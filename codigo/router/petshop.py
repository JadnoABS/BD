from fastapi import APIRouter
from conn import conn
from model.petshop import Petshop

petshop_router = APIRouter(
    prefix="/petshop",
    tags=["petshop"],
)

@petshop_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Petshop.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@petshop_router.post("/")
async def insert_item(petshop: Petshop):
    cursor = conn.cursor()
    sql = petshop.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':petshop}

@petshop_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Petshop.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@petshop_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Petshop.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

