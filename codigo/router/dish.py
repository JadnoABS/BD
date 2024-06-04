from fastapi import APIRouter
from conn import conn
from model.dish import Dish

dish_router = APIRouter(
    prefix="/dish",
    tags=["dish"],
)

@dish_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Dish.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@dish_router.post("/")
async def insert_item(dish: Dish):
    cursor = conn.cursor()
    sql = dish.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':dish}

@dish_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Dish.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@dish_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Dish.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

