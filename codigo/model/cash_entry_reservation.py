from pydantic import BaseModel
class Cash_entry_reservation(BaseModel):
    missing_value: float = None
    payment_id: int = None
    reservation_id: int = None
    discont_with_fidelity_points: float = None
    fidelity_points_used: int = None

    @staticmethod
    def fromList(list):
        return Cash_entry_reservation(
            missing_value=list[0],
            payment_id=list[1],
            reservation_id=list[2],
            discont_with_fidelity_points=list[3],
            fidelity_points_used=list[4],
        )
    def __repr__(self):
        details = '{\n'
        details += 'missing_value: ' + self.missing_value + '\n'
        details += 'payment_id: ' + self.payment_id + '\n'
        details += 'reservation_id: ' + self.reservation_id + '\n'
        details += 'discont_with_fidelity_points: ' + self.discont_with_fidelity_points + '\n'
        details += 'fidelity_points_used: ' + self.fidelity_points_used + '\n'
        details += '}'
        return details

    def insertSql(self) -> str:
        sql = 'insert into cash_entry_reservation values ('
        sql += '"{}"'.format(self.missing_value) if self.missing_value else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.payment_id) if self.payment_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.reservation_id) if self.reservation_id else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.discont_with_fidelity_points) if self.discont_with_fidelity_points else 'NULL'
        sql += ','
        sql += '"{}"'.format(self.fidelity_points_used) if self.fidelity_points_used else 'NULL'
        sql += ');'
        return sql

    @staticmethod
    def querySql(where: dict, attr: list = []) -> str:
        if len(attr) == 0:
            attr = ['missing_value', 'payment_id', 'reservation_id', 'discont_with_fidelity_points', 'fidelity_points_used']
        sql = 'select {} '.format(','.join(attr))
        sql += 'from cash_entry_reservation '
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
        sql = 'delete from cash_entry_reservation '
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
        sql = 'update cash_entry_reservation '
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
        return ['reservation_id', 'payment_id']
