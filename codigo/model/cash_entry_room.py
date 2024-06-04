from pydantic import BaseModel
class Cash_entry_room(BaseModel):
    missing_value: float = None
    payment_id: int = None
    room_id: int = None

    @staticmethod
    def fromList(list):
        return Cash_entry_room(
            missing_value=list[0],
            payment_id=list[1],
            room_id=list[2],
        )
    def __repr__(self):
        details = '{\n'
        details += 'missing_value: ' + self.missing_value + '\n'
        details += 'payment_id: ' + self.payment_id + '\n'
        details += 'room_id: ' + self.room_id + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into cash_entry_room values ('
        sql += '"{}"'.format(self.missing_value) if self.missing_value else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.payment_id) if self.payment_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.room_id) if self.room_id else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['missing_value', 'payment_id', 'room_id']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from cash_entry_room '
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
        sql = 'delete from cash_entry_room '
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
        sql = 'update cash_entry_room '
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
        return ['payment_id', 'room_id']
