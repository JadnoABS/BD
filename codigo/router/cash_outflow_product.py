from fastapi import APIRouter
from conn import conn
from model.cash_outflow_product import Cash_outflow_product

cash_outflow_product_router = APIRouter(
    prefix="/cash_outflow_product",
    tags=["cash_outflow_product"],
)

@cash_outflow_product_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Cash_outflow_product.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@cash_outflow_product_router.post("/")
async def insert_item(cash_outflow_product: Cash_outflow_product):
    cursor = conn.cursor()
    sql = cash_outflow_product.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':cash_outflow_product}

@cash_outflow_product_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Cash_outflow_product.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@cash_outflow_product_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Cash_outflow_product.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

