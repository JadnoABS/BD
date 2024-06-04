from pydantic import BaseModel
class Employee_saloon(BaseModel):
    saloon_id: int = None
    employee_cpf: str = None

    @staticmethod
    def fromList(list):
        return Employee_saloon(
            saloon_id=list[0],
            employee_cpf=list[1],
        )
    def __repr__(self):
        details = '{\n'
        details += 'saloon_id: ' + self.saloon_id + '\n'
        details += 'employee_cpf: ' + self.employee_cpf + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into employee_saloon values ('
        sql += '"{}"'.format(self.saloon_id) if self.saloon_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.employee_cpf) if self.employee_cpf else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['saloon_id', 'employee_cpf']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from employee_saloon '
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
        sql = 'delete from employee_saloon '
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
        sql = 'update employee_saloon '
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
        return ['saloon_id', 'employee_cpf']
