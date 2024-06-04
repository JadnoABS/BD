from pydantic import BaseModel
class Supervision(BaseModel):
    supervisor_cpf: str = None
    employee_cpf: str = None

    @staticmethod
    def fromList(list):
        return Supervision(
            supervisor_cpf=list[0],
            employee_cpf=list[1],
        )
    def __repr__(self):
        details = '{\n'
        details += 'supervisor_cpf: ' + self.supervisor_cpf + '\n'
        details += 'employee_cpf: ' + self.employee_cpf + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into supervision values ('
        sql += '"{}"'.format(self.supervisor_cpf) if self.supervisor_cpf else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.employee_cpf) if self.employee_cpf else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['supervisor_cpf', 'employee_cpf']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from supervision '
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
        sql = 'delete from supervision '
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
        sql = 'update supervision '
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

    @staticmethod
    def getKeys() -> list[str]:
        return ['employee_cpf', 'supervisor_cpf']
