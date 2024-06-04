from fastapi import APIRouter
from conn import conn
from model.saloon_kitchen import Saloon_kitchen

saloon_kitchen_router = APIRouter(
    prefix="/saloon_kitchen",
    tags=["saloon_kitchen"],
)

@saloon_kitchen_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Saloon_kitchen.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@saloon_kitchen_router.post("/")
async def insert_item(saloon_kitchen: Saloon_kitchen):
    cursor = conn.cursor()
    sql = saloon_kitchen.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':saloon_kitchen}

@saloon_kitchen_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Saloon_kitchen.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@saloon_kitchen_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Saloon_kitchen.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

