test = """

CREATE TABLE client (
    f_name varchar(50),
    cpf varchar(11) PRIMARY KEY,
    birth_date datetime,
    l_name varchar(50),
    register_date datetime
);

CREATE TABLE employee (
    office varchar(50),
    salary decimal(10,2),
    f_name varchar(50),
    cpf varchar(11) PRIMARY KEY,
    birth_date datetime,
    l_name varchar(50),
    register_date datetime,
    department_id int
);

CREATE TABLE dependent (
    relation varchar(50),
    f_name varchar(50),
    cpf varchar(11) PRIMARY KEY,
    birth_date datetime,
    l_name varchar(50),
    register_date datetime,
    fk_employee_cpf varchar(11)
);

CREATE TABLE benefit (
    benefit_id int PRIMARY KEY,
    value decimal(10,2),
    level varchar(50),
    benefit_TYPE varchar(50)
);

CREATE TABLE cash_outflow (
    payment_form varchar(50),
    tax decimal(10,2),
    emission_date datetime,
    payment_id int PRIMARY KEY,
    value decimal(10,2),
    quantity int,
    cash_outflow_TYPE varchar(50),
    responsible_cpf varchar(11)
);

CREATE TABLE hotel (
    hotel_id int PRIMARY KEY,
    fantasy_name varchar(50),
    cep varchar(9),
    number int,
    size_m2 decimal(10,2),
    hotel_TYPE varchar(50),
    accept_animals tinyint(1),
    is_familiar tinyint(1),
    has_events tinyint(1),
    is_work tinyint(1)
);

CREATE TABLE bedroom (
    n_bathrooms int,
    max_guests int,
    is_clean int,
    location varchar(50),
    bedroom_id int PRIMARY KEY,
    daily decimal(10,2),
    living_room tinyint(1),
    washing_room tinyint(1),
    kitchen tinyint(1),
    wasshing_room tinyint(1),
    bedroom_TYPE varchar(50),
    hotel_id int
);

CREATE TABLE reservation (
    checkin datetime,
    checkout datetime,
    num_breakfast int,
    value decimal(10,2),
    reservation_id int PRIMARY KEY,
    reservation_date datetime,
    client_cpf varchar(11),
    fidelity_points int as (value * 0.05)
);

CREATE TABLE product (
    last_buy_value decimal,
    name varchar(50),
    description varchar(50),
    sell_value decimal(10,2),
    product_id int PRIMARY KEY
);

CREATE TABLE reservation_period_bedroom (
    days int,
    initial_date datetime,
    bedroom_id int,
    reservation_id int,
    PRIMARY KEY (bedroom_id, reservation_id)
);

CREATE TABLE parking_space (
    location varchar(50),
    daily_rate decimal(10,2),
    preferential tinyint(1),
    parking_id int PRIMARY KEY,
    width decimal(10,2),
    length decimal(10,2),
    parking_space_TYPE varchar(50),
    hotel_id int,
    covered tinyint(1)
);

CREATE TABLE company (
    cnpj varchar(14) PRIMARY KEY,
    fantasy_name varchar(50),
    sector varchar(50)
);

CREATE TABLE event (
    n_days int,
    initial_date datetime,
    value decimal(10,2),
    n_guests int,
    dress_code varchar(50),
    event_id int PRIMARY KEY,
    event_TYPE varchar(50),
    fk_company_cnpj varchar(14),
    fk_client_cpf varchar(11)
);

CREATE TABLE saloon (
    capacity int,
    name varchar(50),
    covered_area decimal(10,2),
    location varchar(50),
    saloon_id int PRIMARY KEY,
    external_area decimal(10,2),
    saloon_TYPE varchar(50),
    hotel_id int
);

CREATE TABLE kitchen (
    n_fridges int,
    n_oven int,
    n_frezeers int,
    n_stoves int,
    stove_hood int,
    size_m2 decimal(10,2),
    kitchen_id int PRIMARY KEY,
    room_id int
);

CREATE TABLE cash_entry (
    payment_form varchar(50),
    tax decimal(10,2),
    emission_date datetime,
    payment_id int PRIMARY KEY,
    value decimal(10,2),
    cupom_id int
);

CREATE TABLE reservation_product (
    quantity int,
    reservation_id int,
    product_id int,
    PRIMARY KEY (reservation_id, product_id)
);

CREATE TABLE hotel_product (
    stock int,
    min_stock int,
    hotel_id int,
    product_id int,
    PRIMARY KEY (product_id, hotel_id)
);

CREATE TABLE bedroom_product (
    min_stock int,
    stock int,
    bedroom_id int,
    product_id int,
    PRIMARY KEY (bedroom_id, product_id)
);

CREATE TABLE reservation_parking_space (
    initial_date datetime,
    total_days int,
    reservation_id int,
    parking_id int,
    PRIMARY KEY (reservation_id, parking_id, initial_date)
);

CREATE TABLE room (
    final_date datetime,
    initial_date datetime,
    size_m2 decimal(10,2),
    location varchar(50),
    mensal_rent decimal(10,2),
    weekly_rent decimal(10,2),
    room_id int PRIMARY KEY,
    deposit_area decimal(10,2),
    room_TYPE varchar(50),
    hotel_id int,
    company_cnpj varchar(14)
);

CREATE TABLE cash_entry_event (
    missing_value decimal(10,2),
    payment_id int,
    event_id int,
    PRIMARY KEY (payment_id, event_id)
);

CREATE TABLE cash_entry_reservation (
    missing_value decimal(10,2),
    payment_id int,
    reservation_id int,
    discont_with_fidelity_points decimal(10,2),
    fidelity_points_used int,
    PRIMARY KEY (reservation_id, payment_id)
);

CREATE TABLE cash_entry_room (
    missing_value decimal(10,2),
    payment_id int,
    room_id int,
    PRIMARY KEY (payment_id, room_id)
);

CREATE TABLE restaurant (
    name varchar(50),
    restaurant_id int PRIMARY KEY,
    type varchar(50),
    room_service int,
    location varchar(50),
    fk_hotel_hotel_id int,
    department_id int
);

CREATE TABLE department (
    department_name varchar(50),
    responsability varchar(50),
    department_id int PRIMARY KEY,
    manager_cpf varchar(11),
    hotel_id int
);

CREATE TABLE restaurant_product (
    stock int,
    min_stock int,
    restaurant_id int,
    product_id int,
    PRIMARY KEY (restaurant_id, product_id)
);

CREATE TABLE cash_entry_restaurant (
    restaurant_id int,
    payment_id int,
    client_cpf varchar(11),
    PRIMARY KEY (restaurant_id, payment_id)
);

CREATE TABLE supervision (
    supervisor_cpf varchar(11),
    employee_cpf varchar(11),
    PRIMARY KEY (employee_cpf, supervisor_cpf)
);

CREATE TABLE benefit_employee (
    benefit_id int,
    employee_cpf varchar(11),
    PRIMARY KEY (benefit_id, employee_cpf)
);

CREATE TABLE received_payment (
    payment_id int,
    employee_cpf varchar(11),
    PRIMARY KEY (employee_cpf, payment_id)
);

CREATE TABLE event_saloon (
    saloon_id int,
    event_id int,
    PRIMARY KEY (saloon_id, event_id)
);

CREATE TABLE saloon_kitchen (
    kitchen_id int,
    saloon_id int,
    PRIMARY KEY (kitchen_id, saloon_id)
);

CREATE TABLE cash_outflow_product (
    product_id int,
    payment_id int,
    PRIMARY KEY (product_id, payment_id)
);

CREATE TABLE employee_room (
    room_id int,
    employee_cpf varchar(11),
    PRIMARY KEY (employee_cpf, room_id)
);

CREATE TABLE employee_saloon (
    saloon_id int,
    employee_cpf varchar(11),
    PRIMARY KEY (saloon_id, employee_cpf)
);

CREATE TABLE cupom (
    active tinyint(1),
    description varchar(50),
    valid_reservation tinyint(1),
    cupom_id int PRIMARY KEY,
    code varchar(50),
    value_percentage decimal(2,2),
    value decimal(10,2),
    cupom_TYPE varchar(50),
    campaign_id int
);

CREATE TABLE campaigns (
    campaign_name varchar(50),
    initial_date datetime,
    final_date datetime,
    main_target varchar(50),
    dept_id int,
    campaign_id int PRIMARY KEY
);

CREATE TABLE dish (
    name varchar(50),
    description varchar(50),
    value decimal(10,2),
    dish_id int PRIMARY KEY,
    restaurant_id int
);

CREATE TABLE petshop (
    petshop_id int PRIMARY KEY,
    name varchar(50),
    location varchar(50),
    open_period varchar(50),
    hotel_id int,
    dept_id int
);

CREATE TABLE petshop_product (
    min_stock int,
    stock int,
    petshop_id int,
    product_id int,
    PRIMARY KEY (petshop_id, product_id)
);

CREATE TABLE petshop_client_payment (
    pet_name varchar(50),
    pet_type varchar(50),
    service_type varchar(50),
    value decimal(10,2),
    petshop_id int,
    cpf varchar(11),
    payment_id int PRIMARY KEY
);

CREATE TABLE fidelity_program (
    cpf varchar(11) PRIMARY KEY,
    points int,
    expire_at datetime
);

CREATE TABLE cash_outflow_campaign (
    campaign_id int,
    payment_id int,
    PRIMARY KEY (campaign_id, payment_id)
);
"""

def getType(input):
    if ("char" in input):
        return "str"
    elif ("datetime" in input):
        return "datetime.datetime"
    elif ("tinyint" in input):
        return "bool"
    elif ("int" in input):
        return "int"
    elif ("decimal" in input):
        return "float"
    return ""

def constructToStr(attrDict):
    file = "    def __repr__(self):\n"   
    file += "        details = '{\\n'\n" 
    for key, value in attrDict.items():
        if "date" not in value:
            file += "        details += '{}: ' + self.{} + '\\n'\n".format(key, key)
        else:
            file += "        details += '{}: ' + self.{}.strftime('%d/%m/%Y') + '\\n'\n".format(key, key)

    file += "        details += '}'\n"
    file += "        return details\n\n"
    return file

def constructDateAttr(attrDict: dict):
    file = ""
    for key, value in attrDict.items():
        if "date" in value:
            file += """    @validator("{}", pre=True)
    def parse_{}(cls, value):
        return datetime.datetime.strptime(
            value,
            "%d/%m/%Y"
        )
""".format(key, key)

    return file

def constructAttr(tableName: str, attrDict: dict):
    file = "class {}(BaseModel):\n".format(tableName.capitalize())

    for key, value in attrDict.items():
        file += "    {}: {} = None\n".format(key, value)

    file += "\n"

    file += "    @staticmethod\n"    
    file += "    def fromList(list):\n"
    file += "        return {}(\n".format(tableName.capitalize())
    
    for index, key in enumerate(attrDict.keys()):
        file += "            {}=list[{}],\n".format(key, index)
    file += "        )"
    file += "\n"

    return file

def constructInsertSql(tableName, attrDict):
    file = "    def insertSql(self) -> str:\n"
    file += "        sql = 'insert into {} values ('\n".format(tableName)
    
    for index, key in enumerate(attrDict.keys()):
        try:
            if "date" in attrDict[key]:
                file += "        sql += {}.format(self.{}) if self.{}.strftime('%Y-%m-%d %H:%M:%S') else 'NULL'\n".format("""'"{}"'""",key, key)
            else:
                file +=  "        sql += {}.format(self.{}) if self.{} else 'NULL'\n".format("""'"{}"'""",key, key)

            if index == len(attrDict.keys()) - 1:
                file += "        sql += ');'\n"
            else:
                file += "        sql += ','\n"
        except Exception as e:
            print(key)
            print(e)
    
    file += "        return sql\n"
    file += "\n"
    return file

def constructQuerySql(tableName,attrDict):
    file = "    @staticmethod\n"
    file += "    def querySql(where: dict, attr: list = []) -> str:\n"
    file += """        if len(attr) == 0:
            attr = {}
""".format(list(attrDict.keys()))
    file += "        sql = 'select {} '.format(','.join(attr))\n"
    file += "        sql += 'from {} '\n".format(tableName)
    file += "        if len(where.keys()):\n"
    file += """            sql += "where "
            for key, value in where.items():
                sql += key 
                sql += " "
                sql += "="
                sql += " "
                sql += "'{}'".format(value)
                sql += " "
"""
    file += "        sql += ';'\n"
    file += "        return sql\n"
    file += "\n"
    return file

def constructUpdateSql(tableName):
    file = "    @staticmethod\n"
    file += "    def updateSql(attrDict:dict, where:dict) -> str:\n"
    file += "        sql = 'update {} '\n".format(tableName)
    file += """        sql += "set "
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
"""
    file += "\n"
    return file

def constructDeleteSql(tableName):
    file = "    @staticmethod\n"
    file += "    def deleteSql(where: dict) -> str:\n"
    file += "        sql = 'delete from {} '\n".format(tableName)
    file += """        sql += "where "
        for key, value in where.items():
            sql += key 
            sql += " "
            sql += "="
            sql += " "
            sql += "'{}'".format(value)
            sql += " "
        sql += ';'
        return sql
"""
    file += "\n"
    return file

def constructGetKeys(primaryKeys):
    return """    @staticmethod
    def getKeys() -> list[str]:
        return {}
""".format(primaryKeys)

def contructModelFile(tableName, attrDict, primaryKeys):
    file = ""
    if "datetime.datetime" in attrDict.values():
        file += "from pydantic import BaseModel, validator\n"
        file += "import datetime\n"
        file += "\n"
    else:
        file += "from pydantic import BaseModel\n"

    file += constructAttr(tableName, attrDict)
    file += constructToStr(attrDict)
    file += constructInsertSql(tableName, attrDict)
    file += constructQuerySql(tableName, attrDict)
    file += constructDeleteSql(tableName)
    file += constructUpdateSql(tableName)
    file += constructDateAttr(attrDict)
    file += constructGetKeys(primaryKeys)

    return file

def constructRouterHeader(table_name: str):
    return """from fastapi import APIRouter
from conn import conn
from model.{} import {}

{}_router = APIRouter(
    prefix="/{}",
    tags=["{}"],
)

""".format(table_name, table_name.capitalize(), table_name, table_name, table_name)

def construcGet(tableName: str):
    return """@{}_router.get("/")
async def read_items(attr: list, where: dict):
    cursor = conn.cursor()
    sql = {}.querySql(attr=attr, where=where)
    cursor.execute(sql)

    lines = cursor.fetchall()

    return {}

""".format(tableName, tableName.capitalize(), '{' + "'values': lines" + '}')

def constructRoute(tableName: str, substitutions: list):
    return """@{}_router.{}("/")
async def {}({}):
    cursor = conn.cursor()
    sql = {}
    cursor.execute(sql)
    conn.commit()

    return {}

""".format(tableName, substitutions[0], substitutions[1], substitutions[2], substitutions[3], substitutions[4])

def contructRouterFile(tableName: str):
    file = ""
    file = constructRouterHeader(tableName)
    file += construcGet(tableName)
    file += constructRoute(tableName, [
        "post",
        "insert_item",
        "{}: {}".format(tableName, tableName.capitalize()),
        "{}.insertSql()".format(tableName),
        "{" + "'added':" + tableName + "}"
    ])
    file += constructRoute(tableName, [
        "delete",
        "delete_item",
        "where: dict",
        "{}.deleteSql(where=where)".format(tableName.capitalize()),
        "{" + "'deleted': where" + "}"
    ])
    file += constructRoute(tableName, [
        "put",
        "update_items",
        "attrDict: dict, where: dict",
        "{}.updateSql(where=where, attrDict=attrDict)".format(tableName.capitalize()),
        "{" + "'updated': attrDict, 'where': where" + "}"
    ])
    return file

def convert(createSql) -> str:
    try:
        attrDict = {}
        name = createSql.splitlines()[2].split()[2]
        primaryKeys = []
        for arg in createSql.splitlines()[3:-1]:
            argType = getType(arg.split()[1].lower())
            if argType != "":
                attrName = arg.split()[0]
                attrDict[attrName] = argType
            if "PRIMARY" in arg:
                if argType != "":
                    primaryKeys.append(attrName)
                else:
                    primaryKeys = arg.split("(")[1][:-1].split(", ")
        
        model = contructModelFile(name, attrDict, primaryKeys)

        with open("model/{}.py".format(name), "w") as f:
            f.write(model)

        router = contructRouterFile(name)

        with open("router/{}.py".format(name), "w") as f:
            f.write(router)

        return name
        
    except Exception as e:
        print(  )
        print(e)

def constructImports(listName: list):
    file = ""
    for name in listName:
        file += "from router.{} import {}_router\n".format(name, name)
    
    return file

def constructRouters(listName: list):
    file = ""
    for name in listName:
        file += "app.include_router({}_router)\n".format(name)
    
    return file

def constructRouter(listName: list):
    file = """from fastapi import FastAPI
"""
    file += constructImports(listName)
    file += "\napp = FastAPI()\n"
    file += constructRouters(listName)

    with open("main.py", "w") as f:
        f.write(file)

listName = []
for index, createSql in enumerate(test.split(";")):
    if index < len(test.split(";")) - 1:
        listName.append(convert(createSql))  

constructRouter(listName)