from fastapi import APIRouter
from conn import conn
from model.cash_entry_reservation import Cash_entry_reservation

cash_entry_reservation_router = APIRouter(
    prefix="/cash_entry_reservation",
    tags=["cash_entry_reservation"],
)

@cash_entry_reservation_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Cash_entry_reservation.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@cash_entry_reservation_router.post("/")
async def insert_item(cash_entry_reservation: Cash_entry_reservation):
    cursor = conn.cursor()
    sql = cash_entry_reservation.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':cash_entry_reservation}

@cash_entry_reservation_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Cash_entry_reservation.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@cash_entry_reservation_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Cash_entry_reservation.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

