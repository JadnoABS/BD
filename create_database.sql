/* Logico: */

CREATE TABLE person (
    cpf VARCHAR(12) PRIMARY KEY UNIQUE,
    f_name VARCHAR(15),
    l_name VARCHAR(15),
    birth_date VARCHAR(12),
    register_date DATE
);

CREATE TABLE employee (
    registration VARCHAR(6) PRIMARY KEY,
    cpf VARCHAR(12) UNIQUE,
    salary DECIMAL(10,2),
    employment VARCHAR(30),
    super_registration VARCHAR(6),
    dept_id VARCHAR(12)
);

CREATE TABLE dependent (
    cpf VARCHAR(12),
    registration VARCHAR(6),
    relation VARCHAR(12),
    PRIMARY KEY (cpf, registration)
);

CREATE TABLE department (
    dept_id VARCHAR(12) PRIMARY KEY,
    name VARCHAR(15),
    reponsability VARCHAR(30),
    manager_registration VARCHAR(6)
);

CREATE TABLE benefit (
    type VARCHAR(20),
    value DECIMAL(10,2),
    registration VARCHAR(6),
    PRIMARY KEY (registration, type)
);

CREATE TABLE reservation (
    reservation_id VARCHAR(12) PRIMARY KEY,
    checkin DATETIME,
    checkout DATETIME,
    has_breakfast INT,
    all_inclusive INT,
    value DECIMAL(12,2),
    cpf VARCHAR(12)
);

CREATE TABLE room (
    room_id VARCHAR(12) PRIMARY KEY,
    room_number INT,
    hotel_id VARCHAR(12),
    max_guests: INT,
    bathroom_number INT,
    location varchar(30),
    type varchar(10),
    living_room INT,
    washing_room INT,
    kitchen INT
);

CREATE TABLE room_reservation (
    room_id VARCHAR(12),
    reservation_id VARCHAR(12),
    PRIMARY KEY (room_id, reservation_id)
);

CREATE TABLE hotel (
    hotel_id VARCHAR(12) PRIMARY KEY,
    fantasy_name VARCHAR(20),
    cep VARCHAR(10),
    number INT,
    size_m2 DECIMAL(15,2),
    family_friendly BOOLEAN,
    adult_public BOOLEAN,
    pet_friendly BOOLEAN,
    big_events BOOLEAN,
    work_related BOOLEAN,
    type VARCHAR(12)
);

CREATE TABLE saloon (
    hotel_id VARCHAR(12),
    saloon_id VARCHAR(12) PRIMARY KEY,
    capacity INT,
    location VARCHAR(20),
    covered_m2 DECIMAL(10,2),
    uncovered_m2 DECIMAL(10,2)
);

CREATE TABLE rent_room (
    rent_room_id VARCHAR(12) PRIMARY KEY,
    hotel_id VARCHAR(12),
    mensal_rent DECIMAL(12,2),
    weekly_rent DECIMAL(12,2),
    location VARCHAR(20),
    size_m2 DECIMAL(8,2),
    type VARCHAR(12)
);

CREATE TABLE kitchen (
    kitchen_id VARCHAR(12) PRIMARY KEY,
    num_fridge INT,
    num_oven INT,
    stove_hood INT,
    num_stove INT,
    num_frezzer INT,
    size_m2 DECIMAL(10,2),
    rent_room_id VARCHAR(12),
    saloon_id VARCHAR(12)
);

CREATE TABLE event (
    event_id VARCHAR(12) PRIMARY KEY,
    init_date DATETIME,
    duration INT,
    value DECIMAL(12,2),
    guests INT,
    dress_code VARCHAR(20),
    hired_by_cnpj VARCHAR(12),
    hired_by_cpf VARCHAR(12)
);

CREATE TABLE event_saloon (
    event_id VARCHAR(12),
    saloon_id VARCHAR(12),
    init_date DATETIME,
    final_date DATETIME,
    PRIMARY KEY (event_id, saloon_id, init_date)
);

CREATE TABLE company (
    cpnj VARCHAR(12) PRIMARY KEY,
    name VARCHAR(20),
    sector VARCHAR(20)
);

CREATE TABLE product (
    product_id VARCHAR(12) PRIMARY KEY,
    name VARCHAR(20),
    description VARCHAR(100),
    last_buy_price DECIMAL(10,2),
    sell_price DECIMAL(10,2)
);

CREATE TABLE hotel_product (
    hotel_id VARCHAR(12),
    product_id VARCHAR(12),
    stock DECIMAL(10,2),
    minimum_stock DECIMAL(10,2),
    PRIMARY KEY (hotel_id, product_id)
);

CREATE TABLE room_product (
    room_id VARCHAR(12),
    product_id VARCHAR(12),
    stock DECIMAL(10,2),
    minimum_stock DECIMAL(10,2),
    PRIMARY KEY (product_id, room_id)
);

CREATE TABLE reservation_product (
    reservation_id VARCHAR(12),
    product_id VARCHAR(12),
    stock DECIMAL(10,2),
    minimum_stock DECIMAL(10,2),
    PRIMARY KEY (reservation_id, product_id)
);

CREATE TABLE parking_space (
    parking_id VARCHAR(12) PRIMARY KEY,
    hotel_id VARCHAR(12),
    type VARCHAR(12),
    preferential INT,
    price_day DECIMAL(3,2),
    width DECIMAL(2,2),
    length DECIMAL(2,2),
    parking_number INT
);

CREATE TABLE reservation_parking (
    reservation_id VARCHAR(12),
    parking_id VARCHAR(12),
    date DATE,
    PRIMARY KEY (reservation_id, date, parking_id)
);

CREATE TABLE receipt (
    receipt_id VARCAHR(12) PRIMARY KEY,
    date DATETIME,
    value DECIMAL(12,2)
);

CREATE TABLE payment (
    payment_id VARCHAR(12) PRIMARY KEY,
    responsible_registration VARCHAR(6),
    date DATETIME,
    value DECIIMAL(12,2)
);

CREATE TABLE employee_payment (
    registration VARCHAR(6),
    payment_id VARCHAR(12),
    PRIMARY KEY (registration, payment_id)
);

CREATE TABLE product_payment (
    product_id VARCHAR(12),
    payment_id VARCHAR(12),
    quantity INT,
    quantity_unit VARCHAR(10),
    unit_price DECIMAL(10,2),
    PRIMARY KEY (product_id, payment_id)
);

CREATE TABLE receipt_reservation (
    receipt_id VARCAHR(12),
    reservation_id VARCHAR(12),
    datetime DATETIME,
    value DECIMAL(10,2),
    missing DECIMAL(10,2),
    PRIMARY KEY (receipt_id, reservation_id, datetime)
);

CREATE TABLE receipt_rent (
    receipt_id VARCAHR(12),
    rent_id VARCHAR(12),
    datetime DATETIME,
    value DECIMAL(10,2),
    missing DECIMAL(10,2),
    PRIMARY KEY (receipt_id, rent_id, datetime)
);

CREATE TABLE event_reservation (
    receipt_id VARCAHR(12),
    event_id VARCHAR(12),
    datetime DATETIME,
    value DECIMAL(10,2),
    missing DECIMAL(10,2),
    PRIMARY KEY (receipt_id, event_id, datetime)
);

CREATE TABLE receipt_restaurant (
    receipt_id VARCAHR(12),
    restaurant_id VARCHAR(12),
    date DATETIME,
    value DECIMAL(10,2),
    PRIMARY KEY (receipt_id, restaurant_id, date)
);

CREATE TABLE rent (
    rent_id VARCHAR(12) PRIMARY KEY,
    rent_room_id VARCHAR(12),
    cnpj VARCHAR(12),
    init_date DATETIME,
    final_date DATETIME,
    value DECIMAL(12,2),
    payment_period VARCHAR(10),
    UNIQUE (rent_room_id, cnpj)
);

CREATE TABLE restaurant (
    id_restaurant VARCHAR(12) PRIMARY KEY,
    name VARCHAR(20),
    type VARCHAR(15),
    room_service INT,
    location VARCHAR(15),
    hotel_id VARCHAR(12),
    dept_id VARCHAR(12)
);

CREATE TABLE restaurant_room (
    restaurant_id VARCHAR(12),
    reservation_id VARCHAR(12),
    datetime DATETIME,
    value DECIMAL(10,2),
    PRIMARY KEY (restaurant_id, reservation_id, datetime)
);

CREATE TABLE dishes (
    restaurant_id VARCHAR(12),
    name VARCHAR(20),
    value DECIMAL(5,2),
    decription VARCHAR(100),
    PRIMARY KEY (restaurant_id, name)
);
 
ALTER TABLE employee ADD CONSTRAINT FK_employee_3
    FOREIGN KEY (cpf)
    REFERENCES person (cpf);
 
ALTER TABLE employee ADD CONSTRAINT FK_employee_4
    FOREIGN KEY (super_registration)
    REFERENCES employee (registration);
 
ALTER TABLE employee ADD CONSTRAINT FK_employee_5
    FOREIGN KEY (dept_id)
    REFERENCES department (dept_id);
 
ALTER TABLE dependent ADD CONSTRAINT FK_dependent_person
    FOREIGN KEY (cpf)
    REFERENCES person (cpf);
 
ALTER TABLE dependent ADD CONSTRAINT FK_dependent_3
    FOREIGN KEY (registration)
    REFERENCES employee (registration);
 
ALTER TABLE department ADD CONSTRAINT FK_department_2
    FOREIGN KEY (manager_registration)
    REFERENCES employee (registration);
 
ALTER TABLE benefit ADD CONSTRAINT FK_benefit_1
    FOREIGN KEY (registration)
    REFERENCES employee (registration);
 
ALTER TABLE reservation ADD CONSTRAINT FK_reservation_2
    FOREIGN KEY (cpf)
    REFERENCES person (cpf);
 
ALTER TABLE room ADD CONSTRAINT FK_room_1
    FOREIGN KEY (hotel_id)
    REFERENCES hotel (hotel_id);
 
ALTER TABLE room_reservation ADD CONSTRAINT FK_room_reservation_1
    FOREIGN KEY (room_id)
    REFERENCES room (room_id);
 
ALTER TABLE room_reservation ADD CONSTRAINT FK_room_reservation_3
    FOREIGN KEY (reservation_id)
    REFERENCES reservation (reservation_id);
 
ALTER TABLE saloon ADD CONSTRAINT FK_saloon_2
    FOREIGN KEY (hotel_id)
    REFERENCES hotel (hotel_id);
 
ALTER TABLE rent_room ADD CONSTRAINT FK_rent_room_2
    FOREIGN KEY (hotel_id)
    REFERENCES hotel (hotel_id);
 
ALTER TABLE rent_room ADD CONSTRAINT FK_rent_room_3
    FOREIGN KEY (fk_kitchen_rent_room_id???)
    REFERENCES ??? (???);
 
ALTER TABLE kitchen ADD CONSTRAINT FK_kitchen_1
    FOREIGN KEY (rent_room_id)
    REFERENCES saloon (saloon_id);
 
ALTER TABLE kitchen ADD CONSTRAINT FK_kitchen_2
    FOREIGN KEY (saloon_id)
    REFERENCES rent_room (rent_room_id);
 
ALTER TABLE event ADD CONSTRAINT FK_event_2
    FOREIGN KEY (hired_by_cpf)
    REFERENCES person (cpf);
 
ALTER TABLE event ADD CONSTRAINT FK_event_3
    FOREIGN KEY (hired_by_cnpj)
    REFERENCES company (cpnj);
 
ALTER TABLE event_saloon ADD CONSTRAINT FK_event_saloon_2
    FOREIGN KEY (event_id)
    REFERENCES event (event_id);
 
ALTER TABLE event_saloon ADD CONSTRAINT FK_event_saloon_3
    FOREIGN KEY (saloon_id)
    REFERENCES saloon (saloon_id);
 
ALTER TABLE hotel_product ADD CONSTRAINT FK_hotel_product_2
    FOREIGN KEY (product_id)
    REFERENCES product (product_id);
 
ALTER TABLE hotel_product ADD CONSTRAINT FK_hotel_product_3
    FOREIGN KEY (hotel_id)
    REFERENCES hotel (hotel_id);
 
ALTER TABLE room_product ADD CONSTRAINT FK_room_product_2
    FOREIGN KEY (product_id)
    REFERENCES product (product_id);
 
ALTER TABLE room_product ADD CONSTRAINT FK_room_product_3
    FOREIGN KEY (room_id)
    REFERENCES room (room_id);
 
ALTER TABLE reservation_product ADD CONSTRAINT FK_reservation_product_2
    FOREIGN KEY (reservation_id)
    REFERENCES reservation (reservation_id);
 
ALTER TABLE reservation_product ADD CONSTRAINT FK_reservation_product_3
    FOREIGN KEY (product_id)
    REFERENCES product (product_id);
 
ALTER TABLE parking_space ADD CONSTRAINT FK_parking_space_2
    FOREIGN KEY (hotel_id)
    REFERENCES hotel (hotel_id);
 
ALTER TABLE reservation_parkin ADD CONSTRAINT FK_reservation_parkin_2
    FOREIGN KEY (reservation_id)
    REFERENCES reservation (reservation_id);
 
ALTER TABLE reservation_parkin ADD CONSTRAINT FK_reservation_parkin_3
    FOREIGN KEY (parking_id)
    REFERENCES parking_space (parkin_id);
 
ALTER TABLE payment ADD CONSTRAINT FK_payment_2
    FOREIGN KEY (responsible_registration)
    REFERENCES employee (registration);
 
ALTER TABLE employee_payment ADD CONSTRAINT FK_employee_payment_2
    FOREIGN KEY (payment_id)
    REFERENCES payment (payment_id);
 
ALTER TABLE employee_payment ADD CONSTRAINT FK_employee_payment_3
    FOREIGN KEY (registration)
    REFERENCES employee (registration);
 
ALTER TABLE product_payment ADD CONSTRAINT FK_product_payment_1
    FOREIGN KEY (product_id)
    REFERENCES product (product_id);
 
ALTER TABLE product_payment ADD CONSTRAINT FK_product_payment_3
    FOREIGN KEY (payment_id)
    REFERENCES payment (payment_id);
 
ALTER TABLE receipt_reservation ADD CONSTRAINT FK_receipt_reservation_2
    FOREIGN KEY (receipt_id)
    REFERENCES receipt (receipt_id);
 
ALTER TABLE receipt_reservation ADD CONSTRAINT FK_receipt_reservation_3
    FOREIGN KEY (reservation_id)
    REFERENCES reservation (reservation_id);
 
ALTER TABLE receipt_rent ADD CONSTRAINT FK_receipt_rent_2
    FOREIGN KEY (receipt_id)
    REFERENCES receipt (receipt_id);
 
ALTER TABLE receipt_rent ADD CONSTRAINT FK_receipt_rent_3
    FOREIGN KEY (rent_id)
    REFERENCES rent (rent_id);
 
ALTER TABLE event_reservation ADD CONSTRAINT FK_event_reservation_2
    FOREIGN KEY (receipt_id)
    REFERENCES receipt (receipt_id);
 
ALTER TABLE event_reservation ADD CONSTRAINT FK_event_reservation_3
    FOREIGN KEY (event_id)
    REFERENCES event (event_id);
 
ALTER TABLE receipt_restaurant ADD CONSTRAINT FK_receipt_restaurant_2
    FOREIGN KEY (receipt_id)
    REFERENCES receipt (receipt_id);
 
ALTER TABLE receipt_restaurant ADD CONSTRAINT FK_receipt_restaurant_3
    FOREIGN KEY (restaurant_id)
    REFERENCES restaurant (id_restaurant);
 
ALTER TABLE rent ADD CONSTRAINT FK_rent_1
    FOREIGN KEY (rent_room_id)
    REFERENCES rent_room (rent_room_id);
 
ALTER TABLE rent ADD CONSTRAINT FK_rent_4
    FOREIGN KEY (cnpj)
    REFERENCES company (cpnj);
 
ALTER TABLE restaurant ADD CONSTRAINT FK_restaurant_2
    FOREIGN KEY (hotel_id)
    REFERENCES hotel (hotel_id);
 
ALTER TABLE restaurant ADD CONSTRAINT FK_restaurant_3
    FOREIGN KEY (dept_id)
    REFERENCES department (dept_id);
 
ALTER TABLE restaurant_room ADD CONSTRAINT FK_restaurant_room_2
    FOREIGN KEY (restaurant_id)
    REFERENCES restaurant (id_restaurant);
 
ALTER TABLE restaurant_room ADD CONSTRAINT FK_restaurant_room_3
    FOREIGN KEY (reservation_id)
    REFERENCES reservation (reservation_id);
 
ALTER TABLE dishes ADD CONSTRAINT FK_dishes_2
    FOREIGN KEY (restaurant_id)
    REFERENCES restaurant (id_restaurant);




# Departamentos
INSERT INTO department VALUES (1, 'Administracao', 'Analise e definicao dos objetivos da empresa', NULL);
INSERT INTO department VALUES (2, 'Recepcao', 'Atendimento direto com o cliente nas instalacoes fisicas do hotel', NULL);
INSERT INTO department VALUES (3, 'Culinaria', 'Preparo de refeicoes para os clientes do hotel', NULL);
INSERT INTO department VALUES (4, 'Relacoes Humanas', 'Gerenciamento dos funcionarios do hotel', NULL);
INSERT INTO department VALUES (5, 'Executivo', 'Gestao geral da empresa', NULL);

# Funcionarios
INSERT INTO person VALUES ('265.243.219-58', 'Marizete', 'Almeida', '1970-07-19', DATE(NOW()));
INSERT INTO person VALUES ('222.333.444-55', 'Carlos', 'Silva', '1972-07-22', DATE(NOW()));
INSERT INTO person VALUES ('324.113.224-75', 'Renan', 'Fernandes', '1985-03-01', DATE(NOW()));
INSERT INTO person VALUES ('549.333.444-53', 'Marta', 'Costa', '1990-12-23', DATE(NOW()));
INSERT INTO person VALUES ('242.378.498-12', 'Gabriela', 'Machado', '2000-05-03', DATE(NOW()));
INSERT INTO person VALUES ('872.343.458-17', 'Cesar', 'Pereira', '1992-12-12', DATE(NOW()));
INSERT INTO person VALUES ('908.463.075-49', 'Franz', 'Weber', '1998-03-28', DATE(NOW()));
INSERT INTO person VALUES ('897.345.867-32', 'Arthur', 'Otoni', '1989-07-16', DATE(NOW()));
INSERT INTO person VALUES ('674.875.398-56', 'Wagner', 'Alfaro', '2001-04-18', DATE(NOW()));
INSERT INTO person VALUES ('123.238.454-12', 'Fabiana', 'Coelho', '1983-09-21', DATE(NOW()));

INSERT INTO employee VALUES ('11111111', '265.243.219-58', 11850, 'Presidente', NULL, 5);
INSERT INTO employee VALUES ('12345678', '222.333.444-55', 6400, 'Gerente', '11111111', 1);
INSERT INTO employee VALUES ('65343453', '324.113.224-75', 4600, 'Analista Comercial', '12345678', 1);
INSERT INTO employee VALUES ('91284532', '549.333.444-53', 6500, 'Analista financeiro', '12345678', 1);
INSERT INTO employee VALUES ('87434526', '242.378.498-12', 5420, 'Gerente', '11111111', 2);
INSERT INTO employee VALUES ('89433421', '872.343.458-17', 2180, 'Recepcionista', '87434526', 2);
INSERT INTO employee VALUES ('23875637', '908.463.075-49', 4500, 'Gerente', '11111111', 3);
INSERT INTO employee VALUES ('52679834', '897.345.867-32', 4200, 'Chef', '23875637', 3);
INSERT INTO employee VALUES ('73458221', '674.875.398-56', 5000, 'Gerente', '11111111', 4);
INSERT INTO employee VALUES ('67354234', '123.238.454-12', 4500, 'Analista de RH', '73458221', 4);

UPDATE department SET manager_registration = '12345678' WHERE dept_id = 1;
UPDATE department SET manager_registration = '87434526' WHERE dept_id = 2;
UPDATE department SET manager_registration = '23875637' WHERE dept_id = 3;
UPDATE department SET manager_registration = '73458221' WHERE dept_id = 4;
UPDATE department SET manager_registration = '11111111' WHERE dept_id = 5;

# Dependentes
INSERT INTO person VALUES ('436.783.245-42', 'Amanda', 'Pereira', '2012-01-02', DATE(NOW()));
INSERT INTO person VALUES ('782.345.234-41', 'Glaucia', 'Pereira', '2012-01-02', DATE(NOW()));
INSERT INTO person VALUES ('152.578.376-31', 'Gabriel', 'Costa', '2014-11-20', DATE(NOW()));
INSERT INTO person VALUES ('324.113.224-75', 'Marcos', 'Fernandes', '2005-06-11', DATE(NOW()));
INSERT INTO person VALUES ('324.113.224-75', 'Abel', 'Fernandes', '2009-08-16', DATE(NOW()));

INSERT INTO dependent VALUES ('436.783.245-42', '89433421', 'filho');
INSERT INTO dependent VALUES ('782.345.234-41', '89433421', 'filho');
INSERT INTO dependent VALUES ('152.578.376-31', '91284532', 'filho');
INSERT INTO dependent VALUES ('324.113.224-75', '65343453', 'filho');
INSERT INTO dependent VALUES ('324.113.224-75', '65343453', 'filho');

# Clientes
INSERT INTO person VALUES ('934.843.444-98', 'Cassio', 'Santana', '1991-02-06', DATE(NOW()));
INSERT INTO person VALUES ('345.764.198-67', 'Larissa', 'Camargo', '1998-04-28', DATE(NOW()));
INSERT INTO person VALUES ('679.452.689-52', 'Marina', 'Fontoura', '1991-02-06', DATE(NOW()));
INSERT INTO person VALUES ('172.364.523-76', 'William', 'Silva', '1991-02-06', DATE(NOW()));
INSERT INTO person VALUES ('345.678.263-09', 'Renato', 'Nakamura', '1991-02-06', DATE(NOW()));


# Hoteis
                                                                 # family - adult - pet - big events - work
INSERT INTO hotel VALUES (1, 'Hotel Teste 1', '12345-678', 12, 100, true, false, true, false, true, 'tradicional');
INSERT INTO hotel VALUES (2, 'Hotel Teste 2', '43458-721', 6, 250, true, false, true, false, true, 'apart-hotel');
INSERT INTO hotel VALUES (3, 'Hotel Teste 3', '56745-834', 59, 500, true, false, false, true, false, 'resort');
INSERT INTO hotel VALUES (4, 'Hotel Teste 4', '67865-342', 12, 100, true, false, true, true, true, 'condominio');
INSERT INTO hotel VALUES (5, 'Hotel Teste 5', '57843-000', 12, 100, false, true, false, false, false, 'pousada');

# Beneficios

INSERT INTO benefit VALUES ('Vale refeicao', 500, '11111111');
INSERT INTO benefit VALUES ('Vale refeicao', 500, '12345678');
INSERT INTO benefit VALUES ('Vale refeicao', 500, '65343453');
INSERT INTO benefit VALUES ('Vale refeicao', 500, '91284532');
INSERT INTO benefit VALUES ('Vale refeicao', 500, '87434526');
INSERT INTO benefit VALUES ('Vale refeicao', 500, '89433421');
INSERT INTO benefit VALUES ('Vale refeicao', 500, '23875637');
INSERT INTO benefit VALUES ('Vale refeicao', 500, '52679834');
INSERT INTO benefit VALUES ('Vale refeicao', 500, '73458221');
INSERT INTO benefit VALUES ('Vale refeicao', 500, '67354234');
