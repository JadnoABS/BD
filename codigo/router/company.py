from fastapi import APIRouter
from conn import conn
from model.company import Company

company_router = APIRouter(
    prefix="/company",
    tags=["company"],
)

@company_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Company.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@company_router.post("/")
async def insert_item(company: Company):
    cursor = conn.cursor()
    sql = company.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':company}

@company_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Company.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@company_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Company.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

