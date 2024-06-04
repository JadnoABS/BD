from fastapi import APIRouter
from conn import conn
from model.kitchen import Kitchen

kitchen_router = APIRouter(
    prefix="/kitchen",
    tags=["kitchen"],
)

@kitchen_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Kitchen.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@kitchen_router.post("/")
async def insert_item(kitchen: Kitchen):
    cursor = conn.cursor()
    sql = kitchen.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':kitchen}

@kitchen_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Kitchen.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@kitchen_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Kitchen.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

