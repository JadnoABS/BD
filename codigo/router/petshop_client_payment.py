from fastapi import APIRouter
from conn import conn
from model.petshop_client_payment import Petshop_client_payment

petshop_client_payment_router = APIRouter(
    prefix="/petshop_client_payment",
    tags=["petshop_client_payment"],
)

@petshop_client_payment_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Petshop_client_payment.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@petshop_client_payment_router.post("/")
async def insert_item(petshop_client_payment: Petshop_client_payment):
    cursor = conn.cursor()
    sql = petshop_client_payment.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':petshop_client_payment}

@petshop_client_payment_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Petshop_client_payment.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@petshop_client_payment_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Petshop_client_payment.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

