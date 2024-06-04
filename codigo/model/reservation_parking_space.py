from pydantic import BaseModel, validator
import datetime

class Reservation_parking_space(BaseModel):
    initial_date: datetime.datetime = None
    total_days: int = None
    reservation_id: int = None
    parking_id: int = None

    @staticmethod
    def fromList(list):
        return Reservation_parking_space(
            initial_date=list[0],
            total_days=list[1],
            reservation_id=list[2],
            parking_id=list[3],
        )
    def __repr__(self):
        details = '{\n'
        details += 'initial_date: ' + self.initial_date.strftime('%d/%m/%Y') + '\n'
        details += 'total_days: ' + self.total_days + '\n'
        details += 'reservation_id: ' + self.reservation_id + '\n'
        details += 'parking_id: ' + self.parking_id + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into reservation_parking_space values ('
        sql += '"{}"'.format(self.initial_date) if self.initial_date.strftime('%Y-%m-%d %H:%M:%S') else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.total_days) if self.total_days else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.reservation_id) if self.reservation_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.parking_id) if self.parking_id else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['initial_date', 'total_days', 'reservation_id', 'parking_id']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from reservation_parking_space '
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
        sql = 'delete from reservation_parking_space '
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
        sql = 'update reservation_parking_space '
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

    @validator("initial_date", pre=True)
    def parse_initial_date(cls, value):
        return datetime.datetime.strptime(
            value,
            "%d/%m/%Y"
        )
    @staticmethod
    def getKeys() -> list[str]:
        return ['reservation_id', 'parking_id', 'initial_date']
