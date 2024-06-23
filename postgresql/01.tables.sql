CREATE TABLE chart (
  chr_id_auto SERIAL NOT NULL,
  chr_name VARCHAR(100) NULL,
  chr_title VARCHAR(200) NULL,
  chr_description VARCHAR(500) NULL,
  chr_flags VARCHAR(20) NULL,
  chr_url VARCHAR(255) NULL
);--

CREATE TABLE client (
  cli_id_auto SERIAL NOT NULL,
  cli_name VARCHAR(100) NULL,
  cli_name_legal VARCHAR(200) NULL,
  cli_name_address VARCHAR(500) NULL,
  cli_flags VARCHAR(20) NULL,
  cli_gmt VARCHAR(8) NULL,
  cli_demo_date timestamp without time zone,
  data_def_id INTEGER NULL,
  cli_sec_code varchar(512)
);--

CREATE TABLE cli_user (
  cli_id INTEGER NOT NULL,
  usr_id INTEGER NOT NULL,
  cli_user_date_added timestamp with time zone NOT NULL,
  cli_user_date_access timestamp with time zone
);--

CREATE TABLE data_definition (
  data_def_id_auto SERIAL NOT NULL,
  data_def_name VARCHAR(100) NULL,
  data_def_description VARCHAR(500) NULL,
  data_def_executable VARCHAR(500) NULL,
  data_def_flags VARCHAR(20) NULL
);--

CREATE TABLE data_processing (
  data_pro_id_auto SERIAL NOT NULL,
  data_def_id INTEGER NOT NULL,
  cli_id INTEGER NOT NULL,
  loc_id INTEGER NULL,
  gen_id INTEGER NULL,
  tri_id INTEGER NULL,
  data_pro_file_name VARCHAR(100) NULL,
  data_pro_date_start timestamp with time zone NULL,
  data_pro_date_end timestamp with time zone NULL,
  data_pro_result INTEGER NULL,
  data_pro_file_log VARCHAR(100) NULL
);--

CREATE TABLE data_type (
  data_type_id INTEGER NOT NULL,
  data_type_name VARCHAR(100) NULL,
  data_type_units VARCHAR(100) NULL,
  data_type_description VARCHAR(200) NULL,
  data_cat_id INTEGER NULL
);--

CREATE TABLE document (
  cli_id INTEGER NOT NULL,
  doc_id_auto SERIAL NOT NULL,
  doc_name VARCHAR(200) NULL,
  doc_type_id INTEGER NULL,
  doc_date_added timestamp with time zone NULL,
  doc_date_from timestamp with time zone NULL,
  doc_date_to timestamp with time zone NULL,
  doc_flags VARCHAR(20) NULL,
  doc_observations VARCHAR(500) NULL,
  doc_file VARCHAR(200) NULL,
  doc_file_name VARCHAR(200) NULL,
  doc_file_size double precision NULL,
  doc_file_content TEXT NULL
);--

CREATE TABLE doc_generator (
  cli_id INTEGER NOT NULL,
  doc_id INTEGER NOT NULL,
  gen_id INTEGER NOT NULL
);--

CREATE TABLE doc_location (
  cli_id INTEGER NOT NULL,
  doc_id INTEGER NOT NULL,
  loc_id INTEGER NOT NULL
);--

CREATE TABLE doc_station (
  cli_id INTEGER NOT NULL,
  doc_id INTEGER NOT NULL,
  sta_id INTEGER NOT NULL
);--

CREATE TABLE functionality (
  fnc_id_auto SERIAL NOT NULL,
  fnc_name VARCHAR(100) NULL,
  fnc_title VARCHAR(200) NULL,
  fnc_description VARCHAR(500) NULL,
  fnc_flags VARCHAR(20) NULL,
  fnc_url varchar(255) NULL,
  fnc_order INTEGER NULL
);--

CREATE TABLE generator (
  cli_id INTEGER NOT NULL,
  gen_id_auto SERIAL NOT NULL,
  data_def_id INTEGER NULL,
  loc_id INTEGER NULL,
  gen_name VARCHAR(100) NULL,
  gen_description VARCHAR(200) NULL,
  gen_coord_lat double precision NULL,
  gen_coord_lng double precision NULL,
  gen_brand VARCHAR(100) NULL,
  gen_model VARCHAR(100) NULL,
  gen_serial_num VARCHAR(100) NULL,
  gen_rate_power double precision NULL,
  gen_flags VARCHAR(20) NULL,
  gen_code VARCHAR(100) NULL,
  gen_data_date_max timestamp without time zone NULL,
  gen_data_date_min timestamp without time zone NULL
);--

CREATE TABLE gen_data (
  cli_id INTEGER NOT NULL,
  gen_id INTEGER NOT NULL,
  data_date timestamp without time zone NOT NULL,
  data_type_id INTEGER NOT NULL,
  data_pro_id INTEGER NOT NULL,
  data_value double precision NULL,
  data_date_added timestamp with time zone NULL
);--

CREATE TABLE gen_metadata (
  cli_id INTEGER NOT NULL,
  gen_id INTEGER NOT NULL,
  metadata_code VARCHAR(100) NOT NULL,
  metadata_title VARCHAR(200) NULL,
  metadata_value VARCHAR(200) NULL,
  metadata_date_added timestamp with time zone NULL
);--

CREATE TABLE gen_statistic (
  cli_id INTEGER NOT NULL,
  gen_id INTEGER NOT NULL,
  stat_date timestamp without time zone NOT NULL,
  stat_type_id INTEGER NOT NULL,
  stat_pro_id INTEGER NOT NULL,
  stat_value double precision NULL,
  stat_date_added timestamp with time zone NULL
);--

CREATE TABLE location (
  cli_id INTEGER NOT NULL,
  loc_id_auto SERIAL NOT NULL,
  data_def_id INTEGER NULL,
  loc_name VARCHAR(100) NULL,
  loc_address VARCHAR(500) NULL,
  loc_state VARCHAR(100) NULL,
  loc_coord_lat double precision NULL,
  loc_coord_lng double precision NULL,
  loc_flags VARCHAR(20) NULL,
  loc_code VARCHAR(100) NULL,
  loc_output_capacity double precision NULL,
  loc_output_total_capacity double precision NULL,
  loc_reference_density double precision NULL,
  loc_data_date_max timestamp without time zone NULL,
  loc_data_date_min timestamp without time zone NULL,
  loc_type varchar(50) NULL,
  loc_gmt VARCHAR(8) NULL,
  loc_demo_date timestamp without time zone,
  ctr_id INTEGER NULL,
  loc_type_id INTEGER NULL
);--

CREATE TABLE loc_user (
  cli_id INTEGER NOT NULL,
  loc_id INTEGER NOT NULL,
  usr_id INTEGER NOT NULL,
  cli_user_date_added timestamp with time zone NOT NULL,
  cli_user_date_access timestamp with time zone
);--

CREATE TABLE loc_data (
  cli_id INTEGER NOT NULL,
  loc_id INTEGER NOT NULL,
  data_date timestamp without time zone NOT NULL,
  data_type_id INTEGER NOT NULL,
  data_pro_id INTEGER NOT NULL,
  data_value double precision NULL,
  data_date_added timestamp with time zone NULL
);--

CREATE TABLE loc_metadata (
  cli_id INTEGER NOT NULL,
  loc_id INTEGER NOT NULL,
  metadata_name VARCHAR(100) NOT NULL,
  metadata_title VARCHAR(200) NULL,
  metadata_value VARCHAR(200) NULL,
  metadata_date_added timestamp with time zone NULL
);--

CREATE TABLE loc_statistic (
  cli_id INTEGER NOT NULL,
  loc_id INTEGER NOT NULL,
  stat_date timestamp without time zone NOT NULL,
  stat_type_id INTEGER NOT NULL,
  stat_pro_id INTEGER NOT NULL,
  stat_value double precision NULL,
  stat_date_added timestamp with time zone NULL
);--

CREATE TABLE prf_functionality (
  prf_id INTEGER NOT NULL,
  fnc_id INTEGER NOT NULL
);--

CREATE TABLE profile (
  prf_id_auto SERIAL NOT NULL,
  prf_name VARCHAR(100) NULL,
  prf_description VARCHAR(500) NULL,
  prf_flags VARCHAR(20) NULL
);--

CREATE TABLE report (
  cli_id INTEGER NOT NULL,
  rep_id_auto SERIAL NOT NULL,
  rep_date_generated timestamp with time zone NULL,
  rep_date_from timestamp with time zone NULL,
  rep_date_to timestamp with time zone NULL,
  rep_title VARCHAR(200) NULL,
  rep_file VARCHAR(100) NULL,
  rep_flags VARCHAR(20) NULL,
  rep_type_id INTEGER NULL,
  reg_file VARCHAR(200) NULL
);--

CREATE TABLE rep_type (
  rep_type_id_auto SERIAL NOT NULL,
  rep_type_name VARCHAR(100) NULL,
  rep_type_title VARCHAR(200) NULL,
  rep_flags VARCHAR(20) NULL,
  rep_executable VARCHAR(500) NOT NULL,
  rep_order INTEGER NOT NULL
);--

CREATE TABLE station (
  cli_id INTEGER NOT NULL,
  sta_id_auto SERIAL NOT NULL,
  data_def_id INTEGER NULL,
  loc_id INTEGER NULL,
  sta_name VARCHAR(100) NULL,
  sta_description VARCHAR(200) NULL,
  sta_coord_lat double precision NULL,
  sta_coord_lng double precision NULL,
  sta_flags VARCHAR(20) NULL,
  sta_code VARCHAR(100) NULL,
  sta_data_date_max timestamp without time zone NULL,
  sta_data_date_min timestamp without time zone NULL
);--

CREATE TABLE stat_definition (
  stat_def_id_auto SERIAL NOT NULL,
  stat_def_name VARCHAR(100) NULL,
  stat_def_description VARCHAR(500) NULL,
  stat_def_executable VARCHAR(500) NULL,
  stat_def_flags VARCHAR(20) NULL,
  stat_def_type INTEGER NULL
);--

CREATE TABLE stat_def_result (
  stat_def_id INTEGER NOT NULL,
  stat_type_id INTEGER NOT NULL
);--

CREATE TABLE stat_def_source (
  stat_def_id INTEGER NOT NULL,
  data_type_id INTEGER NOT NULL
);--

CREATE TABLE stat_processing (
  stat_pro_id_auto SERIAL NOT NULL,
  stat_def_id INTEGER NOT NULL,
  cli_id INTEGER NOT NULL,
  stat_pro_date_start timestamp with time zone NULL,
  stat_pro_date_end timestamp with time zone NULL,
  stat_pro_result INTEGER NULL,
  stat_pro_file_log VARCHAR(100) NULL,
  stat_pro_type INTEGER NULL
);--

CREATE TABLE stat_type (
  stat_type_id INTEGER NOT NULL,
  stat_type_name VARCHAR(100) NULL,
  stat_type_unit VARCHAR(100) NULL,
  stat_type_description VARCHAR(200) NULL
);--

CREATE TABLE sta_data (
  cli_id INTEGER NOT NULL,
  sta_id INTEGER NOT NULL,
  data_date timestamp without time zone NOT NULL,
  data_type_id INTEGER NOT NULL,
  data_pro_id INTEGER NOT NULL,
  data_value double precision NOT NULL,
  data_date_added timestamp with time zone NOT NULL
);--

CREATE TABLE sta_metadata (
  cli_id INTEGER NOT NULL,
  sta_id INTEGER NOT NULL,
  metadata_name VARCHAR(100) NOT NULL,
  metadata_title VARCHAR(200) NULL,
  metadata_value VARCHAR(200) NULL,
  metadata_date_added timestamp with time zone NULL
);--

CREATE TABLE sta_statistic (
  cli_id INTEGER NOT NULL,
  sta_id INTEGER NOT NULL,
  stat_date timestamp without time zone NOT NULL,
  stat_type_id INTEGER NOT NULL,
  stat_pro_id INTEGER NOT NULL,
  stat_value double precision NOT NULL,
  stat_date_added timestamp with time zone NULL
);--

CREATE TABLE users (
  usr_id_auto SERIAL NOT NULL,
  usr_email VARCHAR(500) NULL,
  usr_name VARCHAR(100) NULL,
  usr_flags VARCHAR(20) NULL,
  usr_password VARCHAR(500) NULL,
  usr_date_login timestamp with time zone NULL,
  usr_date_added timestamp with time zone NULL,
  usr_date_locked timestamp with time zone NULL,
  usr_comments VARCHAR(500) NULL,
  usr_pwd_reset_requested timestamp with time zone NULL,
  usr_pwd_reset_uuid VARCHAR(500) NULL
);--

CREATE TABLE usr_profile (
  usr_id INTEGER NOT NULL,
  prf_id INTEGER NOT NULL,
  cli_id INTEGER NOT NULL,
  usr_prf_date_added timestamp with time zone NULL
);--


CREATE TABLE gen_power (
  cli_id INTEGER NOT NULL,
  gen_id INTEGER NOT NULL,
  pwr_wind_speed double precision NOT NULL,
  pwr_air_density double precision NOT NULL,
  gen_power double precision NULL
);--


CREATE TABLE data_def_stat_definition (
  data_def_id INTEGER NOT NULL,
  stat_def_id INTEGER NOT NULL,
  stat_def_call_order INTEGER NULL
);--

CREATE TABLE data_pro_stat_processing (
  data_pro_id INTEGER NOT NULL,
  stat_pro_id INTEGER NOT NULL
);--


CREATE TABLE wea_call (
  cli_id INTEGER NOT NULL,
  wea_id INTEGER NOT NULL,
  wea_call_id_auto SERIAL NOT NULL,
  wea_call_date timestamp with time zone NULL,
  wea_call_resonse_status INTEGER null,
  wea_call_response TEXT NULL
);--


CREATE TABLE wea_definition (
  cli_id INTEGER NOT NULL,
  wea_id_auto SERIAL NOT NULL,
  wea_name VARCHAR(200) NULL,
  wea_description VARCHAR(500) NULL,
  wea_coord_lat double precision NULL,
  wea_coord_lng double precision NULL,
  wea_check_type INTEGER NULL,
  wea_check_frequency INTEGER NULL,
  wea_flags VARCHAR(20) NULL
);--


CREATE TABLE  gen_alarm (
  cli_id INTEGER NOT NULL,
  gen_id INTEGER NOT NULL,
  alarm_code double precision NOT NULL,
  alarm_description varchar(1000),
  data_cat_id INTEGER NULL
);--

CREATE TABLE  loc_gen_alarm (
  cli_id INTEGER NOT NULL,
  loc_id INTEGER NOT NULL,
  alarm_code double precision NOT NULL,
  alarm_description varchar(1000),
  data_cat_id INTEGER NULL
);--

CREATE TABLE  cli_gen_alarm (
  cli_id INTEGER NOT NULL,
  alarm_code double precision NOT NULL,
  alarm_description varchar(1000),
  data_cat_id INTEGER NULL
);--






CREATE TABLE alert_definition (
  alert_def_id_auto SERIAL NOT NULL,
  alert_def_name VARCHAR(100) NULL,
  alert_def_description VARCHAR(500) NULL,
  alert_def_executable VARCHAR(500) NULL,
  alert_def_flags VARCHAR(20) NULL
);--


CREATE TABLE gen_alert (
  cli_id INTEGER NOT NULL,
  gen_id INTEGER NOT NULL,
  alert_def_id INTEGER NOT NULL,
  alert_pro_id INTEGER NOT NULL,
  alert_date_added timestamp with time zone NULL,
  alert_date_send timestamp with time zone NULL,
  alert_message varchar(2000)
);--


CREATE TABLE loc_alert (
  cli_id INTEGER NOT NULL,
  loc_id INTEGER NOT NULL,
  alert_def_id INTEGER NOT NULL,
  alert_pro_id INTEGER NOT NULL,
  alert_date_added timestamp with time zone NULL,
  alert_date_send timestamp with time zone NULL,
  alert_message varchar(2000)
);--


CREATE TABLE sta_alert (
  cli_id INTEGER NOT NULL,
  sta_id INTEGER NOT NULL,
  alert_def_id INTEGER NOT NULL,
  alert_pro_id INTEGER NOT NULL,
  alert_date_added timestamp with time zone NULL,
  alert_date_send timestamp with time zone NULL,
  alert_message varchar(2000)
);--


CREATE TABLE data_def_alert_definition (
  data_def_id INTEGER NOT NULL,
  alert_def_id INTEGER NOT NULL,
  alert_def_call_order INTEGER NULL
);--


CREATE TABLE alert_processing (
  alert_pro_id_auto SERIAL NOT NULL,
  alert_def_id INTEGER NOT NULL,
  cli_id INTEGER NOT NULL,
  loc_id INTEGER NULL,
  alert_pro_file_name VARCHAR(100) NULL,
  alert_pro_date_start timestamp with time zone NULL,
  alert_pro_date_end timestamp with time zone NULL,
  alert_pro_result INTEGER NULL,
  alert_pro_file_log VARCHAR(100) NULL
);--


CREATE TABLE data_pro_alert_processing (
  data_pro_id INTEGER NOT NULL,
  alert_pro_id INTEGER NOT NULL
);--


CREATE TABLE cli_data_def_trigger (
  tri_id_auto SERIAL NOT NULL,
  tri_name VARCHAR(255) NOT NULL,
  cli_id INTEGER NULL,
  loc_id INTEGER NULL,
  gen_id INTEGER NULL,
  sta_id INTEGER NULL,
  data_def_id INTEGER NOT NULL,
  tri_source INTEGER NOT NULL,
  tri_value VARCHAR(200),
  tri_flags VARCHAR(20)
);--


CREATE TABLE loc_usr_rep_type (
  cli_id INTEGER NOT NULL,
  loc_id INTEGER NOT NULL,
  usr_id INTEGER NOT NULL,
  rep_type_id INTEGER NOT NULL,
  loc_usr_rep_type_flags VARCHAR(20) NULL
);--

create table usr_setting (
  usr_id INTEGER NOT NULL,
  usr_set_name VARCHAR(200) NOT NULL,
  usr_set_value VARCHAR(200)
);--


create table loc_estimation (
  cli_id INTEGER NOT NULL,
  loc_id INTEGER NOT NULL,
  loc_est_id_auto SERIAL NOT NULL,
  loc_est_order INTEGER NOT NULL,
  loc_est_title varchar(200) NOT NULL,
  loc_est_01 double precision NULL,
  loc_est_02 double precision NULL,
  loc_est_03 double precision NULL,
  loc_est_04 double precision NULL,
  loc_est_05 double precision NULL,
  loc_est_06 double precision NULL,
  loc_est_07 double precision NULL,
  loc_est_08 double precision NULL,
  loc_est_09 double precision NULL,
  loc_est_10 double precision NULL,
  loc_est_11 double precision NULL,
  loc_est_12 double precision NULL
);--

create table cli_setting (
  cli_id INTEGER NOT NULL,
  cli_set_name VARCHAR(200) NOT NULL,
  cli_set_value VARCHAR(200)
);--


--- DATA MODEL ML INFORMATION ---
CREATE TABLE loc_data_mdl_ml_sanitized (
  cli_id INTEGER NOT NULL,
  loc_id INTEGER NOT NULL,
  data_pro_id INTEGER NOT NULL,
  data_stat_id INTEGER NOT NULL,
  data_date timestamp without time zone NOT NULL,
  data_value_401 double precision NULL,
  data_value_402 double precision NULL,
  data_date_added timestamp with time zone NULL
);--

CREATE TABLE gen_data_mdl_ml_sanitized (
  cli_id INTEGER NOT NULL,
  loc_id INTEGER NOT NULL,
  gen_id INTEGER NOT NULL,
  data_pro_id INTEGER NOT NULL,
  data_stat_id INTEGER NOT NULL,
  data_date timestamp without time zone NOT NULL,
  data_value_201 double precision NULL,
  data_value_202 double precision NULL,
  data_value_204 double precision NULL,
  data_value_205 double precision NULL,
  data_value_257 double precision NULL,
  data_date_added timestamp with time zone NULL
);--

CREATE TABLE sta_data_mdl_ml_sanitized (
  cli_id INTEGER NOT NULL,
  loc_id INTEGER NOT NULL,
  sta_id INTEGER NOT NULL,
  data_pro_id INTEGER NOT NULL,
  data_stat_id INTEGER NOT NULL,
  data_date timestamp without time zone NOT NULL,
  data_value_303 double precision NULL,
  data_value_304 double precision NULL,
  data_value_305 double precision NULL,
  data_date_added timestamp with time zone NOT NULL
);--

CREATE TABLE data_mdl_ml (
  cli_id INTEGER NOT NULL,
  loc_id INTEGER NOT NULL,
  gen_id INTEGER NOT NULL,
  data_pro_id INTEGER NOT NULL,
  data_mdl_id INTEGER NOT NULL,
  data_mdl_date timestamp without time zone NOT NULL,
  data_date_added timestamp with time zone NOT NULL,
  loc_pwr_at_limit INTEGER,
  loc_network_limitation INTEGER,
  loc_pwr_generated double precision, --(mw)
  loc_pwr_max double precision, --(mw)
  gen_alarm double precision,
  gen_output_min double precision,
  gen_output_avg double precision,
  gen_output_max double precision,
  gen_wind_speed_min double precision,
  gen_wind_speed_avg double precision,
  gen_wind_speed_max double precision,
  gen_wind_speed_sd double precision,
  gen_turbulence_intensity double precision,
  gen_wind_direction double precision,
  gen_temperature_min double precision,
  gen_temperature_avg double precision,
  gen_temperature_max double precision,
  gen_rpm_min double precision,
  gen_rpm_avg double precision,
  gen_rpm_max double precision,
  gen_bearing_temperature_avg double precision,
  gen_phase1_temperature_avg double precision,
  gen_rotor_rpm_min double precision,
  gen_rotor_rpm_avg double precision,
  gen_rotor_rpm_max double precision,
  gen_blades_pitch_angle_min double precision,
  gen_blades_pitch_angle_avg double precision,
  gen_blades_pitch_angle_max double precision,
  sta_temp_avg double precision,
  sta_temp_max double precision,
  sta_temp_min double precision,
  sta_hum double precision,
  sta_pres double precision,
  sta_wind_avg double precision,
  sta_wind_max double precision,
  sta_wind_min double precision,
  gen_latitude double precision,
  gen_longitude double precision,
  gen_height double precision
);--

CREATE TABLE gen_neighbour (
  cli_id INTEGER NOT NULL,
  gen_id INTEGER NOT NULL,
  gen_id_neighbour INTEGER NOT NULL,
  gen_id_neighbour_position INTEGER NOT NULL
);--

CREATE TABLE data_category (
  data_cat_id_auto SERIAL NOT NULL,
  data_cat_name VARCHAR(255) NOT NULL,
  data_cat_description VARCHAR(255) NULL
);--


CREATE TABLE loc_weather_data (
  cli_id INTEGER NOT NULL,
  loc_id INTEGER NOT NULL,
  loc_wea_data_id_auto SERIAL NOT NULL,
  loc_wea_data_date timestamp with time zone NULL,
  loc_wea_data_resonse_status INTEGER null,
  loc_wea_data_response TEXT NULL
);--

CREATE TABLE loc_wea_data_hour (
  cli_id INTEGER NOT NULL,
  loc_id INTEGER NOT NULL,
  loc_wea_data_id INTEGER NOT NULL,
  loc_wea_data_hour timestamp with time zone NULL,
  loc_wea_data_retrieve timestamp with time zone NULL,
  loc_wea_data_response TEXT NULL
);--

CREATE TABLE doc_type (
	doc_type_id_auto SERIAL NOT NULL,
	doc_type_name VARCHAR(255) NOT NULL,
	doc_type_title VARCHAR(500) NOT NULL,
	doc_type_flags VARCHAR(20) NULL
);--

CREATE TABLE loc_data_weather (
  cli_id INTEGER NOT NULL,
  loc_id INTEGER NOT NULL,
  data_date_added timestamp with time zone NULL,
  data_date timestamp without time zone NOT NULL,
  data_type_id INTEGER NOT NULL,
  data_pro_id INTEGER NOT NULL,
  data_value double precision NULL
);--

CREATE TABLE cli_loc_usr_setting (
  cli_id INTEGER NOT NULL,
  loc_id INTEGER NOT NULL,
  usr_id INTEGER NOT NULL,
  cli_loc_alert_flags VARCHAR(20) NULL
);--

CREATE TABLE cli_loc_alert (
  cli_id INTEGER NOT NULL,
  loc_id INTEGER NOT NULL,
  cli_loc_alert_id_auto SERIAL NOT NULL,
  cli_loc_alert_added timestamp without time zone NOT NULL,
  cli_loc_alert_type INTEGER NOT NULL,
  cli_loc_alert_data varchar,
  cli_loc_alert_flags varchar(20) DEFAULT '00000',
  cli_loc_alert_trigger timestamp without time zone NOT NULL
);--

CREATE TABLE cli_loc_usr_alert (
  cli_id INTEGER,
  loc_id INTEGER,
  usr_id INTEGER,
  cli_loc_alert_id INTEGER,
  cli_loc_usr_alert_send_date timestamp without time zone NOT NULL,
  cli_loc_usr_alert_send_result VARCHAR
);--


CREATE TABLE cli_gen_alert (
  cli_id INTEGER NOT NULL,
  gen_id INTEGER NOT NULL,
  cli_gen_alert_id_auto SERIAL NOT NULL,
  cli_gen_alert_added timestamp without time zone NOT NULL,
  cli_gen_alert_type INTEGER NOT NULL,
  cli_gen_alert_data varchar,
  cli_gen_alert_flags varchar(20) DEFAULT '00000',
  cli_gen_alert_trigger timestamp without time zone NOT NULL
);--

CREATE TABLE cli_gen_usr_alert (
  cli_id INTEGER,
  gen_id INTEGER,
  usr_id INTEGER,
  cli_gen_alert_id INTEGER,
  cli_gen_usr_alert_send_date timestamp without time zone NOT NULL,
  cli_gen_usr_alert_send_result VARCHAR
);--


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

CREATE TABLE data_def_parameter (
  data_def_id INTEGER NOT NULL,
  data_def_par_id_auto SERIAL NOT NULL,
  data_def_par_name VARCHAR(100) NOT NULL,
  data_def_description VARCHAR(500) NULL
);--


CREATE TABLE cli_data_def_parameter (
  cli_id INTEGER NOT NULL,
  data_def_id INTEGER NOT NULL,
  data_def_par_id INTEGER NOT NULL,
  cli_data_def_par_value VARCHAR(255) NOT NULL
);--


CREATE TABLE loc_data_def_parameter (
  cli_id INTEGER NOT NULL,
  loc_id INTEGER NOT NULL,
  data_def_id INTEGER NOT NULL,
  data_def_par_id INTEGER NOT NULL,
  loc_data_def_par_value VARCHAR(255) NOT NULL
);--


CREATE TABLE gen_data_def_parameter (
  cli_id INTEGER NOT NULL,
  gen_id INTEGER NOT NULL,
  data_def_id INTEGER NOT NULL,
  data_def_par_id INTEGER NOT NULL,
  gen_data_def_par_value VARCHAR(255) NOT NULL
);--


CREATE TABLE cli_metadata (
  cli_id INTEGER NOT NULL,
  metadata_name VARCHAR(100) NOT NULL,
  metadata_title VARCHAR(200) NULL,
  metadata_value VARCHAR(200) NULL,
  metadata_date_added timestamp with time zone NULL
);--

CREATE TABLE country (
  ctr_id_auto SERIAL NOT NULL,
  ctr_name VARCHAR(120) NOT NULL,
  ctr_name_show VARCHAR(120) NOT NULL,
  ctr_code_2 VARCHAR(2) NULL,
  ctr_code_3 VARCHAR(3) NULL,
  ctr_data_date_max timestamp without time zone NULL,
  ctr_data_date_min timestamp without time zone NULL
);--

CREATE TABLE ctr_data (
  ctr_id INTEGER NOT NULL,
  data_date timestamp without time zone NOT NULL,
  data_type_id INTEGER NOT NULL,
  data_pro_id INTEGER NULL,
  data_value double precision NULL,
  data_date_added timestamp with time zone NULL
);--

CREATE TABLE sdg (
   sdg_id_auto SERIAL NOT NULL,
   sdg_code VARCHAR(10) NOT NULL,
   sdg_name VARCHAR(255) NOT NULL
);--

CREATE TABLE loc_sdg (
  cli_id INTEGER NOT NULL,
  loc_id INTEGER NOT NULL,
  sdg_id INTEGER NOT NULL,
  loc_sdg_description VARCHAR(1000)
);--


CREATE TABLE loc_type (
  loc_type_id_auto  SERIAL NOT NULL,
  loc_type_code VARCHAR(255),
  loc_type_text VARCHAR(255)
);--