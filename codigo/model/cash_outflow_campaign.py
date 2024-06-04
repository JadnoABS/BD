from pydantic import BaseModel
class Cash_outflow_campaign(BaseModel):
    campaign_id: int = None
    payment_id: int = None

    @staticmethod
    def fromList(list):
        return Cash_outflow_campaign(
            campaign_id=list[0],
            payment_id=list[1],
        )
    def __repr__(self):
        details = '{\n'
        details += 'campaign_id: ' + self.campaign_id + '\n'
        details += 'payment_id: ' + self.payment_id + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into cash_outflow_campaign values ('
        sql += '"{}"'.format(self.campaign_id) if self.campaign_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.payment_id) if self.payment_id else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['campaign_id', 'payment_id']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from cash_outflow_campaign '
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
        sql = 'delete from cash_outflow_campaign '
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
        sql = 'update cash_outflow_campaign '
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
        return ['campaign_id', 'payment_id']
