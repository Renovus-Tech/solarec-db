CREATE INDEX cli_user_index1 ON cli_user (cli_id);-- 
CREATE INDEX cli_user_index2 ON cli_user (usr_id);-- 
CREATE INDEX processing_index1 ON data_processing (cli_id);--
CREATE INDEX processing_index3 ON data_processing (cli_id, loc_id);--
CREATE INDEX document_index1 ON document (cli_id);-- 
CREATE INDEX doc_generator_index1 ON doc_generator (cli_id, doc_id);-- 
CREATE INDEX doc_generator_index2 ON doc_generator (cli_id, gen_id);-- 
CREATE INDEX doc_location_index1 ON doc_location (cli_id, doc_id);-- 
CREATE INDEX doc_location_index2 ON doc_location (cli_id, loc_id);-- 
CREATE INDEX doc_station_index1 ON doc_station (cli_id, doc_id);-- 
CREATE INDEX doc_station_index2 ON doc_station (cli_id, sta_id);-- 
CREATE INDEX generator_index1 ON generator (cli_id, loc_id);-- 
CREATE INDEX gen_metadata_index1 ON gen_metadata (cli_id, gen_id);-- 
CREATE INDEX gen_statistic_index1 ON gen_statistic (cli_id, gen_id);-- 
CREATE INDEX gen_statistic_index3 ON gen_statistic (stat_type_id);-- 
CREATE INDEX location_index1 ON location (cli_id);-- 
CREATE INDEX loc_metadata_index1 ON loc_metadata (cli_id, loc_id);-- 
CREATE INDEX loc_statistic_index1 ON loc_statistic (cli_id, loc_id);-- 
CREATE INDEX loc_statistic_index3 ON loc_statistic (stat_type_id);-- 
CREATE INDEX prf_functionality_index1 ON prf_functionality (prf_id);-- 
CREATE INDEX prf_functionality_index2 ON prf_functionality (fnc_id);-- 
CREATE INDEX cli_report_index1 ON report (cli_id);-- 
CREATE INDEX cli_report_index2 ON report (rep_type_id);--
CREATE INDEX station_index1 ON station (cli_id, loc_id);-- 
CREATE INDEX chr_result_index2 ON stat_def_result (stat_type_id);--
CREATE INDEX chr_source_index2 ON stat_def_source (data_type_id);--
CREATE INDEX statistic_index1 ON stat_processing (cli_id);-- 
CREATE INDEX sta_metadata_index1 ON sta_metadata (cli_id, sta_id);-- 
CREATE INDEX sta_statistic_index1 ON sta_statistic (cli_id, sta_id);-- 
CREATE INDEX sta_statistic_index3 ON sta_statistic (stat_type_id);-- 
CREATE INDEX usr_profile_index1 ON usr_profile (usr_id);-- 
CREATE INDEX usr_profile_index2 ON usr_profile (prf_id);-- 
CREATE INDEX usr_profile_index3 ON usr_profile (cli_id, usr_id);-- 
CREATE INDEX gen_power_index1 ON gen_power (cli_id, gen_id);--

CREATE INDEX data_def_sta_definition_index1 ON data_def_stat_definition(data_def_id);--
CREATE INDEX data_def_sta_definition_index2 ON data_def_stat_definition(stat_def_id);--

CREATE INDEX data_pro_stat_processing_index1 ON data_pro_stat_processing(data_pro_id);--
CREATE INDEX data_pro_stat_processing_index2 ON data_pro_stat_processing(stat_pro_id);--

CREATE INDEX gen_data_index_chart ON gen_data (gen_id, data_type_id, data_date);--
CREATE INDEX sta_data_index_chart ON sta_data (sta_id, data_type_id, data_date);--
CREATE INDEX loc_data_index_chart ON loc_data (loc_id, data_type_id, data_date);--

CREATE INDEX gen_data_index_compute ON gen_data (data_pro_id, data_type_id);--

CREATE INDEX wea_definition_index1 ON wea_definition(cli_id);--
CREATE INDEX wea_call_index1 ON wea_call(cli_id, wea_id);--

CREATE INDEX gen_data_index1 ON gen_data (cli_id, gen_id);-- 
CREATE INDEX gen_data_index2 ON gen_data (cli_id, data_pro_id);-- 
CREATE INDEX gen_data_index3 ON gen_data (data_type_id);-- 
CREATE INDEX gen_data_index4 ON gen_data (data_pro_id, data_type_id);--
CREATE INDEX loc_data_index1 ON loc_data (cli_id, loc_id);-- 
CREATE INDEX loc_data_index2 ON loc_data (cli_id, data_pro_id);-- 
CREATE INDEX loc_data_index3 ON loc_data (data_type_id);--
CREATE INDEX loc_data_index4 ON loc_data (data_pro_id, data_type_id);--
CREATE INDEX sta_data_index1 ON sta_data (cli_id, sta_id);-- 
CREATE INDEX sta_data_index2 ON sta_data (cli_id, data_pro_id);-- 
CREATE INDEX sta_data_index3 ON sta_data (data_type_id);-- 
CREATE INDEX sta_data_index4 ON sta_data (data_pro_id, data_type_id);--

CREATE INDEX data_def_alert_definition_index1 ON data_def_alert_definition(data_def_id);--
CREATE INDEX data_def_alert_definition_index2 ON data_def_alert_definition(alert_def_id);--

CREATE INDEX gen_alert_index1 ON gen_alert(cli_id, gen_id, alert_def_id);--
CREATE INDEX sta_alert_index1 ON sta_alert(cli_id, sta_id, alert_def_id);--
CREATE INDEX loc_alert_index1 ON loc_alert(cli_id, loc_id, alert_def_id);--

CREATE INDEX gen_alert_index2 ON gen_alert(cli_id, gen_id, alert_date_send);--
CREATE INDEX sta_alert_index2 ON sta_alert(cli_id, sta_id, alert_date_send);--
CREATE INDEX loc_alert_index2 ON loc_alert(cli_id, loc_id, alert_date_send);--

CREATE INDEX alert_processing_index1 ON alert_processing (cli_id);--
CREATE INDEX alert_processing_index3 ON alert_processing (cli_id, loc_id);--

CREATE INDEX data_pro_alert_processing_index1 ON data_pro_alert_processing(data_pro_id);--
CREATE INDEX data_pro_alert_processing_index2 ON data_pro_alert_processing(alert_pro_id);--

CREATE INDEX fk_data_def_tri_index2 ON cli_data_def_trigger (tri_source, tri_value);--

CREATE INDEX loc_usr_rep_type_index1 ON loc_usr_rep_type (cli_id, loc_id);--

CREATE INDEX loc_est_index1 ON loc_estimation (cli_id, loc_id);--

CREATE INDEX gen_data_index5 ON gen_data (cli_id, data_date);--