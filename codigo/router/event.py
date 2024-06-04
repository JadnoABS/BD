from fastapi import APIRouter
from conn import conn
from model.event import Event

event_router = APIRouter(
    prefix="/event",
    tags=["event"],
)

@event_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Event.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@event_router.post("/")
async def insert_item(event: Event):
    cursor = conn.cursor()
    sql = event.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':event}

@event_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Event.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@event_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Event.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

