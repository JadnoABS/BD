from pydantic import BaseModel
class Cupom(BaseModel):
    active: bool = None
    description: str = None
    valid_reservation: bool = None
    cupom_id: int = None
    code: str = None
    value_percentage: float = None
    value: float = None
    cupom_TYPE: str = None
    campaign_id: int = None

    @staticmethod
    def fromList(list):
        return Cupom(
            active=list[0],
            description=list[1],
            valid_reservation=list[2],
            cupom_id=list[3],
            code=list[4],
            value_percentage=list[5],
            value=list[6],
            cupom_TYPE=list[7],
            campaign_id=list[8],
        )
    def __repr__(self):
        details = '{\n'
        details += 'active: ' + self.active + '\n'
        details += 'description: ' + self.description + '\n'
        details += 'valid_reservation: ' + self.valid_reservation + '\n'
        details += 'cupom_id: ' + self.cupom_id + '\n'
        details += 'code: ' + self.code + '\n'
        details += 'value_percentage: ' + self.value_percentage + '\n'
        details += 'value: ' + self.value + '\n'
        details += 'cupom_TYPE: ' + self.cupom_TYPE + '\n'
        details += 'campaign_id: ' + self.campaign_id + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into cupom values ('
        sql += '"{}"'.format(self.active) if self.active else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.description) if self.description else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.valid_reservation) if self.valid_reservation else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.cupom_id) if self.cupom_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.code) if self.code else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.value_percentage) if self.value_percentage else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.value) if self.value else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.cupom_TYPE) if self.cupom_TYPE else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.campaign_id) if self.campaign_id else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['active', 'description', 'valid_reservation', 'cupom_id', 'code', 'value_percentage', 'value', 'cupom_TYPE', 'campaign_id']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from cupom '
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
        sql = 'delete from cupom '
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
        sql = 'update cupom '
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
        return ['cupom_id']
