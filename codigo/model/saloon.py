from pydantic import BaseModel
class Saloon(BaseModel):
    capacity: int = None
    name: str = None
    covered_area: float = None
    location: str = None
    saloon_id: int = None
    external_area: float = None
    saloon_TYPE: str = None
    hotel_id: int = None

    @staticmethod
    def fromList(list):
        return Saloon(
            capacity=list[0],
            name=list[1],
            covered_area=list[2],
            location=list[3],
            saloon_id=list[4],
            external_area=list[5],
            saloon_TYPE=list[6],
            hotel_id=list[7],
        )
    def __repr__(self):
        details = '{\n'
        details += 'capacity: ' + self.capacity + '\n'
        details += 'name: ' + self.name + '\n'
        details += 'covered_area: ' + self.covered_area + '\n'
        details += 'location: ' + self.location + '\n'
        details += 'saloon_id: ' + self.saloon_id + '\n'
        details += 'external_area: ' + self.external_area + '\n'
        details += 'saloon_TYPE: ' + self.saloon_TYPE + '\n'
        details += 'hotel_id: ' + self.hotel_id + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into saloon values ('
        sql += '"{}"'.format(self.capacity) if self.capacity else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.name) if self.name else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.covered_area) if self.covered_area else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.location) if self.location else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.saloon_id) if self.saloon_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.external_area) if self.external_area else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.saloon_TYPE) if self.saloon_TYPE else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.hotel_id) if self.hotel_id else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['capacity', 'name', 'covered_area', 'location', 'saloon_id', 'external_area', 'saloon_TYPE', 'hotel_id']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from saloon '
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
        sql = 'delete from saloon '
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
        sql = 'update saloon '
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
        return ['saloon_id']
