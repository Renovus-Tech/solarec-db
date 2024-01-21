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
select cga.*, g.loc_id from
generator g
join cli_gen_alert cga on g.cli_id = cga.cli_id and g.gen_id_auto = cga.gen_id;--