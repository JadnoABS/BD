from fastapi import APIRouter
from conn import conn
from model.reservation import Reservation

reservation_router = APIRouter(
    prefix="/reservation",
    tags=["reservation"],
)

@reservation_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Reservation.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@reservation_router.post("/")
async def insert_item(reservation: Reservation):
    cursor = conn.cursor()
    sql = reservation.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':reservation}

@reservation_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Reservation.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@reservation_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Reservation.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

