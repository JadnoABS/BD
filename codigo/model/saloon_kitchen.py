from pydantic import BaseModel
class Saloon_kitchen(BaseModel):
    kitchen_id: int = None
    saloon_id: int = None

    @staticmethod
    def fromList(list):
        return Saloon_kitchen(
            kitchen_id=list[0],
            saloon_id=list[1],
        )
    def __repr__(self):
        details = '{\n'
        details += 'kitchen_id: ' + self.kitchen_id + '\n'
        details += 'saloon_id: ' + self.saloon_id + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into saloon_kitchen values ('
        sql += '"{}"'.format(self.kitchen_id) if self.kitchen_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.saloon_id) if self.saloon_id else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['kitchen_id', 'saloon_id']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from saloon_kitchen '
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
        sql = 'delete from saloon_kitchen '
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
        sql = 'update saloon_kitchen '
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
        return ['kitchen_id', 'saloon_id']
