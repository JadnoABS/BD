from fastapi import APIRouter
from conn import conn
from model.restaurant_product import Restaurant_product

restaurant_product_router = APIRouter(
    prefix="/restaurant_product",
    tags=["restaurant_product"],
)

@restaurant_product_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Restaurant_product.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@restaurant_product_router.post("/")
async def insert_item(restaurant_product: Restaurant_product):
    cursor = conn.cursor()
    sql = restaurant_product.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':restaurant_product}

@restaurant_product_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Restaurant_product.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@restaurant_product_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Restaurant_product.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

