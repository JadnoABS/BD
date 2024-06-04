from pydantic import BaseModel
class Benefit(BaseModel):
    benefit_id: int = None
    value: float = None
    level: str = None
    benefit_TYPE: str = None

    @staticmethod
    def fromList(list):
        return Benefit(
            benefit_id=list[0],
            value=list[1],
            level=list[2],
            benefit_TYPE=list[3],
        )
    def __repr__(self):
        details = '{\n'
        details += 'benefit_id: ' + self.benefit_id + '\n'
        details += 'value: ' + self.value + '\n'
        details += 'level: ' + self.level + '\n'
        details += 'benefit_TYPE: ' + self.benefit_TYPE + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into benefit values ('
        sql += '"{}"'.format(self.benefit_id) if self.benefit_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.value) if self.value else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.level) if self.level else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.benefit_TYPE) if self.benefit_TYPE else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['benefit_id', 'value', 'level', 'benefit_TYPE']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from benefit '
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
        sql = 'delete from benefit '
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
        sql = 'update benefit '
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
        return ['benefit_id']
