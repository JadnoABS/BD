from fastapi import APIRouter
from conn import conn
from model.cash_entry import Cash_entry

cash_entry_router = APIRouter(
    prefix="/cash_entry",
    tags=["cash_entry"],
)

@cash_entry_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Cash_entry.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@cash_entry_router.post("/")
async def insert_item(cash_entry: Cash_entry):
    cursor = conn.cursor()
    sql = cash_entry.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':cash_entry}

@cash_entry_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Cash_entry.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@cash_entry_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Cash_entry.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

