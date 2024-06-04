from pydantic import BaseModel, validator
import datetime

class Campaigns(BaseModel):
    campaign_name: str = None
    initial_date: datetime.datetime = None
    final_date: datetime.datetime = None
    main_target: str = None
    dept_id: int = None
    campaign_id: int = None

    @staticmethod
    def fromList(list):
        return Campaigns(
            campaign_name=list[0],
            initial_date=list[1],
            final_date=list[2],
            main_target=list[3],
            dept_id=list[4],
            campaign_id=list[5],
        )
    def __repr__(self):
        details = '{\n'
        details += 'campaign_name: ' + self.campaign_name + '\n'
        details += 'initial_date: ' + self.initial_date.strftime('%d/%m/%Y') + '\n'
        details += 'final_date: ' + self.final_date.strftime('%d/%m/%Y') + '\n'
        details += 'main_target: ' + self.main_target + '\n'
        details += 'dept_id: ' + self.dept_id + '\n'
        details += 'campaign_id: ' + self.campaign_id + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into campaigns values ('
        sql += '"{}"'.format(self.campaign_name) if self.campaign_name else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.initial_date) if self.initial_date.strftime('%Y-%m-%d %H:%M:%S') else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.final_date) if self.final_date.strftime('%Y-%m-%d %H:%M:%S') else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.main_target) if self.main_target else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.dept_id) if self.dept_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.campaign_id) if self.campaign_id else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['campaign_name', 'initial_date', 'final_date', 'main_target', 'dept_id', 'campaign_id']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from campaigns '
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
        sql = 'delete from campaigns '
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
        sql = 'update campaigns '
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
    @validator("final_date", pre=True)
    def parse_final_date(cls, value):
        return datetime.datetime.strptime(
            value,
            "%d/%m/%Y"
        )
    @staticmethod
    def getKeys() -> list[str]:
        return ['campaign_id']
