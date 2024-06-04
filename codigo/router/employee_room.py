from fastapi import APIRouter
from conn import conn
from model.employee_room import Employee_room

employee_room_router = APIRouter(
    prefix="/employee_room",
    tags=["employee_room"],
)

@employee_room_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Employee_room.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@employee_room_router.post("/")
async def insert_item(employee_room: Employee_room):
    cursor = conn.cursor()
    sql = employee_room.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':employee_room}

@employee_room_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Employee_room.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@employee_room_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Employee_room.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

