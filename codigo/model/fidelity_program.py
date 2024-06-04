from pydantic import BaseModel, validator
import datetime

class Fidelity_program(BaseModel):
    cpf: str = None
    points: int = None
    expire_at: datetime.datetime = None

    @staticmethod
    def fromList(list):
        return Fidelity_program(
            cpf=list[0],
            points=list[1],
            expire_at=list[2],
        )
    def __repr__(self):
        details = '{\n'
        details += 'cpf: ' + self.cpf + '\n'
        details += 'points: ' + self.points + '\n'
        details += 'expire_at: ' + self.expire_at.strftime('%d/%m/%Y') + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into fidelity_program values ('
        sql += '"{}"'.format(self.cpf) if self.cpf else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.points) if self.points else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.expire_at) if self.expire_at.strftime('%Y-%m-%d %H:%M:%S') else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['cpf', 'points', 'expire_at']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from fidelity_program '
        if len(where.keys()):
            sql += "where "
            for key, value in where.items():
                sql += key 
                sql += " "
                sql += "="
                sql += " "
                sql += "'{}'".format(value)
                sql += " "
        sql += ';'
        return sql

    @staticmethod
    def deleteSql(where: dict) -> str:
        sql = 'delete from fidelity_program '
        sql += "where "
        for key, value in where.items():
            sql += key 
            sql += " "
            sql += "="
            sql += " "
            sql += "'{}'".format(value)
            sql += " "
        sql += ';'
        return sql

    @staticmethod
    def updateSql(attrDict:dict, where:dict) -> str:
        sql = 'update fidelity_program '
        sql += "set "
        for key, value in attrDict.items():
            sql += "{} = '{}' ".format(key, value)
        if len(where.keys()):
            sql += "where "
            for key, value in where.items():
                sql += key 
                sql += " "
                sql += "="
                sql += " "
                sql += "'{}'".format(value)
                sql += " "
        sql += ';'
        return sql

    @validator("expire_at", pre=True)
    def parse_expire_at(cls, value):
        return datetime.datetime.strptime(
            value,
            "%d/%m/%Y"
        )
    @staticmethod
    def getKeys() -> list[str]:
        return ['cpf']
