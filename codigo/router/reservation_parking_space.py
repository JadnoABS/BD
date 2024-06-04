from fastapi import APIRouter
from conn import conn
from model.reservation_parking_space import Reservation_parking_space

reservation_parking_space_router = APIRouter(
    prefix="/reservation_parking_space",
    tags=["reservation_parking_space"],
)

@reservation_parking_space_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Reservation_parking_space.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@reservation_parking_space_router.post("/")
async def insert_item(reservation_parking_space: Reservation_parking_space):
    cursor = conn.cursor()
    sql = reservation_parking_space.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':reservation_parking_space}

@reservation_parking_space_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Reservation_parking_space.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@reservation_parking_space_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Reservation_parking_space.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

