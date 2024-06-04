from pydantic import BaseModel
class Petshop_product(BaseModel):
    min_stock: int = None
    stock: int = None
    petshop_id: int = None
    product_id: int = None

    @staticmethod
    def fromList(list):
        return Petshop_product(
            min_stock=list[0],
            stock=list[1],
            petshop_id=list[2],
            product_id=list[3],
        )
    def __repr__(self):
        details = '{\n'
        details += 'min_stock: ' + self.min_stock + '\n'
        details += 'stock: ' + self.stock + '\n'
        details += 'petshop_id: ' + self.petshop_id + '\n'
        details += 'product_id: ' + self.product_id + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into petshop_product values ('
        sql += '"{}"'.format(self.min_stock) if self.min_stock else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.stock) if self.stock else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.petshop_id) if self.petshop_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.product_id) if self.product_id else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['min_stock', 'stock', 'petshop_id', 'product_id']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from petshop_product '
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
        sql = 'delete from petshop_product '
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
        sql = 'update petshop_product '
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
        return ['petshop_id', 'product_id']
