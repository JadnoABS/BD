from fastapi import APIRouter
from conn import conn
from model.parking_space import Parking_space

parking_space_router = APIRouter(
    prefix="/parking_space",
    tags=["parking_space"],
)

@parking_space_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Parking_space.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@parking_space_router.post("/")
async def insert_item(parking_space: Parking_space):
    cursor = conn.cursor()
    sql = parking_space.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':parking_space}

@parking_space_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Parking_space.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@parking_space_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Parking_space.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

