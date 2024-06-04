from pydantic import BaseModel
class Cash_entry_restaurant(BaseModel):
    restaurant_id: int = None
    payment_id: int = None
    client_cpf: str = None

    @staticmethod
    def fromList(list):
        return Cash_entry_restaurant(
            restaurant_id=list[0],
            payment_id=list[1],
            client_cpf=list[2],
        )
    def __repr__(self):
        details = '{\n'
        details += 'restaurant_id: ' + self.restaurant_id + '\n'
        details += 'payment_id: ' + self.payment_id + '\n'
        details += 'client_cpf: ' + self.client_cpf + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into cash_entry_restaurant values ('
        sql += '"{}"'.format(self.restaurant_id) if self.restaurant_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.payment_id) if self.payment_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.client_cpf) if self.client_cpf else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['restaurant_id', 'payment_id', 'client_cpf']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from cash_entry_restaurant '
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
        sql = 'delete from cash_entry_restaurant '
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
        sql = 'update cash_entry_restaurant '
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
        return ['restaurant_id', 'payment_id']
