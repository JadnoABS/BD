from pydantic import BaseModel, validator
import datetime

class Dependent(BaseModel):
    relation: str = None
    f_name: str = None
    cpf: str = None
    birth_date: datetime.datetime = None
    l_name: str = None
    register_date: datetime.datetime = None
    fk_employee_cpf: str = None

    @staticmethod
    def fromList(list):
        return Dependent(
            relation=list[0],
            f_name=list[1],
            cpf=list[2],
            birth_date=list[3],
            l_name=list[4],
            register_date=list[5],
            fk_employee_cpf=list[6],
        )
    def __repr__(self):
        details = '{\n'
        details += 'relation: ' + self.relation + '\n'
        details += 'f_name: ' + self.f_name + '\n'
        details += 'cpf: ' + self.cpf + '\n'
        details += 'birth_date: ' + self.birth_date.strftime('%d/%m/%Y') + '\n'
        details += 'l_name: ' + self.l_name + '\n'
        details += 'register_date: ' + self.register_date.strftime('%d/%m/%Y') + '\n'
        details += 'fk_employee_cpf: ' + self.fk_employee_cpf + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into dependent values ('
        sql += '"{}"'.format(self.relation) if self.relation else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.f_name) if self.f_name else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.cpf) if self.cpf else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.birth_date) if self.birth_date.strftime('%Y-%m-%d %H:%M:%S') else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.l_name) if self.l_name else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.register_date) if self.register_date.strftime('%Y-%m-%d %H:%M:%S') else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.fk_employee_cpf) if self.fk_employee_cpf else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['relation', 'f_name', 'cpf', 'birth_date', 'l_name', 'register_date', 'fk_employee_cpf']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from dependent '
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
        sql = 'delete from dependent '
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
        sql = 'update dependent '
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
