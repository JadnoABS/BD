from fastapi import APIRouter
from conn import conn
from model.employee_saloon import Employee_saloon

employee_saloon_router = APIRouter(
    prefix="/employee_saloon",
    tags=["employee_saloon"],
)

@employee_saloon_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Employee_saloon.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@employee_saloon_router.post("/")
async def insert_item(employee_saloon: Employee_saloon):
    cursor = conn.cursor()
    sql = employee_saloon.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':employee_saloon}

@employee_saloon_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Employee_saloon.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@employee_saloon_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Employee_saloon.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

