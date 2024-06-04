from fastapi import APIRouter
from conn import conn
from model.product import Product

product_router = APIRouter(
    prefix="/product",
    tags=["product"],
)

@product_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Product.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@product_router.post("/")
async def insert_item(product: Product):
    cursor = conn.cursor()
    sql = product.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':product}

@product_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Product.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@product_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Product.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

