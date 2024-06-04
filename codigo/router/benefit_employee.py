from fastapi import APIRouter
from conn import conn
from model.benefit_employee import Benefit_employee

benefit_employee_router = APIRouter(
    prefix="/benefit_employee",
    tags=["benefit_employee"],
)

@benefit_employee_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Benefit_employee.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@benefit_employee_router.post("/")
async def insert_item(benefit_employee: Benefit_employee):
    cursor = conn.cursor()
    sql = benefit_employee.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':benefit_employee}

@benefit_employee_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Benefit_employee.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@benefit_employee_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Benefit_employee.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

