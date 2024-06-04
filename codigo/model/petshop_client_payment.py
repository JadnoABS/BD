from pydantic import BaseModel
class Petshop_client_payment(BaseModel):
    pet_name: str = None
    pet_type: str = None
    service_type: str = None
    value: float = None
    petshop_id: int = None
    cpf: str = None
    payment_id: int = None

    @staticmethod
    def fromList(list):
        return Petshop_client_payment(
            pet_name=list[0],
            pet_type=list[1],
            service_type=list[2],
            value=list[3],
            petshop_id=list[4],
            cpf=list[5],
            payment_id=list[6],
        )
    def __repr__(self):
        details = '{\n'
        details += 'pet_name: ' + self.pet_name + '\n'
        details += 'pet_type: ' + self.pet_type + '\n'
        details += 'service_type: ' + self.service_type + '\n'
        details += 'value: ' + self.value + '\n'
        details += 'petshop_id: ' + self.petshop_id + '\n'
        details += 'cpf: ' + self.cpf + '\n'
        details += 'payment_id: ' + self.payment_id + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into petshop_client_payment values ('
        sql += '"{}"'.format(self.pet_name) if self.pet_name else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.pet_type) if self.pet_type else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.service_type) if self.service_type else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.value) if self.value else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.petshop_id) if self.petshop_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.cpf) if self.cpf else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.payment_id) if self.payment_id else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['pet_name', 'pet_type', 'service_type', 'value', 'petshop_id', 'cpf', 'payment_id']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from petshop_client_payment '
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
        sql = 'delete from petshop_client_payment '
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
        sql = 'update petshop_client_payment '
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
        return ['payment_id']
