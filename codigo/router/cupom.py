from fastapi import APIRouter
from conn import conn
from model.cupom import Cupom

cupom_router = APIRouter(
    prefix="/cupom",
    tags=["cupom"],
)

@cupom_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Cupom.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@cupom_router.post("/")
async def insert_item(cupom: Cupom):
    cursor = conn.cursor()
    sql = cupom.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':cupom}

@cupom_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Cupom.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@cupom_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Cupom.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

