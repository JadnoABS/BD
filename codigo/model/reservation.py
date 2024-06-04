from pydantic import BaseModel, validator
import datetime

class Reservation(BaseModel):
    checkin: datetime.datetime = None
    checkout: datetime.datetime = None
    num_breakfast: int = None
    value: float = None
    reservation_id: int = None
    reservation_date: datetime.datetime = None
    client_cpf: str = None
    fidelity_points: int = None

    @staticmethod
    def fromList(list):
        return Reservation(
            checkin=list[0],
            checkout=list[1],
            num_breakfast=list[2],
            value=list[3],
            reservation_id=list[4],
            reservation_date=list[5],
            client_cpf=list[6],
            fidelity_points=list[7],
        )
    def __repr__(self):
        details = '{\n'
        details += 'checkin: ' + self.checkin.strftime('%d/%m/%Y') + '\n'
        details += 'checkout: ' + self.checkout.strftime('%d/%m/%Y') + '\n'
        details += 'num_breakfast: ' + self.num_breakfast + '\n'
        details += 'value: ' + self.value + '\n'
        details += 'reservation_id: ' + self.reservation_id + '\n'
        details += 'reservation_date: ' + self.reservation_date.strftime('%d/%m/%Y') + '\n'
        details += 'client_cpf: ' + self.client_cpf + '\n'
        details += 'fidelity_points: ' + self.fidelity_points + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into reservation values ('
        sql += '"{}"'.format(self.checkin) if self.checkin.strftime('%Y-%m-%d %H:%M:%S') else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.checkout) if self.checkout.strftime('%Y-%m-%d %H:%M:%S') else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.num_breakfast) if self.num_breakfast else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.value) if self.value else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.reservation_id) if self.reservation_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.reservation_date) if self.reservation_date.strftime('%Y-%m-%d %H:%M:%S') else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.client_cpf) if self.client_cpf else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.fidelity_points) if self.fidelity_points else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['checkin', 'checkout', 'num_breakfast', 'value', 'reservation_id', 'reservation_date', 'client_cpf', 'fidelity_points']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from reservation '
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
        sql = 'delete from reservation '
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
        sql = 'update reservation '
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

    @validator("checkin", pre=True)
    def parse_checkin(cls, value):
        return datetime.datetime.strptime(
            value,
            "%d/%m/%Y"
        )
    @validator("checkout", pre=True)
    def parse_checkout(cls, value):
        return datetime.datetime.strptime(
            value,
            "%d/%m/%Y"
        )
    @validator("reservation_date", pre=True)
    def parse_reservation_date(cls, value):
        return datetime.datetime.strptime(
            value,
            "%d/%m/%Y"
        )
    @staticmethod
    def getKeys() -> list[str]:
        return ['reservation_id']
