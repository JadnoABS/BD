from fastapi import APIRouter
from conn import conn
from model.event_saloon import Event_saloon

event_saloon_router = APIRouter(
    prefix="/event_saloon",
    tags=["event_saloon"],
)

@event_saloon_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Event_saloon.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@event_saloon_router.post("/")
async def insert_item(event_saloon: Event_saloon):
    cursor = conn.cursor()
    sql = event_saloon.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':event_saloon}

@event_saloon_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Event_saloon.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@event_saloon_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Event_saloon.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

