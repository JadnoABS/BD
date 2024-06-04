from fastapi import APIRouter
from conn import conn
from model.petshop_product import Petshop_product

petshop_product_router = APIRouter(
    prefix="/petshop_product",
    tags=["petshop_product"],
)

@petshop_product_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Petshop_product.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@petshop_product_router.post("/")
async def insert_item(petshop_product: Petshop_product):
    cursor = conn.cursor()
    sql = petshop_product.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':petshop_product}

@petshop_product_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Petshop_product.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@petshop_product_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Petshop_product.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

