from pydantic import BaseModel
class Kitchen(BaseModel):
    n_fridges: int = None
    n_oven: int = None
    n_frezeers: int = None
    n_stoves: int = None
    stove_hood: int = None
    size_m2: float = None
    kitchen_id: int = None
    room_id: int = None

    @staticmethod
    def fromList(list):
        return Kitchen(
            n_fridges=list[0],
            n_oven=list[1],
            n_frezeers=list[2],
            n_stoves=list[3],
            stove_hood=list[4],
            size_m2=list[5],
            kitchen_id=list[6],
            room_id=list[7],
        )
    def __repr__(self):
        details = '{\n'
        details += 'n_fridges: ' + self.n_fridges + '\n'
        details += 'n_oven: ' + self.n_oven + '\n'
        details += 'n_frezeers: ' + self.n_frezeers + '\n'
        details += 'n_stoves: ' + self.n_stoves + '\n'
        details += 'stove_hood: ' + self.stove_hood + '\n'
        details += 'size_m2: ' + self.size_m2 + '\n'
        details += 'kitchen_id: ' + self.kitchen_id + '\n'
        details += 'room_id: ' + self.room_id + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into kitchen values ('
        sql += '"{}"'.format(self.n_fridges) if self.n_fridges else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.n_oven) if self.n_oven else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.n_frezeers) if self.n_frezeers else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.n_stoves) if self.n_stoves else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.stove_hood) if self.stove_hood else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.size_m2) if self.size_m2 else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.kitchen_id) if self.kitchen_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.room_id) if self.room_id else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['n_fridges', 'n_oven', 'n_frezeers', 'n_stoves', 'stove_hood', 'size_m2', 'kitchen_id', 'room_id']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from kitchen '
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
        sql = 'delete from kitchen '
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
        sql = 'update kitchen '
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
        return ['kitchen_id']
