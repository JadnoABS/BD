from pydantic import BaseModel
class Department(BaseModel):
    department_name: str = None
    responsability: str = None
    department_id: int = None
    manager_cpf: str = None
    hotel_id: int = None

    @staticmethod
    def fromList(list):
        return Department(
            department_name=list[0],
            responsability=list[1],
            department_id=list[2],
            manager_cpf=list[3],
            hotel_id=list[4],
        )
    def __repr__(self):
        details = '{\n'
        details += 'department_name: ' + self.department_name + '\n'
        details += 'responsability: ' + self.responsability + '\n'
        details += 'department_id: ' + self.department_id + '\n'
        details += 'manager_cpf: ' + self.manager_cpf + '\n'
        details += 'hotel_id: ' + self.hotel_id + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into department values ('
        sql += '"{}"'.format(self.department_name) if self.department_name else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.responsability) if self.responsability else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.department_id) if self.department_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.manager_cpf) if self.manager_cpf else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.hotel_id) if self.hotel_id else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['department_name', 'responsability', 'department_id', 'manager_cpf', 'hotel_id']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from department '
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
        sql = 'delete from department '
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
        sql = 'update department '
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
        return ['department_id']
