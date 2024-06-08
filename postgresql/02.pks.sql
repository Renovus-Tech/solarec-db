ALTER TABLE chart ADD PRIMARY KEY(chr_id_auto);--                                                                                                                                                                                                                                                               
ALTER TABLE client ADD PRIMARY KEY(cli_id_auto);--                                                                                                                                                                                                                                                              
ALTER TABLE cli_user ADD PRIMARY KEY(cli_id, usr_id);--                                                                                                                                                                                                                                                         
ALTER TABLE data_definition ADD PRIMARY KEY(data_def_id_auto);--                                                                                                                                                                                                                                                
ALTER TABLE data_processing ADD PRIMARY KEY(data_pro_id_auto);--                                                                                                                                                                                                                                                
ALTER TABLE data_type ADD PRIMARY KEY(data_type_id);--                                                                                                                                                                                                                                                     
ALTER TABLE document ADD PRIMARY KEY(cli_id, doc_id_auto);--                                                                                                                                                                                                                                                         
ALTER TABLE doc_generator ADD PRIMARY KEY(cli_id, doc_id, gen_id);--                                                                                                                                                                                                                                            
ALTER TABLE doc_location ADD PRIMARY KEY(cli_id, doc_id, loc_id);--                                                                                                                                                                                                                                             
ALTER TABLE doc_station ADD PRIMARY KEY(cli_id, doc_id, sta_id);--                                                                                                                                                                                                                                              
ALTER TABLE functionality ADD PRIMARY KEY(fnc_id_auto);--                                                                                                                                                                                                                                                       
ALTER TABLE generator ADD PRIMARY KEY(cli_id, gen_id_auto);--                                                                                                                                                                                                                                                        
ALTER TABLE gen_data ADD PRIMARY KEY(cli_id, gen_id, data_date, data_type_id);--                                                                                                                                                                                                                                
ALTER TABLE gen_metadata ADD PRIMARY KEY(cli_id, gen_id, metadata_code);--                                                                                                                                                                                                                                      
ALTER TABLE gen_statistic ADD PRIMARY KEY(cli_id, gen_id, stat_date, stat_type_id);--                                                                                                                                                                                                                           
ALTER TABLE location ADD PRIMARY KEY(cli_id, loc_id_auto);--
ALTER TABLE loc_user ADD PRIMARY KEY(cli_id, loc_id, usr_id);--                                                                                                                                                                                                                                                    
ALTER TABLE loc_data ADD PRIMARY KEY(cli_id, loc_id, data_date, data_type_id);--                                                                                                                                                                                                                                
ALTER TABLE loc_metadata ADD PRIMARY KEY(cli_id, loc_id, metadata_name);--                                                                                                                                                                                                                                      
ALTER TABLE loc_statistic ADD PRIMARY KEY(cli_id, loc_id, stat_date, stat_type_id);--                                                                                                                                                                                                                           
ALTER TABLE prf_functionality ADD PRIMARY KEY(prf_id, fnc_id);--                                                                                                                                                                                                                                                
ALTER TABLE profile ADD PRIMARY KEY(prf_id_auto);--                                                                                                                                                                                                                                                             
ALTER TABLE report ADD PRIMARY KEY(cli_id, rep_id_auto);--                                                                                                                                                                                                                                                      
ALTER TABLE rep_type ADD PRIMARY KEY(rep_type_id_auto);--                                                                                                                                                                                                                                                       
ALTER TABLE station ADD PRIMARY KEY(cli_id, sta_id_auto);--                                                                                                                                                                                                                                                     
ALTER TABLE stat_definition ADD PRIMARY KEY(stat_def_id_auto);--                                                                                                                                                                                                                                                
ALTER TABLE stat_def_result ADD PRIMARY KEY(stat_def_id, stat_type_id);--                                                                                                                                                                                                                                       
ALTER TABLE stat_def_source ADD PRIMARY KEY(stat_def_id, data_type_id);--                                                                                                                                                                                                                                       
ALTER TABLE stat_processing ADD PRIMARY KEY(stat_pro_id_auto);--                                                                                                                                                                                                                                                
ALTER TABLE stat_type ADD PRIMARY KEY(stat_type_id);--                                                                                                                                                                                                                                                     
ALTER TABLE sta_data ADD PRIMARY KEY(cli_id, sta_id, data_date, data_type_id);--                                                                                                                                                                                                                                 
ALTER TABLE sta_metadata ADD PRIMARY KEY(cli_id, sta_id, metadata_name);--                                                                                                                                                                                                                                      
ALTER TABLE sta_statistic ADD PRIMARY KEY(cli_id, sta_id, stat_date, stat_type_id);--                                                                                                                                                                                                                           
ALTER TABLE users ADD PRIMARY KEY(usr_id_auto);--                                                                                                                                                                                                                                                               
ALTER TABLE usr_profile ADD PRIMARY KEY(usr_id, prf_id, cli_id);--                                                                                                                                                                                                                                                      
ALTER TABLE gen_power ADD PRIMARY KEY(cli_id, gen_id, pwr_wind_speed, pwr_air_density);--

ALTER TABLE data_def_stat_definition ADD PRIMARY KEY(data_def_id, stat_def_id);--
ALTER TABLE data_pro_stat_processing ADD PRIMARY KEY(data_pro_id, stat_pro_id);--

ALTER TABLE wea_definition ADD PRIMARY KEY(cli_id, wea_id_auto);--
ALTER TABLE wea_call ADD PRIMARY KEY(cli_id, wea_id, wea_call_id_auto);--

ALTER TABLE gen_alarm ADD PRIMARY KEY(cli_id, gen_id, alarm_code);--
ALTER TABLE loc_gen_alarm ADD PRIMARY KEY(cli_id, loc_id, alarm_code);--
ALTER TABLE cli_gen_alarm ADD PRIMARY KEY(cli_id, alarm_code);--

ALTER TABLE gen_alert ADD PRIMARY KEY(cli_id, gen_id, alert_def_id, alert_date_added);--
ALTER TABLE alert_definition ADD PRIMARY KEY(alert_def_id_auto);--
ALTER TABLE loc_alert ADD PRIMARY KEY(cli_id, loc_id, alert_def_id, alert_date_added);--
ALTER TABLE sta_alert ADD PRIMARY KEY(cli_id, sta_id, alert_def_id, alert_date_added);--
ALTER TABLE data_def_alert_definition ADD PRIMARY KEY(data_def_id, alert_def_id);--

ALTER TABLE alert_processing ADD PRIMARY KEY(alert_pro_id_auto);--                                                                                                                                                                                                                                                

ALTER TABLE data_pro_alert_processing ADD PRIMARY KEY(data_pro_id, alert_pro_id);--

ALTER TABLE cli_data_def_trigger ADD PRIMARY KEY(tri_id_auto);--

ALTER TABLE loc_usr_rep_type ADD PRIMARY KEY(cli_id, loc_id, usr_id, rep_type_id);--

ALTER TABLE usr_setting ADD PRIMARY KEY(usr_id, usr_set_name);--

ALTER TABLE cli_setting ADD PRIMARY KEY(cli_id, cli_set_name);--

ALTER TABLE loc_data_mdl_ml_sanitized ADD CONSTRAINT loc_data_mdl_ml_sanitized_pkey PRIMARY KEY (cli_id, loc_id, data_date);--
ALTER TABLE gen_data_mdl_ml_sanitized ADD CONSTRAINT gen_data_mdl_ml_sanitized_pkey PRIMARY KEY (cli_id, loc_id, gen_id, data_date);--
ALTER TABLE sta_data_mdl_ml_sanitized ADD CONSTRAINT sta_data_mdl_ml_sanitized_pkey PRIMARY KEY (cli_id, loc_id, sta_id, data_date);--

ALTER TABLE loc_estimation ADD PRIMARY KEY(cli_id, loc_id, loc_est_id_auto);--                                                                                                                                                                                                                                                    

ALTER TABLE gen_neighbour ADD PRIMARY KEY(cli_id, gen_id, gen_id_neighbour);--                                                                                                                                                                                                                                                    

ALTER TABLE data_category ADD PRIMARY KEY(data_cat_id_auto);--

ALTER TABLE loc_weather_data ADD PRIMARY KEY(cli_id, loc_id, loc_wea_data_id_auto);--

ALTER TABLE loc_wea_data_hour ADD PRIMARY KEY(cli_id, loc_id, loc_wea_data_id, loc_wea_data_hour);--

ALTER TABLE doc_type ADD PRIMARY KEY(doc_type_id_auto);--

ALTER TABLE loc_data_weather ADD PRIMARY KEY(cli_id, loc_id, data_date_added, data_date, data_type_id);--

ALTER TABLE cli_loc_usr_setting ADD PRIMARY KEY (cli_id, loc_id, usr_id);--
ALTER TABLE cli_loc_alert ADD PRIMARY KEY (cli_id, loc_id, cli_loc_alert_id_auto);--
ALTER TABLE cli_loc_usr_alert ADD PRIMARY KEY (cli_id, loc_id, usr_id, cli_loc_alert_id);--

ALTER TABLE cli_gen_alert ADD PRIMARY KEY (cli_id, gen_id, cli_gen_alert_id_auto);--
ALTER TABLE cli_gen_usr_alert ADD PRIMARY KEY (cli_id, gen_id, usr_id, cli_gen_alert_id);--

ALTER TABLE settings ADD PRIMARY KEY (set_name);--

ALTER TABLE data_def_parameter ADD PRIMARY KEY (data_def_id, data_def_par_id_auto);--
ALTER TABLE cli_data_def_parameter ADD PRIMARY KEY (cli_id, data_def_id, data_def_par_id);--
ALTER TABLE loc_data_def_parameter ADD PRIMARY KEY (cli_id, loc_id, data_def_id, data_def_par_id);--
ALTER TABLE gen_data_def_parameter ADD PRIMARY KEY (cli_id, gen_id, data_def_id, data_def_par_id);--


ALTER TABLE cli_metadata ADD PRIMARY KEY(cli_id, metadata_name);--                                                                                                                                                                                                                                      


ALTER TABLE country ADD PRIMARY KEY (ctr_id_auto);--
ALTER TABLE ctr_data ADD PRIMARY KEY(ctr_id, data_date, data_type_id);--                                                                                                                                                                                                                                


ALTER TABLE sdg ADD PRIMARY KEY(sdg_id_auto);--                                                                                                                                                                                                                                                               

ALTER TABLE loc_sdg ADD PRIMARY KEY (cli_id, loc_id, sdg_id);--

ALTER TABLE loc_type ADD PRIMARY KEY(loc_type_id_auto);--