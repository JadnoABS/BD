from fastapi import APIRouter
from conn import conn
from model.received_payment import Received_payment

received_payment_router = APIRouter(
    prefix="/received_payment",
    tags=["received_payment"],
)

@received_payment_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Received_payment.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@received_payment_router.post("/")
async def insert_item(received_payment: Received_payment):
    cursor = conn.cursor()
    sql = received_payment.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':received_payment}

@received_payment_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Received_payment.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@received_payment_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Received_payment.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

