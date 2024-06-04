from fastapi import APIRouter
from conn import conn
from model.department import Department

department_router = APIRouter(
    prefix="/department",
    tags=["department"],
)

@department_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Department.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@department_router.post("/")
async def insert_item(department: Department):
    cursor = conn.cursor()
    sql = department.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':department}

@department_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Department.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@department_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Department.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

