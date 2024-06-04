from pydantic import BaseModel
class Bedroom(BaseModel):
    n_bathrooms: int = None
    max_guests: int = None
    is_clean: int = None
    location: str = None
    bedroom_id: int = None
    daily: float = None
    living_room: bool = None
    washing_room: bool = None
    kitchen: bool = None
    wasshing_room: bool = None
    bedroom_TYPE: str = None
    hotel_id: int = None

    @staticmethod
    def fromList(list):
        return Bedroom(
            n_bathrooms=list[0],
            max_guests=list[1],
            is_clean=list[2],
            location=list[3],
            bedroom_id=list[4],
            daily=list[5],
            living_room=list[6],
            washing_room=list[7],
            kitchen=list[8],
            wasshing_room=list[9],
            bedroom_TYPE=list[10],
            hotel_id=list[11],
        )
    def __repr__(self):
        details = '{\n'
        details += 'n_bathrooms: ' + self.n_bathrooms + '\n'
        details += 'max_guests: ' + self.max_guests + '\n'
        details += 'is_clean: ' + self.is_clean + '\n'
        details += 'location: ' + self.location + '\n'
        details += 'bedroom_id: ' + self.bedroom_id + '\n'
        details += 'daily: ' + self.daily + '\n'
        details += 'living_room: ' + self.living_room + '\n'
        details += 'washing_room: ' + self.washing_room + '\n'
        details += 'kitchen: ' + self.kitchen + '\n'
        details += 'wasshing_room: ' + self.wasshing_room + '\n'
        details += 'bedroom_TYPE: ' + self.bedroom_TYPE + '\n'
        details += 'hotel_id: ' + self.hotel_id + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into bedroom values ('
        sql += '"{}"'.format(self.n_bathrooms) if self.n_bathrooms else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.max_guests) if self.max_guests else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.is_clean) if self.is_clean else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.location) if self.location else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.bedroom_id) if self.bedroom_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.daily) if self.daily else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.living_room) if self.living_room else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.washing_room) if self.washing_room else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.kitchen) if self.kitchen else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.wasshing_room) if self.wasshing_room else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.bedroom_TYPE) if self.bedroom_TYPE else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.hotel_id) if self.hotel_id else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['n_bathrooms', 'max_guests', 'is_clean', 'location', 'bedroom_id', 'daily', 'living_room', 'washing_room', 'kitchen', 'wasshing_room', 'bedroom_TYPE', 'hotel_id']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from bedroom '
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
        sql = 'delete from bedroom '
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
        sql = 'update bedroom '
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
        return ['bedroom_id']
