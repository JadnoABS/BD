from pydantic import BaseModel
class Hotel(BaseModel):
    hotel_id: int = None
    fantasy_name: str = None
    cep: str = None
    number: int = None
    size_m2: float = None
    hotel_TYPE: str = None
    accept_animals: bool = None
    is_familiar: bool = None
    has_events: bool = None
    is_work: bool = None

    @staticmethod
    def fromList(list):
        return Hotel(
            hotel_id=list[0],
            fantasy_name=list[1],
            cep=list[2],
            number=list[3],
            size_m2=list[4],
            hotel_TYPE=list[5],
            accept_animals=list[6],
            is_familiar=list[7],
            has_events=list[8],
            is_work=list[9],
        )
    def __repr__(self):
        details = '{\n'
        details += 'hotel_id: ' + self.hotel_id + '\n'
        details += 'fantasy_name: ' + self.fantasy_name + '\n'
        details += 'cep: ' + self.cep + '\n'
        details += 'number: ' + self.number + '\n'
        details += 'size_m2: ' + self.size_m2 + '\n'
        details += 'hotel_TYPE: ' + self.hotel_TYPE + '\n'
        details += 'accept_animals: ' + self.accept_animals + '\n'
        details += 'is_familiar: ' + self.is_familiar + '\n'
        details += 'has_events: ' + self.has_events + '\n'
        details += 'is_work: ' + self.is_work + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into hotel values ('
        sql += '"{}"'.format(self.hotel_id) if self.hotel_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.fantasy_name) if self.fantasy_name else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.cep) if self.cep else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.number) if self.number else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.size_m2) if self.size_m2 else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.hotel_TYPE) if self.hotel_TYPE else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.accept_animals) if self.accept_animals else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.is_familiar) if self.is_familiar else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.has_events) if self.has_events else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.is_work) if self.is_work else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['hotel_id', 'fantasy_name', 'cep', 'number', 'size_m2', 'hotel_TYPE', 'accept_animals', 'is_familiar', 'has_events', 'is_work']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from hotel '
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
        sql = 'delete from hotel '
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
        sql = 'update hotel '
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
        return ['hotel_id']
