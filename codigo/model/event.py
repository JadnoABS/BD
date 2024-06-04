from pydantic import BaseModel, validator
import datetime

class Event(BaseModel):
    n_days: int = None
    initial_date: datetime.datetime = None
    value: float = None
    n_guests: int = None
    dress_code: str = None
    event_id: int = None
    event_TYPE: str = None
    fk_company_cnpj: str = None
    fk_client_cpf: str = None

    @staticmethod
    def fromList(list):
        return Event(
            n_days=list[0],
            initial_date=list[1],
            value=list[2],
            n_guests=list[3],
            dress_code=list[4],
            event_id=list[5],
            event_TYPE=list[6],
            fk_company_cnpj=list[7],
            fk_client_cpf=list[8],
        )
    def __repr__(self):
        details = '{\n'
        details += 'n_days: ' + self.n_days + '\n'
        details += 'initial_date: ' + self.initial_date.strftime('%d/%m/%Y') + '\n'
        details += 'value: ' + self.value + '\n'
        details += 'n_guests: ' + self.n_guests + '\n'
        details += 'dress_code: ' + self.dress_code + '\n'
        details += 'event_id: ' + self.event_id + '\n'
        details += 'event_TYPE: ' + self.event_TYPE + '\n'
        details += 'fk_company_cnpj: ' + self.fk_company_cnpj + '\n'
        details += 'fk_client_cpf: ' + self.fk_client_cpf + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into event values ('
        sql += '"{}"'.format(self.n_days) if self.n_days else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.initial_date) if self.initial_date.strftime('%Y-%m-%d %H:%M:%S') else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.value) if self.value else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.n_guests) if self.n_guests else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.dress_code) if self.dress_code else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.event_id) if self.event_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.event_TYPE) if self.event_TYPE else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.fk_company_cnpj) if self.fk_company_cnpj else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.fk_client_cpf) if self.fk_client_cpf else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['n_days', 'initial_date', 'value', 'n_guests', 'dress_code', 'event_id', 'event_TYPE', 'fk_company_cnpj', 'fk_client_cpf']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from event '
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
        sql = 'delete from event '
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
        sql = 'update event '
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
        return ['event_id']
