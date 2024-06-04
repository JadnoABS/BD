from pydantic import BaseModel
class Cash_entry_event(BaseModel):
    missing_value: float = None
    payment_id: int = None
    event_id: int = None

    @staticmethod
    def fromList(list):
        return Cash_entry_event(
            missing_value=list[0],
            payment_id=list[1],
            event_id=list[2],
        )
    def __repr__(self):
        details = '{\n'
        details += 'missing_value: ' + self.missing_value + '\n'
        details += 'payment_id: ' + self.payment_id + '\n'
        details += 'event_id: ' + self.event_id + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into cash_entry_event values ('
        sql += '"{}"'.format(self.missing_value) if self.missing_value else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.payment_id) if self.payment_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.event_id) if self.event_id else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['missing_value', 'payment_id', 'event_id']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from cash_entry_event '
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
        sql = 'delete from cash_entry_event '
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
        sql = 'update cash_entry_event '
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
        return ['payment_id', 'event_id']
