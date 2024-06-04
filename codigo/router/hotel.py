from fastapi import APIRouter
from conn import conn
from model.hotel import Hotel

hotel_router = APIRouter(
    prefix="/hotel",
    tags=["hotel"],
)

@hotel_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Hotel.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@hotel_router.post("/")
async def insert_item(hotel: Hotel):
    cursor = conn.cursor()
    sql = hotel.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':hotel}

@hotel_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Hotel.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@hotel_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Hotel.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

