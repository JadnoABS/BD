from pydantic import BaseModel, validator
import datetime

class Reservation_period_bedroom(BaseModel):
    days: int = None
    initial_date: datetime.datetime = None
    bedroom_id: int = None
    reservation_id: int = None

    @staticmethod
    def fromList(list):
        return Reservation_period_bedroom(
            days=list[0],
            initial_date=list[1],
            bedroom_id=list[2],
            reservation_id=list[3],
        )
    def __repr__(self):
        details = '{\n'
        details += 'days: ' + self.days + '\n'
        details += 'initial_date: ' + self.initial_date.strftime('%d/%m/%Y') + '\n'
        details += 'bedroom_id: ' + self.bedroom_id + '\n'
        details += 'reservation_id: ' + self.reservation_id + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into reservation_period_bedroom values ('
        sql += '"{}"'.format(self.days) if self.days else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.initial_date) if self.initial_date.strftime('%Y-%m-%d %H:%M:%S') else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.bedroom_id) if self.bedroom_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.reservation_id) if self.reservation_id else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['days', 'initial_date', 'bedroom_id', 'reservation_id']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from reservation_period_bedroom '
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
        sql = 'delete from reservation_period_bedroom '
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
        sql = 'update reservation_period_bedroom '
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
        return ['bedroom_id', 'reservation_id']
