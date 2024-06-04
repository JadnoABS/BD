from fastapi import APIRouter
from conn import conn
from model.cash_entry_event import Cash_entry_event

cash_entry_event_router = APIRouter(
    prefix="/cash_entry_event",
    tags=["cash_entry_event"],
)

@cash_entry_event_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Cash_entry_event.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@cash_entry_event_router.post("/")
async def insert_item(cash_entry_event: Cash_entry_event):
    cursor = conn.cursor()
    sql = cash_entry_event.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':cash_entry_event}

@cash_entry_event_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Cash_entry_event.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@cash_entry_event_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Cash_entry_event.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

