from fastapi import APIRouter
from conn import conn
from model.cash_outflow import Cash_outflow

cash_outflow_router = APIRouter(
    prefix="/cash_outflow",
    tags=["cash_outflow"],
)

@cash_outflow_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Cash_outflow.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@cash_outflow_router.post("/")
async def insert_item(cash_outflow: Cash_outflow):
    cursor = conn.cursor()
    sql = cash_outflow.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':cash_outflow}

@cash_outflow_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Cash_outflow.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@cash_outflow_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Cash_outflow.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

