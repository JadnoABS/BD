from pydantic import BaseModel
class Event_saloon(BaseModel):
    saloon_id: int = None
    event_id: int = None

    @staticmethod
    def fromList(list):
        return Event_saloon(
            saloon_id=list[0],
            event_id=list[1],
        )
    def __repr__(self):
        details = '{\n'
        details += 'saloon_id: ' + self.saloon_id + '\n'
        details += 'event_id: ' + self.event_id + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into event_saloon values ('
        sql += '"{}"'.format(self.saloon_id) if self.saloon_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.event_id) if self.event_id else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['saloon_id', 'event_id']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from event_saloon '
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
        sql = 'delete from event_saloon '
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
        sql = 'update event_saloon '
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
        return ['saloon_id', 'event_id']
