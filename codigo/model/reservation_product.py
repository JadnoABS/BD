from pydantic import BaseModel
class Reservation_product(BaseModel):
    quantity: int = None
    reservation_id: int = None
    product_id: int = None

    @staticmethod
    def fromList(list):
        return Reservation_product(
            quantity=list[0],
            reservation_id=list[1],
            product_id=list[2],
        )
    def __repr__(self):
        details = '{\n'
        details += 'quantity: ' + self.quantity + '\n'
        details += 'reservation_id: ' + self.reservation_id + '\n'
        details += 'product_id: ' + self.product_id + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into reservation_product values ('
        sql += '"{}"'.format(self.quantity) if self.quantity else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.reservation_id) if self.reservation_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.product_id) if self.product_id else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['quantity', 'reservation_id', 'product_id']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from reservation_product '
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
        sql = 'delete from reservation_product '
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
        sql = 'update reservation_product '
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
        return ['reservation_id', 'product_id']
