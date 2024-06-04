from fastapi import APIRouter
from conn import conn
from model.cash_outflow_campaign import Cash_outflow_campaign

cash_outflow_campaign_router = APIRouter(
    prefix="/cash_outflow_campaign",
    tags=["cash_outflow_campaign"],
)

@cash_outflow_campaign_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Cash_outflow_campaign.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@cash_outflow_campaign_router.post("/")
async def insert_item(cash_outflow_campaign: Cash_outflow_campaign):
    cursor = conn.cursor()
    sql = cash_outflow_campaign.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':cash_outflow_campaign}

@cash_outflow_campaign_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Cash_outflow_campaign.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@cash_outflow_campaign_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Cash_outflow_campaign.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

