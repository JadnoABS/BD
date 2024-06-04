from fastapi import APIRouter
from conn import conn
from model.dependent import Dependent

dependent_router = APIRouter(
    prefix="/dependent",
    tags=["dependent"],
)

@dependent_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Dependent.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@dependent_router.post("/")
async def insert_item(dependent: Dependent):
    cursor = conn.cursor()
    sql = dependent.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':dependent}

@dependent_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Dependent.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@dependent_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Dependent.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

