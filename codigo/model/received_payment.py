from pydantic import BaseModel
class Received_payment(BaseModel):
    payment_id: int = None
    employee_cpf: str = None

    @staticmethod
    def fromList(list):
        return Received_payment(
            payment_id=list[0],
            employee_cpf=list[1],
        )
    def __repr__(self):
        details = '{\n'
        details += 'payment_id: ' + self.payment_id + '\n'
        details += 'employee_cpf: ' + self.employee_cpf + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into received_payment values ('
        sql += '"{}"'.format(self.payment_id) if self.payment_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.employee_cpf) if self.employee_cpf else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['payment_id', 'employee_cpf']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from received_payment '
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
        sql = 'delete from received_payment '
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
        sql = 'update received_payment '
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
        return ['employee_cpf', 'payment_id']
