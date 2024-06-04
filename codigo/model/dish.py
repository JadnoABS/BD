from pydantic import BaseModel
class Dish(BaseModel):
    name: str = None
    description: str = None
    value: float = None
    dish_id: int = None
    restaurant_id: int = None

    @staticmethod
    def fromList(list):
        return Dish(
            name=list[0],
            description=list[1],
            value=list[2],
            dish_id=list[3],
            restaurant_id=list[4],
        )
    def __repr__(self):
        details = '{\n'
        details += 'name: ' + self.name + '\n'
        details += 'description: ' + self.description + '\n'
        details += 'value: ' + self.value + '\n'
        details += 'dish_id: ' + self.dish_id + '\n'
        details += 'restaurant_id: ' + self.restaurant_id + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into dish values ('
        sql += '"{}"'.format(self.name) if self.name else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.description) if self.description else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.value) if self.value else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.dish_id) if self.dish_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.restaurant_id) if self.restaurant_id else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['name', 'description', 'value', 'dish_id', 'restaurant_id']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from dish '
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
        sql = 'delete from dish '
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
        sql = 'update dish '
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
        return ['dish_id']
