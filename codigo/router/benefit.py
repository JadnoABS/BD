from fastapi import APIRouter
from conn import conn
from model.benefit import Benefit

benefit_router = APIRouter(
    prefix="/benefit",
    tags=["benefit"],
)

@benefit_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Benefit.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@benefit_router.post("/")
async def insert_item(benefit: Benefit):
    cursor = conn.cursor()
    sql = benefit.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':benefit}

@benefit_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Benefit.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@benefit_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Benefit.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

