from fastapi import APIRouter
from conn import conn
from model.bedroom_product import Bedroom_product

bedroom_product_router = APIRouter(
    prefix="/bedroom_product",
    tags=["bedroom_product"],
)

@bedroom_product_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Bedroom_product.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@bedroom_product_router.post("/")
async def insert_item(bedroom_product: Bedroom_product):
    cursor = conn.cursor()
    sql = bedroom_product.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':bedroom_product}

@bedroom_product_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Bedroom_product.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@bedroom_product_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Bedroom_product.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

