from fastapi import APIRouter
from conn import conn
from model.room import Room

room_router = APIRouter(
    prefix="/room",
    tags=["room"],
)

@room_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Room.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@room_router.post("/")
async def insert_item(room: Room):
    cursor = conn.cursor()
    sql = room.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':room}

@room_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Room.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@room_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Room.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

