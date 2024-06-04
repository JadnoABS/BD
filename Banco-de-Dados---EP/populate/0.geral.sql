-- Para gerar: ls -v *.sql | xargs cat >> 0.geral
INSERT INTO hotel (hotel_id,fantasy_name,cep,`number`,size_m2,hotel_TYPE,accept_animals,is_familiar,has_events,is_work) VALUES
	 (1,'Hotel 1','11111-111',1,111.11,'Hotel Tradicional',0,1,0,0),
	 (2,'Hotel 2','22222-222',2,222.22,'Hotel Tradicional',1,1,0,0),
	 (3,'Hotel 3','33333-333',3,333.33,'Hotel Tradicional',1,1,0,0),
	 (4,'Hotel 4','44444-444',4,444.44,'Hotel Tradicional',0,1,1,0),
	 (5,'Hotel 5','55555-555',5,555.55,'Hotel Tradicional',1,1,1,1);
INSERT INTO bedroom (n_bathrooms,max_guests,is_clean,location,bedroom_id,daily,living_room,washing_room,kitchen,wasshing_room,bedroom_TYPE,hotel_id) VALUES
	 (3,5,0,'1',1,184.00,1,1,1,0,'Chalé',1),
	 (2,7,1,'2',2,194.00,0,0,1,1,'Chalé',1),
	 (2,2,1,'3',3,197.00,1,1,0,1,'Chalé',1),
	 (0,6,0,'4',4,53.00,1,1,1,0,'Apartamento',1),
	 (2,5,1,'5',5,66.00,1,1,0,1,'Suite',1),
	 (2,2,1,'1',6,156.00,0,0,0,1,'Suite',2),
	 (2,6,0,'2',7,170.00,1,0,1,1,'Suite',2),
	 (0,2,0,'3',8,92.00,1,1,0,0,'Apartamento',2),
	 (2,8,0,'4',9,59.00,0,0,0,1,'Suite',2),
	 (1,9,0,'5',10,108.00,0,1,0,0,'Suite',2);
INSERT INTO bedroom (n_bathrooms,max_guests,is_clean,location,bedroom_id,daily,living_room,washing_room,kitchen,wasshing_room,bedroom_TYPE,hotel_id) VALUES
	 (2,2,0,'1',11,196.00,0,0,1,0,'Suite',3),
	 (2,4,0,'2',12,83.00,0,1,1,1,'Chalé',3),
	 (2,5,1,'3',13,92.00,1,0,0,0,'Suite',3),
	 (1,5,1,'4',14,128.00,0,1,1,1,'Suite',3),
	 (1,7,0,'5',15,186.00,0,1,0,0,'Suite',3),
	 (2,9,1,'1',16,145.00,0,1,1,1,'Suite',4),
	 (3,10,1,'2',17,64.00,1,1,0,0,'Chalé',4),
	 (1,8,1,'3',18,142.00,1,0,1,0,'Suite',4),
	 (2,6,1,'4',19,147.00,1,0,0,1,'Suite',4),
	 (1,2,0,'5',20,134.00,0,1,0,1,'Suite',4);
INSERT INTO bedroom (n_bathrooms,max_guests,is_clean,location,bedroom_id,daily,living_room,washing_room,kitchen,wasshing_room,bedroom_TYPE,hotel_id) VALUES
	 (0,9,1,'1',21,62.00,0,0,1,0,'Apartamento',5),
	 (3,6,1,'2',22,130.00,0,1,0,1,'Chalé',5),
	 (1,10,0,'3',23,101.00,0,0,1,1,'Suite',5),
	 (3,4,0,'4',24,139.00,1,1,0,0,'Chalé',5),
	 (2,4,1,'5',25,199.00,0,1,0,0,'Suite',5);
INSERT INTO product (last_buy_value,name,description,sell_value,product_id) VALUES
	 (2,'Barra de cereais','Alimento',3.00,1),
	 (1,'Doce','Alimento',2.00,2),
	 (3,'Café','Alimento',5.00,3),
	 (5,'Toalha','Higiene',10.00,4),
	 (5,'Sabonete','Higiene',10.00,5),
	 (30,'Remédio para otite canine','Medicina',50.00,6),
	 (40,'Shampoo para animais','Higiene',70.00,7);
INSERT INTO bedroom_product (min_stock,stock,bedroom_id,product_id) VALUES
	 (20,30,1,1),
	 (10,25,2,2),
	 (10,20,3,3),
	 (30,36,4,4),
	 (30,43,5,5),
	 (20,35,6,1),
	 (10,26,7,2),
	 (10,23,8,3),
	 (30,125,9,4),
	 (30,32,10,5);
INSERT INTO bedroom_product (min_stock,stock,bedroom_id,product_id) VALUES
	 (20,36,11,1),
	 (10,25,12,2),
	 (10,25,13,3),
	 (30,36,14,4),
	 (30,50,15,5),
	 (20,37,16,1),
	 (10,26,17,2),
	 (10,15,18,3),
	 (30,66,19,4),
	 (30,32,20,5);
INSERT INTO bedroom_product (min_stock,stock,bedroom_id,product_id) VALUES
	 (20,33,21,1),
	 (10,27,22,2),
	 (10,11,23,3),
	 (30,67,24,4),
	 (30,46,25,5);
INSERT INTO benefit (benefit_id,value,`level`,benefit_TYPE) VALUES
	 (1,464.00,'Médio','Refeição'),
	 (2,211.00,'Normal','Vale transporte'),
	 (3,300.00,'Normal','Refeição'),
	 (4,695.00,'Alto','Alimentação'),
	 (5,928.00,'Alto','Plano de Saúde');
INSERT INTO department (department_name,responsability,department_id,manager_cpf,hotel_id) VALUES
	 ('Recursos Humanos','Recursos Humanos',1,NULL,1),
	 ('Financeiro','Financeiro',2,NULL,1),
	 ('Marketing','Marketing',3,NULL,1),
	 ('Operações','Operações',4,NULL,1),
	 ('Recursos Humanos','Recursos Humanos',5,NULL,2),
	 ('Financeiro','Financeiro',6,NULL,2),
	 ('Marketing','Marketing',7,NULL,2),
	 ('Operações','Operações',8,NULL,2),
	 ('Recursos Humanos','Recursos Humanos',9,NULL,3),
	 ('Financeiro','Financeiro',10,NULL,3);
INSERT INTO department (department_name,responsability,department_id,manager_cpf,hotel_id) VALUES
	 ('Marketing','Marketing',11,NULL,3),
	 ('Operações','Operações',12,NULL,3),
	 ('Recursos Humanos','Recursos Humanos',13,NULL,4),
	 ('Financeiro','Financeiro',14,NULL,4),
	 ('Marketing','Marketing',15,NULL,4),
	 ('Operações','Operações',16,NULL,4),
	 ('Recursos Humanos','Recursos Humanos',17,NULL,5),
	 ('Financeiro','Financeiro',18,NULL,5),
	 ('Marketing','Marketing',19,NULL,5),
	 ('Operações','Operações',20,NULL,5);
INSERT INTO employee (office,salary,f_name,cpf,birth_date,l_name,register_date,department_id) VALUES
	 ('Analista',8140.00,'Kelly','12673786081','2000-12-13 16:44:56','Bryan','2019-05-11 13:51:28',14),
	 ('Gerente',29143.00,'Bruno','13144156188','1995-05-04 14:11:01','Golden','2020-08-10 17:44:53',5),
	 ('Analista',3926.00,'Daryl','13616560396','1989-05-03 16:59:47','Banks','2020-09-02 07:27:15',12),
	 ('Analista',6750.00,'Cairo','14818681805','1976-12-10 17:49:04','Eaton','2020-05-28 12:11:07',2),
	 ('Coordenador',21959.00,'Kamal','15863762777','1963-01-18 19:09:29','Suarez','2022-04-29 11:45:56',12),
	 ('Coordenador',23591.00,'Benjamin','17740385403','1994-10-07 21:45:59','Abbott','2019-08-27 12:56:31',2),
	 ('Analista',3352.00,'Dora','18217498915','1997-03-31 10:54:27','Fleming','2021-09-07 02:49:05',14),
	 ('Coordenador',22493.00,'Portia','18924239353','1975-02-04 01:24:14','French','2022-03-10 23:08:09',9),
	 ('Analista',8079.00,'Neville','19761703716','1982-09-21 11:38:54','Blackburn','2022-01-22 16:23:45',15),
	 ('Analista',5925.00,'Illana','21670209596','1965-06-22 17:03:38','Craft','2020-01-08 19:31:35',5);
INSERT INTO employee (office,salary,f_name,cpf,birth_date,l_name,register_date,department_id) VALUES
	 ('Gerente',29184.00,'Audrey','22389034833','1965-12-31 19:42:01','Jenkins','2020-02-03 20:19:12',4),
	 ('Coordenador',23082.00,'Lacey','23021042410','1989-03-23 22:34:56','Brown','2022-10-11 13:03:23',6),
	 ('Analista',12837.00,'Fletcher','23829179793','1980-10-18 00:30:29','Kane','2020-12-01 11:52:20',3),
	 ('Analista',5567.00,'Norman','23964344089','1962-09-02 13:53:40','Villarreal','2019-01-04 07:26:09',6),
	 ('Analista',7822.00,'Aurora','29415257674','2001-08-02 03:57:46','Gillespie','2020-10-24 10:33:41',18),
	 ('Supervisor',15899.00,'Dorian','29458660053','1978-12-17 04:03:10','Hinton','2021-11-16 23:49:39',14),
	 ('Supervisor',19311.00,'Hedley','30472748744','1972-04-27 08:09:33','Whitfield','2022-08-15 04:17:35',2),
	 ('Analista',6581.00,'Ivan','33308842163','1974-07-23 08:48:35','Mejia','2020-11-11 20:51:00',3),
	 ('Supervisor',18127.00,'Pearl','33582451682','2001-12-07 11:00:55','Alvarez','2021-03-10 10:37:00',7),
	 ('Gerente',29089.00,'Kadeem','34001196132','1995-03-23 09:31:44','Santana','2022-08-13 15:11:08',7);
INSERT INTO employee (office,salary,f_name,cpf,birth_date,l_name,register_date,department_id) VALUES
	 ('Gerente',29803.00,'Philip','34190494541','1983-06-10 19:27:34','Hodges','2019-04-05 22:02:58',1),
	 ('Analista',7922.00,'Alfreda','35002823119','1999-08-26 10:16:19','David','2022-04-18 00:51:58',17),
	 ('Gerente',25738.00,'Darius','36496999612','1980-02-11 11:23:34','Franco','2020-07-02 15:25:26',19),
	 ('Supervisor',13217.00,'Dara','38192374273','1987-10-11 12:50:52','Jones','2020-10-02 22:35:13',19),
	 ('Coordenador',21557.00,'Raphael','38890069459','1996-12-17 21:03:30','Owen','2019-01-13 19:55:20',15),
	 ('Supervisor',15271.00,'Alea','39096085181','1979-04-15 03:21:34','Santiago','2021-03-25 16:33:18',16),
	 ('Coordenador',21063.00,'Brynne','39289141418','1985-02-25 06:38:02','Kirkland','2019-12-13 16:27:12',19),
	 ('Analista',11532.00,'Aidan','43574806488','2000-06-13 15:03:18','Coleman','2020-10-02 23:21:32',5),
	 ('Analista',4073.00,'Emma','44290783158','1992-05-21 06:49:45','Wilkinson','2021-02-21 06:31:55',11),
	 ('Supervisor',13188.00,'Walker','44436783579','1975-07-17 15:45:39','Barnett','2022-07-14 03:21:26',20);
INSERT INTO employee (office,salary,f_name,cpf,birth_date,l_name,register_date,department_id) VALUES
	 ('Gerente',27559.00,'Zeph','45183531317','1988-01-18 23:26:55','Spencer','2019-11-11 18:24:51',12),
	 ('Analista',7445.00,'Colton','45485407605','1969-03-15 20:41:09','Lester','2021-04-29 12:50:48',1),
	 ('Analista',9265.00,'Kai','46088903138','1982-01-01 05:25:29','Kline','2021-10-21 11:28:01',11),
	 ('Gerente',28291.00,'August','46848979044','1987-08-27 04:59:10','Mayer','2020-06-26 13:50:04',9),
	 ('Analista',1880.00,'Ria','47913471837','1964-07-29 00:25:15','Cruz','2019-07-31 09:11:57',18),
	 ('Coordenador',21779.00,'Cade','49185410172','1961-08-17 05:25:46','Franklin','2019-05-21 09:11:41',14),
	 ('Coordenador',20343.00,'Lillith','49191327254','1988-11-02 10:07:32','Hansen','2019-10-16 21:41:50',20),
	 ('Coordenador',23477.00,'Brianna','49253535148','1978-09-02 14:02:29','Morgan','2019-10-29 02:30:23',3),
	 ('Gerente',28249.00,'Sheila','50815306335','1985-11-07 11:58:29','Pruitt','2020-03-23 11:53:08',10),
	 ('Supervisor',14651.00,'September','50838196403','1982-07-20 20:24:31','Downs','2019-04-25 06:27:28',18);
INSERT INTO employee (office,salary,f_name,cpf,birth_date,l_name,register_date,department_id) VALUES
	 ('Analista',11739.00,'Kennan','51677792273','1967-09-19 17:12:12','Gomez','2020-02-06 20:24:11',4),
	 ('Analista',10424.00,'Oliver','56504358591','1996-02-19 10:23:26','Best','2021-08-19 02:23:36',6),
	 ('Analista',8248.00,'Andrew','57223779143','1992-01-17 17:02:24','Barlow','2022-04-10 06:48:13',13),
	 ('Gerente',27118.00,'Imogene','57950105512','1992-08-05 03:29:45','Daniel','2020-06-18 23:46:00',13),
	 ('Coordenador',21802.00,'Cathleen','59085976081','1998-11-29 01:30:34','Hayden','2021-02-15 16:31:56',13),
	 ('Analista',7986.00,'Aspen','60531003052','1971-04-25 03:20:02','Farrell','2019-05-03 12:30:43',16),
	 ('Analista',1078.00,'Joel','60681591658','1979-06-18 17:12:23','Coffey','2022-09-07 09:18:43',1),
	 ('Coordenador',21171.00,'Wyatt','61995548699','1969-07-01 05:34:05','Hammond','2020-05-25 03:59:14',17),
	 ('Supervisor',16476.00,'Gabriel','63359208302','1970-10-04 04:07:48','Jones','2019-01-25 05:51:44',13),
	 ('Analista',2068.00,'Myra','64416809167','1999-09-20 22:53:22','Myers','2021-12-14 19:20:16',17);
INSERT INTO employee (office,salary,f_name,cpf,birth_date,l_name,register_date,department_id) VALUES
	 ('Analista',4133.00,'Reese','64746147704','1971-05-15 12:21:51','Jordan','2021-10-10 05:02:25',10),
	 ('Gerente',26382.00,'Minerva','64950318323','1977-06-09 06:59:54','Hebert','2021-04-08 03:07:04',17),
	 ('Analista',9664.00,'Veronica','65060258468','1974-09-18 05:00:43','Bray','2022-09-29 05:11:53',8),
	 ('Supervisor',17026.00,'Price','65712806293','1963-03-23 23:25:58','Norton','2020-06-04 01:05:06',10),
	 ('Gerente',26015.00,'Justine','65801393729','1981-07-26 10:02:08','Delgado','2021-04-26 05:02:09',18),
	 ('Coordenador',23629.00,'Ezekiel','65852677241','1993-11-09 21:43:34','Fowler','2022-05-17 11:07:07',1),
	 ('Supervisor',18775.00,'Gregory','66204786879','1993-11-05 15:34:15','Michael','2020-05-03 03:34:25',5),
	 ('Analista',7457.00,'Jermaine','66683140110','1976-04-19 10:16:14','Slater','2021-06-16 01:42:47',20),
	 ('Analista',5552.00,'Randall','67671288969','1990-01-30 10:13:29','Bryant','2019-10-11 16:43:38',7),
	 ('Analista',7566.00,'Hashim','68155283750','1986-04-29 14:11:09','Gutierrez','2022-08-24 15:03:55',19);
INSERT INTO employee (office,salary,f_name,cpf,birth_date,l_name,register_date,department_id) VALUES
	 ('Coordenador',23058.00,'Kibo','68333082877','1961-01-16 03:01:00','Lindsey','2022-07-06 17:21:44',7),
	 ('Supervisor',16616.00,'Kevyn','68553295471','1972-08-30 03:05:25','Dunn','2020-03-29 19:19:57',12),
	 ('Coordenador',22407.00,'Donna','70101665818','1961-02-13 04:27:20','Ayers','2021-11-01 02:16:31',10),
	 ('Supervisor',17593.00,'Amy','71904029634','1972-03-23 05:05:37','Cobb','2020-10-23 07:53:37',9),
	 ('Analista',3503.00,'Serina','73989376227','1988-12-27 07:45:31','Mosley','2019-03-19 07:24:43',13),
	 ('Analista',1463.00,'Charissa','74558744133','1986-12-27 02:17:34','Gaines','2020-12-13 19:16:53',20),
	 ('Supervisor',15162.00,'Nathan','75236842275','1975-02-20 15:15:02','Reyes','2019-07-17 12:26:42',17),
	 ('Analista',8250.00,'Isabella','75557879028','1961-04-05 01:00:06','Massey','2022-10-17 03:36:37',12),
	 ('Coordenador',21107.00,'Abdul','76118861344','1992-11-11 15:16:04','Duncan','2022-10-13 00:01:33',18),
	 ('Coordenador',23257.00,'Nadine','76694796302','1967-02-04 16:06:09','Bray','2020-05-15 21:44:40',5);
INSERT INTO employee (office,salary,f_name,cpf,birth_date,l_name,register_date,department_id) VALUES
	 ('Coordenador',22196.00,'Glenna','78062457467','1995-01-13 00:26:48','Bennett','2021-12-03 06:34:56',11),
	 ('Supervisor',20171.00,'Ina','78201468182','1986-03-17 08:35:59','Oneil','2021-11-19 03:08:38',1),
	 ('Gerente',29632.00,'Sean','79243245086','1985-09-29 06:19:02','Richards','2021-09-13 09:48:00',2),
	 ('Analista',9956.00,'Penelope','79322328484','1985-08-03 21:04:11','Ellison','2019-10-27 14:50:18',7),
	 ('Analista',13173.00,'Dustin','79739723559','1976-04-11 01:43:21','Floyd','2021-04-13 01:05:56',2),
	 ('Supervisor',16683.00,'Connor','79847481990','1984-12-04 01:46:59','Hyde','2020-08-20 00:17:12',11),
	 ('Coordenador',22656.00,'Lani','79924936337','1981-07-26 22:36:55','Atkins','2019-04-30 19:24:54',8),
	 ('Analista',1465.00,'Genevieve','80179525159','1968-06-04 21:37:23','Frost','2019-01-12 20:37:29',19),
	 ('Supervisor',17869.00,'Gail','80421559928','1968-04-08 06:02:23','Le','2020-01-10 16:22:14',8),
	 ('Analista',9316.00,'Rogan','80599821912','1994-07-30 05:58:21','Jackson','2020-11-10 09:01:03',10);
INSERT INTO employee (office,salary,f_name,cpf,birth_date,l_name,register_date,department_id) VALUES
	 ('Analista',6484.00,'Chantale','84261893909','1997-11-16 06:44:59','Richmond','2019-10-27 15:29:18',4),
	 ('Gerente',26763.00,'Carly','84899323025','2002-10-08 18:09:41','Harding','2022-10-30 16:00:48',14),
	 ('Supervisor',18134.00,'Shellie','85052766280','1979-08-15 04:50:28','Stuart','2022-05-26 03:52:21',6),
	 ('Gerente',24733.00,'Octavia','85535105936','1986-10-03 08:40:37','Weiss','2022-02-17 02:41:33',20),
	 ('Gerente',26450.00,'Brandon','86388311345','1978-07-08 09:59:24','Kline','2019-12-08 15:13:38',16),
	 ('Analista',9570.00,'Cameron','86687483426','1991-12-08 23:38:49','Roberson','2020-08-31 06:05:44',9),
	 ('Analista',4495.00,'Gay','89255200945','1990-08-01 02:09:18','Branch','2019-02-09 22:42:45',9),
	 ('Supervisor',15595.00,'Camille','89363075603','1974-06-07 14:26:55','Ayala','2021-11-23 05:58:15',15),
	 ('Gerente',28850.00,'Vladimir','90098653640','1987-02-14 00:28:40','Schwartz','2019-10-29 11:12:18',8),
	 ('Supervisor',19303.00,'Nasim','90115653661','1984-07-09 01:27:00','Gordon','2020-09-12 14:48:25',3);
INSERT INTO employee (office,salary,f_name,cpf,birth_date,l_name,register_date,department_id) VALUES
	 ('Analista',4874.00,'Colin','91580589267','1973-08-16 21:51:38','Wagner','2020-02-02 11:09:24',8),
	 ('Gerente',29106.00,'Ignatius','92748031008','2000-06-29 09:22:17','Frank','2020-06-04 17:43:44',6),
	 ('Supervisor',19271.00,'Martha','93990306833','1966-12-12 10:33:41','Maldonado','2019-01-14 04:12:10',4),
	 ('Gerente',26596.00,'Finn','94225114828','1979-10-23 09:29:04','Sullivan','2020-07-05 01:32:43',15),
	 ('Coordenador',21497.00,'Allen','94828086274','1969-11-20 16:52:31','Preston','2020-03-27 01:51:50',16),
	 ('Gerente',27838.00,'Xantha','95363017129','1981-07-20 20:18:56','Sanders','2019-10-29 23:57:30',11),
	 ('Gerente',29255.00,'Sylvester','96085352320','2001-11-26 02:01:42','Stevens','2021-09-03 01:01:20',3),
	 ('Analista',2766.00,'Lenore','97465530561','1991-05-05 10:25:46','Wise','2020-01-15 09:16:40',15),
	 ('Analista',2657.00,'Holmes','97810080291','1993-05-19 16:19:49','Hurst','2020-10-18 03:57:05',16),
	 ('Coordenador',23460.00,'Lisandra','99518031149','1992-04-04 04:12:36','Fitzpatrick','2020-06-30 03:04:09',4);
--  Auto-generated SQL script #202212142331
UPDATE department
	SET manager_cpf='34190494541'
	WHERE department_id=1;
UPDATE department
	SET manager_cpf='79243245086'
	WHERE department_id=2;
UPDATE department
	SET manager_cpf='96085352320'
	WHERE department_id=3;
UPDATE department
	SET manager_cpf='22389034833'
	WHERE department_id=4;
UPDATE department
	SET manager_cpf='13144156188'
	WHERE department_id=5;
UPDATE department
	SET manager_cpf='92748031008'
	WHERE department_id=6;
UPDATE department
	SET manager_cpf='34001196132'
	WHERE department_id=7;
UPDATE department
	SET manager_cpf='90098653640'
	WHERE department_id=8;
UPDATE department
	SET manager_cpf='46848979044'
	WHERE department_id=9;
UPDATE department
	SET manager_cpf='50815306335'
	WHERE department_id=10;
UPDATE department
	SET manager_cpf='95363017129'
	WHERE department_id=11;
UPDATE department
	SET manager_cpf='45183531317'
	WHERE department_id=12;
UPDATE department
	SET manager_cpf='57950105512'
	WHERE department_id=13;
UPDATE department
	SET manager_cpf='84899323025'
	WHERE department_id=14;
UPDATE department
	SET manager_cpf='94225114828'
	WHERE department_id=15;
UPDATE department
	SET manager_cpf='86388311345'
	WHERE department_id=16;
UPDATE department
	SET manager_cpf='64950318323'
	WHERE department_id=17;
UPDATE department
	SET manager_cpf='65801393729'
	WHERE department_id=18;
UPDATE department
	SET manager_cpf='36496999612'
	WHERE department_id=19;
UPDATE department
	SET manager_cpf='85535105936'
	WHERE department_id=20;
INSERT INTO campaigns (campaign_name,initial_date,final_date,main_target,dept_id,campaign_id) VALUES
	 ('Promoção de verão','2022-10-15 21:39:56','2022-01-15 21:39:56','Jovens',3,1),
	 ('Promoção de verão','2022-10-15 21:39:56','2022-01-15 21:39:56','Jovens',7,2),
	 ('Promoção de verão','2022-10-15 21:39:56','2022-01-15 21:39:56','Jovens',11,3),
	 ('Promoção de verão','2022-10-15 21:39:56','2022-01-15 21:39:56','Jovens',15,4),
	 ('Promoção de verão','2022-10-15 21:39:56','2022-01-15 21:39:56','Jovens',19,5),
	 ('Promoção de dia das crianças','2022-10-01 21:39:56','2022-10-30 21:39:56','Pais',19,6),
	 ('Promoção de dia das crianças','2022-10-01 21:39:56','2022-10-30 21:39:56','Pais',15,7);
INSERT INTO cupom (active,description,valid_reservation,cupom_id,code,value_percentage,value,cupom_TYPE,campaign_id) VALUES
	 (0,'Cupom de verão',1,1,'AAAAA',NULL,50.00,'Em dinheiro',1),
	 (0,'Cupom de verão',1,2,'BBBBB',0.15,NULL,'Em porcentagem',5),
	 (1,'Cupom de verão',1,3,'CCCCC',0.15,NULL,'Em porcentagem',4),
	 (1,'Cupom de verão',1,4,'DDDDD',NULL,50.00,'Em dinheiro',6),
	 (1,'Cupom de verão',0,5,'EEEEE',0.30,NULL,'Em porcentagem',3);
INSERT INTO cash_entry (payment_form,tax,emission_date,payment_id,value,cupom_id) VALUES
	 ('pix',5.00,'2022-03-22 04:06:08',1,945.12,NULL),
	 ('pix',5.25,'2021-07-08 21:52:38',2,530.30,NULL),
	 ('pix',21.75,'2021-11-30 21:17:47',3,616.15,NULL),
	 ('pix',13.00,'2023-02-23 11:07:38',4,489.85,NULL),
	 ('pix',23.25,'2021-11-14 14:16:01',5,500.78,NULL),
	 ('pix',15.75,'2023-03-09 10:32:11',6,934.38,NULL),
	 ('pix',20.50,'2023-01-01 22:31:45',7,369.54,NULL),
	 ('pix',22.75,'2023-05-08 05:18:06',8,744.55,NULL),
	 ('pix',8.75,'2023-04-02 12:29:49',9,714.16,NULL),
	 ('pix',15.50,'2023-10-20 22:03:40',10,337.14,NULL);
INSERT INTO cash_entry (payment_form,tax,emission_date,payment_id,value,cupom_id) VALUES
	 ('pix',20.25,'2021-12-12 23:14:13',11,343.22,NULL),
	 ('pix',11.50,'2021-11-13 11:43:32',12,604.66,NULL),
	 ('pix',9.75,'2022-06-14 17:53:45',13,993.64,NULL),
	 ('pix',24.25,'2022-05-18 11:43:08',14,354.23,NULL),
	 ('pix',20.50,'2022-04-18 13:06:24',15,490.25,NULL),
	 ('pix',2.25,'2023-03-13 20:22:58',16,388.55,NULL),
	 ('pix',11.25,'2021-12-14 05:50:26',17,371.99,NULL),
	 ('pix',16.50,'2022-01-11 11:14:26',18,594.30,NULL),
	 ('pix',13.50,'2021-06-02 06:08:20',19,855.53,NULL),
	 ('pix',15.75,'2022-06-01 21:35:57',20,594.74,NULL);
INSERT INTO cash_entry (payment_form,tax,emission_date,payment_id,value,cupom_id) VALUES
	 ('pix',8.75,'2023-03-21 19:20:34',21,307.10,NULL),
	 ('pix',13.25,'2023-06-20 03:20:24',22,551.30,NULL),
	 ('pix',23.75,'2023-05-18 21:56:41',23,835.21,NULL),
	 ('pix',17.00,'2021-12-28 04:09:15',24,622.15,NULL),
	 ('pix',17.75,'2023-07-11 14:22:10',25,505.13,NULL),
	 ('pix',4.00,'2023-03-01 02:21:50',26,559.17,NULL),
	 ('pix',20.50,'2022-08-26 21:11:34',27,280.47,NULL),
	 ('pix',7.50,'2021-05-20 18:56:26',28,524.84,NULL),
	 ('pix',15.25,'2023-06-06 15:03:48',29,782.78,NULL),
	 ('pix',21.25,'2022-12-02 06:15:35',30,439.41,NULL);
INSERT INTO cash_entry (payment_form,tax,emission_date,payment_id,value,cupom_id) VALUES
	 ('pix',1.50,'2023-05-15 20:09:39',31,648.68,NULL),
	 ('pix',12.50,'2022-01-15 05:51:29',32,925.19,NULL),
	 ('pix',1.50,'2022-03-25 21:30:16',33,779.92,NULL),
	 ('pix',18.25,'2023-09-26 00:55:55',34,124.01,NULL),
	 ('pix',13.00,'2023-06-16 19:09:52',35,400.00,NULL),
	 ('pix',7.25,'2023-05-24 12:10:53',36,300.00,NULL),
	 ('pix',14.75,'2022-04-08 18:28:36',37,100.00,NULL),
	 ('pix',10.75,'2023-12-14 16:22:08',38,550.00,NULL),
	 ('pix',0.25,'2023-03-18 11:19:11',39,1400.00,NULL),
	 ('pix',13.50,'2021-05-31 04:05:16',40,300.00,NULL);
INSERT INTO cash_entry (payment_form,tax,emission_date,payment_id,value,cupom_id) VALUES
	 ('pix',15.75,'2022-09-08 05:07:20',41,200.00,NULL),
	 ('pix',0.75,'2022-02-14 10:18:16',42,250.00,NULL),
	 ('pix',8.00,'2023-01-09 13:11:34',43,600.00,NULL),
	 ('pix',13.50,'2022-12-08 07:01:05',44,704.57,NULL),
	 ('pix',4.00,'2023-03-07 10:21:54',45,831.43,NULL),
	 ('pix',24.50,'2023-11-14 05:53:57',46,143.44,NULL),
	 ('pix',13.25,'2021-11-13 01:37:25',47,822.90,NULL),
	 ('pix',11.75,'2021-07-03 13:51:08',48,884.18,NULL),
	 ('pix',21.00,'2023-01-20 18:07:10',49,952.19,NULL),
	 ('pix',6.50,'2021-11-15 08:04:18',50,208.42,NULL);
INSERT INTO cash_entry (payment_form,tax,emission_date,payment_id,value,cupom_id) VALUES
	 ('ted',22.00,'2022-06-04 07:27:39',51,785.55,NULL),
	 ('ted',1.25,'2022-09-26 05:53:02',52,502.48,NULL),
	 ('ted',24.25,'2023-03-30 17:01:33',53,955.75,NULL),
	 ('ted',6.25,'2021-09-02 02:01:19',54,471.30,NULL),
	 ('ted',16.00,'2023-01-30 22:43:23',55,289.25,NULL),
	 ('ted',24.25,'2022-01-08 22:18:03',56,832.37,NULL),
	 ('ted',20.75,'2023-09-29 22:52:42',57,494.07,NULL),
	 ('ted',3.00,'2022-09-26 15:58:37',58,773.24,NULL),
	 ('ted',23.25,'2021-05-14 22:42:42',59,484.02,NULL),
	 ('ted',12.25,'2022-05-07 18:02:32',60,900.37,NULL);
INSERT INTO cash_entry (payment_form,tax,emission_date,payment_id,value,cupom_id) VALUES
	 ('ted',15.25,'2022-06-13 12:07:48',61,249.77,NULL),
	 ('ted',10.25,'2022-04-17 00:38:02',62,247.74,NULL),
	 ('ted',21.50,'2023-06-16 13:08:13',63,389.40,NULL),
	 ('ted',14.00,'2021-07-18 11:55:37',64,203.76,NULL),
	 ('ted',13.00,'2023-10-21 12:23:23',65,650.61,NULL),
	 ('ted',13.50,'2022-10-04 16:48:02',66,741.78,NULL),
	 ('ted',14.75,'2022-12-05 10:03:56',67,757.05,NULL),
	 ('ted',13.75,'2022-12-07 00:00:08',68,559.91,NULL),
	 ('ted',0.75,'2021-06-28 04:58:40',69,428.42,NULL),
	 ('ted',10.00,'2023-07-23 10:36:44',70,362.38,NULL);
INSERT INTO cash_entry (payment_form,tax,emission_date,payment_id,value,cupom_id) VALUES
	 ('ted',13.75,'2022-09-02 04:27:37',71,426.63,NULL),
	 ('ted',18.75,'2023-12-14 20:41:44',72,946.00,NULL),
	 ('ted',1.50,'2022-05-31 09:38:27',73,650.12,NULL),
	 ('ted',24.00,'2021-12-18 07:57:22',74,312.62,NULL),
	 ('ted',9.00,'2021-05-08 02:43:09',75,412.71,NULL),
	 ('ted',7.50,'2023-01-25 06:26:35',76,125.72,NULL),
	 ('ted',15.25,'2022-09-21 04:29:24',77,190.44,NULL),
	 ('ted',21.00,'2022-02-20 01:04:33',78,475.07,NULL),
	 ('ted',14.00,'2023-05-15 07:43:05',79,804.02,NULL),
	 ('ted',16.50,'2021-08-14 17:37:27',80,694.88,NULL);
INSERT INTO cash_entry (payment_form,tax,emission_date,payment_id,value,cupom_id) VALUES
	 ('ted',8.75,'2021-10-24 01:14:25',81,962.32,NULL),
	 ('ted',3.25,'2022-02-09 22:06:22',82,827.00,NULL),
	 ('ted',23.50,'2022-11-10 10:02:39',83,248.01,NULL),
	 ('ted',24.75,'2021-11-01 02:36:31',84,459.07,NULL),
	 ('ted',11.50,'2023-07-06 15:24:04',85,551.33,NULL),
	 ('ted',8.75,'2022-07-24 14:18:15',86,379.41,NULL),
	 ('ted',7.50,'2021-11-21 01:16:13',87,143.06,NULL),
	 ('ted',9.75,'2022-04-11 22:24:52',88,377.09,NULL),
	 ('ted',5.25,'2021-09-09 04:21:12',89,456.26,NULL),
	 ('ted',17.50,'2021-12-09 11:50:42',90,150.05,NULL);
INSERT INTO cash_entry (payment_form,tax,emission_date,payment_id,value,cupom_id) VALUES
	 ('ted',17.00,'2022-01-07 23:18:11',91,181.44,NULL),
	 ('ted',8.00,'2022-01-09 05:06:41',92,357.08,NULL),
	 ('ted',18.75,'2023-07-21 13:20:07',93,241.05,NULL),
	 ('ted',15.75,'2021-10-20 01:42:49',94,934.04,NULL),
	 ('ted',4.00,'2023-08-30 11:04:18',95,247.05,NULL),
	 ('ted',24.50,'2022-03-25 15:50:20',96,133.13,NULL),
	 ('ted',2.25,'2022-12-26 07:37:55',97,724.49,NULL),
	 ('ted',12.25,'2022-08-30 05:14:14',98,423.05,NULL),
	 ('ted',15.75,'2021-05-21 03:59:03',99,741.79,NULL),
	 ('ted',12.50,'2022-04-11 07:33:36',100,539.80,NULL);
INSERT INTO cash_entry (payment_form,tax,emission_date,payment_id,value,cupom_id) VALUES
	 ('cartão',21.25,'2022-05-04 01:47:01',101,373.65,NULL),
	 ('cartão',20.00,'2023-03-22 03:46:00',102,148.82,NULL),
	 ('cartão',8.25,'2023-09-20 19:00:14',103,423.18,NULL),
	 ('cartão',10.00,'2023-06-30 01:42:22',104,669.41,NULL),
	 ('cartão',17.75,'2021-12-25 23:14:10',105,177.53,NULL),
	 ('cartão',10.75,'2022-10-10 22:04:07',106,579.40,NULL),
	 ('cartão',15.50,'2021-12-15 20:40:51',107,464.43,NULL),
	 ('cartão',1.50,'2021-11-19 11:54:07',108,483.94,NULL),
	 ('cartão',18.00,'2021-11-17 14:48:52',109,926.42,NULL),
	 ('cartão',14.00,'2021-07-18 20:46:10',110,380.29,NULL);
INSERT INTO cash_entry (payment_form,tax,emission_date,payment_id,value,cupom_id) VALUES
	 ('cartão',11.25,'2021-10-12 13:21:06',111,822.17,NULL),
	 ('cartão',4.00,'2023-11-13 22:08:32',112,169.98,NULL),
	 ('cartão',18.25,'2022-06-22 21:26:41',113,983.39,NULL),
	 ('cartão',2.50,'2022-06-02 00:50:45',114,707.02,NULL),
	 ('cartão',6.75,'2022-11-14 06:42:48',115,484.92,NULL),
	 ('cartão',2.75,'2021-11-09 09:16:00',116,203.54,NULL),
	 ('cartão',8.00,'2022-06-29 02:38:28',117,362.93,NULL),
	 ('cartão',5.75,'2023-12-09 01:52:45',118,204.06,NULL),
	 ('cartão',0.75,'2023-06-27 04:50:03',119,731.49,NULL),
	 ('cartão',6.75,'2021-12-17 08:09:01',120,245.27,NULL);
INSERT INTO cash_entry (payment_form,tax,emission_date,payment_id,value,cupom_id) VALUES
	 ('cartão',11.00,'2022-10-16 07:09:45',121,731.87,NULL),
	 ('cartão',20.25,'2021-12-05 04:15:52',122,123.56,NULL),
	 ('cartão',21.75,'2021-11-29 00:51:12',123,122.20,NULL),
	 ('cartão',14.75,'2023-01-19 16:23:56',124,140.31,NULL),
	 ('cartão',21.00,'2023-02-28 02:13:23',125,234.95,NULL),
	 ('cartão',1.50,'2023-05-14 22:14:28',126,653.81,NULL),
	 ('cartão',19.00,'2021-07-03 17:40:14',127,664.20,NULL),
	 ('cartão',0.00,'2021-12-20 20:38:11',128,359.58,NULL),
	 ('cartão',0.75,'2023-12-06 16:52:27',129,605.31,NULL),
	 ('cartão',21.50,'2022-02-13 22:41:00',130,947.80,NULL);
INSERT INTO cash_entry (payment_form,tax,emission_date,payment_id,value,cupom_id) VALUES
	 ('cartão',18.75,'2023-01-31 02:24:10',131,123.07,NULL),
	 ('cartão',17.50,'2022-02-12 11:16:05',132,371.94,NULL),
	 ('cartão',24.75,'2021-07-26 20:00:56',133,490.50,NULL),
	 ('cartão',17.50,'2023-12-12 19:03:59',134,336.67,NULL),
	 ('cartão',4.75,'2022-02-20 15:51:52',135,111.85,NULL),
	 ('cartão',3.00,'2022-09-18 10:50:18',136,349.26,NULL),
	 ('cartão',9.50,'2021-07-31 16:11:48',137,410.76,NULL),
	 ('cartão',10.50,'2023-10-15 04:42:53',138,906.00,NULL),
	 ('cartão',14.75,'2023-10-16 11:11:34',139,497.71,NULL),
	 ('cartão',18.50,'2022-05-30 02:55:18',140,570.57,NULL);
INSERT INTO cash_entry (payment_form,tax,emission_date,payment_id,value,cupom_id) VALUES
	 ('cartão',11.00,'2023-08-07 05:10:39',141,359.70,NULL),
	 ('cartão',1.25,'2022-06-22 16:35:46',142,886.79,NULL),
	 ('cartão',23.00,'2022-08-20 15:26:06',143,554.85,NULL),
	 ('cartão',18.50,'2023-03-16 15:26:52',144,913.90,NULL),
	 ('cartão',22.75,'2021-11-01 13:42:41',145,104.93,NULL),
	 ('cartão',16.50,'2021-12-10 13:21:52',146,382.94,NULL),
	 ('cartão',1.00,'2023-05-14 02:29:31',147,599.92,NULL),
	 ('cartão',1.50,'2023-01-14 21:33:29',148,850.79,NULL),
	 ('cartão',9.50,'2021-12-20 00:02:03',149,554.20,NULL),
	 ('cartão',8.75,'2022-11-25 09:55:27',150,118.63,NULL);
INSERT INTO cash_entry (payment_form,tax,emission_date,payment_id,value,cupom_id) VALUES
	 ('dinheiro',5.75,'2021-12-25 11:05:11',151,630.55,NULL),
	 ('dinheiro',2.25,'2023-04-28 05:23:19',152,896.85,NULL),
	 ('dinheiro',23.75,'2021-12-10 10:27:15',153,692.60,NULL),
	 ('dinheiro',14.00,'2022-12-30 08:45:28',154,672.47,NULL),
	 ('dinheiro',7.25,'2023-12-13 17:47:09',155,284.54,NULL),
	 ('dinheiro',4.00,'2023-02-13 12:09:10',156,205.30,NULL),
	 ('dinheiro',18.25,'2021-05-14 12:51:47',157,972.86,NULL),
	 ('dinheiro',11.50,'2021-09-02 19:17:10',158,548.39,NULL),
	 ('dinheiro',5.75,'2023-07-31 04:06:58',159,623.37,NULL),
	 ('dinheiro',0.00,'2021-09-08 13:18:54',160,471.69,NULL);
INSERT INTO cash_entry (payment_form,tax,emission_date,payment_id,value,cupom_id) VALUES
	 ('dinheiro',12.25,'2023-09-10 03:50:49',161,388.35,NULL),
	 ('dinheiro',14.50,'2023-10-25 19:53:44',162,426.69,NULL),
	 ('dinheiro',18.75,'2022-02-15 09:01:14',163,868.37,NULL),
	 ('dinheiro',0.25,'2022-07-18 13:42:20',164,261.78,NULL),
	 ('dinheiro',5.75,'2023-10-20 23:07:07',165,403.81,NULL),
	 ('dinheiro',15.75,'2022-06-18 07:50:45',166,233.68,NULL),
	 ('dinheiro',17.25,'2022-10-24 15:17:15',167,756.99,NULL),
	 ('dinheiro',13.25,'2023-09-16 23:29:10',168,283.91,NULL),
	 ('dinheiro',3.50,'2022-03-19 21:30:21',169,848.60,NULL),
	 ('dinheiro',1.25,'2021-07-19 15:32:24',170,591.24,NULL);
INSERT INTO cash_entry (payment_form,tax,emission_date,payment_id,value,cupom_id) VALUES
	 ('dinheiro',9.00,'2021-06-10 08:03:56',171,310.43,NULL),
	 ('dinheiro',4.00,'2022-07-16 17:49:41',172,578.40,NULL),
	 ('dinheiro',18.25,'2023-10-10 09:45:07',173,960.70,NULL),
	 ('dinheiro',9.00,'2023-06-25 23:05:58',174,268.33,NULL),
	 ('dinheiro',23.00,'2022-04-24 05:00:46',175,159.55,NULL),
	 ('dinheiro',2.25,'2023-01-01 21:44:26',176,792.75,NULL),
	 ('dinheiro',21.00,'2022-05-21 07:43:55',177,685.12,NULL),
	 ('dinheiro',17.25,'2023-08-03 23:18:20',178,947.34,NULL),
	 ('dinheiro',13.25,'2022-04-20 21:55:48',179,781.35,NULL),
	 ('dinheiro',20.75,'2021-08-03 17:18:32',180,964.71,NULL);
INSERT INTO cash_entry (payment_form,tax,emission_date,payment_id,value,cupom_id) VALUES
	 ('dinheiro',25.00,'2023-02-10 19:14:05',181,579.52,NULL),
	 ('dinheiro',24.75,'2022-09-24 02:12:09',182,803.47,NULL),
	 ('dinheiro',13.25,'2021-07-30 01:13:40',183,378.77,NULL),
	 ('dinheiro',7.00,'2023-03-08 16:27:46',184,283.44,NULL),
	 ('dinheiro',7.75,'2023-10-09 16:26:20',185,180.90,NULL),
	 ('dinheiro',1.75,'2022-12-25 03:37:39',186,854.19,NULL),
	 ('dinheiro',15.50,'2023-05-29 03:41:27',187,928.24,NULL),
	 ('dinheiro',15.75,'2022-11-18 10:25:57',188,178.64,NULL),
	 ('dinheiro',9.50,'2022-12-11 08:28:07',189,708.46,NULL),
	 ('dinheiro',12.75,'2022-12-18 11:14:03',190,206.39,NULL);
INSERT INTO cash_entry (payment_form,tax,emission_date,payment_id,value,cupom_id) VALUES
	 ('dinheiro',8.75,'2022-05-29 16:26:06',191,606.56,NULL),
	 ('dinheiro',16.25,'2022-04-14 13:00:04',192,513.63,NULL),
	 ('dinheiro',13.00,'2021-05-07 09:39:04',193,648.47,NULL),
	 ('dinheiro',5.00,'2023-02-12 23:17:03',194,701.47,NULL),
	 ('dinheiro',16.25,'2023-07-24 07:33:10',195,561.96,NULL),
	 ('dinheiro',2.25,'2023-05-14 15:24:54',196,605.36,NULL),
	 ('dinheiro',7.00,'2022-10-10 00:54:06',197,340.93,NULL),
	 ('dinheiro',23.00,'2021-05-19 02:04:05',198,688.56,NULL),
	 ('dinheiro',25.00,'2022-05-22 01:01:43',199,520.00,NULL),
	 ('dinheiro',1.25,'2023-01-08 16:58:25',200,434.31,NULL);
INSERT INTO cash_entry (payment_form,tax,emission_date,payment_id,value,cupom_id) VALUES
	 ('ted',5.00,'2022-03-22 04:06:08',201,511.57,NULL),
	 ('ted',9.75,'2022-06-14 17:53:45',202,4618.00,NULL),
	 ('cartão',9.00,'2021-11-01 13:42:41',203,2708.05,NULL),
	 ('cartão',9.00,'2021-12-01 13:42:41',204,2708.05,NULL),
	 ('dinheiro',1.25,'2023-01-08 16:58:25',205,42.00,1),
	 ('ted',5.00,'2022-03-22 04:06:08',206,126.85,2),
	 ('ted',9.75,'2022-06-14 17:53:45',207,50.00,NULL),
	 ('cartão',9.00,'2021-11-01 13:42:41',208,82.00,NULL),
	 ('cartão',9.00,'2021-12-01 13:42:41',209,57.00,NULL),
	 ('ted',9.00,'2021-11-01 13:42:41',210,1642.29,NULL);
INSERT INTO cash_entry (payment_form,tax,emission_date,payment_id,value,cupom_id) VALUES
	 ('ted',9.00,'2021-12-01 13:42:41',211,1642.29,NULL),
	 ('ted',9.00,'2022-01-01 13:42:41',212,1012.28,NULL),
	 ('ted',9.00,'2021-11-01 13:42:41',213,1862.36,NULL),
	 ('ted',9.00,'2021-12-01 13:42:41',214,1862.35,NULL);
INSERT INTO company (cnpj,fantasy_name,sector) VALUES
	 ('17302434705304','Jerde Group','Consumer Services'),
	 ('18940924979145','Strosin Inc','Health Care'),
	 ('27134405665583','Carter Group','Basic Industries'),
	 ('37507963270658','Pfeffer LLC','Basic Industries'),
	 ('38932377930041','Cummerata-Cormier','Health Care'),
	 ('39843148162446','Effertz-Baumbach','Finance'),
	 ('41022413805795','Langworth and Sons','Capital Goods'),
	 ('43644232354672','Wiegand-Nolan','Capital Goods'),
	 ('45647694603898','Jacobs-Jacobs','Basic Industries'),
	 ('48098618295403','Ratke-Haag','Finance');
INSERT INTO company (cnpj,fantasy_name,sector) VALUES
	 ('52195524767087','Herzog-Prosacco','Consumer Non-Durables'),
	 ('55870362506713','Ryan-DuBuque','Basic Industries'),
	 ('58100642987257','Murazik-Graham','Basic Industries'),
	 ('70521121027793','Davis-Fadel','Basic Industries'),
	 ('74337437125735','Gutmann Group','Finance'),
	 ('77111770615673','Lehner, Maggio and Cole','Finance'),
	 ('78367461578072','Cummings Group','Finance'),
	 ('83025979169998','Stehr-Homenick','Consumer Non-Durables'),
	 ('92917438849286','Feil, Senger and Bins','Consumer Non-Durables'),
	 ('94941420315746','Wiza, Schumm and Reinger','Finance');
INSERT INTO client (f_name,cpf,birth_date,l_name,register_date) VALUES
	 ('Francis','11653758376','1965-11-14 00:49:15','Booth','2020-09-26 00:28:45'),
	 ('Skyler','14684895849','1960-07-13 17:46:29','Montgomery','2022-01-10 06:52:50'),
	 ('Shelly','14863617125','1951-07-21 08:06:41','Meyer','2020-08-23 05:16:12'),
	 ('Elmo','15026003393','1963-08-18 04:00:01','Todd','2022-12-11 01:59:43'),
	 ('Merritt','15390022108','1989-07-20 03:21:56','Rios','2020-07-08 02:22:32'),
	 ('Christen','17745047047','1996-11-07 17:12:36','Benjamin','2020-10-13 18:08:19'),
	 ('Iona','17829659659','2001-11-19 17:56:21','Kline','2021-12-31 07:49:11'),
	 ('Daryl','18937089940','1974-07-23 23:22:52','Pearson','2021-12-14 00:38:16'),
	 ('Courtney','20126904669','1985-01-10 01:41:39','Ballard','2021-07-09 15:39:17'),
	 ('Cameron','20548098142','1980-05-14 11:25:00','Frye','2020-12-25 03:04:51');
INSERT INTO client (f_name,cpf,birth_date,l_name,register_date) VALUES
	 ('Kasimir','23295361354','1981-10-16 11:34:38','Ramirez','2020-12-29 00:15:26'),
	 ('Faith','24738320396','1951-04-30 00:16:53','Hart','2022-03-19 21:51:33'),
	 ('Gregory','25313666769','1972-09-09 11:23:39','Barrett','2021-09-16 09:20:11'),
	 ('Sade','25675754362','1964-11-17 12:46:01','Robinson','2022-07-20 02:40:09'),
	 ('Holmes','26980211027','1987-09-12 05:26:19','Parks','2021-03-11 21:51:09'),
	 ('Vance','27347950998','1954-08-14 10:26:59','Wright','2020-05-16 08:43:56'),
	 ('Yvonne','27779345994','1998-09-05 21:56:32','Lindsey','2022-02-19 19:42:06'),
	 ('Martena','29392753217','1967-09-18 05:08:44','Vasquez','2021-07-03 02:18:21'),
	 ('Dacey','30173079528','1959-09-06 12:09:02','Fletcher','2020-07-18 19:36:33'),
	 ('Acton','30208062926','1968-01-10 16:58:14','Weaver','2021-08-12 00:23:05');
INSERT INTO client (f_name,cpf,birth_date,l_name,register_date) VALUES
	 ('McKenzie','30710264073','1967-11-27 03:15:11','Malone','2020-03-14 09:21:41'),
	 ('Michael','31698040431','1995-12-01 18:15:19','Curtis','2022-03-27 23:17:52'),
	 ('Emerson','32582812105','1964-08-24 14:48:04','Lowe','2022-05-12 12:28:53'),
	 ('Mona','32843636113','1989-02-22 15:00:14','Saunders','2021-11-23 12:42:21'),
	 ('Alfonso','35641445260','1992-05-22 01:22:09','Pierce','2020-09-06 07:32:18'),
	 ('Dylan','36480220698','1958-04-09 08:57:40','Barber','2022-07-03 17:10:42'),
	 ('Kiona','37090268058','1957-04-07 11:24:16','Jenkins','2020-11-30 07:51:29'),
	 ('Randall','40096725786','1983-08-30 17:15:36','Levy','2020-06-13 11:39:28'),
	 ('Charles','41107870868','2000-09-22 04:15:15','Bradley','2020-09-29 20:42:27'),
	 ('Camille','42972379388','1960-06-25 20:46:04','Clements','2021-12-15 22:29:04');
INSERT INTO client (f_name,cpf,birth_date,l_name,register_date) VALUES
	 ('Slade','44079634354','1976-07-18 16:24:03','Mcbride','2021-03-30 16:24:07'),
	 ('Carol','45228657214','1985-04-21 19:36:54','West','2021-07-29 19:53:53'),
	 ('Kennedy','47058747019','1959-09-25 15:07:27','Ray','2022-07-30 05:55:02'),
	 ('Yael','48240539218','1957-01-05 20:24:09','Allison','2021-08-01 19:49:16'),
	 ('Gary','49470100528','1980-11-27 01:33:07','Sharpe','2020-02-25 14:09:28'),
	 ('Amela','50747135632','1968-12-09 14:31:13','Emerson','2022-06-30 09:38:57'),
	 ('Jaime','51749716371','1970-01-22 18:26:17','Head','2022-11-27 02:33:49'),
	 ('Kylie','53243622361','1992-12-07 06:25:41','Keith','2020-05-13 19:10:48'),
	 ('Latifah','53483721624','1989-04-16 07:46:17','Branch','2021-12-24 04:10:27'),
	 ('Macaulay','53702890574','1982-05-17 23:51:42','Mcmillan','2021-04-14 12:44:39');
INSERT INTO client (f_name,cpf,birth_date,l_name,register_date) VALUES
	 ('Gannon','53751679925','1967-04-18 21:52:42','Parker','2022-06-27 22:45:28'),
	 ('Ulysses','54823052507','1970-06-27 03:31:22','Dickerson','2020-07-15 05:40:00'),
	 ('David','55319037173','1990-05-09 10:25:33','Bryant','2021-05-12 08:52:26'),
	 ('Anne','57414494474','1968-10-30 14:05:46','Barr','2021-07-31 09:39:40'),
	 ('Felix','57685319355','1988-02-05 14:07:59','Randall','2020-03-15 16:30:49'),
	 ('Stewart','60581887040','1990-06-09 06:26:56','Rasmussen','2021-01-13 09:59:33'),
	 ('Kevin','61271311625','1989-04-27 22:52:30','Weaver','2021-03-28 13:36:36'),
	 ('Tanner','61635830582','1990-05-03 20:51:42','Conway','2021-09-18 23:29:58'),
	 ('Quinlan','61665087389','1958-02-28 17:45:03','Hopkins','2021-04-24 22:59:00'),
	 ('Tanner','62959947145','1954-12-05 00:46:08','Dorsey','2020-09-09 12:26:41');
INSERT INTO client (f_name,cpf,birth_date,l_name,register_date) VALUES
	 ('Tucker','63175283460','1985-01-27 00:48:39','Roman','2021-12-02 00:19:07'),
	 ('Jordan','63281504387','1961-08-04 22:48:11','Baird','2021-05-12 16:22:15'),
	 ('Ori','63878991002','1984-11-14 03:53:31','Oneal','2022-07-17 16:12:40'),
	 ('Micah','64848263730','1996-08-21 03:36:11','Mcmahon','2020-11-11 05:06:06'),
	 ('Hunter','65385614131','1974-05-30 07:39:49','Murray','2020-01-21 00:38:10'),
	 ('Salvador','65641225794','2001-10-25 10:13:20','Head','2022-01-31 07:39:52'),
	 ('Jared','66493480305','1958-11-10 22:40:19','Harmon','2021-08-17 12:52:19'),
	 ('Tana','66985078156','1996-09-09 14:52:13','Boyd','2020-04-04 02:39:20'),
	 ('Xena','67704520549','1995-06-14 10:31:29','Reese','2021-09-25 06:01:51'),
	 ('Harper','67873256906','1969-01-28 19:01:35','Alvarez','2021-05-03 11:33:16');
INSERT INTO client (f_name,cpf,birth_date,l_name,register_date) VALUES
	 ('Macon','69148240030','1984-07-12 08:02:36','Washington','2020-09-19 11:15:37'),
	 ('Erin','69919473808','1981-04-01 04:02:18','Henson','2022-06-23 14:47:05'),
	 ('Zoe','69975720527','1983-02-14 17:37:29','Hunter','2020-05-30 20:31:45'),
	 ('Joel','71112124504','1992-09-22 08:12:16','Wynn','2020-09-25 22:16:03'),
	 ('Cheyenne','71564871733','1958-05-12 13:46:59','Goff','2021-06-25 16:35:37'),
	 ('Hoyt','72172087355','1972-09-18 05:29:24','Mack','2021-03-19 20:04:53'),
	 ('Adara','72608476684','1982-01-06 02:26:56','Bradshaw','2021-12-17 17:58:01'),
	 ('Demetrius','72608528886','1961-03-08 20:33:48','Robbins','2022-10-08 01:50:26'),
	 ('Thane','72703020620','1993-02-28 12:26:33','Vincent','2020-11-07 03:20:51'),
	 ('Suki','73796104852','1969-08-27 01:09:10','Harrington','2020-06-28 13:47:29');
INSERT INTO client (f_name,cpf,birth_date,l_name,register_date) VALUES
	 ('Doris','73807639664','1998-09-25 20:21:33','Hubbard','2022-07-19 05:24:33'),
	 ('Ila','75429906936','2000-10-02 00:26:48','Whitney','2021-06-08 16:57:23'),
	 ('Patrick','75756517335','1984-03-05 02:09:54','Mejia','2020-05-21 09:27:46'),
	 ('Timothy','75940596036','1966-03-01 15:08:46','Benson','2021-06-05 04:19:10'),
	 ('Dora','76390895079','1974-09-02 23:33:12','Duran','2021-12-06 04:38:14'),
	 ('Maxwell','76399450948','1991-03-11 05:21:23','Craig','2021-07-19 23:14:16'),
	 ('Pascale','76583696545','1994-05-18 18:43:22','Rivers','2022-07-29 11:51:54'),
	 ('Margaret','77122715709','1984-07-05 11:30:31','Galloway','2020-09-28 10:25:33'),
	 ('Adam','78802506057','1999-10-21 07:09:30','Michael','2022-04-18 23:40:18'),
	 ('Lee','79367152528','1986-11-24 04:57:23','Carter','2022-11-23 20:00:25');
INSERT INTO client (f_name,cpf,birth_date,l_name,register_date) VALUES
	 ('Lunea','82215672249','1996-09-30 20:59:23','Waller','2021-05-20 08:28:47'),
	 ('Walter','85827852449','1994-10-07 12:44:58','Ball','2020-01-08 15:36:07'),
	 ('Felix','86082073329','1964-11-27 17:30:28','Kennedy','2021-05-10 22:29:37'),
	 ('Odysseus','86420528253','1982-10-13 07:01:29','Gordon','2022-10-08 20:04:49'),
	 ('Randall','86674618979','1988-01-18 10:03:42','Woodward','2022-10-31 05:38:08'),
	 ('Aquila','87828698777','1963-07-17 01:58:17','Abbott','2020-11-07 08:59:03'),
	 ('Kennan','89303220440','1972-01-21 22:19:06','Battle','2020-08-19 05:35:25'),
	 ('Nerea','90474650538','1996-12-31 22:03:24','Lowe','2020-07-28 23:32:54'),
	 ('Irma','92605726714','1977-02-12 06:35:12','Bridges','2021-11-08 17:28:18'),
	 ('Merrill','92892828239','1995-02-08 00:57:20','Rollins','2022-10-10 04:06:21');
INSERT INTO client (f_name,cpf,birth_date,l_name,register_date) VALUES
	 ('Jonas','94172285755','1957-05-23 10:54:12','Harrison','2020-02-25 04:12:47'),
	 ('Alyssa','95422526066','1979-10-20 07:27:08','Stone','2022-08-03 14:15:31'),
	 ('Whilemina','96539900721','1974-03-11 20:11:33','Winters','2021-01-08 00:20:11'),
	 ('Dana','96919023941','1954-12-17 05:34:00','Reilly','2022-11-28 10:44:43'),
	 ('Ariel','97469232468','1964-07-06 18:56:00','Whitaker','2020-03-10 21:57:45'),
	 ('Sierra','98617428911','1997-01-24 03:31:55','Robertson','2020-04-28 18:46:35'),
	 ('Nicole','99085416777','2001-08-12 11:14:30','Brewer','2021-08-09 07:11:10'),
	 ('Phelan','99141366565','1965-08-07 07:26:07','Head','2021-11-25 19:02:47'),
	 ('Lars','99302352877','1991-06-18 23:09:55','Stout','2022-02-05 15:25:16'),
	 ('Veronica','99371732354','1962-04-28 02:56:08','Simon','2020-02-02 21:30:46');
INSERT INTO event (n_days,initial_date,value,n_guests,dress_code,event_id,event_TYPE,fk_company_cnpj,fk_client_cpf) VALUES
	 (11,'2022-12-22 14:46:08',41799.00,141,'Casual',1,'Empresarial','17302434705304',NULL),
	 (3,'2022-08-30 12:57:35',19136.00,292,'Social',2,'Pessoal',NULL,'11653758376'),
	 (5,'2022-10-14 16:36:13',5417.00,85,'Casual',3,'Pessoal',NULL,'15390022108'),
	 (8,'2022-11-23 00:36:39',35627.00,384,'Esportivo',4,'Empresarial','18940924979145',NULL),
	 (20,'2022-09-26 08:12:23',26289.00,233,'Casual',5,'Empresarial','27134405665583',NULL),
	 (6,'2022-08-30 09:03:31',41224.00,395,'Casual',6,'Pessoal',NULL,'18937089940'),
	 (11,'2023-01-18 01:39:20',28822.00,65,'Casual',7,'Empresarial','37507963270658',NULL),
	 (3,'2022-09-17 02:03:47',13070.00,157,'Esportivo',8,'Empresarial','38932377930041',NULL),
	 (20,'2022-10-17 09:58:16',14960.00,374,'Esportivo',9,'Pessoal',NULL,'20126904669'),
	 (4,'2022-12-01 20:33:21',11735.00,310,'Casual',10,'Pessoal',NULL,'25313666769');
INSERT INTO event (n_days,initial_date,value,n_guests,dress_code,event_id,event_TYPE,fk_company_cnpj,fk_client_cpf) VALUES
	 (5,'2022-10-01 16:21:30',2387.00,35,'Casual',11,'Empresarial','38932377930041',NULL),
	 (1,'2022-10-18 21:00:19',45491.00,275,'Social',12,'Pessoal',NULL,'20548098142'),
	 (15,'2022-08-31 02:16:13',25989.00,465,'Esportivo',13,'Pessoal',NULL,'27347950998'),
	 (7,'2022-09-14 21:29:34',45357.00,214,'Social',14,'Pessoal',NULL,'26980211027'),
	 (9,'2022-11-02 06:50:07',4618.00,467,'Esportivo',15,'Pessoal',NULL,'27347950998'),
	 (20,'2023-02-03 05:38:05',43771.00,198,'Casual',16,'Pessoal',NULL,'26980211027'),
	 (8,'2022-12-30 07:51:37',38204.00,332,'Esportivo',17,'Pessoal',NULL,'27779345994'),
	 (17,'2022-11-11 15:18:18',31439.00,214,'Social',18,'Empresarial','37507963270658',NULL),
	 (10,'2022-10-20 09:18:04',36368.00,34,'Esportivo',19,'Pessoal',NULL,'29392753217'),
	 (2,'2023-01-05 00:55:13',36899.00,291,'Esportivo',20,'Empresarial','17302434705304',NULL);
INSERT INTO cash_entry_event (missing_value,payment_id,event_id) VALUES
	 (4421.18,39,3),
	 (1393.36,13,11),
	 (1393.36,202,15),
	 (2708.50,203,5),
	 (0.00,204,5);
INSERT INTO reservation (checkin,checkout,num_breakfast,value,reservation_id,reservation_date,client_cpf) VALUES
	 ('2021-12-02 04:44:39','2021-12-08 11:27:21',4,92.00,1,'2021-11-29 01:52:58','11653758376'),
	 ('2021-12-03 21:02:05','2021-12-06 14:38:46',3,149.00,2,'2021-11-29 17:25:48','14684895849'),
	 ('2021-12-03 06:54:25','2021-12-08 11:22:14',2,55.00,3,'2021-11-29 13:10:50','17829659659'),
	 ('2021-12-03 21:23:09','2021-12-06 08:21:30',1,86.00,4,'2021-11-28 17:05:55','15026003393'),
	 ('2021-12-04 14:36:37','2021-12-06 13:22:33',4,64.00,5,'2021-11-28 02:19:08','14863617125'),
	 ('2021-12-02 18:16:32','2021-12-08 03:36:09',2,182.00,6,'2021-11-28 16:06:37','24738320396'),
	 ('2021-12-03 21:51:55','2021-12-06 13:01:42',2,117.00,7,'2021-11-28 21:12:26','17829659659'),
	 ('2021-12-02 00:26:09','2021-12-06 21:42:03',3,157.00,8,'2021-11-29 11:53:15','27347950998'),
	 ('2021-12-04 17:32:51','2021-12-07 11:04:33',3,157.00,9,'2021-11-28 20:10:24','23295361354'),
	 ('2021-12-03 03:37:07','2021-12-07 12:36:45',4,99.00,10,'2021-11-28 13:23:20','30173079528');
	
INSERT INTO reservation (checkin,checkout,num_breakfast,value,reservation_id,reservation_date,client_cpf) VALUES
	 ('2021-12-04 06:18:26','2021-12-08 10:57:11',4,61.00,11,'2021-11-29 10:43:49','30710264073'),
	 ('2021-12-03 22:30:31','2021-12-06 22:32:07',2,176.00,12,'2021-11-28 15:06:18','32582812105'),
	 ('2021-12-04 08:36:16','2021-12-06 05:45:36',5,89.00,13,'2021-11-28 23:48:38','35641445260'),
	 ('2021-12-02 19:53:30','2021-12-06 10:39:25',4,135.00,14,'2021-11-29 00:39:37','36480220698'),
	 ('2021-12-03 04:34:25','2021-12-07 07:31:20',1,108.00,15,'2021-11-28 19:53:45','32843636113'),
	 ('2021-12-04 11:49:22','2021-12-06 14:51:01',3,190.00,16,'2021-11-28 16:06:05','27347950998'),
	 ('2021-12-04 21:54:07','2021-12-06 23:38:17',2,127.00,17,'2021-11-29 08:57:47','30173079528'),
	 ('2021-12-03 16:00:23','2021-12-07 19:24:00',5,188.00,18,'2021-11-28 08:05:33','29392753217'),
	 ('2021-12-03 04:54:20','2021-12-08 07:53:48',3,117.00,19,'2021-11-28 07:48:30','30710264073'),
	 ('2021-12-04 14:37:41','2021-12-09 10:14:20',2,166.00,20,'2021-11-28 09:40:05','41107870868');
INSERT INTO cash_entry_reservation (missing_value,payment_id,reservation_id) VALUES
	 (0.0,205,1),
	 (0.0,206,2),
	 (0.0,207,3),
	 (0.0,208,4),
	 (0.0,209,5);
INSERT INTO restaurant (name,restaurant_id,`type`,room_service,location,fk_hotel_hotel_id,department_id) VALUES
	 ('Belo Sabor',1,'Brasileira',1,'Térreo',1,4),
	 ('Bem Servido',2,'Brasileira',1,'Térreo',2,8),
	 ('Bom Apetite',3,'Brasileira',1,'Térreo',3,12),
	 ('Canto do Sabor',4,'Brasileira',0,'Térreo',4,16),
	 ('Casa da Sogra',5,'Brasileira',0,'Térreo',5,20),
	 ('Origami',6,'Japonesa',0,'Térreo',5,20),
	 ('Aladin',7,'Árabe',1,'Térreo',4,16);
INSERT INTO cash_entry_restaurant (restaurant_id,payment_id, client_cpf) VALUES
	 (1,1,"23295361354"),
	 (2,2,"24738320396"),
	 (3,3,"25313666769"),
	 (4,4,"25675754362"),
	 (5,5,"26980211027"),
	 (6,6,"27347950998"),
	 (7,7,"27779345994"),
	 (1,8,"29392753217"),
	 (2,9,"30173079528"),
	 (3,10,"30208062926");
INSERT INTO room (final_date,initial_date,size_m2,location,mensal_rent,weekly_rent,room_id,deposit_area,room_TYPE,hotel_id,company_cnpj) VALUES
	 ('2022-02-07 03:17:06','2021-11-23 05:58:53',88.00,'2',1916.00,547.43,1,54.00,'interna',3,'17302434705304'),
	 ('2021-12-30 10:46:25','2021-11-23 18:57:44',60.00,'2',2897.00,827.71,2,51.00,'interna',2,'18940924979145'),
	 ('2022-01-07 07:34:08','2021-11-19 19:45:05',83.00,'3',1465.00,418.57,3,59.00,'interna',3,'27134405665583'),
	 ('2022-01-31 21:17:25','2021-11-24 01:28:06',43.00,'2',4762.00,1360.57,4,42.00,'interna',5,'37507963270658'),
	 ('2022-01-22 09:50:33','2021-11-24 17:53:30',31.00,'2',4718.00,1348.00,5,3.00,'interna',2,'38932377930041'),
	 ('2022-02-11 07:02:40','2021-11-21 12:16:46',79.00,'3',1554.00,444.00,6,30.00,'interna',4,'41022413805795'),
	 ('2022-02-07 04:16:43','2021-11-23 15:34:48',55.00,'2',2610.00,745.71,7,92.00,'interna',2,'43644232354672'),
	 ('2022-01-20 21:46:30','2021-11-18 08:34:54',37.00,'2',3599.00,1028.29,8,62.00,'interna',1,'45647694603898'),
	 ('2022-01-01 23:22:53','2021-11-19 11:59:56',47.00,'2',3949.00,1128.29,9,61.00,'interna',2,'48098618295403'),
	 ('2021-12-24 17:25:56','2021-11-19 14:42:32',99.00,'2',3196.00,913.14,10,32.00,'interna',4,'48098618295403');
INSERT INTO room (final_date,initial_date,size_m2,location,mensal_rent,weekly_rent,room_id,deposit_area,room_TYPE,hotel_id,company_cnpj) VALUES
	 ('2022-01-27 13:17:42','2021-11-18 20:23:40',44.00,'3',2062.00,589.14,11,28.00,'interna',4,'94941420315746'),
	 ('2022-01-30 03:07:58','2021-11-19 16:25:29',39.00,'2',1655.00,472.86,12,94.00,'externa',4,'52195524767087'),
	 ('2021-12-25 16:06:39','2021-11-19 18:06:14',57.00,'2',3045.00,870.00,13,8.00,'externa',2,'55870362506713'),
	 ('2022-01-28 00:51:39','2021-11-24 12:29:17',71.00,'2',4489.00,1282.57,14,61.00,'externa',4,'58100642987257'),
	 ('2022-02-10 18:37:30','2021-11-18 16:30:07',38.00,'2',3712.00,1060.57,15,13.00,'externa',3,'74337437125735'),
	 ('2021-12-23 15:49:32','2021-11-21 04:26:21',92.00,'2',3800.00,1085.71,16,33.00,'externa',2,'77111770615673'),
	 ('2022-02-21 21:22:30','2021-11-19 08:28:05',97.00,'1',2639.00,754.00,17,72.00,'externa',4,'78367461578072'),
	 ('2022-02-15 17:54:09','2021-11-18 10:01:06',48.00,'2',1209.00,345.43,18,56.00,'externa',4,'83025979169998'),
	 ('2022-02-03 18:36:20','2021-11-18 15:37:01',84.00,'1',1428.00,408.00,19,66.00,'externa',1,'92917438849286'),
	 ('2022-01-26 07:01:37','2021-11-23 23:45:50',34.00,'1',1763.00,503.71,20,93.00,'externa',2,'92917438849286');
INSERT INTO dependent (relation,f_name,cpf,birth_date,l_name,register_date,fk_employee_cpf) VALUES
	 ('Jamalia Middleton','Natalie','17367007847','2004-07-13 16:39:50','Rios','2023-09-20 15:39:59','12673786081'),
	 ('Flavia Lester','Chaim','31011004074','2020-01-19 02:42:54','Fitzpatrick','2022-06-04 03:03:27','13144156188'),
	 ('Kirsten Nielsen','Dacey','53908628812','2018-11-19 11:56:59','Miller','2022-08-29 13:21:30','18217498915'),
	 ('Chantale Ray','Cade','59456165563','2006-09-09 20:52:53','Dawson','2023-12-13 02:01:29','14818681805'),
	 ('Lucius Cox','Kenneth','60535113520','2014-01-04 13:22:16','Griffith','2023-10-08 23:14:20','19761703716'),
	 ('Mara Hoffman','Tara','67609864589','2007-10-15 01:06:10','Little','2022-12-09 01:12:49','23964344089'),
	 ('Ezekiel Hutchinson','Ali','69637316911','2008-02-07 05:08:15','Herman','2021-04-17 03:29:31','34001196132'),
	 ('Iliana Jarvis','Iliana','76108472234','2010-09-13 17:49:27','Weiss','2023-11-01 21:57:49','38192374273'),
	 ('Arthur Cummings','Madeline','80180923061','2010-06-18 02:22:39','Bean','2020-03-06 14:20:46','38192374273'),
	 ('Portia Allison','Brenden','84940100144','2002-01-03 23:57:53','Mckinney','2021-06-17 02:20:11','21670209596');
INSERT INTO supervision (supervisor_cpf,employee_cpf) VALUES
	 ('29458660053','12673786081'),
	 ('68553295471','13616560396'),
	 ('30472748744','14818681805'),
	 ('29458660053','18217498915'),
	 ('89363075603','19761703716'),
	 ('66204786879','21670209596'),
	 ('90115653661','23829179793'),
	 ('85052766280','23964344089'),
	 ('50838196403','29415257674'),
	 ('90115653661','33308842163');
INSERT INTO supervision (supervisor_cpf,employee_cpf) VALUES
	 ('75236842275','35002823119'),
	 ('66204786879','43574806488'),
	 ('79847481990','44290783158'),
	 ('78201468182','45485407605'),
	 ('79847481990','46088903138'),
	 ('50838196403','47913471837'),
	 ('93990306833','51677792273'),
	 ('85052766280','56504358591'),
	 ('63359208302','57223779143'),
	 ('39096085181','60531003052');
INSERT INTO supervision (supervisor_cpf,employee_cpf) VALUES
	 ('78201468182','60681591658'),
	 ('75236842275','64416809167'),
	 ('65712806293','64746147704'),
	 ('80421559928','65060258468'),
	 ('44436783579','66683140110'),
	 ('33582451682','67671288969'),
	 ('38192374273','68155283750'),
	 ('63359208302','73989376227'),
	 ('44436783579','74558744133'),
	 ('68553295471','75557879028');
INSERT INTO supervision (supervisor_cpf,employee_cpf) VALUES
	 ('33582451682','79322328484'),
	 ('30472748744','79739723559'),
	 ('38192374273','80179525159'),
	 ('65712806293','80599821912'),
	 ('93990306833','84261893909'),
	 ('71904029634','86687483426'),
	 ('71904029634','89255200945'),
	 ('80421559928','91580589267'),
	 ('89363075603','97465530561'),
	 ('39096085181','97810080291');
INSERT INTO supervision (supervisor_cpf,employee_cpf) VALUES
	 ('49185410172','29458660053'),
	 ('17740385403','30472748744'),
	 ('68333082877','33582451682'),
	 ('39289141418','38192374273'),
	 ('94828086274','39096085181'),
	 ('49191327254','44436783579'),
	 ('76118861344','50838196403'),
	 ('59085976081','63359208302'),
	 ('70101665818','65712806293'),
	 ('76694796302','66204786879');
INSERT INTO supervision (supervisor_cpf,employee_cpf) VALUES
	 ('15863762777','68553295471'),
	 ('18924239353','71904029634'),
	 ('61995548699','75236842275'),
	 ('65852677241','78201468182'),
	 ('78062457467','79847481990'),
	 ('79924936337','80421559928'),
	 ('23021042410','85052766280'),
	 ('38890069459','89363075603'),
	 ('49253535148','90115653661'),
	 ('99518031149','93990306833');
INSERT INTO supervision (supervisor_cpf,employee_cpf) VALUES
	 ('45183531317','15863762777'),
	 ('79243245086','17740385403'),
	 ('46848979044','18924239353'),
	 ('92748031008','23021042410'),
	 ('94225114828','38890069459'),
	 ('36496999612','39289141418'),
	 ('84899323025','49185410172'),
	 ('85535105936','49191327254'),
	 ('96085352320','49253535148'),
	 ('57950105512','59085976081');
INSERT INTO supervision (supervisor_cpf,employee_cpf) VALUES
	 ('64950318323','61995548699'),
	 ('34190494541','65852677241'),
	 ('34001196132','68333082877'),
	 ('50815306335','70101665818'),
	 ('65801393729','76118861344'),
	 ('13144156188','76694796302'),
	 ('95363017129','78062457467'),
	 ('90098653640','79924936337'),
	 ('86388311345','94828086274'),
	 ('22389034833','99518031149');
INSERT INTO benefit_employee (benefit_id,employee_cpf) VALUES
	 (1,'13144156188'),
	 (1,'22389034833'),
	 (1,'34001196132'),
	 (1,'34190494541'),
	 (1,'36496999612'),
	 (1,'45183531317'),
	 (1,'46848979044'),
	 (1,'50815306335'),
	 (1,'57950105512'),
	 (1,'64950318323');
INSERT INTO benefit_employee (benefit_id,employee_cpf) VALUES
	 (1,'65801393729'),
	 (1,'79243245086'),
	 (1,'84899323025'),
	 (1,'85535105936'),
	 (1,'86388311345'),
	 (1,'90098653640'),
	 (1,'92748031008'),
	 (1,'94225114828'),
	 (1,'95363017129'),
	 (1,'96085352320');
INSERT INTO benefit_employee (benefit_id,employee_cpf) VALUES
	 (5,'13144156188'),
	 (5,'22389034833'),
	 (5,'34001196132'),
	 (5,'34190494541'),
	 (5,'36496999612'),
	 (5,'45183531317'),
	 (5,'46848979044'),
	 (5,'50815306335'),
	 (5,'57950105512'),
	 (5,'64950318323');
INSERT INTO benefit_employee (benefit_id,employee_cpf) VALUES
	 (5,'65801393729'),
	 (5,'79243245086'),
	 (5,'84899323025'),
	 (5,'85535105936'),
	 (5,'86388311345'),
	 (5,'90098653640'),
	 (5,'92748031008'),
	 (5,'94225114828'),
	 (5,'95363017129'),
	 (5,'96085352320');
INSERT INTO benefit_employee (benefit_id,employee_cpf) VALUES
	 (4,'13144156188'),
	 (4,'22389034833'),
	 (4,'34001196132'),
	 (4,'34190494541'),
	 (4,'36496999612'),
	 (4,'45183531317'),
	 (4,'46848979044'),
	 (4,'50815306335'),
	 (4,'57950105512'),
	 (4,'64950318323');
INSERT INTO benefit_employee (benefit_id,employee_cpf) VALUES
	 (4,'65801393729'),
	 (4,'79243245086'),
	 (4,'84899323025'),
	 (4,'85535105936'),
	 (4,'86388311345'),
	 (4,'90098653640'),
	 (4,'92748031008'),
	 (4,'94225114828'),
	 (4,'95363017129'),
	 (4,'96085352320');
INSERT INTO benefit_employee (benefit_id,employee_cpf) VALUES
	 (1,'29458660053'),
	 (1,'30472748744'),
	 (1,'33582451682'),
	 (1,'38192374273'),
	 (1,'39096085181'),
	 (1,'44436783579'),
	 (1,'50838196403'),
	 (1,'63359208302'),
	 (1,'65712806293'),
	 (1,'66204786879');
INSERT INTO benefit_employee (benefit_id,employee_cpf) VALUES
	 (1,'68553295471'),
	 (1,'71904029634'),
	 (1,'75236842275'),
	 (1,'78201468182'),
	 (1,'79847481990'),
	 (1,'80421559928'),
	 (1,'85052766280'),
	 (1,'89363075603'),
	 (1,'90115653661'),
	 (1,'93990306833');
INSERT INTO benefit_employee (benefit_id,employee_cpf) VALUES
	 (4,'29458660053'),
	 (4,'30472748744'),
	 (4,'33582451682'),
	 (4,'38192374273'),
	 (4,'39096085181'),
	 (4,'44436783579'),
	 (4,'50838196403'),
	 (4,'63359208302'),
	 (4,'65712806293'),
	 (4,'66204786879');
INSERT INTO benefit_employee (benefit_id,employee_cpf) VALUES
	 (4,'68553295471'),
	 (4,'71904029634'),
	 (4,'75236842275'),
	 (4,'78201468182'),
	 (4,'79847481990'),
	 (4,'80421559928'),
	 (4,'85052766280'),
	 (4,'89363075603'),
	 (4,'90115653661'),
	 (4,'93990306833');
INSERT INTO benefit_employee (benefit_id,employee_cpf) VALUES
	 (4,'15863762777'),
	 (4,'17740385403'),
	 (4,'18924239353'),
	 (4,'23021042410'),
	 (4,'38890069459'),
	 (4,'39289141418'),
	 (4,'49185410172'),
	 (4,'49191327254'),
	 (4,'49253535148'),
	 (4,'59085976081');
INSERT INTO benefit_employee (benefit_id,employee_cpf) VALUES
	 (4,'61995548699'),
	 (4,'65852677241'),
	 (4,'68333082877'),
	 (4,'70101665818'),
	 (4,'76118861344'),
	 (4,'76694796302'),
	 (4,'78062457467'),
	 (4,'79924936337'),
	 (4,'94828086274'),
	 (4,'99518031149');
INSERT INTO benefit_employee (benefit_id,employee_cpf) VALUES
	 (1,'15863762777'),
	 (1,'17740385403'),
	 (1,'18924239353'),
	 (1,'23021042410'),
	 (1,'38890069459'),
	 (1,'39289141418'),
	 (1,'49185410172'),
	 (1,'49191327254'),
	 (1,'49253535148'),
	 (1,'59085976081');
INSERT INTO benefit_employee (benefit_id,employee_cpf) VALUES
	 (1,'61995548699'),
	 (1,'65852677241'),
	 (1,'68333082877'),
	 (1,'70101665818'),
	 (1,'76118861344'),
	 (1,'76694796302'),
	 (1,'78062457467'),
	 (1,'79924936337'),
	 (1,'94828086274'),
	 (1,'99518031149');
INSERT INTO benefit_employee (benefit_id,employee_cpf) VALUES
	 (3,'12673786081'),
	 (3,'13616560396'),
	 (3,'14818681805'),
	 (3,'18217498915'),
	 (3,'19761703716'),
	 (3,'21670209596'),
	 (3,'23829179793'),
	 (3,'23964344089'),
	 (3,'29415257674'),
	 (3,'33308842163');
INSERT INTO benefit_employee (benefit_id,employee_cpf) VALUES
	 (3,'35002823119'),
	 (3,'43574806488'),
	 (3,'44290783158'),
	 (3,'45485407605'),
	 (3,'46088903138'),
	 (3,'47913471837'),
	 (3,'51677792273'),
	 (3,'56504358591'),
	 (3,'57223779143'),
	 (3,'60531003052');
INSERT INTO benefit_employee (benefit_id,employee_cpf) VALUES
	 (3,'60681591658'),
	 (3,'64416809167'),
	 (3,'64746147704'),
	 (3,'65060258468'),
	 (3,'66683140110'),
	 (3,'67671288969'),
	 (3,'68155283750'),
	 (3,'73989376227'),
	 (3,'74558744133'),
	 (3,'75557879028');
INSERT INTO benefit_employee (benefit_id,employee_cpf) VALUES
	 (3,'79322328484'),
	 (3,'79739723559'),
	 (3,'80179525159'),
	 (3,'80599821912'),
	 (3,'84261893909'),
	 (3,'86687483426'),
	 (3,'89255200945'),
	 (3,'91580589267'),
	 (3,'97465530561'),
	 (3,'97810080291');
INSERT INTO benefit_employee (benefit_id,employee_cpf) VALUES
	 (2,'12673786081'),
	 (2,'13616560396'),
	 (2,'14818681805'),
	 (2,'18217498915'),
	 (2,'19761703716'),
	 (2,'21670209596'),
	 (2,'23829179793'),
	 (2,'23964344089'),
	 (2,'29415257674'),
	 (2,'33308842163');
INSERT INTO benefit_employee (benefit_id,employee_cpf) VALUES
	 (2,'35002823119'),
	 (2,'43574806488'),
	 (2,'44290783158'),
	 (2,'45485407605'),
	 (2,'46088903138'),
	 (2,'47913471837'),
	 (2,'51677792273'),
	 (2,'56504358591'),
	 (2,'57223779143'),
	 (2,'60531003052');
INSERT INTO cash_outflow (payment_form,tax,emission_date,payment_id,value,quantity,cash_outflow_TYPE,responsible_cpf) VALUES
	 ('pix',28.71,'2022-12-13 12:07:50',1,224.11,1,'produto','50815306335'),
	 ('dinheiro',20.01,'2022-12-14 14:44:23',2,239.69,9,'produto','14818681805'),
	 ('cartão',26.83,'2022-12-06 05:16:47',3,451.64,4,'produto','12673786081'),
	 ('cartão',28.62,'2022-12-13 11:45:07',4,226.63,1,'produto','17740385403'),
	 ('dinheiro',11.33,'2022-12-09 23:11:35',5,714.81,2,'produto','79243245086'),
	 ('pix',16.91,'2022-12-08 12:13:12',6,858.70,2,'produto','84899323025'),
	 ('dinheiro',13.93,'2022-12-09 13:51:09',7,411.94,7,'produto','14818681805'),
	 ('dinheiro',39.98,'2022-12-04 16:59:33',8,931.91,2,'produto','17740385403'),
	 ('pix',15.56,'2022-12-09 00:02:42',9,138.78,4,'produto','76118861344'),
	 ('dinheiro',33.04,'2022-12-12 04:53:46',10,505.26,7,'produto','29458660053');
INSERT INTO cash_outflow (payment_form,tax,emission_date,payment_id,value,quantity,cash_outflow_TYPE,responsible_cpf) VALUES
	 ('cartão',13.43,'2022-12-13 10:43:45',11,468.50,4,'produto','30472748744'),
	 ('ted',34.31,'2022-12-12 19:33:17',12,557.42,9,'produto','65712806293'),
	 ('pix',25.58,'2022-12-04 06:05:06',13,58.83,7,'produto','14818681805'),
	 ('pix',7.70,'2022-12-05 06:46:01',14,781.37,3,'produto','17740385403'),
	 ('cartão',12.32,'2022-12-10 06:32:13',15,712.79,2,'produto','80599821912'),
	 ('cartão',21.34,'2022-12-13 03:55:15',16,722.01,7,'produto','50838196403'),
	 ('pix',30.26,'2022-12-17 02:36:26',17,52.01,6,'produto','56504358591'),
	 ('cartão',37.69,'2022-12-09 05:26:19',18,343.06,4,'produto','64746147704'),
	 ('pix',22.52,'2022-12-17 02:46:01',19,666.07,8,'produto','30472748744'),
	 ('dinheiro',33.99,'2022-12-10 16:54:36',20,55.68,6,'produto','29415257674');
INSERT INTO cash_outflow (payment_form,tax,emission_date,payment_id,value,quantity,cash_outflow_TYPE,responsible_cpf) VALUES
	 ('cartão',12.83,'2022-12-07 23:07:05',21,95.67,3,'produto','56504358591'),
	 ('dinheiro',39.43,'2022-12-17 17:00:59',22,425.91,5,'produto','47913471837'),
	 ('ted',38.01,'2022-12-13 23:56:46',23,560.32,7,'produto','92748031008'),
	 ('cartão',10.84,'2022-12-13 05:28:53',24,618.90,2,'produto','23964344089'),
	 ('dinheiro',11.50,'2022-12-12 17:08:55',25,438.75,3,'produto','79739723559'),
	 ('cartão',33.32,'2022-12-05 19:09:18',26,782.03,3,'produto','76118861344'),
	 ('dinheiro',25.10,'2022-12-01 22:16:52',27,465.14,2,'produto','17740385403'),
	 ('cartão',19.41,'2022-12-09 21:22:13',28,56.45,7,'produto','76118861344'),
	 ('ted',27.20,'2022-12-03 03:02:26',29,598.88,7,'produto','79739723559'),
	 ('dinheiro',23.57,'2022-12-19 10:59:50',30,218.94,1,'produto','49185410172');
INSERT INTO cash_outflow (payment_form,tax,emission_date,payment_id,value,quantity,cash_outflow_TYPE,responsible_cpf) VALUES
	 ('pix',7.89,'2022-12-01 21:03:21',31,864.91,3,'produto','18217498915'),
	 ('ted',6.45,'2022-12-03 09:00:22',32,403.42,6,'produto','65801393729'),
	 ('cartão',13.20,'2022-12-01 23:32:04',33,470.34,2,'produto','47913471837'),
	 ('ted',5.19,'2022-12-04 03:27:07',34,695.44,10,'produto','23964344089'),
	 ('dinheiro',38.98,'2022-12-10 01:56:49',35,455.02,8,'produto','29458660053'),
	 ('cartão',6.34,'2022-12-03 00:21:50',36,322.43,3,'produto','23021042410'),
	 ('dinheiro',7.40,'2022-12-09 20:53:38',37,52.48,7,'produto','84899323025'),
	 ('ted',39.01,'2022-12-16 15:50:11',38,196.66,4,'produto','17740385403'),
	 ('dinheiro',5.63,'2022-12-10 03:41:34',39,263.23,8,'produto','29415257674'),
	 ('pix',12.95,'2022-12-10 23:35:04',40,840.49,7,'produto','56504358591');
INSERT INTO cash_outflow (payment_form,tax,emission_date,payment_id,value,quantity,cash_outflow_TYPE,responsible_cpf) VALUES
	 ('cartão',30.83,'2022-12-09 15:01:33',41,986.14,7,'produto','50838196403'),
	 ('dinheiro',18.80,'2022-12-05 23:42:33',42,78.83,5,'produto','47913471837'),
	 ('cartão',15.53,'2022-12-13 01:10:37',43,203.41,10,'produto','76118861344'),
	 ('ted',21.62,'2022-12-09 05:15:54',44,663.75,1,'produto','76118861344'),
	 ('cartão',30.54,'2022-12-16 21:13:17',45,923.91,3,'produto','64746147704'),
	 ('ted',29.38,'2022-12-09 16:51:50',46,170.42,4,'produto','85052766280'),
	 ('ted',35.97,'2022-12-18 16:20:53',47,942.74,10,'produto','12673786081'),
	 ('cartão',6.28,'2022-12-03 02:57:40',48,353.76,4,'produto','65712806293'),
	 ('ted',18.94,'2022-12-02 23:36:23',49,266.62,9,'produto','65712806293'),
	 ('cartão',27.61,'2022-12-06 02:57:50',50,365.41,9,'produto','79739723559');
INSERT INTO cash_outflow (payment_form,tax,emission_date,payment_id,value,quantity,cash_outflow_TYPE,responsible_cpf) VALUES
	 ('cartão',10.55,'2022-12-13 20:59:22',51,803.64,1,'produto','29415257674'),
	 ('dinheiro',26.21,'2022-12-20 01:05:30',52,157.08,7,'produto','23021042410'),
	 ('ted',6.28,'2022-12-05 15:48:41',53,987.60,4,'produto','56504358591'),
	 ('ted',20.27,'2022-12-14 22:40:14',54,302.09,3,'produto','29415257674'),
	 ('ted',8.87,'2022-12-02 04:57:15',55,870.04,3,'produto','47913471837'),
	 ('ted',19.64,'2022-12-14 10:32:22',56,225.07,9,'produto','85052766280'),
	 ('ted',24.58,'2022-12-13 00:39:59',57,431.03,3,'produto','49185410172'),
	 ('pix',10.45,'2022-12-15 15:10:12',58,301.30,2,'produto','17740385403'),
	 ('ted',11.58,'2022-12-19 13:18:32',59,242.26,2,'produto','70101665818'),
	 ('pix',13.61,'2022-12-13 12:44:12',60,475.49,4,'produto','70101665818');
INSERT INTO cash_outflow (payment_form,tax,emission_date,payment_id,value,quantity,cash_outflow_TYPE,responsible_cpf) VALUES
	 ('cartão',19.01,'2022-12-05 01:01:23',61,775.92,3,'produto','14818681805'),
	 ('dinheiro',12.29,'2022-12-12 02:53:13',62,227.48,3,'produto','64746147704'),
	 ('ted',27.97,'2022-12-05 05:10:41',63,110.32,8,'produto','92748031008'),
	 ('pix',38.22,'2022-12-05 09:33:40',64,294.32,7,'produto','79243245086'),
	 ('cartão',39.13,'2022-12-14 10:33:54',65,582.52,8,'produto','23021042410'),
	 ('dinheiro',6.69,'2022-12-16 21:41:58',66,917.03,2,'produto','23964344089'),
	 ('pix',27.35,'2022-12-14 23:24:09',67,698.56,4,'produto','17740385403'),
	 ('ted',30.51,'2022-12-06 18:51:35',68,301.50,5,'produto','30472748744'),
	 ('ted',34.46,'2022-12-18 22:46:17',69,179.45,9,'produto','92748031008'),
	 ('pix',26.67,'2022-12-09 00:33:18',70,214.49,7,'produto','30472748744');
INSERT INTO cash_outflow (payment_form,tax,emission_date,payment_id,value,quantity,cash_outflow_TYPE,responsible_cpf) VALUES
	 ('ted',19.09,'2022-12-15 18:01:36',71,596.97,7,'produto','56504358591'),
	 ('cartão',26.58,'2022-12-16 09:43:51',72,167.27,3,'produto','80599821912'),
	 ('ted',28.18,'2022-12-01 19:01:40',73,187.50,7,'produto','92748031008'),
	 ('dinheiro',21.40,'2022-12-08 16:31:53',74,548.16,5,'produto','80599821912'),
	 ('pix',30.78,'2022-12-19 20:41:16',75,698.76,6,'produto','29458660053'),
	 ('ted',37.72,'2022-12-09 16:39:04',76,457.86,9,'produto','29415257674'),
	 ('dinheiro',10.36,'2022-12-05 19:24:33',77,702.66,8,'produto','79243245086'),
	 ('ted',27.87,'2022-12-08 08:46:36',78,905.01,5,'produto','29415257674'),
	 ('dinheiro',6.38,'2022-12-12 12:16:27',79,792.75,3,'produto','47913471837'),
	 ('ted',31.29,'2022-12-13 11:56:58',80,967.54,9,'produto','49185410172');
INSERT INTO cash_outflow (payment_form,tax,emission_date,payment_id,value,quantity,cash_outflow_TYPE,responsible_cpf) VALUES
	 ('dinheiro',39.97,'2022-12-20 01:54:58',81,975.70,9,'produto','85052766280'),
	 ('ted',22.81,'2022-12-11 18:14:48',82,254.49,5,'produto','70101665818'),
	 ('pix',16.60,'2022-12-05 21:53:21',83,234.20,3,'produto','64746147704'),
	 ('cartão',18.96,'2022-12-15 23:34:48',84,664.63,10,'produto','65712806293'),
	 ('cartão',11.11,'2022-12-15 08:35:16',85,180.59,5,'produto','47913471837'),
	 ('dinheiro',10.98,'2022-12-02 17:15:36',86,830.51,9,'produto','70101665818'),
	 ('pix',40.71,'2022-12-13 00:14:03',87,99.83,5,'produto','17740385403'),
	 ('cartão',17.25,'2022-12-17 04:20:17',88,149.95,1,'produto','70101665818'),
	 ('dinheiro',9.22,'2022-12-07 12:13:49',89,268.16,3,'produto','84899323025'),
	 ('cartão',29.50,'2022-12-18 02:01:32',90,355.87,10,'produto','85052766280');
INSERT INTO cash_outflow (payment_form,tax,emission_date,payment_id,value,quantity,cash_outflow_TYPE,responsible_cpf) VALUES
	 ('dinheiro',31.64,'2022-12-09 20:53:19',91,982.70,6,'produto','65801393729'),
	 ('pix',15.15,'2022-12-05 06:02:12',92,183.84,2,'produto','65712806293'),
	 ('dinheiro',35.40,'2022-12-05 17:50:15',93,603.66,3,'produto','23021042410'),
	 ('pix',15.99,'2022-12-16 06:55:00',94,976.82,6,'produto','47913471837'),
	 ('ted',28.94,'2022-12-18 14:32:35',95,531.06,8,'produto','56504358591'),
	 ('dinheiro',31.67,'2022-12-01 12:06:01',96,789.32,9,'produto','79739723559'),
	 ('dinheiro',9.28,'2022-12-16 09:23:45',97,583.84,5,'produto','47913471837'),
	 ('cartão',18.87,'2022-12-07 05:09:38',98,380.45,9,'produto','64746147704'),
	 ('cartão',12.99,'2022-12-04 00:43:10',99,999.81,6,'produto','29415257674'),
	 ('ted',28.42,'2022-12-10 10:02:52',103,424.84,6,'produto','80599821912');
INSERT INTO cash_outflow (payment_form,tax,emission_date,payment_id,value,quantity,cash_outflow_TYPE,responsible_cpf) VALUES
	 ('ted',17.88,'2022-12-15 23:27:51',104,749.18,5,'produto','56504358591'),
	 ('pix',30.59,'2022-12-03 07:13:32',105,15.00,4,'produto','80599821912'),
	 ('ted',20.06,'2022-12-06 04:40:30',106,20.00,10,'produto','76118861344'),
	 ('dinheiro',8.81,'2022-12-05 13:11:47',107,10.00,8,'produto','84899323025'),
	 ('cartão',5.44,'2022-12-03 17:47:39',108,25.00,6,'produto','92748031008'),
	 ('dinheiro',25.52,'2022-12-08 12:00:27',109,18.00,2,'produto','92748031008'),
	 ('pix',27.69,'2022-12-17 20:37:51',110,25.00,5,'produto','47913471837'),
	 ('pix',23.99,'2022-12-05 12:43:58',111,80.00,5,'produto','23964344089'),
	 ('dinheiro',8.29,'2022-12-19 12:55:51',112,60.00,5,'produto','18217498915'),
	 ('pix',23.13,'2022-12-06 06:11:56',113,20.00,8,'produto','56504358591');
INSERT INTO cash_outflow (payment_form,tax,emission_date,payment_id,value,quantity,cash_outflow_TYPE,responsible_cpf) VALUES
	 ('dinheiro',36.19,'2022-12-02 05:26:32',114,27.00,6,'produto','29415257674'),
	 ('dinheiro',33.27,'2022-12-08 23:42:15',115,45.00,7,'produto','50815306335'),
	 ('cartão',26.38,'2022-12-06 21:36:37',116,40.00,7,'produto','50815306335'),
	 ('pix',5.03,'2022-12-18 12:25:18',117,70.00,5,'produto','64746147704'),
	 ('ted',9.18,'2022-12-16 14:58:20',118,80.00,7,'produto','18217498915'),
	 ('cartão',12.21,'2022-12-08 12:27:16',119,6.00,3,'produto','80599821912'),
	 ('cartão',29.17,'2022-12-07 18:09:43',120,30.00,7,'produto','65801393729'),
	 ('dinheiro',26.87,'2022-12-08 17:42:50',121,30.00,2,'produto','50815306335'),
	 ('pix',36.80,'2022-12-06 01:29:18',122,3.00,6,'produto','29415257674'),
	 ('dinheiro',32.10,'2022-12-19 16:42:51',123,40.00,6,'produto','84899323025');
INSERT INTO cash_outflow (payment_form,tax,emission_date,payment_id,value,quantity,cash_outflow_TYPE,responsible_cpf) VALUES
	 ('pix',17.23,'2022-12-13 00:17:50',124,6.00,1,'produto','14818681805'),
	 ('cartão',39.63,'2022-12-02 03:24:23',125,40.00,4,'produto','29415257674'),
	 ('pix',15.36,'2022-12-05 01:49:21',126,80.00,2,'produto','79739723559'),
	 ('dinheiro',27.51,'2022-12-03 23:37:51',127,50.00,8,'produto','47913471837'),
	 ('dinheiro',29.58,'2022-12-03 04:41:22',128,21.00,5,'produto','50815306335'),
	 ('ted',38.91,'2022-12-11 19:01:33',129,24.00,9,'produto','23021042410'),
	 ('pix',35.40,'2022-12-14 05:46:29',130,4.00,8,'produto','70101665818'),
	 ('cartão',33.40,'2022-12-07 19:03:25',131,10.00,4,'produto','29458660053'),
	 ('pix',32.05,'2022-12-13 06:38:30',132,20.00,9,'produto','79739723559'),
	 ('cartão',32.85,'2022-12-05 13:33:23',133,6.00,8,'produto','76118861344');
INSERT INTO cash_outflow (payment_form,tax,emission_date,payment_id,value,quantity,cash_outflow_TYPE,responsible_cpf) VALUES
	 ('ted',21.54,'2022-12-09 08:32:47',134,6.00,7,'produto','29415257674'),
	 ('ted',33.79,'2022-12-02 22:46:25',135,70.00,10,'produto','84899323025'),
	 ('cartão',35.78,'2022-12-06 20:52:10',136,50.00,9,'produto','64746147704'),
	 ('pix',17.79,'2022-12-14 08:37:52',137,18.00,4,'produto','12673786081'),
	 ('ted',30.00,'2022-10-13 08:08:16',138,8140.00,1,'salário','45485407605'),
	 ('ted',30.00,'2021-05-10 03:25:58',139,29143.00,1,'salário','64950318323'),
	 ('ted',30.00,'2021-12-17 10:38:00',140,3926.00,1,'salário','65852677241'),
	 ('ted',30.00,'2022-05-27 08:48:15',141,6750.00,1,'salário','34190494541'),
	 ('ted',30.00,'2022-03-09 13:02:32',142,21959.00,1,'salário','76694796302'),
	 ('ted',30.00,'2022-11-28 15:04:03',143,23591.00,1,'salário','57223779143');
INSERT INTO cash_outflow (payment_form,tax,emission_date,payment_id,value,quantity,cash_outflow_TYPE,responsible_cpf) VALUES
	 ('ted',30.00,'2022-03-19 15:21:05',144,3352.00,1,'salário','34190494541'),
	 ('ted',30.00,'2021-03-15 02:13:56',145,22493.00,1,'salário','18924239353'),
	 ('ted',30.00,'2022-09-15 07:47:33',146,8079.00,1,'salário','63359208302'),
	 ('ted',30.00,'2021-10-14 05:26:27',147,5925.00,1,'salário','43574806488'),
	 ('ted',30.00,'2021-05-04 19:31:12',148,29184.00,1,'salário','13144156188'),
	 ('ted',30.00,'2022-03-11 12:35:04',149,23082.00,1,'salário','57950105512'),
	 ('ted',30.00,'2022-05-09 22:46:12',150,12837.00,1,'salário','86687483426'),
	 ('ted',30.00,'2021-04-20 09:27:12',151,5567.00,1,'salário','60681591658'),
	 ('ted',30.00,'2021-07-01 07:05:23',152,7822.00,1,'salário','76694796302'),
	 ('ted',30.00,'2022-12-14 23:25:28',153,15899.00,1,'salário','66204786879');
INSERT INTO cash_outflow (payment_form,tax,emission_date,payment_id,value,quantity,cash_outflow_TYPE,responsible_cpf) VALUES
	 ('ted',30.00,'2022-05-27 09:25:00',154,19311.00,1,'salário','66204786879'),
	 ('ted',30.00,'2022-04-02 02:49:25',155,6581.00,1,'salário','78201468182'),
	 ('ted',30.00,'2022-03-08 00:24:23',156,18127.00,1,'salário','46848979044'),
	 ('ted',30.00,'2021-07-16 10:04:31',157,29089.00,1,'salário','34190494541'),
	 ('ted',30.00,'2022-09-29 12:06:35',158,29803.00,1,'salário','76694796302'),
	 ('ted',30.00,'2021-05-20 12:07:25',159,7922.00,1,'salário','76694796302'),
	 ('ted',30.00,'2022-12-12 00:04:33',160,25738.00,1,'salário','45485407605'),
	 ('ted',30.00,'2022-01-30 18:31:26',161,13217.00,1,'salário','63359208302'),
	 ('ted',30.00,'2022-04-07 09:53:28',162,21557.00,1,'salário','63359208302'),
	 ('ted',30.00,'2021-07-28 00:29:09',163,15271.00,1,'salário','78201468182');
INSERT INTO cash_outflow (payment_form,tax,emission_date,payment_id,value,quantity,cash_outflow_TYPE,responsible_cpf) VALUES
	 ('ted',30.00,'2021-07-15 15:42:44',164,21063.00,1,'salário','35002823119'),
	 ('ted',30.00,'2021-09-13 13:26:58',165,11532.00,1,'salário','71904029634'),
	 ('ted',30.00,'2022-12-05 17:50:18',166,4073.00,1,'salário','61995548699'),
	 ('ted',30.00,'2021-01-30 23:22:53',167,13188.00,1,'salário','18924239353'),
	 ('ted',30.00,'2020-12-24 13:38:09',168,27559.00,1,'salário','64416809167'),
	 ('ted',30.00,'2021-02-10 18:38:09',169,7445.00,1,'salário','71904029634'),
	 ('ted',30.00,'2021-10-08 00:59:32',170,9265.00,1,'salário','75236842275'),
	 ('ted',30.00,'2021-12-10 09:13:53',171,28291.00,1,'salário','75236842275'),
	 ('ted',30.00,'2022-10-19 05:00:44',172,1880.00,1,'salário','18924239353'),
	 ('ted',30.00,'2021-11-01 03:18:13',173,21779.00,1,'salário','73989376227');
INSERT INTO cash_outflow (payment_form,tax,emission_date,payment_id,value,quantity,cash_outflow_TYPE,responsible_cpf) VALUES
	 ('ted',30.00,'2022-04-15 05:18:03',174,20343.00,1,'salário','59085976081'),
	 ('ted',30.00,'2022-05-11 03:30:40',175,23477.00,1,'salário','75236842275'),
	 ('ted',30.00,'2022-03-28 23:04:05',176,28249.00,1,'salário','46848979044'),
	 ('ted',30.00,'2022-03-15 06:34:31',177,14651.00,1,'salário','59085976081'),
	 ('ted',30.00,'2022-10-30 17:56:07',178,11739.00,1,'salário','45485407605'),
	 ('ted',30.00,'2021-08-30 19:57:16',179,10424.00,1,'salário','64416809167'),
	 ('ted',30.00,'2021-05-02 07:06:33',180,8248.00,1,'salário','57950105512'),
	 ('ted',30.00,'2022-01-15 04:39:51',181,27118.00,1,'salário','64950318323'),
	 ('ted',30.00,'2022-07-02 02:24:02',182,21802.00,1,'salário','57223779143'),
	 ('ted',30.00,'2021-06-27 14:10:39',183,7986.00,1,'salário','65852677241');
INSERT INTO cash_outflow (payment_form,tax,emission_date,payment_id,value,quantity,cash_outflow_TYPE,responsible_cpf) VALUES
	 ('ted',30.00,'2022-02-20 15:59:35',184,1078.00,1,'salário','73989376227'),
	 ('ted',30.00,'2021-10-22 15:34:32',185,21171.00,1,'salário','78201468182'),
	 ('ted',30.00,'2021-11-19 06:35:00',186,16476.00,1,'salário','60681591658'),
	 ('ted',30.00,'2021-03-31 16:18:39',187,2068.00,1,'salário','89255200945'),
	 ('ted',30.00,'2022-06-15 14:51:37',188,4133.00,1,'salário','65852677241'),
	 ('ted',30.00,'2022-01-10 06:47:35',189,26382.00,1,'salário','43574806488'),
	 ('ted',30.00,'2021-01-01 08:48:58',190,9664.00,1,'salário','60681591658'),
	 ('ted',30.00,'2022-01-28 08:32:20',191,17026.00,1,'salário','13144156188'),
	 ('ted',30.00,'2022-04-13 00:16:45',192,26015.00,1,'salário','75236842275'),
	 ('ted',30.00,'2021-02-08 14:57:53',193,23629.00,1,'salário','89255200945');
INSERT INTO cash_outflow (payment_form,tax,emission_date,payment_id,value,quantity,cash_outflow_TYPE,responsible_cpf) VALUES
	 ('ted',30.00,'2021-08-07 01:55:29',194,18775.00,1,'salário','13144156188'),
	 ('ted',30.00,'2022-04-02 07:29:40',195,7457.00,1,'salário','13144156188'),
	 ('ted',30.00,'2022-08-09 07:00:33',196,5552.00,1,'salário','89255200945'),
	 ('ted',30.00,'2022-11-09 14:32:44',197,7566.00,1,'salário','57223779143'),
	 ('ted',30.00,'2022-08-10 00:42:22',198,23058.00,1,'salário','21670209596'),
	 ('ted',30.00,'2021-10-01 10:59:30',199,16616.00,1,'salário','34190494541'),
	 ('ted',30.00,'2022-06-14 17:24:39',200,22407.00,1,'salário','64950318323'),
	 ('ted',30.00,'2022-08-22 06:27:32',201,17593.00,1,'salário','59085976081'),
	 ('ted',30.00,'2022-04-13 12:11:45',202,3503.00,1,'salário','57950105512'),
	 ('ted',30.00,'2021-03-03 00:48:10',203,1463.00,1,'salário','78201468182');
INSERT INTO cash_outflow (payment_form,tax,emission_date,payment_id,value,quantity,cash_outflow_TYPE,responsible_cpf) VALUES
	 ('ted',30.00,'2021-01-01 22:59:35',204,15162.00,1,'salário','89255200945'),
	 ('ted',30.00,'2022-08-10 23:07:28',205,8250.00,1,'salário','60681591658'),
	 ('ted',30.00,'2022-06-04 01:35:26',206,21107.00,1,'salário','18924239353'),
	 ('ted',30.00,'2021-03-06 17:18:56',207,23257.00,1,'salário','35002823119'),
	 ('ted',30.00,'2022-11-12 13:52:00',208,22196.00,1,'salário','66204786879'),
	 ('ted',30.00,'2021-03-12 17:49:06',209,20171.00,1,'salário','64950318323'),
	 ('ted',30.00,'2022-12-14 17:23:44',210,29632.00,1,'salário','35002823119'),
	 ('ted',30.00,'2022-02-27 02:25:03',211,9956.00,1,'salário','59085976081'),
	 ('ted',30.00,'2022-02-11 13:03:11',212,13173.00,1,'salário','13144156188'),
	 ('ted',30.00,'2022-09-13 17:51:32',213,16683.00,1,'salário','34190494541');
INSERT INTO cash_outflow (payment_form,tax,emission_date,payment_id,value,quantity,cash_outflow_TYPE,responsible_cpf) VALUES
	 ('ted',30.00,'2020-12-30 05:40:12',214,22656.00,1,'salário','63359208302'),
	 ('ted',30.00,'2022-11-29 07:41:49',215,1465.00,1,'salário','78201468182'),
	 ('ted',30.00,'2021-04-01 09:35:44',216,17869.00,1,'salário','86687483426'),
	 ('ted',30.00,'2022-09-12 07:02:14',217,9316.00,1,'salário','57950105512'),
	 ('ted',30.00,'2021-05-18 14:45:18',218,6484.00,1,'salário','61995548699'),
	 ('ted',30.00,'2022-01-13 05:25:52',219,26763.00,1,'salário','34190494541'),
	 ('ted',30.00,'2021-08-05 06:47:19',220,18134.00,1,'salário','59085976081'),
	 ('ted',30.00,'2021-06-19 16:07:49',221,24733.00,1,'salário','73989376227'),
	 ('ted',30.00,'2022-11-12 06:51:26',222,26450.00,1,'salário','13144156188'),
	 ('ted',30.00,'2022-07-08 06:51:41',223,9570.00,1,'salário','13144156188');
INSERT INTO cash_outflow (payment_form,tax,emission_date,payment_id,value,quantity,cash_outflow_TYPE,responsible_cpf) VALUES
	 ('ted',30.00,'2021-11-04 21:48:49',224,4495.00,1,'salário','86687483426'),
	 ('ted',30.00,'2022-02-20 07:31:48',225,15595.00,1,'salário','76694796302'),
	 ('ted',30.00,'2022-08-19 13:52:06',226,28850.00,1,'salário','13144156188'),
	 ('ted',30.00,'2022-06-01 05:35:40',227,19303.00,1,'salário','66204786879'),
	 ('ted',30.00,'2021-09-23 00:42:01',228,4874.00,1,'salário','18924239353'),
	 ('ted',30.00,'2022-08-10 20:30:37',229,29106.00,1,'salário','45485407605'),
	 ('ted',30.00,'2021-10-08 11:56:58',230,19271.00,1,'salário','60681591658'),
	 ('ted',30.00,'2021-12-10 01:05:41',231,26596.00,1,'salário','64950318323'),
	 ('ted',30.00,'2021-06-06 10:23:52',232,21497.00,1,'salário','75236842275'),
	 ('ted',30.00,'2021-03-16 01:38:06',233,27838.00,1,'salário','61995548699');
INSERT INTO cash_outflow (payment_form,tax,emission_date,payment_id,value,quantity,cash_outflow_TYPE,responsible_cpf) VALUES
	 ('ted',30.00,'2022-07-21 22:18:41',234,29255.00,1,'salário','66204786879'),
	 ('ted',30.00,'2021-08-29 07:21:16',235,2766.00,1,'salário','76694796302'),
	 ('ted',30.00,'2022-07-10 02:13:24',236,2657.00,1,'salário','78201468182'),
	 ('ted',30.00,'2022-04-06 02:24:10',237,23460.00,1,'salário','57950105512');
INSERT INTO cash_outflow_product (product_id,payment_id) VALUES
	 (5,106),
	 (3,107),
	 (3,108),
	 (1,109),
	 (3,110),
	 (4,111),
	 (5,112),
	 (2,113),
	 (1,114),
	 (3,115);
INSERT INTO cash_outflow_product (product_id,payment_id) VALUES
	 (5,116),
	 (5,117),
	 (5,118),
	 (1,119),
	 (4,120),
	 (4,121),
	 (1,122),
	 (3,123),
	 (2,124),
	 (4,125);
INSERT INTO cash_outflow_product (product_id,payment_id) VALUES
	 (5,126),
	 (5,127),
	 (1,128),
	 (1,129),
	 (2,130),
	 (2,131),
	 (3,132),
	 (1,133),
	 (2,134),
	 (5,135);
INSERT INTO cash_outflow_product (product_id,payment_id) VALUES
	 (5,136),
	 (1,137);
INSERT INTO employee_room (room_id,employee_cpf) VALUES
	 (1,'13616560396'),
	 (2,'65060258468'),
	 (3,'13616560396'),
	 (3,'75557879028'),
	 (4,'44436783579'),
	 (5,'65060258468'),
	 (6,'39096085181'),
	 (7,'65060258468'),
	 (8,'22389034833'),
	 (9,'91580589267');
INSERT INTO employee_room (room_id,employee_cpf) VALUES
	 (10,'39096085181'),
	 (11,'97810080291'),
	 (12,'97810080291'),
	 (13,'91580589267'),
	 (14,'39096085181'),
	 (15,'13616560396'),
	 (16,'65060258468'),
	 (17,'39096085181'),
	 (18,'39096085181'),
	 (19,'22389034833');
INSERT INTO employee_room (room_id,employee_cpf) VALUES
	 (20,'65060258468');
INSERT INTO saloon (capacity,name,covered_area,location,saloon_id,external_area,saloon_TYPE,hotel_id) VALUES
	 (50,'Salão 1',150.00,'térreo',1,0.00,'normal',1),
	 (75,'Salão 2',200.00,'1 andar',2,0.00,'normal',2),
	 (30,'Salão 3',80.00,'2 andar',3,0.00,'normal',3),
	 (150,'Salão 4',200.00,'térreo',4,50.00,'com área externa',4),
	 (200,'Salão 5',300.00,'térreo',5,100.00,'com área externa',5);
INSERT INTO employee_saloon (saloon_id,employee_cpf) VALUES
	 (1,'22389034833'),
	 (1,'51677792273'),
	 (2,'65060258468'),
	 (2,'79924936337'),
	 (3,'13616560396'),
	 (3,'15863762777'),
	 (4,'39096085181'),
	 (4,'97810080291'),
	 (5,'44436783579'),
	 (5,'49191327254');
INSERT INTO employee_saloon (saloon_id,employee_cpf) VALUES
	 (5,'66683140110');
INSERT INTO event_saloon (saloon_id,event_id) VALUES
	 (1,1),
	 (2,2),
	 (3,3),
	 (4,4),
	 (5,5),
	 (1,6),
	 (2,7),
	 (3,8),
	 (4,9),
	 (5,10);
INSERT INTO hotel_product (stock,min_stock,hotel_id,product_id) VALUES
	 (103,50,1,1),
	 (143,100,1,2),
	 (201,50,1,3),
	 (423,100,1,4),
	 (321,100,1,5),
	 (108,60,2,1),
	 (160,110,2,2),
	 (205,60,2,3),
	 (440,110,2,4),
	 (326,110,2,5);
INSERT INTO hotel_product (stock,min_stock,hotel_id,product_id) VALUES
	 (121,70,3,1),
	 (161,120,3,2),
	 (220,70,3,3),
	 (422,120,3,4),
	 (456,120,3,5),
	 (131,80,4,1),
	 (171,130,4,2),
	 (223,80,4,3),
	 (150,130,4,4),
	 (451,130,4,5);
INSERT INTO hotel_product (stock,min_stock,hotel_id,product_id) VALUES
	 (451,150,5,1),
	 (672,200,5,2),
	 (323,100,5,3),
	 (642,200,5,4),
	 (545,200,5,5);
INSERT INTO kitchen (n_fridges,n_oven,n_frezeers,n_stoves,stove_hood,size_m2,kitchen_id,room_id) VALUES
	 (5,5,4,1,0,44.00,1,1),
	 (5,1,2,4,0,76.00,2,1),
	 (3,2,4,4,0,28.00,3,1),
	 (2,3,4,3,0,42.00,4,1),
	 (3,4,2,5,0,40.00,5,1),
	 (4,3,2,2,1,51.00,6,1),
	 (2,3,2,2,1,59.00,7,1),
	 (4,5,4,5,0,65.00,8,1),
	 (2,3,4,3,0,83.00,9,1),
	 (2,3,3,2,1,58.00,10,1);
INSERT INTO kitchen (n_fridges,n_oven,n_frezeers,n_stoves,stove_hood,size_m2,kitchen_id,room_id) VALUES
	 (5,4,5,3,1,83.00,11,1),
	 (4,2,1,3,1,99.00,12,1),
	 (3,4,4,3,1,75.00,13,1),
	 (1,5,2,3,0,84.00,14,1),
	 (3,2,4,2,0,54.00,15,1),
	 (2,1,5,5,1,42.00,16,1),
	 (2,3,4,3,1,90.00,17,1),
	 (4,3,5,2,1,46.00,18,1),
	 (3,4,3,4,0,91.00,19,1),
	 (2,2,5,2,0,63.00,20,1);
INSERT INTO kitchen (n_fridges,n_oven,n_frezeers,n_stoves,stove_hood,size_m2,kitchen_id,room_id) VALUES
	 (5,4,2,3,0,44.00,21,1),
	 (4,1,3,4,1,50.00,22,1),
	 (1,2,3,1,0,89.00,23,1),
	 (3,2,2,4,0,38.00,24,1),
	 (4,4,5,1,0,24.00,25,1),
	 (4,2,3,4,0,40.00,26,1),
	 (4,2,2,2,0,44.00,27,1),
	 (2,5,4,2,1,54.00,28,1),
	 (2,3,4,4,1,83.00,29,1),
	 (2,5,4,3,1,33.00,30,1);
INSERT INTO parking_space (location,daily_rate,preferential,parking_id,width,`length`,parking_space_TYPE,hotel_id,covered) VALUES
	 ('A1',20.00,1,1,2.40,5.40,'Interna',1,1),
	 ('B1',20.00,0,2,2.40,5.40,'Externa',1,0),
	 ('A2',20.00,0,3,2.40,5.40,'Interna',1,1),
	 ('B2',20.00,1,4,2.40,5.40,'Externa',1,0),
	 ('A3',20.00,0,5,2.40,5.40,'Interna',1,1),
	 ('A1',20.00,1,6,2.40,5.40,'Interna',2,1),
	 ('B1',20.00,0,7,2.40,5.40,'Externa',2,0),
	 ('A2',20.00,0,8,2.40,5.40,'Interna',2,1),
	 ('B2',20.00,1,9,2.40,5.40,'Externa',2,0),
	 ('A3',20.00,0,10,2.40,5.40,'Interna',2,1);
INSERT INTO parking_space (location,daily_rate,preferential,parking_id,width,`length`,parking_space_TYPE,hotel_id,covered) VALUES
	 ('A1',20.00,1,11,2.40,5.40,'Interna',3,1),
	 ('B1',20.00,0,12,2.40,5.40,'Externa',3,0),
	 ('A2',20.00,0,13,2.40,5.40,'Interna',3,1),
	 ('B2',20.00,1,14,2.40,5.40,'Externa',3,0),
	 ('A3',20.00,0,15,2.40,5.40,'Interna',3,1),
	 ('A1',20.00,1,16,2.40,5.40,'Interna',4,1),
	 ('B1',20.00,0,17,2.40,5.40,'Externa',4,0),
	 ('A2',20.00,0,18,2.40,5.40,'Interna',4,1),
	 ('B2',20.00,1,19,2.40,5.40,'Externa',4,0),
	 ('A3',20.00,0,20,2.40,5.40,'Interna',4,1);
INSERT INTO parking_space (location,daily_rate,preferential,parking_id,width,`length`,parking_space_TYPE,hotel_id,covered) VALUES
	 ('A1',20.00,1,21,2.40,5.40,'Interna',5,1),
	 ('B1',20.00,0,22,2.40,5.40,'Externa',5,0),
	 ('A2',20.00,0,23,2.40,5.40,'Interna',5,1),
	 ('B2',20.00,1,24,2.40,5.40,'Externa',5,0),
	 ('A3',20.00,0,25,2.40,5.40,'Interna',5,1);
INSERT INTO received_payment (payment_id,employee_cpf) VALUES
	 (138,'12673786081'),
	 (139,'13144156188'),
	 (140,'13616560396'),
	 (141,'14818681805'),
	 (142,'15863762777'),
	 (143,'17740385403'),
	 (144,'18217498915'),
	 (145,'18924239353'),
	 (146,'19761703716'),
	 (147,'21670209596');
INSERT INTO received_payment (payment_id,employee_cpf) VALUES
	 (148,'22389034833'),
	 (149,'23021042410'),
	 (150,'23829179793'),
	 (151,'23964344089'),
	 (152,'29415257674'),
	 (153,'29458660053'),
	 (154,'30472748744'),
	 (155,'33308842163'),
	 (156,'33582451682'),
	 (157,'34001196132');
INSERT INTO received_payment (payment_id,employee_cpf) VALUES
	 (158,'34190494541'),
	 (159,'35002823119'),
	 (160,'36496999612'),
	 (161,'38192374273'),
	 (162,'38890069459'),
	 (163,'39096085181'),
	 (164,'39289141418'),
	 (165,'43574806488'),
	 (166,'44290783158'),
	 (167,'44436783579');
INSERT INTO received_payment (payment_id,employee_cpf) VALUES
	 (168,'45183531317'),
	 (169,'45485407605'),
	 (170,'46088903138'),
	 (171,'46848979044'),
	 (172,'47913471837'),
	 (173,'49185410172'),
	 (174,'49191327254'),
	 (175,'49253535148'),
	 (176,'50815306335'),
	 (177,'50838196403');
INSERT INTO received_payment (payment_id,employee_cpf) VALUES
	 (178,'51677792273'),
	 (179,'56504358591'),
	 (180,'57223779143'),
	 (181,'57950105512'),
	 (182,'59085976081'),
	 (183,'60531003052'),
	 (184,'60681591658'),
	 (185,'61995548699'),
	 (186,'63359208302'),
	 (187,'64416809167');
INSERT INTO received_payment (payment_id,employee_cpf) VALUES
	 (188,'64746147704'),
	 (189,'64950318323'),
	 (190,'65060258468'),
	 (191,'65712806293'),
	 (192,'65801393729'),
	 (193,'65852677241'),
	 (194,'66204786879'),
	 (195,'66683140110'),
	 (196,'67671288969'),
	 (197,'68155283750');
INSERT INTO received_payment (payment_id,employee_cpf) VALUES
	 (198,'68333082877'),
	 (199,'68553295471'),
	 (200,'70101665818'),
	 (201,'71904029634'),
	 (202,'73989376227'),
	 (203,'74558744133'),
	 (204,'75236842275'),
	 (205,'75557879028'),
	 (206,'76118861344'),
	 (207,'76694796302');
INSERT INTO received_payment (payment_id,employee_cpf) VALUES
	 (208,'78062457467'),
	 (209,'78201468182'),
	 (210,'79243245086'),
	 (211,'79322328484'),
	 (212,'79739723559'),
	 (213,'79847481990'),
	 (214,'79924936337'),
	 (215,'80179525159'),
	 (216,'80421559928'),
	 (217,'80599821912');
INSERT INTO received_payment (payment_id,employee_cpf) VALUES
	 (218,'84261893909'),
	 (219,'84899323025'),
	 (220,'85052766280'),
	 (221,'85535105936'),
	 (222,'86388311345'),
	 (223,'86687483426'),
	 (224,'89255200945'),
	 (225,'89363075603'),
	 (226,'90098653640'),
	 (227,'90115653661');
INSERT INTO received_payment (payment_id,employee_cpf) VALUES
	 (228,'91580589267'),
	 (229,'92748031008'),
	 (230,'93990306833'),
	 (231,'94225114828'),
	 (232,'94828086274'),
	 (233,'95363017129'),
	 (234,'96085352320'),
	 (235,'97465530561'),
	 (236,'97810080291'),
	 (237,'99518031149');
INSERT INTO reservation_parking_space (initial_date,total_days,reservation_id,parking_id) VALUES
	 ('2021-12-02 04:44:39',6,1,1),
	 ('2021-12-03 21:02:05',3,2,2),
	 ('2021-12-03 06:54:25',5,3,3),
	 ('2021-12-03 21:23:09',3,4,4),
	 ('2021-12-04 14:36:37',2,5,5),
	 ('2021-12-02 18:16:32',6,6,6),
	 ('2021-12-03 21:51:55',3,7,7),
	 ('2021-12-02 00:26:09',4,8,8),
	 ('2021-12-04 17:32:51',3,9,9),
	 ('2021-12-03 03:37:07',4,10,10);
INSERT INTO reservation_parking_space (initial_date,total_days,reservation_id,parking_id) VALUES
	 ('2021-12-04 06:18:26',4,11,11),
	 ('2021-12-03 22:30:31',3,12,12),
	 ('2021-12-04 08:36:16',2,13,13),
	 ('2021-12-02 19:53:30',4,14,14),
	 ('2021-12-03 04:34:25',4,15,15),
	 ('2021-12-04 11:49:22',2,16,16),
	 ('2021-12-04 21:54:07',2,17,17),
	 ('2021-12-03 16:00:23',4,18,18),
	 ('2021-12-03 04:54:20',5,19,19),
	 ('2021-12-04 14:37:41',5,20,20);
INSERT INTO reservation_period_bedroom (days,initial_date,bedroom_id,reservation_id) VALUES
	 (5,'2021-12-04 14:37:41',16,20),
	 (5,'2021-12-03 04:54:20',17,19),
	 (4,'2021-12-03 16:00:23',18,18),
	 (2,'2021-12-04 21:54:07',19,17),
	 (2,'2021-12-04 11:49:22',20,16),
	 (4,'2021-12-03 04:34:25',11,15),
	 (4,'2021-12-02 19:53:30',12,14),
	 (2,'2021-12-04 08:36:16',13,13),
	 (3,'2021-12-03 22:30:31',14,12),
	 (4,'2021-12-04 06:18:26',15,11);
INSERT INTO reservation_period_bedroom (days,initial_date,bedroom_id,reservation_id) VALUES
	 (4,'2021-12-03 03:37:07',6,10),
	 (3,'2021-12-04 17:32:51',7,9),
	 (4,'2021-12-02 00:26:09',8,8),
	 (3,'2021-12-03 21:51:55',9,7),
	 (6,'2021-12-02 18:16:32',10,6),
	 (2,'2021-12-04 14:36:37',1,5),
	 (3,'2021-12-03 21:23:09',2,4),
	 (5,'2021-12-03 06:54:25',3,3),
	 (3,'2021-12-03 21:02:05',4,2),
	 (6,'2021-12-02 04:44:39',5,1);
INSERT INTO reservation_product (quantity,reservation_id,product_id) VALUES
	 (2,1,1),
	 (3,2,2),
	 (1,3,3),
	 (2,4,4),
	 (1,5,5);
INSERT INTO restaurant_product (stock,min_stock,restaurant_id,product_id) VALUES
	 (16,10,1,1),
	 (19,10,2,2),
	 (31,20,3,3),
	 (14,10,4,1),
	 (15,10,5,2),
	 (25,20,6,3),
	 (16,10,7,1);
INSERT INTO saloon_kitchen (kitchen_id,saloon_id) VALUES
	 (1,1),
	 (2,2),
	 (3,3),
	 (4,4),
	 (5,5);
INSERT INTO cash_entry_room (missing_value,payment_id,room_id) VALUES
	 (2654.57,210,1),
	 (1012.28,211,1),
	 (0.00,212,1),
	 (1862.35,213,2),
	 (0.00,214,2);
INSERT INTO dish (name,description,value,dish_id,restaurant_id) VALUES
	 ('Feijoada','Acompanhado com arroz.',50.00,1,1),
	 ('Feijoada','Acompanhado com arroz.',45.00,2,2),
	 ('Feijoada','Acompanhado com arroz.',60.00,3,3),
	 ('Feijoada','Acompanhado com arroz.',45.00,4,4),
	 ('Feijoada','Acompanhado com arroz.',55.00,5,5),
	 ('Beirute aladim','Presunto, mussarela, orégano, cebola e tomate',70.00,6,7),
	 ('Esfiha filé mignom','Esfiha de filé mignom',20.00,7,7),
	 ('Temaki de salmão','Temaki de salmão',20.00,8,6);
INSERT INTO fidelity_program (cpf,points,expire_at) VALUES
	 ('11653758376',125,'2023-12-15 22:28:27'),
	 ('14684895849',10,'2023-12-15 22:28:27'),
	 ('14863617125',352,'2023-12-15 22:28:27'),
	 ('15026003393',5,'2023-12-15 22:28:27'),
	 ('17829659659',25,'2023-12-15 22:28:27'),
	 ('25313666769',320,'2023-12-15 22:28:27'),
	 ('25675754362',541,'2023-12-15 22:28:27'),
	 ('26980211027',3,'2023-12-15 22:28:27'),
	 ('27779345994',21,'2023-12-15 22:28:27'),
	 ('30208062926',121,'2023-12-15 22:28:27');
INSERT INTO petshop (petshop_id,name,location,open_period,hotel_id,dept_id) VALUES
	 (1,'Recanto dos Pets','Térreo','08:00-17:00',1,4),
	 (2,'Amicão','Térreo','07:00-22:00',2,8),
	 (3,'Pet Spa','Primeiro Andar','07:00-22:00',3,12),
	 (4,'SOS Pet','Primeiro Andar','07:00-22:00',4,16),
	 (5,'Mundo Pet','Térreo','00:00-23:59',5,20);
INSERT INTO petshop_client_payment (pet_name,pet_type,service_type,value,petshop_id,cpf,payment_id) VALUES
	 ('Rex','Cachorro','Médico',400.00,1,'11653758376',35),
	 ('Thor','Cachorro','Lavagem',300.00,2,'14684895849',36),
	 ('Ariel','Gato','Lavagem',100.00,3,'14863617125',37),
	 ('Pingo','Cachorro','Médico',550.00,4,'23295361354',38),
	 ('Max','Cachorro','Médico',1400.00,5,'15026003393',39),
	 ('Scooby','Cachorro','Lavagem',300.00,1,'14863617125',40),
	 ('Zeus','Gato','Lavagem',200.00,2,'25675754362',41),
	 ('Amarelinho','Gato','Lavagem',250.00,3,'30173079528',42),
	 ('Branquinho','Gato','Médico',600.00,4,'30710264073',43);
INSERT INTO petshop_product (min_stock,stock,petshop_id,product_id) VALUES
	 (4,5,1,6),
	 (4,6,2,6),
	 (4,7,3,6),
	 (3,8,4,6),
	 (4,9,5,6),
	 (10,13,2,7),
	 (15,20,3,7),
	 (15,21,4,7),
	 (20,36,5,7);
	 