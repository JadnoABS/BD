from pydantic import BaseModel, validator
import datetime

class Client(BaseModel):
    f_name: str = None
    cpf: str = None
    birth_date: datetime.datetime = None
    l_name: str = None
    register_date: datetime.datetime = None

    @staticmethod
    def fromList(list):
        return Client(
            f_name=list[0],
            cpf=list[1],
            birth_date=list[2],
            l_name=list[3],
            register_date=list[4],
        )
    def __repr__(self):
        details = '{\n'
        details += 'f_name: ' + self.f_name + '\n'
        details += 'cpf: ' + self.cpf + '\n'
        details += 'birth_date: ' + self.birth_date.strftime('%d/%m/%Y') + '\n'
        details += 'l_name: ' + self.l_name + '\n'
        details += 'register_date: ' + self.register_date.strftime('%d/%m/%Y') + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into client values ('
        sql += '"{}"'.format(self.f_name) if self.f_name else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.cpf) if self.cpf else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.birth_date) if self.birth_date.strftime('%Y-%m-%d %H:%M:%S') else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.l_name) if self.l_name else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.register_date) if self.register_date.strftime('%Y-%m-%d %H:%M:%S') else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['f_name', 'cpf', 'birth_date', 'l_name', 'register_date']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from client '
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
        sql = 'delete from client '
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
        sql = 'update client '
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

    @validator("birth_date", pre=True)
    def parse_birth_date(cls, value):
        return datetime.datetime.strptime(
            value,
            "%d/%m/%Y"
        )
    @validator("register_date", pre=True)
    def parse_register_date(cls, value):
        return datetime.datetime.strptime(
            value,
            "%d/%m/%Y"
        )
    @staticmethod
    def getKeys() -> list[str]:
        return ['cpf']
