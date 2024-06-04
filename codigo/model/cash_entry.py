from pydantic import BaseModel, validator
import datetime

class Cash_entry(BaseModel):
    payment_form: str = None
    tax: float = None
    emission_date: datetime.datetime = None
    payment_id: int = None
    value: float = None
    cupom_id: int = None

    @staticmethod
    def fromList(list):
        return Cash_entry(
            payment_form=list[0],
            tax=list[1],
            emission_date=list[2],
            payment_id=list[3],
            value=list[4],
            cupom_id=list[5],
        )
    def __repr__(self):
        details = '{\n'
        details += 'payment_form: ' + self.payment_form + '\n'
        details += 'tax: ' + self.tax + '\n'
        details += 'emission_date: ' + self.emission_date.strftime('%d/%m/%Y') + '\n'
        details += 'payment_id: ' + self.payment_id + '\n'
        details += 'value: ' + self.value + '\n'
        details += 'cupom_id: ' + self.cupom_id + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into cash_entry values ('
        sql += '"{}"'.format(self.payment_form) if self.payment_form else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.tax) if self.tax else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.emission_date) if self.emission_date.strftime('%Y-%m-%d %H:%M:%S') else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.payment_id) if self.payment_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.value) if self.value else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.cupom_id) if self.cupom_id else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['payment_form', 'tax', 'emission_date', 'payment_id', 'value', 'cupom_id']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from cash_entry '
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
        sql = 'delete from cash_entry '
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
        sql = 'update cash_entry '
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

    @validator("emission_date", pre=True)
    def parse_emission_date(cls, value):
        return datetime.datetime.strptime(
            value,
            "%d/%m/%Y"
        )
    @staticmethod
    def getKeys() -> list[str]:
        return ['payment_id']
