/* logico: */

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
 
ALTER TABLE cash_entry ADD CONSTRAINT FK_cash_entry_2
    FOREIGN KEY (cupom_id)
    REFERENCES cupom (cupom_id);
 
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
 
ALTER TABLE cash_entry_room ADD CONSTRAINT FK_cash_entry_room_3
    FOREIGN KEY (room_id)
    REFERENCES room (room_id);
 
ALTER TABLE restaurant ADD CONSTRAINT FK_restaurant_2
    FOREIGN KEY (fk_hotel_hotel_id)
    REFERENCES hotel (hotel_id)
    ON DELETE CASCADE;
 
ALTER TABLE restaurant ADD CONSTRAINT FK_restaurant_3
    FOREIGN KEY (department_id)
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
 
ALTER TABLE cash_entry_restaurant ADD CONSTRAINT FK_cash_entry_restaurant_4
    FOREIGN KEY (client_cpf)
    REFERENCES client (cpf);
 
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
    ON DELETE CASCADE;
 
ALTER TABLE benefit_employee ADD CONSTRAINT FK_benefit_employee_2
    FOREIGN KEY (employee_cpf)
    REFERENCES employee (cpf)
    ON DELETE CASCADE;
 
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
    ON DELETE CASCADE;
 
ALTER TABLE saloon_kitchen ADD CONSTRAINT FK_saloon_kitchen_2
    FOREIGN KEY (saloon_id)
    REFERENCES saloon (saloon_id)
    ON DELETE CASCADE;
 
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
    ON DELETE CASCADE;
 
ALTER TABLE employee_saloon ADD CONSTRAINT FK_employee_saloon_1
    FOREIGN KEY (saloon_id)
    REFERENCES saloon (saloon_id)
    ON DELETE RESTRICT;
 
ALTER TABLE employee_saloon ADD CONSTRAINT FK_employee_saloon_2
    FOREIGN KEY (employee_cpf)
    REFERENCES employee (cpf)
    ON DELETE CASCADE;
 
ALTER TABLE cupom ADD CONSTRAINT FK_cupom_2
    FOREIGN KEY (campaign_id)
    REFERENCES campaigns (campaign_id);
 
ALTER TABLE campaigns ADD CONSTRAINT FK_campaigns_1
    FOREIGN KEY (dept_id)
    REFERENCES department (department_id);
 
ALTER TABLE dish ADD CONSTRAINT FK_dish_2
    FOREIGN KEY (restaurant_id)
    REFERENCES restaurant (restaurant_id)
    ON DELETE CASCADE;
 
ALTER TABLE petshop ADD CONSTRAINT FK_petshop_2
    FOREIGN KEY (hotel_id)
    REFERENCES hotel (hotel_id)
    ON DELETE CASCADE;
 
ALTER TABLE petshop ADD CONSTRAINT FK_petshop_3
    FOREIGN KEY (dept_id)
    REFERENCES department (department_id);
 
ALTER TABLE petshop_product ADD CONSTRAINT FK_petshop_product_1
    FOREIGN KEY (petshop_id)
    REFERENCES petshop (petshop_id);
 
ALTER TABLE petshop_product ADD CONSTRAINT FK_petshop_product_2
    FOREIGN KEY (product_id)
    REFERENCES product (product_id);
 
ALTER TABLE petshop_client_payment ADD CONSTRAINT FK_petshop_client_payment_1
    FOREIGN KEY (petshop_id)
    REFERENCES petshop (petshop_id);
 
ALTER TABLE petshop_client_payment ADD CONSTRAINT FK_petshop_client_payment_2
    FOREIGN KEY (payment_id)
    REFERENCES cash_entry (payment_id);
 
ALTER TABLE petshop_client_payment ADD CONSTRAINT FK_petshop_client_payment_4
    FOREIGN KEY (cpf)
    REFERENCES client (cpf);
 
ALTER TABLE fidelity_program ADD CONSTRAINT FK_fidelity_program_2
    FOREIGN KEY (cpf)
    REFERENCES client (cpf);
 
ALTER TABLE cash_outflow_campaign ADD CONSTRAINT FK_cash_outflow_campaign_2
    FOREIGN KEY (payment_id)
    REFERENCES cash_outflow (payment_id);
 
ALTER TABLE cash_outflow_campaign ADD CONSTRAINT FK_cash_outflow_campaign_3
    FOREIGN KEY (campaign_id)
    REFERENCES campaigns (campaign_id);