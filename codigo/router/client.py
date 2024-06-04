from fastapi import APIRouter
from conn import conn
from model.client import Client

client_router = APIRouter(
    prefix="/client",
    tags=["client"],
)

@client_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Client.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@client_router.post("/")
async def insert_item(client: Client):
    cursor = conn.cursor()
    sql = client.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':client}

@client_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Client.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@client_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Client.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

