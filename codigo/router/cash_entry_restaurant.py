from fastapi import APIRouter
from conn import conn
from model.cash_entry_restaurant import Cash_entry_restaurant

cash_entry_restaurant_router = APIRouter(
    prefix="/cash_entry_restaurant",
    tags=["cash_entry_restaurant"],
)

@cash_entry_restaurant_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Cash_entry_restaurant.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@cash_entry_restaurant_router.post("/")
async def insert_item(cash_entry_restaurant: Cash_entry_restaurant):
    cursor = conn.cursor()
    sql = cash_entry_restaurant.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':cash_entry_restaurant}

@cash_entry_restaurant_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Cash_entry_restaurant.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@cash_entry_restaurant_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Cash_entry_restaurant.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

