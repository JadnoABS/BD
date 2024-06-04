from fastapi import APIRouter
from conn import conn
from model.hotel_product import Hotel_product

hotel_product_router = APIRouter(
    prefix="/hotel_product",
    tags=["hotel_product"],
)

@hotel_product_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Hotel_product.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@hotel_product_router.post("/")
async def insert_item(hotel_product: Hotel_product):
    cursor = conn.cursor()
    sql = hotel_product.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':hotel_product}

@hotel_product_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Hotel_product.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@hotel_product_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Hotel_product.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

