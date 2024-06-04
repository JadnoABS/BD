from pydantic import BaseModel
class Restaurant(BaseModel):
    name: str = None
    restaurant_id: int = None
    type: str = None
    room_service: int = None
    location: str = None
    fk_hotel_hotel_id: int = None
    department_id: int = None

    @staticmethod
    def fromList(list):
        return Restaurant(
            name=list[0],
            restaurant_id=list[1],
            type=list[2],
            room_service=list[3],
            location=list[4],
            fk_hotel_hotel_id=list[5],
            department_id=list[6],
        )
    def __repr__(self):
        details = '{\n'
        details += 'name: ' + self.name + '\n'
        details += 'restaurant_id: ' + self.restaurant_id + '\n'
        details += 'type: ' + self.type + '\n'
        details += 'room_service: ' + self.room_service + '\n'
        details += 'location: ' + self.location + '\n'
        details += 'fk_hotel_hotel_id: ' + self.fk_hotel_hotel_id + '\n'
        details += 'department_id: ' + self.department_id + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into restaurant values ('
        sql += '"{}"'.format(self.name) if self.name else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.restaurant_id) if self.restaurant_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.type) if self.type else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.room_service) if self.room_service else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.location) if self.location else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.fk_hotel_hotel_id) if self.fk_hotel_hotel_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.department_id) if self.department_id else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['name', 'restaurant_id', 'type', 'room_service', 'location', 'fk_hotel_hotel_id', 'department_id']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from restaurant '
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
        sql = 'delete from restaurant '
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
        sql = 'update restaurant '
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
        return ['restaurant_id']
