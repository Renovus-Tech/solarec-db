--#1 | M5 - A1 - Develop list of alerts that are easy to understand to users.
CREATE TABLE cli_loc_usr_setting (
  cli_id INTEGER NOT NULL,
  loc_id INTEGER NOT NULL,
  usr_id INTEGER NOT NULL,
  cli_loc_alert_flags VARCHAR(20) NULL
);--

ALTER TABLE cli_loc_usr_setting ADD PRIMARY KEY (cli_id, loc_id, usr_id);--
ALTER TABLE cli_loc_usr_setting ADD CONSTRAINT fk_cli_loc_usr_setting__users FOREIGN KEY(usr_id) REFERENCES users(usr_id_auto);-- 
ALTER TABLE cli_loc_usr_setting ADD CONSTRAINT fk_cli_loc_usr_setting__client FOREIGN KEY(cli_id) REFERENCES client(cli_id_auto);-- 
ALTER TABLE cli_loc_usr_setting ADD CONSTRAINT fk_cli_loc_usr_setting__location FOREIGN KEY(cli_id, loc_id) REFERENCES location(cli_id, loc_id_auto);-- 

CREATE TABLE cli_loc_alert (
  cli_id INTEGER NOT NULL,
  loc_id INTEGER NOT NULL,
  cli_loc_alert_id_auto SERIAL NOT NULL,
  cli_loc_alert_added timestamp without time zone NOT NULL,
  cli_loc_alert_type INTEGER NOT NULL,
  cli_loc_alert_data varchar,
  cli_loc_alert_flags varchar(20)
);--

ALTER TABLE cli_loc_alert ADD PRIMARY KEY (cli_id, loc_id, cli_loc_alert_id_auto);--
ALTER TABLE cli_loc_alert ADD CONSTRAINT fk_cli_loc_alert__client FOREIGN KEY(cli_id) REFERENCES client(cli_id_auto);-- 
ALTER TABLE cli_loc_alert ADD CONSTRAINT fk_cli_loc_alert__location FOREIGN KEY(cli_id, loc_id) REFERENCES location(cli_id, loc_id_auto);-- 

CREATE TABLE cli_loc_usr_alert (
  cli_id INTEGER,
  loc_id INTEGER,
  usr_id INTEGER,
  cli_loc_alert_id INTEGER,
  cli_loc_usr_alert_send_date timestamp without time zone NOT NULL,
  cli_loc_usr_alert_send_result VARCHAR
);--

ALTER TABLE cli_loc_usr_alert ADD PRIMARY KEY (cli_id, loc_id, usr_id, cli_loc_alert_id);--
ALTER TABLE cli_loc_usr_alert ADD CONSTRAINT fk_cli_loc_usr_alert__users FOREIGN KEY(usr_id) REFERENCES users(usr_id_auto);-- 
ALTER TABLE cli_loc_usr_alert ADD CONSTRAINT fk_cli_loc_usr_alert__cli_loc_alert FOREIGN KEY(cli_id, loc_id, cli_loc_alert_id) REFERENCES cli_loc_alert(cli_id, loc_id, cli_loc_alert_id_auto);-- 


-----

CREATE TABLE cli_gen_alert (
  cli_id INTEGER NOT NULL,
  gen_id INTEGER NOT NULL,
  cli_gen_alert_id_auto SERIAL NOT NULL,
  cli_gen_alert_added timestamp without time zone NOT NULL,
  cli_gen_alert_type INTEGER NOT NULL,
  cli_gen_alert_data varchar,
  cli_gen_alert_flags varchar(20)
);--

ALTER TABLE cli_gen_alert ADD PRIMARY KEY (cli_id, gen_id, cli_gen_alert_id_auto);--
ALTER TABLE cli_gen_alert ADD CONSTRAINT fk_cli_gen_alert__client FOREIGN KEY(cli_id) REFERENCES client(cli_id_auto);-- 
ALTER TABLE cli_gen_alert ADD CONSTRAINT fk_cli_gen_alert__generator FOREIGN KEY(cli_id, gen_id) REFERENCES generator(cli_id, gen_id_auto);-- 

CREATE TABLE cli_gen_usr_alert (
  cli_id INTEGER,
  gen_id INTEGER,
  usr_id INTEGER,
  cli_gen_alert_id INTEGER,
  cli_gen_usr_alert_send_date timestamp without time zone NOT NULL,
  cli_gen_usr_alert_send_result VARCHAR
);--

ALTER TABLE cli_gen_usr_alert ADD PRIMARY KEY (cli_id, gen_id, usr_id, cli_gen_alert_id);--
ALTER TABLE cli_gen_usr_alert ADD CONSTRAINT fk_cli_gen_usr_alert__users FOREIGN KEY(usr_id) REFERENCES users(usr_id_auto);-- 
ALTER TABLE cli_gen_usr_alert ADD CONSTRAINT fk_cli_gen_usr_alert__cli_gen_alert FOREIGN KEY(cli_id, gen_id, cli_gen_alert_id) REFERENCES cli_gen_alert(cli_id, gen_id, cli_gen_alert_id_auto);-- 

ALTER TABLE cli_loc_alert ADD COLUMN cli_loc_alert_trigger timestamp without time zone NOT NULL;--
ALTER TABLE cli_gen_alert ADD COLUMN cli_gen_alert_trigger timestamp without time zone NOT NULL;--


CREATE TABLE settings (
  set_name VARCHAR(200) NOT NULL,
  set_cat_name VARCHAR(200) NOT NULL,
  set_type VARCHAR(200) NOT NULL,
  set_unit VARCHAR(100) NULL,
  set_value_default VARCHAR(200) NULL,
  set_value_min VARCHAR(100) NULL,
  set_value_max VARCHAR(100) NULL,
  set_flags VARCHAR(20) NULL
);--

ALTER TABLE settings ADD PRIMARY KEY (set_name);--
ALTER TABLE cli_setting ADD CONSTRAINT fk_cli_set__setting FOREIGN KEY (cli_set_name) REFERENCES settings(set_name);--
ALTER TABLE usr_setting ADD CONSTRAINT fk_usr_set__setting FOREIGN KEY (usr_set_name) REFERENCES settings(set_name);--

CREATE VIEW vw_cli_gen_alert_by_location AS
select
 cga.*,
 g.loc_id,
 g.gen_name,
 g.gen_code,
 l.loc_name,
 l.loc_code,
 c.cli_name
from
client c
join location l on c.cli_id_auto = l.cli_id
join generator g on g.cli_id = l.cli_id and g.loc_id = l.loc_id_auto
join cli_gen_alert cga on l.cli_id = cga.cli_id and g.gen_id_auto = cga.gen_id;--

ALTER TABLE cli_loc_alert ALTER COLUMN cli_loc_alert_flags SET DEFAULT '00000';--
ALTER TABLE cli_gen_alert ALTER COLUMN cli_gen_alert_flags SET DEFAULT '00000';--

update cli_loc_alert set cli_loc_alert_flags = '00000' where cli_loc_alert_flags is null;--
update cli_gen_alert set cli_gen_alert_flags = '00000' where cli_gen_alert_flags is null;--

CREATE VIEW vw_cli_loc_alert_full AS 
select
 cla.*,
 l.loc_name,
 l.loc_code,
 c.cli_name
from
client c
join location l on c.cli_id_auto = l.cli_id
join cli_loc_alert cla on l.cli_id = cla.cli_id and l.loc_id_auto = cla.loc_id;--

CREATE VIEW vw_cli_gen_alert_full AS 
select
 cga.*,
 g.gen_name,
 g.gen_code,
 l.loc_name,
 l.loc_code,
 c.cli_name
from
client c
join location l on c.cli_id_auto = l.cli_id
join generator g on g.cli_id = l.cli_id and g.loc_id = l.loc_id_auto
join cli_gen_alert cga on l.cli_id = cga.cli_id and g.gen_id_auto = cga.gen_id;--


CREATE TABLE ember_country_overview (
  country_or_region varchar(100),
  country_code varchar(100),
  year integer,
  demand_twh double precision,
  demand_mwh_per_capita double precision,
  emissions_intensity_gco2_per_kwh double precision,
  continent varchar(100),
  ember_region varchar(100),
  eu_flag double precision NULL,
  g20_flag double precision NULL,
  g7_flag double precision NULL,
  oecd_flag double precision NULL,
  world_demand_rank double precision NULL,
  region_demand_rank double precision NULL,
  oecd_demand_rank double precision NULL,
  eu_demand_rank double precision NULL,
  latest_year integer,
  coal_deadline integer,
  clean_deadline integer
);--

ALTER TABLE ember_country_overview ADD PRIMARY KEY (country_or_region, year);--


CREATE TABLE data_def_parameter (
  data_def_id INTEGER NOT NULL,
  data_def_par_id_auto SERIAL NOT NULL,
  data_def_par_name VARCHAR(100) NOT NULL,
  data_def_description VARCHAR(500) NULL
);--

ALTER TABLE data_def_parameter ADD PRIMARY KEY (data_def_id, data_def_par_id_auto);--
ALTER TABLE data_def_parameter ADD CONSTRAINT fk_data_def_par__data_definition FOREIGN KEY(data_def_id) REFERENCES data_definition(data_def_id_auto);--

CREATE TABLE cli_data_def_parameter (
  cli_id INTEGER NOT NULL,
  data_def_id INTEGER NOT NULL,
  data_def_par_id INTEGER NOT NULL,
  cli_data_def_par_value VARCHAR(255) NOT NULL
);--

ALTER TABLE cli_data_def_parameter ADD PRIMARY KEY (cli_id, data_def_id, data_def_par_id);--
ALTER TABLE cli_data_def_parameter ADD CONSTRAINT fk_cli_data_def_par__client FOREIGN KEY(cli_id) REFERENCES client(cli_id_auto);--
ALTER TABLE cli_data_def_parameter ADD CONSTRAINT fk_cli_data_def_par__data_def_parameter FOREIGN KEY(data_def_id, data_def_par_id) REFERENCES data_def_parameter(data_def_id, data_def_par_id_auto);--


CREATE TABLE loc_data_def_parameter (
  cli_id INTEGER NOT NULL,
  loc_id INTEGER NOT NULL,
  data_def_id INTEGER NOT NULL,
  data_def_par_id INTEGER NOT NULL,
  cli_data_def_par_value VARCHAR(255) NOT NULL
);--

ALTER TABLE loc_data_def_parameter ADD PRIMARY KEY (cli_id, loc_id, data_def_id, data_def_par_id);--
ALTER TABLE loc_data_def_parameter ADD CONSTRAINT fk_loc_data_def_par__location FOREIGN KEY(cli_id, loc_id) REFERENCES location(cli_id, loc_id_auto);--
ALTER TABLE loc_data_def_parameter ADD CONSTRAINT fk_loc_data_def_par__data_def_parameter FOREIGN KEY(data_def_id, data_def_par_id) REFERENCES data_def_parameter(data_def_id, data_def_par_id_auto);--


CREATE TABLE gen_data_def_parameter (
  cli_id INTEGER NOT NULL,
  gen_id INTEGER NOT NULL,
  data_def_id INTEGER NOT NULL,
  data_def_par_id INTEGER NOT NULL,
  cli_data_def_par_value VARCHAR(255) NOT NULL
);--

ALTER TABLE gen_data_def_parameter ADD PRIMARY KEY (cli_id, gen_id, data_def_id, data_def_par_id);--
ALTER TABLE gen_data_def_parameter ADD CONSTRAINT fk_gen_data_def_par__generator FOREIGN KEY(cli_id, gen_id) REFERENCES generator(cli_id, gen_id_auto);--
ALTER TABLE gen_data_def_parameter ADD CONSTRAINT fk_gen_data_def_par__data_def_parameter FOREIGN KEY(data_def_id, data_def_par_id) REFERENCES data_def_parameter(data_def_id, data_def_par_id_auto);--



CREATE VIEW vw_cli_data_def_parameter AS
SELECT c.cli_id_auto as cli_id, ddp.*, cddp.data_def_par_id, cddp.cli_data_def_par_value FROM
client c
JOIN data_def_parameter ddp ON c.data_def_id = ddp.data_def_id
LEFT JOIN cli_data_def_parameter cddp ON c.cli_id_auto = cddp.cli_id AND ddp.data_def_id = cddp.data_def_id AND ddp.data_def_par_id_auto = cddp.data_def_par_id;--

CREATE VIEW vw_loc_data_def_parameter AS
SELECT l.cli_id, l.loc_id_auto as loc_id, ddp.*, lddp.data_def_par_id, lddp.loc_data_def_par_value FROM
location l
JOIN data_def_parameter ddp ON l.data_def_id = ddp.data_def_id
LEFT JOIN loc_data_def_parameter lddp ON l.cli_id  = lddp.cli_id AND l.loc_id_auto = lddp.loc_id AND ddp.data_def_id = lddp.data_def_id AND ddp.data_def_par_id_auto = lddp.data_def_par_id;--

CREATE VIEW vw_gen_data_def_parameter AS
SELECT g.cli_id, g.gen_id_auto as gen_id, ddp.*, gddp.data_def_par_id, gddp.gen_data_def_par_value FROM
generator g
JOIN data_def_parameter ddp ON g.data_def_id = ddp.data_def_id
LEFT JOIN gen_data_def_parameter gddp ON g.cli_id = gddp.cli_id  AND g.gen_id_auto = gddp.gen_id AND ddp.data_def_id = gddp.data_def_id AND ddp.data_def_par_id_auto = gddp.data_def_par_id;--


ALTER TABLE data_processing ADD COLUMN gen_id INTEGER NULL;--
ALTER TABLE data_processing ADD CONSTRAINT fk_data_pro__generator FOREIGN KEY(cli_id, gen_id) REFERENCES generator(cli_id, gen_id_auto);--


---------------

CREATE TABLE cli_metadata (
  cli_id INTEGER NOT NULL,
  metadata_name VARCHAR(100) NOT NULL,
  metadata_title VARCHAR(200) NULL,
  metadata_value VARCHAR(200) NULL,
  metadata_date_added timestamp with time zone NULL
);--

ALTER TABLE cli_metadata ADD PRIMARY KEY(cli_id, metadata_name);--

ALTER TABLE cli_metadata ADD CONSTRAINT fk_cli_metdat__client FOREIGN KEY(cli_id) REFERENCES client(cli_id_auto);--


-------------------

CREATE TABLE country (
  ctr_id_auto SERIAL NOT NULL,
  ctr_name VARCHAR(120) NOT NULL,
  ctr_name_show VARCHAR(120) NOT NULL,
  ctr_code_2 VARCHAR(2) NULL,
  ctr_code_3 VARCHAR(3) NULL,
  ctr_data_date_max timestamp without time zone NULL,
  ctr_data_date_min timestamp without time zone NULL

);--

ALTER TABLE country ADD PRIMARY KEY (ctr_id_auto);--

CREATE TABLE ctr_data (
  ctr_id INTEGER NOT NULL,
  data_date timestamp without time zone NOT NULL,
  data_type_id INTEGER NOT NULL,
  data_pro_id INTEGER NULL,
  data_value double precision NULL,
  data_date_added timestamp with time zone NULL
);--

ALTER TABLE ctr_data ADD PRIMARY KEY(ctr_id, data_date, data_type_id);--                                                                                                                                                                                                                                

ALTER TABLE ctr_data ADD CONSTRAINT fk_ctr_data__country FOREIGN KEY(ctr_id) REFERENCES country(ctr_id_auto);--
ALTER TABLE ctr_data ADD CONSTRAINT fk_ctr_data__data_processing FOREIGN KEY(data_pro_id) REFERENCES data_processing(data_pro_id_auto);--
ALTER TABLE ctr_data ADD CONSTRAINT fk_ctr_data__data_type FOREIGN KEY(data_type_id) REFERENCES data_type(data_type_id);--

ALTER TABLE location ADD COLUMN ctr_id INTEGER NULL;--
ALTER TABLE location ADD CONSTRAINT fk_loc__country FOREIGN KEY(ctr_id) REFERENCES country(ctr_id_auto);--

INSERT INTO data_type (data_type_name, data_type_id) VALUES ('COUNTRY_EMISSIONS_INTENSITY_GCO2_PER_KWH', 901);--

insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('ARUBA','Aruba','AW','ABW');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('AFGHANISTAN','Afghanistan','AF','AFG');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('ANGOLA','Angola','AO','AGO');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('ANGUILLA','Anguilla','AI','AIA');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('ALBANIA','Albania','AL','ALB');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('ANDORRA','Andorra','AD','AND');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('NETHERLANDS ANTILLES','Netherlands Antilles','AN','ANT');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('UNITED ARAB EMIRATES','United Arab Emirates','AE','ARE');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('ARGENTINA','Argentina','AR','ARG');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('ARMENIA','Armenia','AM','ARM');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('AMERICAN SAMOA','American Samoa','AS','ASM');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('ANTIGUA AND BARBUDA','Antigua and Barbuda','AG','ATG');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('AUSTRALIA','Australia','AU','AUS');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('AUSTRIA','Austria','AT','AUT');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('AZERBAIJAN','Azerbaijan','AZ','AZE');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('BURUNDI','Burundi','BI','BDI');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('BELGIUM','Belgium','BE','BEL');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('BENIN','Benin','BJ','BEN');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('BURKINA FASO','Burkina Faso','BF','BFA');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('BANGLADESH','Bangladesh','BD','BGD');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('BULGARIA','Bulgaria','BG','BGR');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('BAHRAIN','Bahrain','BH','BHR');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('BAHAMAS','Bahamas','BS','BHS');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('BOSNIA AND HERZEGOVINA','Bosnia and Herzegovina','BA','BIH');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('BELARUS','Belarus','BY','BLR');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('BELIZE','Belize','BZ','BLZ');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('BERMUDA','Bermuda','BM','BMU');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('BOLIVIA','Bolivia','BO','BOL');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('BRAZIL','Brazil','BR','BRA');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('BARBADOS','Barbados','BB','BRB');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('BRUNEI DARUSSALAM','Brunei Darussalam','BN','BRN');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('BHUTAN','Bhutan','BT','BTN');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('BOTSWANA','Botswana','BW','BWA');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('CENTRAL AFRICAN REPUBLIC','Central African Republic','CF','CAF');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('CANADA','Canada','CA','CAN');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('SWITZERLAND','Switzerland','CH','CHE');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('CHILE','Chile','CL','CHL');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('CHINA','China','CN','CHN');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('COTE DIVOIRE','Cote DIvoire','CI','CIV');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('CAMEROON','Cameroon','CM','CMR');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('CONGO, THE DEMOCRATIC REPUBLIC OF THE','Congo, the Democratic Republic of the','CD','COD');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('CONGO','Congo','CG','COG');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('COOK ISLANDS','Cook Islands','CK','COK');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('COLOMBIA','Colombia','CO','COL');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('COMOROS','Comoros','KM','COM');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('CAPE VERDE','Cape Verde','CV','CPV');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('COSTA RICA','Costa Rica','CR','CRI');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('CUBA','Cuba','CU','CUB');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('CAYMAN ISLANDS','Cayman Islands','KY','CYM');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('CYPRUS','Cyprus','CY','CYP');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('CZECH REPUBLIC','Czech Republic','CZ','CZE');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('GERMANY','Germany','DE','DEU');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('DJIBOUTI','Djibouti','DJ','DJI');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('DOMINICA','Dominica','DM','DMA');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('DENMARK','Denmark','DK','DNK');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('DOMINICAN REPUBLIC','Dominican Republic','DO','DOM');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('ALGERIA','Algeria','DZ','DZA');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('ECUADOR','Ecuador','EC','ECU');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('EGYPT','Egypt','EG','EGY');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('ERITREA','Eritrea','ER','ERI');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('WESTERN SAHARA','Western Sahara','EH','ESH');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('SPAIN','Spain','ES','ESP');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('ESTONIA','Estonia','EE','EST');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('ETHIOPIA','Ethiopia','ET','ETH');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('FINLAND','Finland','FI','FIN');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('FIJI','Fiji','FJ','FJI');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('FRANCE','France','FR','FRA');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('FAROE ISLANDS','Faroe Islands','FO','FRO');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('MICRONESIA, FEDERATED STATES OF','Micronesia, Federated States of','FM','FSM');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('GABON','Gabon','GA','GAB');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('UNITED KINGDOM','United Kingdom','GB','GBR');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('GEORGIA','Georgia','GE','GEO');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('GHANA','Ghana','GH','GHA');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('GIBRALTAR','Gibraltar','GI','GIB');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('GUINEA','Guinea','GN','GIN');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('GUADELOUPE','Guadeloupe','GP','GLP');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('GAMBIA','Gambia','GM','GMB');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('GUINEA-BISSAU','Guinea-Bissau','GW','GNB');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('EQUATORIAL GUINEA','Equatorial Guinea','GQ','GNQ');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('GREECE','Greece','GR','GRC');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('GRENADA','Grenada','GD','GRD');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('GREENLAND','Greenland','GL','GRL');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('GUATEMALA','Guatemala','GT','GTM');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('FRENCH GUIANA','French Guiana','GF','GUF');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('GUAM','Guam','GU','GUM');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('GUYANA','Guyana','GY','GUY');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('HONG KONG','Hong Kong','HK','HKG');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('HONDURAS','Honduras','HN','HND');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('CROATIA','Croatia','HR','HRV');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('HAITI','Haiti','HT','HTI');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('HUNGARY','Hungary','HU','HUN');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('INDONESIA','Indonesia','ID','IDN');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('INDIA','India','IN','IND');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('IRELAND','Ireland','IE','IRL');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('IRAN, ISLAMIC REPUBLIC OF','Iran, Islamic Republic of','IR','IRN');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('IRAQ','Iraq','IQ','IRQ');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('ICELAND','Iceland','IS','ISL');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('ISRAEL','Israel','IL','ISR');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('ITALY','Italy','IT','ITA');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('JAMAICA','Jamaica','JM','JAM');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('JORDAN','Jordan','JO','JOR');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('JAPAN','Japan','JP','JPN');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('KAZAKHSTAN','Kazakhstan','KZ','KAZ');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('KENYA','Kenya','KE','KEN');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('KYRGYZSTAN','Kyrgyzstan','KG','KGZ');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('CAMBODIA','Cambodia','KH','KHM');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('KIRIBATI','Kiribati','KI','KIR');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('SAINT KITTS AND NEVIS','Saint Kitts and Nevis','KN','KNA');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('KOREA, REPUBLIC OF','Korea, Republic of','KR','KOR');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('KUWAIT','Kuwait','KW','KWT');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('LAO PEOPLES DEMOCRATIC REPUBLIC','Lao Peoples Democratic Republic','LA','LAO');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('LEBANON','Lebanon','LB','LBN');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('LIBERIA','Liberia','LR','LBR');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('LIBYAN ARAB JAMAHIRIYA','Libyan Arab Jamahiriya','LY','LBY');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('SAINT LUCIA','Saint Lucia','LC','LCA');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('LIECHTENSTEIN','Liechtenstein','LI','LIE');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('SRI LANKA','Sri Lanka','LK','LKA');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('LESOTHO','Lesotho','LS','LSO');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('LITHUANIA','Lithuania','LT','LTU');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('LUXEMBOURG','Luxembourg','LU','LUX');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('LATVIA','Latvia','LV','LVA');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('MACAO','Macao','MO','MAC');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('MOROCCO','Morocco','MA','MAR');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('MONACO','Monaco','MC','MCO');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('MOLDOVA, REPUBLIC OF','Moldova, Republic of','MD','MDA');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('MADAGASCAR','Madagascar','MG','MDG');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('MALDIVES','Maldives','MV','MDV');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('MEXICO','Mexico','MX','MEX');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('MARSHALL ISLANDS','Marshall Islands','MH','MHL');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF','Macedonia, the Former Yugoslav Republic of','MK','MKD');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('MALI','Mali','ML','MLI');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('MALTA','Malta','MT','MLT');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('MYANMAR','Myanmar','MM','MMR');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('MONGOLIA','Mongolia','MN','MNG');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('NORTHERN MARIANA ISLANDS','Northern Mariana Islands','MP','MNP');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('MOZAMBIQUE','Mozambique','MZ','MOZ');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('MAURITANIA','Mauritania','MR','MRT');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('MONTSERRAT','Montserrat','MS','MSR');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('MARTINIQUE','Martinique','MQ','MTQ');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('MAURITIUS','Mauritius','MU','MUS');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('MALAWI','Malawi','MW','MWI');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('MALAYSIA','Malaysia','MY','MYS');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('NAMIBIA','Namibia','NA','NAM');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('NEW CALEDONIA','New Caledonia','NC','NCL');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('NIGER','Niger','NE','NER');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('NORFOLK ISLAND','Norfolk Island','NF','NFK');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('NIGERIA','Nigeria','NG','NGA');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('NICARAGUA','Nicaragua','NI','NIC');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('NIUE','Niue','NU','NIU');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('NETHERLANDS','Netherlands','NL','NLD');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('NORWAY','Norway','NO','NOR');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('NEPAL','Nepal','NP','NPL');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('NAURU','Nauru','NR','NRU');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('NEW ZEALAND','New Zealand','NZ','NZL');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('OMAN','Oman','OM','OMN');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('PAKISTAN','Pakistan','PK','PAK');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('PANAMA','Panama','PA','PAN');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('PITCAIRN','Pitcairn','PN','PCN');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('PERU','Peru','PE','PER');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('PHILIPPINES','Philippines','PH','PHL');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('PALAU','Palau','PW','PLW');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('PAPUA NEW GUINEA','Papua New Guinea','PG','PNG');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('POLAND','Poland','PL','POL');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('PUERTO RICO','Puerto Rico','PR','PRI');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('KOREA, DEMOCRATIC PEOPLES REPUBLIC OF','Korea, Democratic Peoples Republic of','KP','PRK');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('PORTUGAL','Portugal','PT','PRT');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('PARAGUAY','Paraguay','PY','PRY');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('FRENCH POLYNESIA','French Polynesia','PF','PYF');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('QATAR','Qatar','QA','QAT');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('REUNION','Reunion','RE','REU');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('ROMANIA','Romania','RO','ROU');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('RUSSIAN FEDERATION','Russian Federation','RU','RUS');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('RWANDA','Rwanda','RW','RWA');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('SAUDI ARABIA','Saudi Arabia','SA','SAU');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('SUDAN','Sudan','SD','SDN');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('SENEGAL','Senegal','SN','SEN');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('SINGAPORE','Singapore','SG','SGP');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('SAINT HELENA','Saint Helena','SH','SHN');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('SVALBARD AND JAN MAYEN','Svalbard and Jan Mayen','SJ','SJM');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('SOLOMON ISLANDS','Solomon Islands','SB','SLB');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('SIERRA LEONE','Sierra Leone','SL','SLE');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('EL SALVADOR','El Salvador','SV','SLV');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('SAN MARINO','San Marino','SM','SMR');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('SOMALIA','Somalia','SO','SOM');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('SAINT PIERRE AND MIQUELON','Saint Pierre and Miquelon','PM','SPM');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('SAO TOME AND PRINCIPE','Sao Tome and Principe','ST','STP');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('SURINAME','Suriname','SR','SUR');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('SLOVAKIA','Slovakia','SK','SVK');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('SLOVENIA','Slovenia','SI','SVN');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('SWEDEN','Sweden','SE','SWE');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('SWAZILAND','Swaziland','SZ','SWZ');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('SEYCHELLES','Seychelles','SC','SYC');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('SYRIAN ARAB REPUBLIC','Syrian Arab Republic','SY','SYR');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('TURKS AND CAICOS ISLANDS','Turks and Caicos Islands','TC','TCA');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('CHAD','Chad','TD','TCD');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('TOGO','Togo','TG','TGO');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('THAILAND','Thailand','TH','THA');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('TAJIKISTAN','Tajikistan','TJ','TJK');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('TOKELAU','Tokelau','TK','TKL');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('TURKMENISTAN','Turkmenistan','TM','TKM');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('TONGA','Tonga','TO','TON');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('TRINIDAD AND TOBAGO','Trinidad and Tobago','TT','TTO');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('TUNISIA','Tunisia','TN','TUN');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('TURKEY','Turkey','TR','TUR');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('TUVALU','Tuvalu','TV','TUV');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('TAIWAN, PROVINCE OF CHINA','Taiwan, Province of China','TW','TWN');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('TANZANIA, UNITED REPUBLIC OF','Tanzania, United Republic of','TZ','TZA');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('UGANDA','Uganda','UG','UGA');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('UKRAINE','Ukraine','UA','UKR');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('URUGUAY','Uruguay','UY','URY');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('UNITED STATES','United States','US','USA');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('UZBEKISTAN','Uzbekistan','UZ','UZB');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('SAINT VINCENT AND THE GRENADINES','Saint Vincent and the Grenadines','VC','VCT');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('VENEZUELA','Venezuela','VE','VEN');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('VIRGIN ISLANDS, BRITISH','Virgin Islands, British','VG','VGB');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('VIRGIN ISLANDS, U.S.','Virgin Islands, U.s.','VI','VIR');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('VIET NAM','Viet Nam','VN','VNM');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('VANUATU','Vanuatu','VU','VUT');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('WALLIS AND FUTUNA','Wallis and Futuna','WF','WLF');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('SAMOA','Samoa','WS','WSM');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('YEMEN','Yemen','YE','YEM');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('SOUTH AFRICA','South Africa','ZA','ZAF');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('ZAMBIA','Zambia','ZM','ZMB');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('ZIMBABWE','Zimbabwe','ZW','ZWE');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('FALKLAND ISLANDS (MALVINAS)','Falkland Islands (Malvinas)','FK','FLK');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('SUDAN','Sudan','SD','SDN');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('SERBIA','Serbia','RS','SRB');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('MONTENEGRO','Montenegro','ME','MNE');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('PALESTINAN','Palestina','PS','PSE');--
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('KOSOVO','Kosovo','XK','XKX');--

ALTER TABLE location DROP COLUMN loc_country;--
ALTER TABLE location DROP COLUMN loc_country_alpha_2;--

CREATE TABLE sdg (
   sdg_id_auto SERIAL NOT NULL,
   sdg_code VARCHAR(10) NOT NULL,
   sdg_name VARCHAR(255) NOT NULL
);--

ALTER TABLE sdg ADD PRIMARY KEY(sdg_id_auto);--

CREATE TABLE loc_sdg (
  cli_id INTEGER NOT NULL,
  loc_id INTEGER NOT NULL,
  sdg_id INTEGER NOT NULL,
  loc_sdg_description VARCHAR(1000)
);--
ALTER TABLE loc_sdg ADD PRIMARY KEY (cli_id, loc_id, sdg_id);--

ALTER TABLE loc_sdg ADD CONSTRAINT fk_loc_sdg__location FOREIGN KEY(cli_id, loc_id) REFERENCES location(cli_id, loc_id_auto);--
ALTER TABLE loc_sdg ADD CONSTRAINT fk_loc_sdg__sdg FOREIGN KEY(sdg_id) REFERENCES sdg(sdg_id_auto);--


CREATE VIEW vw_cli_gen_alert_to_send_by_email AS
select
 cga.*,
 g.loc_id,
 g.gen_name,
 g.gen_code,
 l.loc_name,
 l.loc_code,
 c.cli_name
from
client c
join location l on c.cli_id_auto = l.cli_id
join generator g on g.cli_id = l.cli_id and g.loc_id = l.loc_id_auto
join cli_gen_alert cga on l.cli_id = cga.cli_id and g.gen_id_auto = cga.gen_id
where c.cli_flags ilike '__1%' and g.gen_flags ilike '_1%' and cga.cli_gen_alert_flags ilike '_0%';--


CREATE VIEW vw_cli_loc_alert_to_send_by_email AS 
select
 cla.*,
 l.loc_name,
 l.loc_code,
 c.cli_name
from
client c
join location l on c.cli_id_auto = l.cli_id
join cli_loc_alert cla on l.cli_id = cla.cli_id and l.loc_id_auto = cla.loc_id
where c.cli_flags ilike '__1%' and l.loc_flags ilike '_1%' and cla.cli_loc_alert_flags ilike '_0%';--



CREATE TABLE loc_type (
  loc_type_id_auto  SERIAL NOT NULL,
  loc_type_code VARCHAR(255),
  loc_type_text VARCHAR(255)
);--

ALTER TABLE loc_type ADD PRIMARY KEY(loc_type_id_auto);--

ALTER TABLE location ADD COLUMN loc_type_id INTEGER NULL;--
ALTER TABLE location ADD CONSTRAINT fk_loc__loc_type FOREIGN KEY(loc_type_id) REFERENCES loc_type(loc_type_id_auto);--

insert into loc_type (loc_type_code, loc_type_text) values ('RES', 'Residential');--
insert into loc_type (loc_type_code, loc_type_text) values ('IND', 'Industrial');--
insert into loc_type (loc_type_code, loc_type_text) values ('RURAL', 'Rural');--
insert into loc_type (loc_type_code, loc_type_text) values ('COMM_EST', 'Commercial establishment');--


ALTER TABLE client ADD COLUMN cli_cert_prov_data VARCHAR(2000);--
ALTER TABLE users ADD COLUMN usr_cert_prov_data VARCHAR(2000);--
ALTER TABLE location ADD COLUMN loc_cert_prov_data VARCHAR(2000);--
ALTER TABLE generator ADD COLUMN gen_cert_prov_data VARCHAR(2000);--
ALTER TABLE station ADD COLUMN sta_cert_prov_data VARCHAR(2000);--

update client set cli_flags = '0001' where cli_flags is null or cli_flags = '';--
update client set cli_flags = cli_flags || '001' where cli_flags ilike '_';--
update client set cli_flags = cli_flags || '01' where cli_flags ilike '__';--
update client set cli_flags = cli_flags || '1' where cli_flags ilike '___';--

update users set usr_flags = '00001' where usr_flags is null or usr_flags = '';--
update users set usr_flags = usr_flags || '0001' where usr_flags ilike '_';--
update users set usr_flags = usr_flags || '001' where usr_flags ilike '__';--
update users set usr_flags = usr_flags || '01' where usr_flags ilike '___';--
update users set usr_flags = usr_flags || '1' where usr_flags ilike '____';--

update location set loc_flags = '000001' where loc_flags is null or loc_flags = '';--
update location set loc_flags = loc_flags || '00001' where loc_flags ilike '_';--
update location set loc_flags = loc_flags || '0001' where loc_flags ilike '__';--
update location set loc_flags = loc_flags || '001' where loc_flags ilike '___';--
update location set loc_flags = loc_flags || '01' where loc_flags ilike '____';--
update location set loc_flags = loc_flags || '1' where loc_flags ilike '_____';--

update station set sta_flags = '01' where sta_flags is null or sta_flags = '';--
update station set sta_flags = sta_flags || '1' where sta_flags ilike '_';--

ALTER TABLE gen_data ADD COLUMN gen_data_cert_prov_data VARCHAR(2000);--

ALTER TABLE country ADD COLUMN ctr_code_phone VARCHAR(10) NULL;--

