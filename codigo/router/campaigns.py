from fastapi import APIRouter
from conn import conn
from model.campaigns import Campaigns

campaigns_router = APIRouter(
    prefix="/campaigns",
    tags=["campaigns"],
)

@campaigns_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Campaigns.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@campaigns_router.post("/")
async def insert_item(campaigns: Campaigns):
    cursor = conn.cursor()
    sql = campaigns.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':campaigns}

@campaigns_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Campaigns.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@campaigns_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Campaigns.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

