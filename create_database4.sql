/* LógicoCorrigido2: */

CREATE TABLE client (
    f_name varchar(50),
    cpf varchar(11) PRIMARY KEY,
    birth_date timestamp,
    l_name varchar(50),
    register_date timestamp
);

CREATE TABLE employee (
    office varchar(50),
    salary decimal(10,2),
    f_name varchar(50),
    cpf varchar(11) PRIMARY KEY,
    birth_date timestamp,
    l_name varchar(50),
    register_date timestamp,
    department_id int
);

CREATE TABLE dependent (
    relation varchar(50),
    f_name varchar(50),
    cpf varchar(11) PRIMARY KEY,
    birth_date timestamp,
    l_name varchar(50),
    register_date timestamp,
    fk_employee_cpf varchar(11)
);

CREATE TABLE benefit (
    benefit_id int PRIMARY KEY,
    value decimal(10,2),
    level varchar(50),
    beneft_TYPE varchar(50)
);

CREATE TABLE cash_outflow (
    payment_form varchar(50),
    tax decimal(10,2),
    emission_date timestamp,
    payment_id int PRIMARY KEY,
    value decimal(10,2),
    quantitity int,
    buy_value decimal(10,2),
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
    accept_animals smallint,
    is_familiar smallint,
    has_events smallint,
    is_work smallint
);

CREATE TABLE bedroom (
    n_bathrooms int,
    max_guests int,
    is_clean int,
    location varchar(50),
    bedroom_id int PRIMARY KEY,
    daily decimal(10,2),
    living_room smallint,
    washing_room smallint,
    kitchen smallint,
    wasshing_room smallint,
    bedroom_TYPE varchar(50),
    hotel_id int
);

CREATE TABLE reservation (
    checkin timestamp,
    checkout timestamp,
    num_breakfast int,
    value decimal(10,2),
    reservation_id int PRIMARY KEY,
    reservation_date timestamp,
    client_cpf varchar(11)
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
    initial_date timestamp,
    bedroom_id int,
    reservation_id int
);

CREATE TABLE parking_space (
    location varchar(50),
    daily_rate decimal(10,2),
    preferential smallint,
    parking_id int PRIMARY KEY,
    width decimal(10,2),
    length decimal(10,2),
    parking_space_TYPE INT,
    hotel_id int
);

CREATE TABLE company (
    cnpj varchar(14) PRIMARY KEY,
    fantasy_name varchar(50),
    sector varchar(50)
);

CREATE TABLE event (
    n_days int,
    initial_date timestamp,
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
    value DECIMAL(10,2),
    tax decimal(10,2),
    emission_date timestamp,
    payment_id int PRIMARY KEY
);

CREATE TABLE reservation_product (
    quantity int,
    reservation_id int,
    product_id int
);

CREATE TABLE hotel_product (
    stock int,
    min_stock int,
    hotel_id int,
    product_id int
);

CREATE TABLE bedroom_product (
    min_stock int,
    stock int,
    bedroom_id int,
    product_id int
);

CREATE TABLE reservation_parking_space (
    initial_date timestamp,
    total_days int,
    reservation_id int,
    parking_id int
);

CREATE TABLE room (
    final_date timestamp,
    initial_date timestamp,
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
    event_id int
);

CREATE TABLE cash_entry_reservation (
    missing_value decimal(10,2),
    payment_id int,
    reservation_id int
);

CREATE TABLE cash_entry_room (
    missing_value decimal(10,2),
    payment_id int
);

CREATE TABLE restaurant (
    name varchar(50),
    restaurant_id int PRIMARY KEY,
    type varchar(50),
    room_service int,
    location varchar(50),
    fk_hotel_hotel_id int,
    fk_department_department_id int
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
    product_id int
);

CREATE TABLE cash_entry_restaurant (
    restaurant_id int,
    payment_id int
);

CREATE TABLE supervision (
    supervisor_cpf varchar(11),
    employee_cpf varchar(11)
);

CREATE TABLE benefit_employee (
    benefit_id int,
    employee_cpf varchar(11)
);

CREATE TABLE received_payment (
    payment_id int,
    employee_cpf varchar(11)
);

CREATE TABLE event_saloon (
    saloon_id int,
    event_id int
);

CREATE TABLE saloon_kitchen (
    kitchen_id int,
    saloon_id int
);

CREATE TABLE cash_outflow_product (
    product_id int,
    payment_id int
);

CREATE TABLE employee_room (
    room_id int,
    employee_cpf varchar(11)
);

CREATE TABLE employee_saloon (
    saloon_id int,
    employee_cpf varchar(11)
);
 
ALTER TABLE employee ADD CONSTRAINT FK_employee_2
    FOREIGN KEY (department_id)
    REFERENCES department (department_id)
    ON DELETE RESTRICT;
 
ALTER TABLE dependent ADD CONSTRAINT FK_dependent_2
    FOREIGN KEY (fk_employee_cpf)
    REFERENCES employee (cpf)
    ON DELETE CASCADE;
 
ALTER TABLE cash_outflow ADD CONSTRAINT FK_cash_outflow_2
    FOREIGN KEY (responsible_cpf)
    REFERENCES employee (cpf)
    ON DELETE CASCADE;
 
ALTER TABLE bedroom ADD CONSTRAINT FK_bedroom_2
    FOREIGN KEY (hotel_id)
    REFERENCES hotel (hotel_id)
    ON DELETE RESTRICT;
 
ALTER TABLE reservation ADD CONSTRAINT FK_reservation_2
    FOREIGN KEY (client_cpf)
    REFERENCES client (cpf)
    ON DELETE RESTRICT;
 
ALTER TABLE reservation_period_bedroom ADD CONSTRAINT FK_reservation_period_bedroom_1
    FOREIGN KEY (bedroom_id)
    REFERENCES bedroom (bedroom_id);
 
ALTER TABLE reservation_period_bedroom ADD CONSTRAINT FK_reservation_period_bedroom_2
    FOREIGN KEY (reservation_id)
    REFERENCES reservation (reservation_id);
 
ALTER TABLE parking_space ADD CONSTRAINT FK_parking_space_2
    FOREIGN KEY (hotel_id)
    REFERENCES hotel (hotel_id)
    ON DELETE CASCADE;
 
ALTER TABLE event ADD CONSTRAINT FK_event_2
    FOREIGN KEY (fk_company_cnpj)
    REFERENCES company (cnpj)
    ON DELETE CASCADE;
 
ALTER TABLE event ADD CONSTRAINT FK_event_3
    FOREIGN KEY (fk_client_cpf)
    REFERENCES client (cpf)
    ON DELETE CASCADE;
 
ALTER TABLE saloon ADD CONSTRAINT FK_saloon_2
    FOREIGN KEY (hotel_id)
    REFERENCES hotel (hotel_id)
    ON DELETE CASCADE;
 
ALTER TABLE kitchen ADD CONSTRAINT FK_kitchen_2
    FOREIGN KEY (room_id)
    REFERENCES room (room_id);
 
ALTER TABLE reservation_product ADD CONSTRAINT FK_reservation_product_1
    FOREIGN KEY (reservation_id)
    REFERENCES reservation (reservation_id);
 
ALTER TABLE reservation_product ADD CONSTRAINT FK_reservation_product_2
    FOREIGN KEY (product_id)
    REFERENCES product (product_id);
 
ALTER TABLE hotel_product ADD CONSTRAINT FK_hotel_product_1
    FOREIGN KEY (hotel_id)
    REFERENCES hotel (hotel_id);
 
ALTER TABLE hotel_product ADD CONSTRAINT FK_hotel_product_2
    FOREIGN KEY (product_id)
    REFERENCES product (product_id);
 
ALTER TABLE bedroom_product ADD CONSTRAINT FK_bedroom_product_1
    FOREIGN KEY (bedroom_id)
    REFERENCES bedroom (bedroom_id);
 
ALTER TABLE bedroom_product ADD CONSTRAINT FK_bedroom_product_2
    FOREIGN KEY (product_id)
    REFERENCES product (product_id);
 
ALTER TABLE reservation_parking_space ADD CONSTRAINT FK_reservation_parking_space_1
    FOREIGN KEY (reservation_id)
    REFERENCES reservation (reservation_id);
 
ALTER TABLE reservation_parking_space ADD CONSTRAINT FK_reservation_parking_space_2
    FOREIGN KEY (parking_id)
    REFERENCES parking_space (parking_id);
 
ALTER TABLE room ADD CONSTRAINT FK_room_2
    FOREIGN KEY (hotel_id)
    REFERENCES hotel (hotel_id);
 
ALTER TABLE room ADD CONSTRAINT FK_room_3
    FOREIGN KEY (company_cnpj)
    REFERENCES company (cnpj);
 
ALTER TABLE cash_entry_event ADD CONSTRAINT FK_cash_entry_event_1
    FOREIGN KEY (payment_id)
    REFERENCES cash_entry (payment_id);
 
ALTER TABLE cash_entry_event ADD CONSTRAINT FK_cash_entry_event_2
    FOREIGN KEY (event_id)
    REFERENCES event (event_id);
 
ALTER TABLE cash_entry_reservation ADD CONSTRAINT FK_cash_entry_reservation_1
    FOREIGN KEY (payment_id)
    REFERENCES cash_entry (payment_id);
 
ALTER TABLE cash_entry_reservation ADD CONSTRAINT FK_cash_entry_reservation_2
    FOREIGN KEY (reservation_id)
    REFERENCES reservation (reservation_id);
 
ALTER TABLE cash_entry_room ADD CONSTRAINT FK_cash_entry_room_1
    FOREIGN KEY (payment_id)
    REFERENCES cash_entry (payment_id);
 
ALTER TABLE restaurant ADD CONSTRAINT FK_restaurant_2
    FOREIGN KEY (fk_hotel_hotel_id)
    REFERENCES hotel (hotel_id)
    ON DELETE CASCADE;
 
ALTER TABLE restaurant ADD CONSTRAINT FK_restaurant_3
    FOREIGN KEY (fk_department_department_id)
    REFERENCES department (department_id)
    ON DELETE CASCADE;
 
ALTER TABLE department ADD CONSTRAINT FK_department_2
    FOREIGN KEY (manager_cpf)
    REFERENCES employee (cpf)
    ON DELETE CASCADE;
 
ALTER TABLE department ADD CONSTRAINT FK_department_3
    FOREIGN KEY (hotel_id)
    REFERENCES hotel (hotel_id)
    ON DELETE RESTRICT;
 
ALTER TABLE restaurant_product ADD CONSTRAINT FK_restaurant_product_1
    FOREIGN KEY (restaurant_id)
    REFERENCES restaurant (restaurant_id);
 
ALTER TABLE restaurant_product ADD CONSTRAINT FK_restaurant_product_2
    FOREIGN KEY (product_id)
    REFERENCES product (product_id);
 
ALTER TABLE cash_entry_restaurant ADD CONSTRAINT FK_cash_entry_restaurant_1
    FOREIGN KEY (restaurant_id)
    REFERENCES restaurant (restaurant_id);
 
ALTER TABLE cash_entry_restaurant ADD CONSTRAINT FK_cash_entry_restaurant_2
    FOREIGN KEY (payment_id)
    REFERENCES cash_entry (payment_id);
 
ALTER TABLE supervision ADD CONSTRAINT FK_supervision_1
    FOREIGN KEY (supervisor_cpf)
    REFERENCES employee (cpf)
    ON DELETE CASCADE;
 
ALTER TABLE supervision ADD CONSTRAINT FK_supervision_2
    FOREIGN KEY (employee_cpf)
    REFERENCES employee (cpf)
    ON DELETE CASCADE;
 
ALTER TABLE benefit_employee ADD CONSTRAINT FK_benefit_employee_1
    FOREIGN KEY (benefit_id)
    REFERENCES benefit (benefit_id)
    ON DELETE SET NULL;
 
ALTER TABLE benefit_employee ADD CONSTRAINT FK_benefit_employee_2
    FOREIGN KEY (employee_cpf)
    REFERENCES employee (cpf)
    ON DELETE SET NULL;
 
ALTER TABLE received_payment ADD CONSTRAINT FK_received_payment_1
    FOREIGN KEY (payment_id)
    REFERENCES cash_outflow (payment_id)
    ON DELETE RESTRICT;
 
ALTER TABLE received_payment ADD CONSTRAINT FK_received_payment_2
    FOREIGN KEY (employee_cpf)
    REFERENCES employee (cpf)
    ON DELETE RESTRICT;
 
ALTER TABLE event_saloon ADD CONSTRAINT FK_event_saloon_1
    FOREIGN KEY (saloon_id)
    REFERENCES saloon (saloon_id)
    ON DELETE RESTRICT;
 
ALTER TABLE event_saloon ADD CONSTRAINT FK_event_saloon_2
    FOREIGN KEY (event_id)
    REFERENCES event (event_id)
    ON DELETE RESTRICT;
 
ALTER TABLE saloon_kitchen ADD CONSTRAINT FK_saloon_kitchen_1
    FOREIGN KEY (kitchen_id)
    REFERENCES kitchen (kitchen_id)
    ON DELETE SET NULL;
 
ALTER TABLE saloon_kitchen ADD CONSTRAINT FK_saloon_kitchen_2
    FOREIGN KEY (saloon_id)
    REFERENCES saloon (saloon_id)
    ON DELETE SET NULL;
 
ALTER TABLE cash_outflow_product ADD CONSTRAINT FK_cash_outflow_product_1
    FOREIGN KEY (product_id)
    REFERENCES product (product_id)
    ON DELETE RESTRICT;
 
ALTER TABLE cash_outflow_product ADD CONSTRAINT FK_cash_outflow_product_2
    FOREIGN KEY (payment_id)
    REFERENCES cash_outflow (payment_id)
    ON DELETE RESTRICT;
 
ALTER TABLE employee_room ADD CONSTRAINT FK_employee_room_1
    FOREIGN KEY (room_id)
    REFERENCES room (room_id);
 
ALTER TABLE employee_room ADD CONSTRAINT FK_employee_room_2
    FOREIGN KEY (employee_cpf)
    REFERENCES employee (cpf)
    ON DELETE SET NULL;
 
ALTER TABLE employee_saloon ADD CONSTRAINT FK_employee_saloon_1
    FOREIGN KEY (saloon_id)
    REFERENCES saloon (saloon_id)
    ON DELETE RESTRICT;
 
ALTER TABLE employee_saloon ADD CONSTRAINT FK_employee_saloon_2
    FOREIGN KEY (employee_cpf)
    REFERENCES employee (cpf)
    ON DELETE SET NULL;
