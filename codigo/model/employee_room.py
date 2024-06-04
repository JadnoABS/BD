from pydantic import BaseModel
class Employee_room(BaseModel):
    room_id: int = None
    employee_cpf: str = None

    @staticmethod
    def fromList(list):
        return Employee_room(
            room_id=list[0],
            employee_cpf=list[1],
        )
    def __repr__(self):
        details = '{\n'
        details += 'room_id: ' + self.room_id + '\n'
        details += 'employee_cpf: ' + self.employee_cpf + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into employee_room values ('
        sql += '"{}"'.format(self.room_id) if self.room_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.employee_cpf) if self.employee_cpf else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['room_id', 'employee_cpf']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from employee_room '
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
        sql = 'delete from employee_room '
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
        sql = 'update employee_room '
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
        return ['employee_cpf', 'room_id']
