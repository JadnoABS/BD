from pydantic import BaseModel
class Bedroom_product(BaseModel):
    min_stock: int = None
    stock: int = None
    bedroom_id: int = None
    product_id: int = None

    @staticmethod
    def fromList(list):
        return Bedroom_product(
            min_stock=list[0],
            stock=list[1],
            bedroom_id=list[2],
            product_id=list[3],
        )
    def __repr__(self):
        details = '{\n'
        details += 'min_stock: ' + self.min_stock + '\n'
        details += 'stock: ' + self.stock + '\n'
        details += 'bedroom_id: ' + self.bedroom_id + '\n'
        details += 'product_id: ' + self.product_id + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into bedroom_product values ('
        sql += '"{}"'.format(self.min_stock) if self.min_stock else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.stock) if self.stock else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.bedroom_id) if self.bedroom_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.product_id) if self.product_id else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['min_stock', 'stock', 'bedroom_id', 'product_id']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from bedroom_product '
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
        sql = 'delete from bedroom_product '
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
        sql = 'update bedroom_product '
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
        return ['bedroom_id', 'product_id']
