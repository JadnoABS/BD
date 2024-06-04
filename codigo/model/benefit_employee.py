from pydantic import BaseModel
class Benefit_employee(BaseModel):
    benefit_id: int = None
    employee_cpf: str = None

    @staticmethod
    def fromList(list):
        return Benefit_employee(
            benefit_id=list[0],
            employee_cpf=list[1],
        )
    def __repr__(self):
        details = '{\n'
        details += 'benefit_id: ' + self.benefit_id + '\n'
        details += 'employee_cpf: ' + self.employee_cpf + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into benefit_employee values ('
        sql += '"{}"'.format(self.benefit_id) if self.benefit_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.employee_cpf) if self.employee_cpf else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['benefit_id', 'employee_cpf']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from benefit_employee '
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
        sql = 'delete from benefit_employee '
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
        sql = 'update benefit_employee '
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
        return ['benefit_id', 'employee_cpf']
