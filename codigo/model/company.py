from pydantic import BaseModel
class Company(BaseModel):
    cnpj: str = None
    fantasy_name: str = None
    sector: str = None

    @staticmethod
    def fromList(list):
        return Company(
            cnpj=list[0],
            fantasy_name=list[1],
            sector=list[2],
        )
    def __repr__(self):
        details = '{\n'
        details += 'cnpj: ' + self.cnpj + '\n'
        details += 'fantasy_name: ' + self.fantasy_name + '\n'
        details += 'sector: ' + self.sector + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into company values ('
        sql += '"{}"'.format(self.cnpj) if self.cnpj else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.fantasy_name) if self.fantasy_name else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.sector) if self.sector else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['cnpj', 'fantasy_name', 'sector']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from company '
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
        sql = 'delete from company '
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
        sql = 'update company '
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
        return ['cnpj']
