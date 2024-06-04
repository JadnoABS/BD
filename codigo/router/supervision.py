from fastapi import APIRouter
from conn import conn
from model.supervision import Supervision

supervision_router = APIRouter(
    prefix="/supervision",
    tags=["supervision"],
)

@supervision_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Supervision.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@supervision_router.post("/")
async def insert_item(supervision: Supervision):
    cursor = conn.cursor()
    sql = supervision.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':supervision}

@supervision_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Supervision.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@supervision_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Supervision.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

