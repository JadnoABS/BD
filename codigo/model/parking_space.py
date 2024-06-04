from pydantic import BaseModel
class Parking_space(BaseModel):
    location: str = None
    daily_rate: float = None
    preferential: bool = None
    parking_id: int = None
    width: float = None
    length: float = None
    parking_space_TYPE: str = None
    hotel_id: int = None
    covered: bool = None

    @staticmethod
    def fromList(list):
        return Parking_space(
            location=list[0],
            daily_rate=list[1],
            preferential=list[2],
            parking_id=list[3],
            width=list[4],
            length=list[5],
            parking_space_TYPE=list[6],
            hotel_id=list[7],
            covered=list[8],
        )
    def __repr__(self):
        details = '{\n'
        details += 'location: ' + self.location + '\n'
        details += 'daily_rate: ' + self.daily_rate + '\n'
        details += 'preferential: ' + self.preferential + '\n'
        details += 'parking_id: ' + self.parking_id + '\n'
        details += 'width: ' + self.width + '\n'
        details += 'length: ' + self.length + '\n'
        details += 'parking_space_TYPE: ' + self.parking_space_TYPE + '\n'
        details += 'hotel_id: ' + self.hotel_id + '\n'
        details += 'covered: ' + self.covered + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into parking_space values ('
        sql += '"{}"'.format(self.location) if self.location else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.daily_rate) if self.daily_rate else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.preferential) if self.preferential else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.parking_id) if self.parking_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.width) if self.width else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.length) if self.length else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.parking_space_TYPE) if self.parking_space_TYPE else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.hotel_id) if self.hotel_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.covered) if self.covered else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['location', 'daily_rate', 'preferential', 'parking_id', 'width', 'length', 'parking_space_TYPE', 'hotel_id', 'covered']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from parking_space '
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
        sql = 'delete from parking_space '
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
        sql = 'update parking_space '
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
        return ['parking_id']
