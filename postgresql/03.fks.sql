ALTER TABLE cli_user ADD CONSTRAINT fk_cli_usr__users FOREIGN KEY(usr_id) REFERENCES users(usr_id_auto);-- 
ALTER TABLE cli_user ADD CONSTRAINT fk_cli_usr__client FOREIGN KEY(cli_id) REFERENCES client(cli_id_auto);--
ALTER TABLE data_processing ADD CONSTRAINT fk_data_pro__client FOREIGN KEY(cli_id) REFERENCES client(cli_id_auto);-- 
ALTER TABLE data_processing ADD CONSTRAINT fk_data_pro__data_definition FOREIGN KEY(data_def_id) REFERENCES data_definition(data_def_id_auto);-- 
ALTER TABLE data_processing ADD CONSTRAINT fk_data_pro__location FOREIGN KEY(cli_id, loc_id) REFERENCES location(cli_id, loc_id_auto);-- 
ALTER TABLE document ADD CONSTRAINT fk_doc__client FOREIGN KEY(cli_id) REFERENCES client(cli_id_auto);--
ALTER TABLE doc_generator ADD CONSTRAINT fk_doc_gen__document FOREIGN KEY(cli_id, doc_id) REFERENCES document(cli_id, doc_id_auto);-- 
ALTER TABLE doc_generator ADD CONSTRAINT fk_doc_gen__generator FOREIGN KEY(cli_id, gen_id) REFERENCES generator(cli_id, gen_id_auto);--
ALTER TABLE doc_location ADD CONSTRAINT fk_doc_loc__document FOREIGN KEY(cli_id, doc_id) REFERENCES document(cli_id, doc_id_auto);--
ALTER TABLE doc_location ADD CONSTRAINT fk_doc_loc__location FOREIGN KEY(cli_id, loc_id) REFERENCES location(cli_id, loc_id_auto);-- 
ALTER TABLE doc_station ADD CONSTRAINT fk_doc_sta__document FOREIGN KEY(cli_id, doc_id) REFERENCES document(cli_id, doc_id_auto);--
ALTER TABLE doc_station ADD CONSTRAINT fk_doc_sta__station FOREIGN KEY(cli_id, sta_id) REFERENCES station(cli_id, sta_id_auto);--
ALTER TABLE generator ADD CONSTRAINT fk_gen__location FOREIGN KEY(cli_id, loc_id) REFERENCES location(cli_id, loc_id_auto);--
ALTER TABLE generator ADD CONSTRAINT fk_gen__data_definition FOREIGN KEY(data_def_id) REFERENCES data_definition(data_def_id_auto);--
ALTER TABLE gen_data ADD CONSTRAINT fk_gen_data__generator FOREIGN KEY(cli_id, gen_id) REFERENCES generator(cli_id, gen_id_auto);--
ALTER TABLE gen_data ADD CONSTRAINT fk_gen_data__data_processing FOREIGN KEY(data_pro_id) REFERENCES data_processing(data_pro_id_auto);--
ALTER TABLE gen_data ADD CONSTRAINT fk_gen_data__data_type FOREIGN KEY(data_type_id) REFERENCES data_type(data_type_id);--
ALTER TABLE gen_metadata ADD CONSTRAINT fk_gen_metdat__generator FOREIGN KEY(cli_id, gen_id) REFERENCES generator(cli_id, gen_id_auto);-- 
ALTER TABLE gen_statistic ADD CONSTRAINT fk_gen_stat__generator FOREIGN KEY(cli_id, gen_id) REFERENCES generator(cli_id, gen_id_auto);--
ALTER TABLE gen_statistic ADD CONSTRAINT fk_gen_stat__processing FOREIGN KEY(stat_pro_id) REFERENCES stat_processing(stat_pro_id_auto);--
ALTER TABLE gen_statistic ADD CONSTRAINT fk_gen_stat__stat_type FOREIGN KEY(stat_type_id) REFERENCES stat_type(stat_type_id);--
ALTER TABLE location ADD CONSTRAINT fk_loc__client FOREIGN KEY(cli_id) REFERENCES client(cli_id_auto);--
ALTER TABLE location ADD CONSTRAINT fk_loc__data_definition FOREIGN KEY(data_def_id) REFERENCES data_definition(data_def_id_auto);-- 
ALTER TABLE loc_user ADD CONSTRAINT fk_loc_usr__users FOREIGN KEY(usr_id) REFERENCES users(usr_id_auto);-- 
ALTER TABLE loc_user ADD CONSTRAINT fk_loc_usr__location FOREIGN KEY(cli_id, loc_id) REFERENCES location(cli_id, loc_id_auto);--
ALTER TABLE loc_data ADD CONSTRAINT fk_loc_data__location FOREIGN KEY(cli_id, loc_id) REFERENCES location(cli_id, loc_id_auto);--
ALTER TABLE loc_data ADD CONSTRAINT fk_loc_data__data_processing FOREIGN KEY(data_pro_id) REFERENCES data_processing(data_pro_id_auto);--
ALTER TABLE loc_data ADD CONSTRAINT fk_loc_data__data_type FOREIGN KEY(data_type_id) REFERENCES data_type(data_type_id);--
ALTER TABLE loc_metadata ADD CONSTRAINT fk_loc_metdat__location FOREIGN KEY(cli_id, loc_id) REFERENCES location(cli_id, loc_id_auto);--
ALTER TABLE loc_statistic ADD CONSTRAINT fk_loc_stat__location FOREIGN KEY(cli_id, loc_id) REFERENCES location(cli_id, loc_id_auto);--
ALTER TABLE loc_statistic ADD CONSTRAINT fk_loc_stat__stat_processing FOREIGN KEY(stat_pro_id) REFERENCES stat_processing(stat_pro_id_auto);-- 
ALTER TABLE loc_statistic ADD CONSTRAINT fk_loc_stat__stat_type FOREIGN KEY(stat_type_id) REFERENCES stat_type(stat_type_id);--
ALTER TABLE prf_functionality ADD CONSTRAINT fk_prf_fnc__profile FOREIGN KEY(prf_id) REFERENCES profile(prf_id_auto);--
ALTER TABLE prf_functionality ADD CONSTRAINT fk_prf_fnc__functionality FOREIGN KEY(fnc_id) REFERENCES functionality(fnc_id_auto);--
ALTER TABLE report ADD CONSTRAINT fk_rep__client FOREIGN KEY(cli_id) REFERENCES client(cli_id_auto);--
ALTER TABLE report ADD CONSTRAINT fk_rep__rep_type FOREIGN KEY(rep_type_id) REFERENCES rep_type(rep_type_id_auto);-- 
ALTER TABLE station ADD CONSTRAINT fk_sta__location FOREIGN KEY(cli_id, loc_id) REFERENCES location(cli_id, loc_id_auto);--
ALTER TABLE station ADD CONSTRAINT fk_sta__data_definition FOREIGN KEY(data_def_id) REFERENCES data_definition(data_def_id_auto);--
ALTER TABLE stat_def_result ADD CONSTRAINT fk_stat_def_rlt__stat_type FOREIGN KEY(stat_type_id) REFERENCES stat_type(stat_type_id);-- 
ALTER TABLE stat_def_result ADD CONSTRAINT fk_stat_def_rlt__stat_definition FOREIGN KEY(stat_def_id) REFERENCES stat_definition(stat_def_id_auto);-- 
ALTER TABLE stat_def_source ADD CONSTRAINT fk_stat_def_src__data_type FOREIGN KEY(data_type_id) REFERENCES data_type(data_type_id);--
ALTER TABLE stat_def_source ADD CONSTRAINT fk_stat_def_src__stat_definition FOREIGN KEY(stat_def_id) REFERENCES stat_definition(stat_def_id_auto);-- 
ALTER TABLE stat_processing ADD CONSTRAINT fk_stat_pro__client FOREIGN KEY(cli_id) REFERENCES client(cli_id_auto);--
ALTER TABLE stat_processing ADD CONSTRAINT fk_stat_pro__stat_desfinition FOREIGN KEY(stat_def_id) REFERENCES stat_definition(stat_def_id_auto);--
ALTER TABLE sta_data ADD CONSTRAINT fk_sta_data__station FOREIGN KEY(cli_id, sta_id) REFERENCES station(cli_id, sta_id_auto);--
ALTER TABLE sta_data ADD CONSTRAINT fk_sta_data__data_processing FOREIGN KEY(data_pro_id) REFERENCES data_processing(data_pro_id_auto);--
ALTER TABLE sta_data ADD CONSTRAINT fk_sta_data__data_type FOREIGN KEY(data_type_id) REFERENCES data_type(data_type_id);--
ALTER TABLE sta_metadata ADD CONSTRAINT fk_sta_metdat__station FOREIGN KEY(cli_id, sta_id) REFERENCES station(cli_id, sta_id_auto);--
ALTER TABLE sta_statistic ADD CONSTRAINT fk_sta_stat__station FOREIGN KEY(cli_id, sta_id) REFERENCES station(cli_id, sta_id_auto);--
ALTER TABLE sta_statistic ADD CONSTRAINT fk_sta_stat__stat_processing FOREIGN KEY(stat_pro_id) REFERENCES stat_processing(stat_pro_id_auto);-- 
ALTER TABLE sta_statistic ADD CONSTRAINT fk_sta_stat__stat_type FOREIGN KEY(stat_type_id) REFERENCES stat_type(stat_type_id);--
ALTER TABLE usr_profile ADD CONSTRAINT fk_usr_prf__users FOREIGN KEY(usr_id) REFERENCES users(usr_id_auto);--
ALTER TABLE usr_profile ADD CONSTRAINT fk_usr_prf__profle FOREIGN KEY(prf_id) REFERENCES profile(prf_id_auto);-- 
ALTER TABLE usr_profile ADD CONSTRAINT fk_usr_prf__cli_user FOREIGN KEY(cli_id, usr_id) REFERENCES cli_user(cli_id, usr_id);-- 
ALTER TABLE gen_power ADD CONSTRAINT fk_gen_pwr__generator FOREIGN KEY(cli_id, gen_id) REFERENCES generator(cli_id, gen_id_auto);--

ALTER TABLE data_def_stat_definition ADD CONSTRAINT fk_data_def_stat_def__data_def FOREIGN KEY(data_def_id) REFERENCES data_definition(data_def_id_auto);-- 
ALTER TABLE data_def_stat_definition ADD CONSTRAINT fk_data_def_stat_def__stat_def FOREIGN KEY(stat_def_id) REFERENCES stat_definition(stat_def_id_auto);-- 

ALTER TABLE data_pro_stat_processing ADD CONSTRAINT fk_data_pro_stat_pro__data_pro FOREIGN KEY(data_pro_id) REFERENCES data_processing(data_pro_id_auto);-- 
ALTER TABLE data_pro_stat_processing ADD CONSTRAINT fk_data_pro_stat_pro__stat_pro FOREIGN KEY(stat_pro_id) REFERENCES stat_processing(stat_pro_id_auto);-- 

ALTER TABLE wea_definition ADD CONSTRAINT fk_wea_def__client FOREIGN KEY(cli_id) REFERENCES client(cli_id_auto);--
ALTER TABLE wea_call ADD CONSTRAINT fk_wea_call__wea_definition FOREIGN KEY(cli_id, wea_id) REFERENCES wea_definition(cli_id,wea_id_auto);--

ALTER TABLE client ADD CONSTRAINT fk_cli__data_definition FOREIGN KEY(data_def_id) REFERENCES data_definition(data_def_id_auto);--

ALTER TABLE gen_alarm ADD CONSTRAINT fk_gen_alarm__generator FOREIGN KEY(cli_id, gen_id) REFERENCES generator(cli_id, gen_id_auto);--
ALTER TABLE loc_gen_alarm ADD CONSTRAINT fk_loc_gen_alarm__location FOREIGN KEY(cli_id, loc_id) REFERENCES location(cli_id, loc_id_auto);--
ALTER TABLE cli_gen_alarm ADD CONSTRAINT fk_cli_gen_alarm__client FOREIGN KEY(cli_id) REFERENCES client(cli_id_auto);--

ALTER TABLE gen_alert ADD CONSTRAINT fk_gen_alert__gention FOREIGN KEY(cli_id, gen_id) REFERENCES generator(cli_id, gen_id_auto);--
ALTER TABLE gen_alert ADD CONSTRAINT fk_gen_alert__alert_definition FOREIGN KEY(alert_def_id) REFERENCES alert_definition(alert_def_id_auto);--
ALTER TABLE loc_alert ADD CONSTRAINT fk_loc_alert__loction FOREIGN KEY(cli_id, loc_id) REFERENCES location(cli_id, loc_id_auto);--
ALTER TABLE loc_alert ADD CONSTRAINT fk_loc_alert__alert_definition FOREIGN KEY(alert_def_id) REFERENCES alert_definition(alert_def_id_auto);--
ALTER TABLE sta_alert ADD CONSTRAINT fk_sta_alert__station FOREIGN KEY(cli_id, sta_id) REFERENCES station(cli_id, sta_id_auto);--
ALTER TABLE sta_alert ADD CONSTRAINT fk_sta_alert__alert_definition FOREIGN KEY(alert_def_id) REFERENCES alert_definition(alert_def_id_auto);--
ALTER TABLE data_def_alert_definition ADD CONSTRAINT fk_data_def_alert_def__data_def FOREIGN KEY(data_def_id) REFERENCES data_definition(data_def_id_auto);-- 
ALTER TABLE data_def_alert_definition ADD CONSTRAINT fk_data_def_alert_def__alert_def FOREIGN KEY(alert_def_id) REFERENCES alert_definition(alert_def_id_auto);-- 

ALTER TABLE alert_processing ADD CONSTRAINT fk_alert_pro__client FOREIGN KEY(cli_id) REFERENCES client(cli_id_auto);-- 
ALTER TABLE alert_processing ADD CONSTRAINT fk_alert_pro__alert_definition FOREIGN KEY(alert_def_id) REFERENCES alert_definition(alert_def_id_auto);-- 
ALTER TABLE alert_processing ADD CONSTRAINT fk_alert_pro__location FOREIGN KEY(cli_id, loc_id) REFERENCES location(cli_id, loc_id_auto);-- 

ALTER TABLE gen_alert ADD CONSTRAINT fk_gen_alert__alert_processing FOREIGN KEY(alert_pro_id) REFERENCES alert_processing(alert_pro_id_auto);--
ALTER TABLE sta_alert ADD CONSTRAINT fk_sta_alert__alert_processing FOREIGN KEY(alert_pro_id) REFERENCES alert_processing(alert_pro_id_auto);--
ALTER TABLE loc_alert ADD CONSTRAINT fk_loc_alert__alert_processing FOREIGN KEY(alert_pro_id) REFERENCES alert_processing(alert_pro_id_auto);--

ALTER TABLE data_pro_alert_processing ADD CONSTRAINT fk_data_pro_alert_pro__data_pro FOREIGN KEY(data_pro_id) REFERENCES data_processing(data_pro_id_auto);-- 
ALTER TABLE data_pro_alert_processing ADD CONSTRAINT fk_data_pro_alert_pro__alert_pro FOREIGN KEY(alert_pro_id) REFERENCES alert_processing(alert_pro_id_auto);-- 

ALTER TABLE cli_data_def_trigger ADD CONSTRAINT fk_data_def_tri__data_definition FOREIGN KEY(data_def_id) REFERENCES data_definition(data_def_id_auto);-- 
ALTER TABLE cli_data_def_trigger ADD CONSTRAINT fk_data_def_tri__client FOREIGN KEY(cli_id) REFERENCES client(cli_id_auto);-- 
ALTER TABLE cli_data_def_trigger ADD CONSTRAINT fk_data_def_tri__location FOREIGN KEY(cli_id, loc_id) REFERENCES location(cli_id, loc_id_auto);--
ALTER TABLE cli_data_def_trigger ADD CONSTRAINT fk_data_def_tri__generator FOREIGN KEY(cli_id, gen_id) REFERENCES generator(cli_id, gen_id_auto);--
ALTER TABLE cli_data_def_trigger ADD CONSTRAINT fk_data_def_tri__station FOREIGN KEY(cli_id, sta_id) REFERENCES station(cli_id, sta_id_auto);--

ALTER TABLE data_processing ADD CONSTRAINT fk_data_pro__cli_data_def_trigger FOREIGN KEY(tri_id) REFERENCES cli_data_def_trigger(tri_id_auto);--

ALTER TABLE loc_usr_rep_type ADD CONSTRAINT fk_loc_usr_rep_type__rep_type FOREIGN KEY(rep_type_id) REFERENCES rep_type(rep_type_id_auto);--
ALTER TABLE loc_usr_rep_type ADD CONSTRAINT fk_loc_usr_rep_type__loc_user FOREIGN KEY(cli_id, loc_id, usr_id) REFERENCES loc_user(cli_id, loc_id, usr_id);--

ALTER TABLE usr_setting ADD CONSTRAINT fk_usr_prf__users FOREIGN KEY(usr_id) REFERENCES users(usr_id_auto);--

ALTER TABLE loc_estimation ADD CONSTRAINT fk_loc_est__location FOREIGN KEY(cli_id, loc_id) REFERENCES location(cli_id, loc_id_auto);--

ALTER TABLE cli_setting ADD CONSTRAINT fk_cli_prf__client FOREIGN KEY(cli_id) REFERENCES client(cli_id_auto);--

ALTER TABLE gen_neighbour ADD CONSTRAINT fk_gen_nei__generator_1 FOREIGN KEY(cli_id, gen_id) REFERENCES generator(cli_id, gen_id_auto);--
ALTER TABLE gen_neighbour ADD CONSTRAINT fk_gen_nei__generator_2 FOREIGN KEY(cli_id, gen_id_neighbour) REFERENCES generator(cli_id, gen_id_auto);--

ALTER TABLE data_type ADD CONSTRAINT fk_data_type__data_category FOREIGN KEY(data_cat_id) REFERENCES data_category(data_cat_id_auto);--
ALTER TABLE loc_weather_data ADD CONSTRAINT fk_low_wea_data__localtion FOREIGN KEY(cli_id, loc_id) REFERENCES location(cli_id, loc_id_auto);--

ALTER TABLE loc_wea_data_hour ADD CONSTRAINT fk_loc_wea_data_hour__loc_wea_data FOREIGN KEY(cli_id, loc_id, loc_wea_data_id) REFERENCES loc_weather_data(cli_id, loc_id, loc_wea_data_id_auto);--

ALTER TABLE document ADD CONSTRAINT fk_doc__doc_type FOREIGN KEY(doc_type_id) REFERENCES doc_type(doc_type_id_auto);--

ALTER TABLE loc_data ADD CONSTRAINT fk_loc_data_wea__location FOREIGN KEY(cli_id, loc_id) REFERENCES location(cli_id, loc_id_auto);--
ALTER TABLE loc_data ADD CONSTRAINT fk_loc_data_wea__data_type FOREIGN KEY(data_type_id) REFERENCES data_type(data_type_id);--

ALTER TABLE gen_alarm ADD CONSTRAINT fk_gen_alarm__data_category FOREIGN KEY(data_cat_id) REFERENCES data_category(data_cat_id_auto);--
ALTER TABLE loc_gen_alarm ADD CONSTRAINT fk_loc_gen_alarm__data_category FOREIGN KEY(data_cat_id) REFERENCES data_category(data_cat_id_auto);--
ALTER TABLE cli_gen_alarm ADD CONSTRAINT fk_cli_gen_alarm__data_category FOREIGN KEY(data_cat_id) REFERENCES data_category(data_cat_id_auto);--