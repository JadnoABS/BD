from fastapi import APIRouter
from conn import conn
from model.reservation_period_bedroom import Reservation_period_bedroom

reservation_period_bedroom_router = APIRouter(
    prefix="/reservation_period_bedroom",
    tags=["reservation_period_bedroom"],
)

@reservation_period_bedroom_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Reservation_period_bedroom.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@reservation_period_bedroom_router.post("/")
async def insert_item(reservation_period_bedroom: Reservation_period_bedroom):
    cursor = conn.cursor()
    sql = reservation_period_bedroom.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':reservation_period_bedroom}

@reservation_period_bedroom_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Reservation_period_bedroom.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@reservation_period_bedroom_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Reservation_period_bedroom.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

