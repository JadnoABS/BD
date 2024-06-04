from pydantic import BaseModel
class Petshop(BaseModel):
    petshop_id: int = None
    name: str = None
    location: str = None
    open_period: str = None
    hotel_id: int = None
    dept_id: int = None

    @staticmethod
    def fromList(list):
        return Petshop(
            petshop_id=list[0],
            name=list[1],
            location=list[2],
            open_period=list[3],
            hotel_id=list[4],
            dept_id=list[5],
        )
    def __repr__(self):
        details = '{\n'
        details += 'petshop_id: ' + self.petshop_id + '\n'
        details += 'name: ' + self.name + '\n'
        details += 'location: ' + self.location + '\n'
        details += 'open_period: ' + self.open_period + '\n'
        details += 'hotel_id: ' + self.hotel_id + '\n'
        details += 'dept_id: ' + self.dept_id + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into petshop values ('
        sql += '"{}"'.format(self.petshop_id) if self.petshop_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.name) if self.name else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.location) if self.location else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.open_period) if self.open_period else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.hotel_id) if self.hotel_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.dept_id) if self.dept_id else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['petshop_id', 'name', 'location', 'open_period', 'hotel_id', 'dept_id']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from petshop '
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
        sql = 'delete from petshop '
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
        sql = 'update petshop '
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
        return ['petshop_id']
