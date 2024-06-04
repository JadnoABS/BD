from fastapi import APIRouter
from conn import conn
from model.reservation_product import Reservation_product

reservation_product_router = APIRouter(
    prefix="/reservation_product",
    tags=["reservation_product"],
)

@reservation_product_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Reservation_product.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@reservation_product_router.post("/")
async def insert_item(reservation_product: Reservation_product):
    cursor = conn.cursor()
    sql = reservation_product.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':reservation_product}

@reservation_product_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Reservation_product.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@reservation_product_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Reservation_product.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

