from pydantic import BaseModel
class Product(BaseModel):
    last_buy_value: float = None
    name: str = None
    description: str = None
    sell_value: float = None
    product_id: int = None

    @staticmethod
    def fromList(list):
        return Product(
            last_buy_value=list[0],
            name=list[1],
            description=list[2],
            sell_value=list[3],
            product_id=list[4],
        )
    def __repr__(self):
        details = '{\n'
        details += 'last_buy_value: ' + self.last_buy_value + '\n'
        details += 'name: ' + self.name + '\n'
        details += 'description: ' + self.description + '\n'
        details += 'sell_value: ' + self.sell_value + '\n'
        details += 'product_id: ' + self.product_id + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into product values ('
        sql += '"{}"'.format(self.last_buy_value) if self.last_buy_value else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.name) if self.name else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.description) if self.description else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.sell_value) if self.sell_value else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.product_id) if self.product_id else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['last_buy_value', 'name', 'description', 'sell_value', 'product_id']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from product '
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
        sql = 'delete from product '
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
        sql = 'update product '
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
        return ['product_id']
