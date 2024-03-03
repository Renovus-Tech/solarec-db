select * from client order by cli_id_auto desc --8
select * from data_definition order by  data_Def_id_auto desc--15
select * from location order by loc_id_auto desc --15
select * from generator where cli_id = 8 order by gen_id_auto desc
select * from station where cli_id = 8 order by sta_id_auto desc
select * from users order by usr_id_auto --1, 3, 5, 11
select * from profile order by prf_id_auto --1, 2
select * from data_category
select * from stat_definition where stat_def_type = 2 order by stat_Def_id_auto; --28, 10

------------------

insert into client (cli_name, cli_name_legal, cli_name_address, cli_flags) 
values ('Canary', 'Canelones, Uruguay', 'Canelones, Uruguay', '1');-- 1

insert into data_definition(data_def_name, data_def_description, data_def_executable, data_Def_flags)
values ('Canary Excel Initial Load', null, 'com.falconer.business.impl.processing.canary.InitialLoadExcelProcessing', '01');-- 1

insert into location (cli_id, data_def_id, loc_name, loc_address, loc_coord_lat, loc_coord_lng, loc_flags, loc_code, loc_output_capacity, loc_output_total_capacity, loc_reference_density, loc_type, loc_gmt)
values (1, 1, 'Domus', 'Canelones, Uruguay', -34.7833, -56.0112, '10', 'Domus', 50, 50, 1.0, 'solar', '-0300');--1

insert into generator (cli_id, loc_id, gen_name, gen_coord_lat, gen_coord_lng, gen_brand, gen_model, gen_serial_num, gen_rate_power, gen_code, gen_flags)
values (1, 1, '1', -34.7833, -56.0112, 'ABB', 'ABB Trio 50.0', '19384220', 50, '1', '1');--1

insert into station(cli_id, loc_id, sta_name, sta_coord_lat, sta_coord_lng, sta_code)
values (1, 1, 'Met_1', -34.7833, -56.0112, 'Met_1');--1

insert into users (usr_email, usr_name, usr_password) values ('solarec@renovus.tech', 'SolaREC', 'solarecdemo');--1
insert into cli_user (cli_id, usr_id, cli_user_date_added) values ( 1, 1,  current_timestamp);--
insert into loc_user (cli_id, usr_id, loc_id, cli_user_date_added) values (1, 1, 1, current_timestamp);--
insert into usr_profile (usr_id, prf_id, cli_id, usr_prf_date_added) values (1, 1, 1, current_timestamp);--
insert into usr_profile (usr_id, prf_id, cli_id, usr_prf_date_added) values (1, 2, 1, current_timestamp);--


insert into data_definition(data_def_name, data_def_description, data_def_executable, data_Def_flags)
values ('Inverter Fimer', null, 'tech.renovus.solarec.inverters.brand.fimer.FimerInverterService', '011');-- 2

insert into data_def_parameter (data_def_id, data_def_par_name ) values (2, 'fimer.client.user');--
insert into data_def_parameter (data_def_id, data_def_par_name ) values (2, 'fimer.client.password');--
insert into data_def_parameter (data_def_id, data_def_par_name ) values (2, 'fimer.client.key');--
insert into data_def_parameter (data_def_id, data_def_par_name ) values (2, 'fimer.client.timezone');--
insert into data_def_parameter (data_def_id, data_def_par_name ) values (2, 'fimer.client.portafolioId');--
insert into data_def_parameter (data_def_id, data_def_par_name ) values (2, 'fimer.location.plantId');--
insert into data_def_parameter (data_def_id, data_def_par_name ) values (2, 'fimer.generator.deviceId');--
insert into data_def_parameter (data_def_id, data_def_par_name ) values (2, 'fimer.client.last_retrieve');--
insert into data_def_parameter (data_def_id, data_def_par_name ) values (2, 'fimer.location.last_retrieve');--
insert into data_def_parameter (data_def_id, data_def_par_name ) values (2, 'fimer.generator.last_retrieve');--


insert into data_definition(data_def_name, data_def_description, data_def_executable, data_Def_flags)
values ('Inverter Fronius', null, 'tech.renovus.solarec.inverters.brand.fronius.FroniusInverterService', '011');-- 3

insert into data_def_parameter (data_def_id, data_def_par_name ) values (3, 'fronius.client.key_id');--
insert into data_def_parameter (data_def_id, data_def_par_name ) values (3, 'fronius.client.key_value');--
insert into data_def_parameter (data_def_id, data_def_par_name ) values (3, 'fronius.generator.pv_systems_id');--
insert into data_def_parameter (data_def_id, data_def_par_name ) values (3, 'fronius.client.last_retrieve');--
insert into data_def_parameter (data_def_id, data_def_par_name ) values (3, 'fronius.location.last_retrieve');--
insert into data_def_parameter (data_def_id, data_def_par_name ) values (3, 'fronius.generator.last_retrieve');--
insert into data_def_parameter (data_def_id, data_def_par_name ) values (3, 'fronius.beta');--


insert into data_definition(data_def_name, data_def_description, data_def_executable, data_Def_flags)
values ('Inverter SMA', null, 'tech.renovus.solarec.inverters.brand.sma.SmaInverterService', '011');-- 4

insert into data_def_parameter (data_def_id, data_def_par_name ) values (4, 'sma.sandbox');--
insert into data_def_parameter (data_def_id, data_def_par_name ) values (4, 'sma.client.client_id');--
insert into data_def_parameter (data_def_id, data_def_par_name ) values (4, 'sma.client.client_secret');--
insert into data_def_parameter (data_def_id, data_def_par_name ) values (4, 'sma.client.resource_owner');--
insert into data_def_parameter (data_def_id, data_def_par_name ) values (4, 'sma.location.plant_id');--
insert into data_def_parameter (data_def_id, data_def_par_name ) values (4, 'sma.generator.device_id');--
insert into data_def_parameter (data_def_id, data_def_par_name ) values (4, 'sma.generator.last_retrieve');--



insert into generator (cli_id, loc_id, gen_name, gen_coord_lat, gen_coord_lng, gen_brand, gen_model, gen_serial_num, gen_rate_power, gen_code, data_def_id, gen_flags)
values (1, 1, 'Fimer #1', -34.7833, -56.0112, 'Fimer', 'Sample', 'Sample #1', 50, 'Fimer_1', 2, '1');--2

insert into generator (cli_id, loc_id, gen_name, gen_coord_lat, gen_coord_lng, gen_brand, gen_model, gen_serial_num, gen_rate_power, gen_code, data_def_id, gen_flags)
values (1, 1, 'Fronius #1', -34.7833, -56.0112, 'Fronius', 'Sample', 'Sample #1', 50, 'Fronius_1', 3, '1');--3

insert into generator (cli_id, loc_id, gen_name, gen_coord_lat, gen_coord_lng, gen_brand, gen_model, gen_serial_num, gen_rate_power, gen_code, data_def_id, gen_flags)
values (1, 1, 'SMA #1', -34.7833, -56.0112, 'SMA', 'Sample', 'Sample #1', 50, 'SMA_1', 4, '1');--4


INSERT INTO data_type (data_type_name, data_type_id) VALUES ('TYPE_SOLAR_STATION_TOTAL_CLOUD_COVER', 506);--
INSERT INTO data_type (data_type_name, data_type_id) VALUES ('TYPE_SOLAR_STATION_PRECIPITATION', 507);--
