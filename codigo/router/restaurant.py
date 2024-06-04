from fastapi import APIRouter
from conn import conn
from model.restaurant import Restaurant

restaurant_router = APIRouter(
    prefix="/restaurant",
    tags=["restaurant"],
)

@restaurant_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Restaurant.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@restaurant_router.post("/")
async def insert_item(restaurant: Restaurant):
    cursor = conn.cursor()
    sql = restaurant.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':restaurant}

@restaurant_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Restaurant.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@restaurant_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Restaurant.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

