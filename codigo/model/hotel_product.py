from pydantic import BaseModel
class Hotel_product(BaseModel):
    stock: int = None
    min_stock: int = None
    hotel_id: int = None
    product_id: int = None

    @staticmethod
    def fromList(list):
        return Hotel_product(
            stock=list[0],
            min_stock=list[1],
            hotel_id=list[2],
            product_id=list[3],
        )
    def __repr__(self):
        details = '{\n'
        details += 'stock: ' + self.stock + '\n'
        details += 'min_stock: ' + self.min_stock + '\n'
        details += 'hotel_id: ' + self.hotel_id + '\n'
        details += 'product_id: ' + self.product_id + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into hotel_product values ('
        sql += '"{}"'.format(self.stock) if self.stock else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.min_stock) if self.min_stock else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.hotel_id) if self.hotel_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.product_id) if self.product_id else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['stock', 'min_stock', 'hotel_id', 'product_id']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from hotel_product '
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
        sql = 'delete from hotel_product '
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
        sql = 'update hotel_product '
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
        return ['product_id', 'hotel_id']
