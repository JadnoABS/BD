from pydantic import BaseModel
class Restaurant_product(BaseModel):
    stock: int = None
    min_stock: int = None
    restaurant_id: int = None
    product_id: int = None

    @staticmethod
    def fromList(list):
        return Restaurant_product(
            stock=list[0],
            min_stock=list[1],
            restaurant_id=list[2],
            product_id=list[3],
        )
    def __repr__(self):
        details = '{\n'
        details += 'stock: ' + self.stock + '\n'
        details += 'min_stock: ' + self.min_stock + '\n'
        details += 'restaurant_id: ' + self.restaurant_id + '\n'
        details += 'product_id: ' + self.product_id + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into restaurant_product values ('
        sql += '"{}"'.format(self.stock) if self.stock else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.min_stock) if self.min_stock else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.restaurant_id) if self.restaurant_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.product_id) if self.product_id else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['stock', 'min_stock', 'restaurant_id', 'product_id']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from restaurant_product '
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
        sql = 'delete from restaurant_product '
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
        sql = 'update restaurant_product '
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
        return ['restaurant_id', 'product_id']
