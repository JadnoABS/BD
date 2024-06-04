from fastapi import APIRouter
from conn import conn
from model.employee import Employee

employee_router = APIRouter(
    prefix="/employee",
    tags=["employee"],
)

@employee_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Employee.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@employee_router.post("/")
async def insert_item(employee: Employee):
    cursor = conn.cursor()
    sql = employee.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':employee}

@employee_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Employee.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@employee_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Employee.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

