from pydantic import BaseModel, validator
import datetime

class Room(BaseModel):
    final_date: datetime.datetime = None
    initial_date: datetime.datetime = None
    size_m2: float = None
    location: str = None
    mensal_rent: float = None
    weekly_rent: float = None
    room_id: int = None
    deposit_area: float = None
    room_TYPE: str = None
    hotel_id: int = None
    company_cnpj: str = None

    @staticmethod
    def fromList(list):
        return Room(
            final_date=list[0],
            initial_date=list[1],
            size_m2=list[2],
            location=list[3],
            mensal_rent=list[4],
            weekly_rent=list[5],
            room_id=list[6],
            deposit_area=list[7],
            room_TYPE=list[8],
            hotel_id=list[9],
            company_cnpj=list[10],
        )
    def __repr__(self):
        details = '{\n'
        details += 'final_date: ' + self.final_date.strftime('%d/%m/%Y') + '\n'
        details += 'initial_date: ' + self.initial_date.strftime('%d/%m/%Y') + '\n'
        details += 'size_m2: ' + self.size_m2 + '\n'
        details += 'location: ' + self.location + '\n'
        details += 'mensal_rent: ' + self.mensal_rent + '\n'
        details += 'weekly_rent: ' + self.weekly_rent + '\n'
        details += 'room_id: ' + self.room_id + '\n'
        details += 'deposit_area: ' + self.deposit_area + '\n'
        details += 'room_TYPE: ' + self.room_TYPE + '\n'
        details += 'hotel_id: ' + self.hotel_id + '\n'
        details += 'company_cnpj: ' + self.company_cnpj + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into room values ('
        sql += '"{}"'.format(self.final_date) if self.final_date.strftime('%Y-%m-%d %H:%M:%S') else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.initial_date) if self.initial_date.strftime('%Y-%m-%d %H:%M:%S') else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.size_m2) if self.size_m2 else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.location) if self.location else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.mensal_rent) if self.mensal_rent else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.weekly_rent) if self.weekly_rent else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.room_id) if self.room_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.deposit_area) if self.deposit_area else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.room_TYPE) if self.room_TYPE else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.hotel_id) if self.hotel_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.company_cnpj) if self.company_cnpj else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['final_date', 'initial_date', 'size_m2', 'location', 'mensal_rent', 'weekly_rent', 'room_id', 'deposit_area', 'room_TYPE', 'hotel_id', 'company_cnpj']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from room '
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
        sql = 'delete from room '
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
        sql = 'update room '
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

    @validator("final_date", pre=True)
    def parse_final_date(cls, value):
        return datetime.datetime.strptime(
            value,
            "%d/%m/%Y"
        )
    @validator("initial_date", pre=True)
    def parse_initial_date(cls, value):
        return datetime.datetime.strptime(
            value,
            "%d/%m/%Y"
        )
    @staticmethod
    def getKeys() -> list[str]:
        return ['room_id']
