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
