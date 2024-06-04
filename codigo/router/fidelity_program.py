from fastapi import APIRouter
from conn import conn
from model.fidelity_program import Fidelity_program

fidelity_program_router = APIRouter(
    prefix="/fidelity_program",
    tags=["fidelity_program"],
)

@fidelity_program_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = Fidelity_program.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {'values': lines}

@fidelity_program_router.post("/")
async def insert_item(fidelity_program: Fidelity_program):
    cursor = conn.cursor()
    sql = fidelity_program.insertSql()
    cursor.execute(sql)
    conn.commit()

    return {'added':fidelity_program}

@fidelity_program_router.delete("/")
async def delete_item(where: dict):
    cursor = conn.cursor()
    sql = Fidelity_program.deleteSql(where=where)
    cursor.execute(sql)
    conn.commit()

    return {'deleted': where}

@fidelity_program_router.put("/")
async def update_items(attrDict: dict, where: dict):
    cursor = conn.cursor()
    sql = Fidelity_program.updateSql(where=where, attrDict=attrDict)
    cursor.execute(sql)
    conn.commit()

    return {'updated': attrDict, 'where': where}

