INSERT INTO data_category (data_cat_name) VALUES ('Manufacturer');--
INSERT INTO data_category (data_cat_name) VALUES ('Environmental');--
INSERT INTO data_category (data_cat_name) VALUES ('Grid Curtailment');--
INSERT INTO data_category (data_cat_name) VALUES ('Service');--
INSERT INTO data_category (data_cat_name) VALUES ('Utility');--

INSERT INTO data_type (data_type_name, data_type_id) VALUES ('INVALID', -1);--

INSERT INTO data_type (data_type_name, data_type_id) VALUES ('LOCATION_OUTPUT_CAPACITY', 401);--
INSERT INTO data_type (data_type_name, data_type_id) VALUES ('LOCATION_POWER_KWH', 402);--

INSERT INTO data_type (data_type_name, data_type_id) VALUES ('SOLAR_OUTPUT_CAPACITY', 500);--
INSERT INTO data_type (data_type_name, data_type_id) VALUES ('SOLAR_DC_POWER', 501);--
INSERT INTO data_type (data_type_name, data_type_id) VALUES ('SOLAR_AC_POWER', 502);--
INSERT INTO data_type (data_type_name, data_type_id) VALUES ('SOLAR_AMBIENT_TEMPERATURE', 503);--
INSERT INTO data_type (data_type_name, data_type_id) VALUES ('SOLAR_MODULE_TEMPERATURE', 504);--
INSERT INTO data_type (data_type_name, data_type_id) VALUES ('SOLAR_IRRADIATION', 505);--
INSERT INTO data_type (data_type_name, data_type_id) VALUES ('TYPE_SOLAR_STATION_TOTAL_CLOUD_COVER', 506);--
INSERT INTO data_type (data_type_name, data_type_id) VALUES ('TYPE_SOLAR_STATION_PRECIPITATION', 507);--
INSERT INTO data_type (data_type_name, data_type_id) VALUES ('SOLAR_AC_POWER_PREDICTION', 508);--

INSERT INTO data_type (data_type_name, data_type_id) VALUES ('COUNTRY_EMISSIONS_INTENSITY_GCO2_PER_KWH', 901);--

insert into stat_type (stat_type_name, stat_type_id) values ('COMMON_TIME_BASED_AVAILABILITY', 101);--
insert into stat_type (stat_type_name, stat_type_id) values ('COMMON_CAPACITY_FACTOR', 102);--
insert into stat_type (stat_type_name, stat_type_id) values ('COMMON_MWH_GENERATED_FOR_PERIOD', 103);--
insert into stat_type (stat_type_name, stat_type_id) values ('COMMON_TEMPERATURE', 105);--
insert into stat_type (stat_type_name, stat_type_id) values ('LOCATION_MWH_GENERATED_PERIOD', 201);--
insert into stat_type (stat_type_name, stat_type_id) values ('MANUFACTURER_POWER_CURVE', 301);--
insert into stat_type (stat_type_name, stat_type_id) values ('GENERATOR_IEC_CURVE', 401);--
insert into stat_type (stat_type_name, stat_type_id) values ('GENERATOR_OPERATION_DATA', 402);--
insert into stat_type (stat_type_name, stat_type_id) values ('GENERATOR_PERFORMANCE_INDEX', 403);--
insert into stat_type (stat_type_name, stat_type_id) values ('GENERATOR_PERFORMANCE_MWH', 404);--

insert into stat_definition (stat_def_name, stat_def_description, stat_def_executable, stat_def_flags, stat_def_type) values ('Overview solar', 'Mostrar KPIs: totalProduction, totalIrradiation, avgAmbientTemp, avgModuleTemp, timeBasedAvailability, specificYield, performanceRatio for period.', 'tech.renovus.solarec.business.impl.chart.solar.OverviewChart', null, 1);--
insert into stat_definition (stat_def_name, stat_def_description, stat_def_executable, stat_def_flags, stat_def_type) values ('Performance Index solar', 'Indice de performance (100% = Esperado) y su evolución en el tiempo. Ejemplo gráfica de abajo, solo línea negra', 'tech.renovus.solarec.business.impl.chart.solar.PerformanceIndex', null, 1);--
insert into stat_definition (stat_def_name, stat_def_description, stat_def_executable, stat_def_flags, stat_def_type) values ('Climate solar', 'Condiciones climáticas para período seleccionado.', 'tech.renovus.solarec.business.impl.chart.solar.Climate', null, 1);--
insert into stat_definition (stat_def_name, stat_def_description, stat_def_executable, stat_def_flags, stat_def_type) values ('Power curve (Solar)', 'Curva de potencia mostrando los puntos de potencia solar', 'tech.renovus.solarec.business.impl.chart.solar.PowerCurve', null, 1);--

insert into stat_definition (stat_def_name, stat_def_description, stat_def_executable, stat_def_flags, stat_def_type) values ('Emissions CO2', 'Information regarding CO2 emissions in a country in a period of time.', 'tech.renovus.solarec.business.impl.chart.solar.EmissionsCo2', null, 1);--
insert into stat_definition (stat_def_name, stat_def_description, stat_def_executable, stat_def_flags, stat_def_type) values ('Certificates sales', 'Information regarding the sales of certificates for a client in a period of time.', 'tech.renovus.solarec.business.impl.chart.solar.CertificatesSales', null, 1);--
insert into stat_definition (stat_def_name, stat_def_description, stat_def_executable, stat_def_flags, stat_def_type) values ('Certificates', 'Information regarding the certificates of a client in a period of time.', 'tech.renovus.solarec.business.impl.chart.solar.Certificates', null, 1);--

insert into rep_type (rep_type_name, rep_type_title, rep_flags, rep_executable, rep_order) values ('WEEKLY', 'Weekly', '100110', 'tech.renovus.solarec.business.impl.report.ReportWeekly', 1);--

INSERT INTO profile (prf_name,prf_description,prf_flags) VALUES ('Administrador','',null);-- 1
INSERT INTO profile (prf_name,prf_description,prf_flags) VALUES ('Usuario','',null);-- 2
insert into profile (prf_name, prf_description) values ('DEV', 'Sólo para tener acceso a funcionalidades en desarrollo'); --3

INSERT INTO functionality (fnc_name,fnc_title,fnc_description,fnc_flags,fnc_url,fnc_order) VALUES ('CURRENT_STATUS_NOW','Current Status (now)','','','/dashboard', 1);-- 1
INSERT INTO functionality (fnc_name,fnc_title,fnc_description,fnc_flags,fnc_url,fnc_order) VALUES ('CURRENT_STATUS_!=','Current Status (10 min)','','','/modules/status/ten-min-average', 2);-- 2
INSERT INTO functionality (fnc_name,fnc_title,fnc_description,fnc_flags,fnc_url,fnc_order) VALUES ('OVERVIEW','Overview','','','/modules/overview', 3);-- 3
INSERT INTO functionality (fnc_name,fnc_title,fnc_description,fnc_flags,fnc_url,fnc_order) VALUES ('OVERVIEW_ALERTS','Alerts','','','/modules/overview/alerts', 4);-- 4
INSERT INTO functionality (fnc_name,fnc_title,fnc_description,fnc_flags,fnc_url,fnc_order) VALUES ('CLIMATE_SUMMARY','Summary','','','/modules/climate/summary', 5);-- 5
INSERT INTO functionality (fnc_name,fnc_title,fnc_description,fnc_flags,fnc_url,fnc_order) VALUES ('CLIMATE_TRENDS','Trends','','','/modules/climate/trends', 6);-- 6
INSERT INTO functionality (fnc_name,fnc_title,fnc_description,fnc_flags,fnc_url,fnc_order) VALUES ('CLIMATE_FORECAST','Forecast','','','/modules/climate/forecast', 7);-- 7
INSERT INTO functionality (fnc_name,fnc_title,fnc_description,fnc_flags,fnc_url,fnc_order) VALUES ('DATA_AVAILABILITY','Data Availability','','','/modules/data-availability', 8);-- 8
INSERT INTO functionality (fnc_name,fnc_title,fnc_description,fnc_flags,fnc_url,fnc_order) VALUES ('BUDGET','Budget','','','/modules/budget', 9);-- 9
INSERT INTO functionality (fnc_name,fnc_title,fnc_description,fnc_flags,fnc_url,fnc_order) VALUES ('SOLAR_BATERRY','Baterry','','','/modules/solar-battery', 10);-- 10
INSERT INTO functionality (fnc_name,fnc_title,fnc_description,fnc_flags,fnc_url,fnc_order) VALUES ('PERFORMANCE','Performance','','','/modules/performance', 11);-- 11
INSERT INTO functionality (fnc_name,fnc_title,fnc_description,fnc_flags,fnc_url,fnc_order) VALUES ('PC_SYMMARY','Summary','','','/modules/power-curve/summary', 12);-- 12
INSERT INTO functionality (fnc_name,fnc_title,fnc_description,fnc_flags,fnc_url,fnc_order) VALUES ('PC_ANALYZE','Analysis','','','/modules/power-curve/analysis', 13);-- 13
INSERT INTO functionality (fnc_name,fnc_title,fnc_description,fnc_flags,fnc_url,fnc_order) VALUES ('PC_BENCHMARK','Benchmark','','','/modules/power-curve/benchmark', 14);-- 14
INSERT INTO functionality (fnc_name,fnc_title,fnc_description,fnc_flags,fnc_url,fnc_order) VALUES ('ALARMS','Alarms','','','/modules/alarms', 15);-- 15
INSERT INTO functionality (fnc_name,fnc_title,fnc_description,fnc_flags,fnc_url,fnc_order) VALUES ('AVAILABILITY_LOSSES','Availability and Losses','','','/modules/availability-and-losses', 16);-- 16
INSERT INTO functionality (fnc_name,fnc_title,fnc_description,fnc_flags,fnc_url,fnc_order) VALUES ('DIAGNOSTIC','Diagnostic','','','/modules/diagnostics', 17);-- 17
INSERT INTO functionality (fnc_name,fnc_title,fnc_description,fnc_flags,fnc_url,fnc_order) VALUES ('CURTAILMENTS','Curtailments','','','/modules/curtailments', 18);-- 18
INSERT INTO functionality (fnc_name,fnc_title,fnc_description,fnc_flags,fnc_url,fnc_order) VALUES ('DOCUMENTS','Documents','','','/modules/maintenance', 19);-- 19
INSERT INTO functionality (fnc_name,fnc_title,fnc_description,fnc_flags,fnc_url,fnc_order) VALUES ('REPORT_SETTINGS','E-mail Settings','','','/modules/reports/settings', 20);-- 20
INSERT INTO functionality (fnc_name,fnc_title,fnc_description,fnc_flags,fnc_url,fnc_order) VALUES ('REPORT_GENERATE','Generate','','','/modules/reports/generate', 21);-- 21
INSERT INTO functionality (fnc_name,fnc_title,fnc_description,fnc_flags,fnc_url,fnc_order) VALUES ('SETTINGS','Settings','','','/user/settings', 22);-- 22
INSERT INTO functionality (fnc_name,fnc_title,fnc_description,fnc_flags,fnc_url,fnc_order) VALUES ('AI_ENERGY_GEN','Energy Generation','','','/modules/ai-analytics/energy-generation', 23);-- 23
INSERT INTO functionality (fnc_name,fnc_title,fnc_description,fnc_flags,fnc_url,fnc_order) VALUES ('AU_FAUL_ANALYSIS','Fault Analysis','','','/modules/ai-analytics/fault-analysis', 24);-- 24

INSERT INTO functionality (fnc_name,fnc_title,fnc_description,fnc_flags,fnc_url,fnc_order) VALUES ('CLI_SETTINGS', 'Client settings', '', '001', '/client/settings', 25);--
INSERT INTO functionality (fnc_name,fnc_title,fnc_description,fnc_flags,fnc_url,fnc_order) VALUES ('ENY_OVERVIEW', 'Energy Overview', '', '001', '/modules/energy/overview', 26);--
INSERT INTO functionality (fnc_name,fnc_title,fnc_description,fnc_flags,fnc_url,fnc_order) VALUES ('ENY_TRENDS', 'Energy Trends', '', '001', '/modules/energy/trends', 27);--
INSERT INTO functionality (fnc_name,fnc_title,fnc_description,fnc_flags,fnc_url,fnc_order) VALUES ('ENY_PERFORMANCE', 'Energy Performance', '', '001', '/modules/energy/performance', 28);--
INSERT INTO functionality (fnc_name,fnc_title,fnc_description,fnc_flags,fnc_url,fnc_order) VALUES ('ENY_REV_CERTS_OFFSETS', 'Revenue Certificates and Offsets', '', '001', '/modules/revenue/certificates-and-offsets', 29);--
INSERT INTO functionality (fnc_name,fnc_title,fnc_description,fnc_flags,fnc_url,fnc_order) VALUES ('ENY_REV_SALES', 'Revenye Sales', '', '001', '/modules/revenue/sales', 30);--

INSERT INTO functionality (fnc_name,fnc_title,fnc_description,fnc_flags,fnc_url, fnc_order) VALUES ('CLI_SETTINGS','Client Settings','','','/client/settings', 31);--

update functionality set fnc_flags = '011' where fnc_name = 'CURRENT_STATUS_NOW';
update functionality set fnc_flags = '010' where fnc_name = 'CURRENT_STATUS_!=';
update functionality set fnc_flags = '011' where fnc_name = 'OVERVIEW';
update functionality set fnc_flags = '010' where fnc_name = 'OVERVIEW_ALERTS';
update functionality set fnc_flags = '010' where fnc_name = 'CLIMATE_SUMMARY';
update functionality set fnc_flags = '011' where fnc_name = 'CLIMATE_TRENDS';
update functionality set fnc_flags = '011' where fnc_name = 'CLIMATE_FORECAST';
update functionality set fnc_flags = '010' where fnc_name = 'DATA_AVAILABILITY';
update functionality set fnc_flags = '010' where fnc_name = 'BUDGET';
update functionality set fnc_flags = '001' where fnc_name = 'SOLAR_BATERRY';
update functionality set fnc_flags = '011' where fnc_name = 'PERFORMANCE';
update functionality set fnc_flags = '010' where fnc_name = 'PC_SYMMARY';
update functionality set fnc_flags = '011' where fnc_name = 'PC_ANALYZE';
update functionality set fnc_flags = '011' where fnc_name = 'PC_BENCHMARK';
update functionality set fnc_flags = '010' where fnc_name = 'ALARMS';
update functionality set fnc_flags = '010' where fnc_name = 'AVAILABILITY_LOSSES';
update functionality set fnc_flags = '010' where fnc_name = 'DIAGNOSTIC';
update functionality set fnc_flags = '010' where fnc_name = 'CURTAILMENTS';
update functionality set fnc_flags = '010' where fnc_name = 'DOCUMENTS';
update functionality set fnc_flags = '010' where fnc_name = 'REPORT_SETTINGS';
update functionality set fnc_flags = '010' where fnc_name = 'REPORT_GENERATE';
update functionality set fnc_flags = '100' where fnc_name = 'SETTINGS';
update functionality set fnc_flags = '010' where fnc_name = 'AI_ENERGY_GEN';
update functionality set fnc_flags = '010' where fnc_name = 'AU_FAUL_ANALYSIS';

insert into prf_functionality (prf_id, fnc_id) select prf_id_auto, fnc_id_auto from profile p, functionality f;--

insert into settings(set_name, set_cat_name, set_type, set_unit, set_value_default, set_value_min, set_value_max, set_flags) values ('fiscalYearEndMonth', 'otherSettings', 'number', 'month', '12', '1', '12', '010');--
insert into settings(set_name, set_cat_name, set_type, set_unit, set_value_default, set_value_min, set_value_max, set_flags) values ('certSoldPorcentage', 'cert', 'number', '%', '50', '0', '100', '011');--
insert into settings(set_name, set_cat_name, set_type, set_unit, set_value_default, set_value_min, set_value_max, set_flags) values ('certPrice', 'cert', 'number', 'USD', '20', '0', null, '011');--
insert into settings(set_name, set_cat_name, set_type, set_unit, set_value_default, set_value_min, set_value_max, set_flags) values ('alertDataAvailabilityLowerThan', 'alerts', 'number', '%', '90', '0', '100', '011');--
insert into settings(set_name, set_cat_name, set_type, set_unit, set_value_default, set_value_min, set_value_max, set_flags) values ('alertNegativeChangeExceeding', 'alerts', 'number', '%', '6', '0', '100', '011');--
insert into settings(set_name, set_cat_name, set_type, set_unit, set_value_default, set_value_min, set_value_max, set_flags) values ('alertTimeBasedAvailabilityLowerThan', 'alerts', 'number', '%', '90', '0', '100', '011');--
insert into settings(set_name, set_cat_name, set_type, set_unit, set_value_default, set_value_min, set_value_max, set_flags) values ('language', 'otherSettings', 'language', 'language', 'EN', null, null, '101');

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
insert into country (ctr_name, ctr_name_show, ctr_code_2, ctr_code_3) values ('SOUTH SUDAN','South Sudan','SS','SSD');--

insert into sdg (sdg_code, sdg_name) values ('SDG 1', 'No poverty ');--
insert into sdg (sdg_code, sdg_name) values ('SDG 2', 'Zero hunger ');--
insert into sdg (sdg_code, sdg_name) values ('SDG 3', 'Good health and well-being');--
insert into sdg (sdg_code, sdg_name) values ('SDG 4', 'Quality education');--
insert into sdg (sdg_code, sdg_name) values ('SDG 5', 'Gender equality');--
insert into sdg (sdg_code, sdg_name) values ('SDG 6', 'Clean water and sanitation');--
insert into sdg (sdg_code, sdg_name) values ('SDG 7', 'Affordable and clean energy');--
insert into sdg (sdg_code, sdg_name) values ('SDG 8', 'Decent work and economic growth');--
insert into sdg (sdg_code, sdg_name) values ('SDG 9', 'Industry, innovation and infrastructure');--
insert into sdg (sdg_code, sdg_name) values ('SDG 10', 'Reduced inequalities');--
insert into sdg (sdg_code, sdg_name) values ('SDG 11', 'Sustainable cities and communities');-- 
insert into sdg (sdg_code, sdg_name) values ('SDG 12', 'Responsible consumption and production');--
insert into sdg (sdg_code, sdg_name) values ('SDG 13', 'Climate action ');--
insert into sdg (sdg_code, sdg_name) values ('SDG 14', 'Life below water');--
insert into sdg (sdg_code, sdg_name) values ('SDG 15', 'Life on land');--
insert into sdg (sdg_code, sdg_name) values ('SDG 16', 'Peace, justice, and strong institutions');-- 
insert into sdg (sdg_code, sdg_name) values ('SDG 17', 'Partnerships for the goals');--

insert into loc_type (loc_type_code, loc_type_text) values ('RES', 'Residential');--
insert into loc_type (loc_type_code, loc_type_text) values ('IND', 'Industrial');--
insert into loc_type (loc_type_code, loc_type_text) values ('RURAL', 'Rural');--
insert into loc_type (loc_type_code, loc_type_text) values ('COMM_EST', 'Commercial establishment');--


insert into loc_type (loc_type_code, loc_type_text) values ('BUS', 'Business');--
insert into loc_type (loc_type_code, loc_type_text) values ('NON_PRF', 'Non-profit');--
insert into loc_type (loc_type_code, loc_type_text) values ('PUB_SEC', 'Public sector');--
insert into loc_type (loc_type_code, loc_type_text) values ('EDU', 'Educational');--



UPDATE country SET ctr_code_phone = '+297' WHERE ctr_code_3 = 'ABW';--
UPDATE country SET ctr_code_phone = '+93' WHERE ctr_code_3 = 'AFG';--
UPDATE country SET ctr_code_phone = '+244' WHERE ctr_code_3 = 'AGO';--
UPDATE country SET ctr_code_phone = '+1-264' WHERE ctr_code_3 = 'AIA';--
UPDATE country SET ctr_code_phone = '+355' WHERE ctr_code_3 = 'ALB';--
UPDATE country SET ctr_code_phone = '+376' WHERE ctr_code_3 = 'AND';--
UPDATE country SET ctr_code_phone = '+599' WHERE ctr_code_3 = 'ANT';--
UPDATE country SET ctr_code_phone = '+971' WHERE ctr_code_3 = 'ARE';--
UPDATE country SET ctr_code_phone = '+54' WHERE ctr_code_3 = 'ARG';--
UPDATE country SET ctr_code_phone = '+374' WHERE ctr_code_3 = 'ARM';--
UPDATE country SET ctr_code_phone = '+1-684' WHERE ctr_code_3 = 'ASM';--
UPDATE country SET ctr_code_phone = '+1-268' WHERE ctr_code_3 = 'ATG';--
UPDATE country SET ctr_code_phone = '+61' WHERE ctr_code_3 = 'AUS';--
UPDATE country SET ctr_code_phone = '+43' WHERE ctr_code_3 = 'AUT';--
UPDATE country SET ctr_code_phone = '+994' WHERE ctr_code_3 = 'AZE';--
UPDATE country SET ctr_code_phone = '+257' WHERE ctr_code_3 = 'BDI';--
UPDATE country SET ctr_code_phone = '+32' WHERE ctr_code_3 = 'BEL';--
UPDATE country SET ctr_code_phone = '+229' WHERE ctr_code_3 = 'BEN';--
UPDATE country SET ctr_code_phone = '+226' WHERE ctr_code_3 = 'BFA';--
UPDATE country SET ctr_code_phone = '+880' WHERE ctr_code_3 = 'BGD';--
UPDATE country SET ctr_code_phone = '+359' WHERE ctr_code_3 = 'BGR';--
UPDATE country SET ctr_code_phone = '+973' WHERE ctr_code_3 = 'BHR';--
UPDATE country SET ctr_code_phone = '+1-242' WHERE ctr_code_3 = 'BHS';--
UPDATE country SET ctr_code_phone = '+387' WHERE ctr_code_3 = 'BIH';--
UPDATE country SET ctr_code_phone = '+375' WHERE ctr_code_3 = 'BLR';--
UPDATE country SET ctr_code_phone = '+501' WHERE ctr_code_3 = 'BLZ';--
UPDATE country SET ctr_code_phone = '+1-441' WHERE ctr_code_3 = 'BMU';--
UPDATE country SET ctr_code_phone = '+591' WHERE ctr_code_3 = 'BOL';--
UPDATE country SET ctr_code_phone = '+55' WHERE ctr_code_3 = 'BRA';--
UPDATE country SET ctr_code_phone = '+1-246' WHERE ctr_code_3 = 'BRB';--
UPDATE country SET ctr_code_phone = '+673' WHERE ctr_code_3 = 'BRN';--
UPDATE country SET ctr_code_phone = '+975' WHERE ctr_code_3 = 'BTN';--
UPDATE country SET ctr_code_phone = '+267' WHERE ctr_code_3 = 'BWA';--
UPDATE country SET ctr_code_phone = '+236' WHERE ctr_code_3 = 'CAF';--
UPDATE country SET ctr_code_phone = '+1' WHERE ctr_code_3 = 'CAN';--
UPDATE country SET ctr_code_phone = '+41' WHERE ctr_code_3 = 'CHE';--
UPDATE country SET ctr_code_phone = '+56' WHERE ctr_code_3 = 'CHL';--
UPDATE country SET ctr_code_phone = '+86' WHERE ctr_code_3 = 'CHN';--
UPDATE country SET ctr_code_phone = '+225' WHERE ctr_code_3 = 'CIV';--
UPDATE country SET ctr_code_phone = '+237' WHERE ctr_code_3 = 'CMR';--
UPDATE country SET ctr_code_phone = '+243' WHERE ctr_code_3 = 'COD';--
UPDATE country SET ctr_code_phone = '+242' WHERE ctr_code_3 = 'COG';--
UPDATE country SET ctr_code_phone = '+682' WHERE ctr_code_3 = 'COK';--
UPDATE country SET ctr_code_phone = '+57' WHERE ctr_code_3 = 'COL';--
UPDATE country SET ctr_code_phone = '+269' WHERE ctr_code_3 = 'COM';--
UPDATE country SET ctr_code_phone = '+238' WHERE ctr_code_3 = 'CPV';--
UPDATE country SET ctr_code_phone = '+506' WHERE ctr_code_3 = 'CRI';--
UPDATE country SET ctr_code_phone = '+53' WHERE ctr_code_3 = 'CUB';--
UPDATE country SET ctr_code_phone = '+1-345' WHERE ctr_code_3 = 'CYM';--
UPDATE country SET ctr_code_phone = '+357' WHERE ctr_code_3 = 'CYP';--
UPDATE country SET ctr_code_phone = '+420' WHERE ctr_code_3 = 'CZE';--
UPDATE country SET ctr_code_phone = '+49' WHERE ctr_code_3 = 'DEU';--
UPDATE country SET ctr_code_phone = '+253' WHERE ctr_code_3 = 'DJI';--
UPDATE country SET ctr_code_phone = '+1-767' WHERE ctr_code_3 = 'DMA';--
UPDATE country SET ctr_code_phone = '+45' WHERE ctr_code_3 = 'DNK';--
UPDATE country SET ctr_code_phone = '+1-809' WHERE ctr_code_3 = 'DOM';--
UPDATE country SET ctr_code_phone = '+213' WHERE ctr_code_3 = 'DZA';--
UPDATE country SET ctr_code_phone = '+593' WHERE ctr_code_3 = 'ECU';--
UPDATE country SET ctr_code_phone = '+20' WHERE ctr_code_3 = 'EGY';--
UPDATE country SET ctr_code_phone = '+291' WHERE ctr_code_3 = 'ERI';--
UPDATE country SET ctr_code_phone = '+212' WHERE ctr_code_3 = 'ESH';--
UPDATE country SET ctr_code_phone = '+34' WHERE ctr_code_3 = 'ESP';--
UPDATE country SET ctr_code_phone = '+372' WHERE ctr_code_3 = 'EST';--
UPDATE country SET ctr_code_phone = '+251' WHERE ctr_code_3 = 'ETH';--
UPDATE country SET ctr_code_phone = '+358' WHERE ctr_code_3 = 'FIN';--
UPDATE country SET ctr_code_phone = '+679' WHERE ctr_code_3 = 'FJI';--
UPDATE country SET ctr_code_phone = '+33' WHERE ctr_code_3 = 'FRA';--
UPDATE country SET ctr_code_phone = '+298' WHERE ctr_code_3 = 'FRO';--
UPDATE country SET ctr_code_phone = '+691' WHERE ctr_code_3 = 'FSM';--
UPDATE country SET ctr_code_phone = '+241' WHERE ctr_code_3 = 'GAB';--
UPDATE country SET ctr_code_phone = '+44' WHERE ctr_code_3 = 'GBR';--
UPDATE country SET ctr_code_phone = '+995' WHERE ctr_code_3 = 'GEO';--
UPDATE country SET ctr_code_phone = '+233' WHERE ctr_code_3 = 'GHA';--
UPDATE country SET ctr_code_phone = '+350' WHERE ctr_code_3 = 'GIB';--
UPDATE country SET ctr_code_phone = '+224' WHERE ctr_code_3 = 'GIN';--
UPDATE country SET ctr_code_phone = '+590' WHERE ctr_code_3 = 'GLP';--
UPDATE country SET ctr_code_phone = '+220' WHERE ctr_code_3 = 'GMB';--
UPDATE country SET ctr_code_phone = '+245' WHERE ctr_code_3 = 'GNB';--
UPDATE country SET ctr_code_phone = '+240' WHERE ctr_code_3 = 'GNQ';--
UPDATE country SET ctr_code_phone = '+30' WHERE ctr_code_3 = 'GRC';--
UPDATE country SET ctr_code_phone = '+1-473' WHERE ctr_code_3 = 'GRD';--
UPDATE country SET ctr_code_phone = '+299' WHERE ctr_code_3 = 'GRL';--
UPDATE country SET ctr_code_phone = '+502' WHERE ctr_code_3 = 'GTM';--
UPDATE country SET ctr_code_phone = '+594' WHERE ctr_code_3 = 'GUF';--
UPDATE country SET ctr_code_phone = '+1-671' WHERE ctr_code_3 = 'GUM';--
UPDATE country SET ctr_code_phone = '+592' WHERE ctr_code_3 = 'GUY';--
UPDATE country SET ctr_code_phone = '+852' WHERE ctr_code_3 = 'HKG';--
UPDATE country SET ctr_code_phone = '+504' WHERE ctr_code_3 = 'HND';--
UPDATE country SET ctr_code_phone = '+385' WHERE ctr_code_3 = 'HRV';--
UPDATE country SET ctr_code_phone = '+509' WHERE ctr_code_3 = 'HTI';--
UPDATE country SET ctr_code_phone = '+36' WHERE ctr_code_3 = 'HUN';--
UPDATE country SET ctr_code_phone = '+62' WHERE ctr_code_3 = 'IDN';--
UPDATE country SET ctr_code_phone = '+91' WHERE ctr_code_3 = 'IND';--
UPDATE country SET ctr_code_phone = '+353' WHERE ctr_code_3 = 'IRL';--
UPDATE country SET ctr_code_phone = '+98' WHERE ctr_code_3 = 'IRN';--
UPDATE country SET ctr_code_phone = '+964' WHERE ctr_code_3 = 'IRQ';--
UPDATE country SET ctr_code_phone = '+354' WHERE ctr_code_3 = 'ISL';--
UPDATE country SET ctr_code_phone = '+972' WHERE ctr_code_3 = 'ISR';--
UPDATE country SET ctr_code_phone = '+39' WHERE ctr_code_3 = 'ITA';--
UPDATE country SET ctr_code_phone = '+1-876' WHERE ctr_code_3 = 'JAM';--
UPDATE country SET ctr_code_phone = '+962' WHERE ctr_code_3 = 'JOR';--
UPDATE country SET ctr_code_phone = '+81' WHERE ctr_code_3 = 'JPN';--
UPDATE country SET ctr_code_phone = '+7' WHERE ctr_code_3 = 'KAZ';--
UPDATE country SET ctr_code_phone = '+254' WHERE ctr_code_3 = 'KEN';--
UPDATE country SET ctr_code_phone = '+996' WHERE ctr_code_3 = 'KGZ';--
UPDATE country SET ctr_code_phone = '+855' WHERE ctr_code_3 = 'KHM';--
UPDATE country SET ctr_code_phone = '+686' WHERE ctr_code_3 = 'KIR';--
UPDATE country SET ctr_code_phone = '+1-869' WHERE ctr_code_3 = 'KNA';--
UPDATE country SET ctr_code_phone = '+82' WHERE ctr_code_3 = 'KOR';--
UPDATE country SET ctr_code_phone = '+965' WHERE ctr_code_3 = 'KWT';--
UPDATE country SET ctr_code_phone = '+856' WHERE ctr_code_3 = 'LAO';--
UPDATE country SET ctr_code_phone = '+961' WHERE ctr_code_3 = 'LBN';--
UPDATE country SET ctr_code_phone = '+231' WHERE ctr_code_3 = 'LBR';--
UPDATE country SET ctr_code_phone = '+218' WHERE ctr_code_3 = 'LBY';--
UPDATE country SET ctr_code_phone = '+1-758' WHERE ctr_code_3 = 'LCA';--
UPDATE country SET ctr_code_phone = '+423' WHERE ctr_code_3 = 'LIE';--
UPDATE country SET ctr_code_phone = '+94' WHERE ctr_code_3 = 'LKA';--
UPDATE country SET ctr_code_phone = '+266' WHERE ctr_code_3 = 'LSO';--
UPDATE country SET ctr_code_phone = '+370' WHERE ctr_code_3 = 'LTU';--
UPDATE country SET ctr_code_phone = '+352' WHERE ctr_code_3 = 'LUX';--
UPDATE country SET ctr_code_phone = '+371' WHERE ctr_code_3 = 'LVA';--
UPDATE country SET ctr_code_phone = '+853' WHERE ctr_code_3 = 'MAC';--
UPDATE country SET ctr_code_phone = '+212' WHERE ctr_code_3 = 'MAR';--
UPDATE country SET ctr_code_phone = '+377' WHERE ctr_code_3 = 'MCO';--
UPDATE country SET ctr_code_phone = '+373' WHERE ctr_code_3 = 'MDA';--
UPDATE country SET ctr_code_phone = '+261' WHERE ctr_code_3 = 'MDG';--
UPDATE country SET ctr_code_phone = '+960' WHERE ctr_code_3 = 'MDV';--
UPDATE country SET ctr_code_phone = '+52' WHERE ctr_code_3 = 'MEX';--
UPDATE country SET ctr_code_phone = '+692' WHERE ctr_code_3 = 'MHL';--
UPDATE country SET ctr_code_phone = '+389' WHERE ctr_code_3 = 'MKD';--
UPDATE country SET ctr_code_phone = '+223' WHERE ctr_code_3 = 'MLI';--
UPDATE country SET ctr_code_phone = '+356' WHERE ctr_code_3 = 'MLT';--
UPDATE country SET ctr_code_phone = '+95' WHERE ctr_code_3 = 'MMR';--
UPDATE country SET ctr_code_phone = '+976' WHERE ctr_code_3 = 'MNG';--
UPDATE country SET ctr_code_phone = '+1-670' WHERE ctr_code_3 = 'MNP';--
UPDATE country SET ctr_code_phone = '+258' WHERE ctr_code_3 = 'MOZ';--
UPDATE country SET ctr_code_phone = '+222' WHERE ctr_code_3 = 'MRT';--
UPDATE country SET ctr_code_phone = '+1-664' WHERE ctr_code_3 = 'MSR';--
UPDATE country SET ctr_code_phone = '+596' WHERE ctr_code_3 = 'MTQ';--
UPDATE country SET ctr_code_phone = '+230' WHERE ctr_code_3 = 'MUS';--
UPDATE country SET ctr_code_phone = '+265' WHERE ctr_code_3 = 'MWI';--
UPDATE country SET ctr_code_phone = '+60' WHERE ctr_code_3 = 'MYS';--
UPDATE country SET ctr_code_phone = '+264' WHERE ctr_code_3 = 'NAM';--
UPDATE country SET ctr_code_phone = '+687' WHERE ctr_code_3 = 'NCL';--
UPDATE country SET ctr_code_phone = '+227' WHERE ctr_code_3 = 'NER';--
UPDATE country SET ctr_code_phone = '+672' WHERE ctr_code_3 = 'NFK';--
UPDATE country SET ctr_code_phone = '+234' WHERE ctr_code_3 = 'NGA';--
UPDATE country SET ctr_code_phone = '+505' WHERE ctr_code_3 = 'NIC';--
UPDATE country SET ctr_code_phone = '+683' WHERE ctr_code_3 = 'NIU';--
UPDATE country SET ctr_code_phone = '+31' WHERE ctr_code_3 = 'NLD';--
UPDATE country SET ctr_code_phone = '+47' WHERE ctr_code_3 = 'NOR';--
UPDATE country SET ctr_code_phone = '+977' WHERE ctr_code_3 = 'NPL';--
UPDATE country SET ctr_code_phone = '+674' WHERE ctr_code_3 = 'NRU';--
UPDATE country SET ctr_code_phone = '+64' WHERE ctr_code_3 = 'NZL';--
UPDATE country SET ctr_code_phone = '+968' WHERE ctr_code_3 = 'OMN';--
UPDATE country SET ctr_code_phone = '+92' WHERE ctr_code_3 = 'PAK';--
UPDATE country SET ctr_code_phone = '+507' WHERE ctr_code_3 = 'PAN';--
UPDATE country SET ctr_code_phone = '+872' WHERE ctr_code_3 = 'PCN';--
UPDATE country SET ctr_code_phone = '+51' WHERE ctr_code_3 = 'PER';--
UPDATE country SET ctr_code_phone = '+63' WHERE ctr_code_3 = 'PHL';--
UPDATE country SET ctr_code_phone = '+680' WHERE ctr_code_3 = 'PLW';--
UPDATE country SET ctr_code_phone = '+675' WHERE ctr_code_3 = 'PNG';--
UPDATE country SET ctr_code_phone = '+48' WHERE ctr_code_3 = 'POL';--
UPDATE country SET ctr_code_phone = '+1-787' WHERE ctr_code_3 = 'PRI';--
UPDATE country SET ctr_code_phone = '+850' WHERE ctr_code_3 = 'PRK';--
UPDATE country SET ctr_code_phone = '+351' WHERE ctr_code_3 = 'PRT';--
UPDATE country SET ctr_code_phone = '+595' WHERE ctr_code_3 = 'PRY';--
UPDATE country SET ctr_code_phone = '+689' WHERE ctr_code_3 = 'PYF';--
UPDATE country SET ctr_code_phone = '+974' WHERE ctr_code_3 = 'QAT';--
UPDATE country SET ctr_code_phone = '+262' WHERE ctr_code_3 = 'REU';--
UPDATE country SET ctr_code_phone = '+40' WHERE ctr_code_3 = 'ROU';--
UPDATE country SET ctr_code_phone = '+7' WHERE ctr_code_3 = 'RUS';--
UPDATE country SET ctr_code_phone = '+250' WHERE ctr_code_3 = 'RWA';--
UPDATE country SET ctr_code_phone = '+966' WHERE ctr_code_3 = 'SAU';--
UPDATE country SET ctr_code_phone = '+249' WHERE ctr_code_3 = 'SDN';--
UPDATE country SET ctr_code_phone = '+221' WHERE ctr_code_3 = 'SEN';--
UPDATE country SET ctr_code_phone = '+65' WHERE ctr_code_3 = 'SGP';--
UPDATE country SET ctr_code_phone = '+290' WHERE ctr_code_3 = 'SHN';--
UPDATE country SET ctr_code_phone = '+47' WHERE ctr_code_3 = 'SJM';--
UPDATE country SET ctr_code_phone = '+677' WHERE ctr_code_3 = 'SLB';--
UPDATE country SET ctr_code_phone = '+232' WHERE ctr_code_3 = 'SLE';--
UPDATE country SET ctr_code_phone = '+503' WHERE ctr_code_3 = 'SLV';--
UPDATE country SET ctr_code_phone = '+378' WHERE ctr_code_3 = 'SMR';--
UPDATE country SET ctr_code_phone = '+252' WHERE ctr_code_3 = 'SOM';--
UPDATE country SET ctr_code_phone = '+508' WHERE ctr_code_3 = 'SPM';--
UPDATE country SET ctr_code_phone = '+239' WHERE ctr_code_3 = 'STP';--
UPDATE country SET ctr_code_phone = '+597' WHERE ctr_code_3 = 'SUR';--
UPDATE country SET ctr_code_phone = '+421' WHERE ctr_code_3 = 'SVK';--
UPDATE country SET ctr_code_phone = '+386' WHERE ctr_code_3 = 'SVN';--
UPDATE country SET ctr_code_phone = '+46' WHERE ctr_code_3 = 'SWE';--
UPDATE country SET ctr_code_phone = '+268' WHERE ctr_code_3 = 'SWZ';--
UPDATE country SET ctr_code_phone = '+248' WHERE ctr_code_3 = 'SYC';--
UPDATE country SET ctr_code_phone = '+963' WHERE ctr_code_3 = 'SYR';--
UPDATE country SET ctr_code_phone = '+1-649' WHERE ctr_code_3 = 'TCA';--
UPDATE country SET ctr_code_phone = '+235' WHERE ctr_code_3 = 'TCD';--
UPDATE country SET ctr_code_phone = '+228' WHERE ctr_code_3 = 'TGO';--
UPDATE country SET ctr_code_phone = '+66' WHERE ctr_code_3 = 'THA';--
UPDATE country SET ctr_code_phone = '+992' WHERE ctr_code_3 = 'TJK';--
UPDATE country SET ctr_code_phone = '+690' WHERE ctr_code_3 = 'TKL';--
UPDATE country SET ctr_code_phone = '+993' WHERE ctr_code_3 = 'TKM';--
UPDATE country SET ctr_code_phone = '+676' WHERE ctr_code_3 = 'TON';--
UPDATE country SET ctr_code_phone = '+1-868' WHERE ctr_code_3 = 'TTO';--
UPDATE country SET ctr_code_phone = '+216' WHERE ctr_code_3 = 'TUN';--
UPDATE country SET ctr_code_phone = '+90' WHERE ctr_code_3 = 'TUR';--
UPDATE country SET ctr_code_phone = '+688' WHERE ctr_code_3 = 'TUV';--
UPDATE country SET ctr_code_phone = '+886' WHERE ctr_code_3 = 'TWN';--
UPDATE country SET ctr_code_phone = '+255' WHERE ctr_code_3 = 'TZA';--
UPDATE country SET ctr_code_phone = '+256' WHERE ctr_code_3 = 'UGA';--
UPDATE country SET ctr_code_phone = '+380' WHERE ctr_code_3 = 'UKR';--
UPDATE country SET ctr_code_phone = '+1' WHERE ctr_code_3 = 'USA';--
UPDATE country SET ctr_code_phone = '+998' WHERE ctr_code_3 = 'UZB';--
UPDATE country SET ctr_code_phone = '+1-784' WHERE ctr_code_3 = 'VCT';--
UPDATE country SET ctr_code_phone = '+58' WHERE ctr_code_3 = 'VEN';--
UPDATE country SET ctr_code_phone = '+1-284' WHERE ctr_code_3 = 'VGB';--
UPDATE country SET ctr_code_phone = '+1-340' WHERE ctr_code_3 = 'VIR';--
UPDATE country SET ctr_code_phone = '+84' WHERE ctr_code_3 = 'VNM';--
UPDATE country SET ctr_code_phone = '+678' WHERE ctr_code_3 = 'VUT';--
UPDATE country SET ctr_code_phone = '+681' WHERE ctr_code_3 = 'WLF';--
UPDATE country SET ctr_code_phone = '+685' WHERE ctr_code_3 = 'WSM';--
UPDATE country SET ctr_code_phone = '+967' WHERE ctr_code_3 = 'YEM';--
UPDATE country SET ctr_code_phone = '+27' WHERE ctr_code_3 = 'ZAF';--
UPDATE country SET ctr_code_phone = '+260' WHERE ctr_code_3 = 'ZMB';--
UPDATE country SET ctr_code_phone = '+263' WHERE ctr_code_3 = 'ZWE';--
UPDATE country SET ctr_code_phone = '+500' WHERE ctr_code_3 = 'FLK';--
UPDATE country SET ctr_code_phone = '+381' WHERE ctr_code_3 = 'SRB';--
UPDATE country SET ctr_code_phone = '+382' WHERE ctr_code_3 = 'MNE';--
UPDATE country SET ctr_code_phone = '+970' WHERE ctr_code_3 = 'PSE';--
UPDATE country SET ctr_code_phone = '+383' WHERE ctr_code_3 = 'XKX';--
UPDATE country SET ctr_code_phone = '+211' WHERE ctr_code_3 = 'SSD';--
UPDATE country SET ctr_code_phone = '+598' WHERE ctr_code_3 = 'URY';--


update country set ctr_coord_lat = 34.5553, ctr_coord_lng = 69.2075 where ctr_code_3 = 'AFG';--
update country set ctr_coord_lat = 41.3275, ctr_coord_lng = 19.8189 where ctr_code_3 = 'ALB';--
update country set ctr_coord_lat = 36.7372, ctr_coord_lng = 3.0869 where ctr_code_3 = 'DZA';--
update country set ctr_coord_lat = -14.271, ctr_coord_lng = -170.1322 where ctr_code_3 = 'ASM';--
update country set ctr_coord_lat = 42.5063, ctr_coord_lng = 1.5218 where ctr_code_3 = 'AND';--
update country set ctr_coord_lat = -8.839, ctr_coord_lng = 13.2894 where ctr_code_3 = 'AGO';--
update country set ctr_coord_lat = 18.2206, ctr_coord_lng = -63.0686 where ctr_code_3 = 'AIA';--
update country set ctr_coord_lat = 17.0747, ctr_coord_lng = -61.8175 where ctr_code_3 = 'ATG';--
update country set ctr_coord_lat = -34.6037, ctr_coord_lng = -58.3816 where ctr_code_3 = 'ARG';--
update country set ctr_coord_lat = 40.1792, ctr_coord_lng = 44.4991 where ctr_code_3 = 'ARM';--
update country set ctr_coord_lat = 12.5211, ctr_coord_lng = -69.9683 where ctr_code_3 = 'ABW';--
update country set ctr_coord_lat = -35.2809, ctr_coord_lng = 149.13 where ctr_code_3 = 'AUS';--
update country set ctr_coord_lat = 48.2082, ctr_coord_lng = 16.3738 where ctr_code_3 = 'AUT';--
update country set ctr_coord_lat = 40.4093, ctr_coord_lng = 49.8671 where ctr_code_3 = 'AZE';--
update country set ctr_coord_lat = 25.0343, ctr_coord_lng = -77.3963 where ctr_code_3 = 'BHS';--
update country set ctr_coord_lat = 26.2285, ctr_coord_lng = 50.586 where ctr_code_3 = 'BHR';--
update country set ctr_coord_lat = 23.8103, ctr_coord_lng = 90.4125 where ctr_code_3 = 'BGD';--
update country set ctr_coord_lat = 13.1939, ctr_coord_lng = -59.5432 where ctr_code_3 = 'BRB';--
update country set ctr_coord_lat = 53.9045, ctr_coord_lng = 27.5615 where ctr_code_3 = 'BLR';--
update country set ctr_coord_lat = 50.8503, ctr_coord_lng = 4.3517 where ctr_code_3 = 'BEL';--
update country set ctr_coord_lat = 17.1899, ctr_coord_lng = -88.4976 where ctr_code_3 = 'BLZ';--
update country set ctr_coord_lat = 6.3703, ctr_coord_lng = 2.3912 where ctr_code_3 = 'BEN';--
update country set ctr_coord_lat = 32.3078, ctr_coord_lng = -64.7505 where ctr_code_3 = 'BMU';--
update country set ctr_coord_lat = 27.5142, ctr_coord_lng = 89.6339 where ctr_code_3 = 'BTN';--
update country set ctr_coord_lat = -16.5, ctr_coord_lng = -68.15 where ctr_code_3 = 'BOL';--
update country set ctr_coord_lat = 43.8563, ctr_coord_lng = 18.4131 where ctr_code_3 = 'BIH';--
update country set ctr_coord_lat = -24.6282, ctr_coord_lng = 25.9231 where ctr_code_3 = 'BWA';--
update country set ctr_coord_lat = -15.8267, ctr_coord_lng = -47.9218 where ctr_code_3 = 'BRA';--
update country set ctr_coord_lat = 4.9031, ctr_coord_lng = 114.9398 where ctr_code_3 = 'BRN';--
update country set ctr_coord_lat = 42.6977, ctr_coord_lng = 23.3219 where ctr_code_3 = 'BGR';--
update country set ctr_coord_lat = 12.3714, ctr_coord_lng = -1.5197 where ctr_code_3 = 'BFA';--
update country set ctr_coord_lat = -3.3731, ctr_coord_lng = 29.9189 where ctr_code_3 = 'BDI';--
update country set ctr_coord_lat = 11.5564, ctr_coord_lng = 104.9282 where ctr_code_3 = 'KHM';--
update country set ctr_coord_lat = 3.848, ctr_coord_lng = 11.5021 where ctr_code_3 = 'CMR';--
update country set ctr_coord_lat = 45.4215, ctr_coord_lng = -75.6972 where ctr_code_3 = 'CAN';--
update country set ctr_coord_lat = 14.933, ctr_coord_lng = -23.5133 where ctr_code_3 = 'CPV';--
update country set ctr_coord_lat = 19.3133, ctr_coord_lng = -81.2546 where ctr_code_3 = 'CYM';--
update country set ctr_coord_lat = 4.3947, ctr_coord_lng = 18.5582 where ctr_code_3 = 'CAF';--
update country set ctr_coord_lat = 12.1348, ctr_coord_lng = 15.0557 where ctr_code_3 = 'TCD';--
update country set ctr_coord_lat = -33.4489, ctr_coord_lng = -70.6693 where ctr_code_3 = 'CHL';--
update country set ctr_coord_lat = 39.9042, ctr_coord_lng = 116.4074 where ctr_code_3 = 'CHN';--
update country set ctr_coord_lat = 4.711, ctr_coord_lng = -74.0721 where ctr_code_3 = 'COL';--
update country set ctr_coord_lat = -11.6455, ctr_coord_lng = 43.3333 where ctr_code_3 = 'COM';--
update country set ctr_coord_lat = -4.2634, ctr_coord_lng = 15.2429 where ctr_code_3 = 'COG';--
update country set ctr_coord_lat = -4.4419, ctr_coord_lng = 15.2663 where ctr_code_3 = 'COD';--
update country set ctr_coord_lat = -21.2367, ctr_coord_lng = -159.7777 where ctr_code_3 = 'COK';--
update country set ctr_coord_lat = 9.9281, ctr_coord_lng = -84.0907 where ctr_code_3 = 'CRI';--
update country set ctr_coord_lat = 5.347, ctr_coord_lng = -4.0244 where ctr_code_3 = 'CIV';--
update country set ctr_coord_lat = 45.815, ctr_coord_lng = 15.9819 where ctr_code_3 = 'HRV';--
update country set ctr_coord_lat = 23.1136, ctr_coord_lng = -82.3666 where ctr_code_3 = 'CUB';--
update country set ctr_coord_lat = 35.1856, ctr_coord_lng = 33.3823 where ctr_code_3 = 'CYP';--
update country set ctr_coord_lat = 50.0755, ctr_coord_lng = 14.4378 where ctr_code_3 = 'CZE';--
update country set ctr_coord_lat = 55.6761, ctr_coord_lng = 12.5683 where ctr_code_3 = 'DNK';--
update country set ctr_coord_lat = 11.8251, ctr_coord_lng = 42.5903 where ctr_code_3 = 'DJI';--
update country set ctr_coord_lat = 15.3092, ctr_coord_lng = -61.3794 where ctr_code_3 = 'DMA';--
update country set ctr_coord_lat = 18.4861, ctr_coord_lng = -69.9312 where ctr_code_3 = 'DOM';--
update country set ctr_coord_lat = -0.1807, ctr_coord_lng = -78.4678 where ctr_code_3 = 'ECU';--
update country set ctr_coord_lat = 30.0444, ctr_coord_lng = 31.2357 where ctr_code_3 = 'EGY';--
update country set ctr_coord_lat = 13.6929, ctr_coord_lng = -89.2182 where ctr_code_3 = 'SLV';--
update country set ctr_coord_lat = 3.75, ctr_coord_lng = 8.7833 where ctr_code_3 = 'GNQ';--
update country set ctr_coord_lat = 15.3229, ctr_coord_lng = 38.9251 where ctr_code_3 = 'ERI';--
update country set ctr_coord_lat = 59.437, ctr_coord_lng = 24.7535 where ctr_code_3 = 'EST';--
update country set ctr_coord_lat = 9.145, ctr_coord_lng = 40.4897 where ctr_code_3 = 'ETH';--
update country set ctr_coord_lat = -51.7963, ctr_coord_lng = -59.5236 where ctr_code_3 = 'FLK';--
update country set ctr_coord_lat = 62.0079, ctr_coord_lng = -6.7903 where ctr_code_3 = 'FRO';--
update country set ctr_coord_lat = -18.1248, ctr_coord_lng = 178.4501 where ctr_code_3 = 'FJI';--
update country set ctr_coord_lat = 60.1695, ctr_coord_lng = 24.9355 where ctr_code_3 = 'FIN';--
update country set ctr_coord_lat = 48.8566, ctr_coord_lng = 2.3522 where ctr_code_3 = 'FRA';--
update country set ctr_coord_lat = 4.9331, ctr_coord_lng = -52.3269 where ctr_code_3 = 'GUF';--
update country set ctr_coord_lat = -17.6797, ctr_coord_lng = -149.4068 where ctr_code_3 = 'PYF';--
update country set ctr_coord_lat = 0.4162, ctr_coord_lng = 9.4673 where ctr_code_3 = 'GAB';--
update country set ctr_coord_lat = 13.4549, ctr_coord_lng = -16.579 where ctr_code_3 = 'GMB';--
update country set ctr_coord_lat = 41.7151, ctr_coord_lng = 44.8271 where ctr_code_3 = 'GEO';--
update country set ctr_coord_lat = 52.52, ctr_coord_lng = 13.405 where ctr_code_3 = 'DEU';--
update country set ctr_coord_lat = 5.6037, ctr_coord_lng = -0.187 where ctr_code_3 = 'GHA';--
update country set ctr_coord_lat = 36.1408, ctr_coord_lng = -5.3536 where ctr_code_3 = 'GIB';--
update country set ctr_coord_lat = 37.9838, ctr_coord_lng = 23.7275 where ctr_code_3 = 'GRC';--
update country set ctr_coord_lat = 64.1835, ctr_coord_lng = -51.7216 where ctr_code_3 = 'GRL';--
update country set ctr_coord_lat = 12.0561, ctr_coord_lng = -61.7486 where ctr_code_3 = 'GRD';--
update country set ctr_coord_lat = 16.265, ctr_coord_lng = -61.551 where ctr_code_3 = 'GLP';--
update country set ctr_coord_lat = 13.4443, ctr_coord_lng = 144.7937 where ctr_code_3 = 'GUM';--
update country set ctr_coord_lat = 14.6349, ctr_coord_lng = -90.5069 where ctr_code_3 = 'GTM';--
update country set ctr_coord_lat = 9.6412, ctr_coord_lng = -13.5784 where ctr_code_3 = 'GIN';--
update country set ctr_coord_lat = 11.8037, ctr_coord_lng = -15.1804 where ctr_code_3 = 'GNB';--
update country set ctr_coord_lat = 6.8013, ctr_coord_lng = -58.1551 where ctr_code_3 = 'GUY';--
update country set ctr_coord_lat = 18.5944, ctr_coord_lng = -72.3074 where ctr_code_3 = 'HTI';--
update country set ctr_coord_lat = 14.0723, ctr_coord_lng = -87.1921 where ctr_code_3 = 'HND';--
update country set ctr_coord_lat = 22.3193, ctr_coord_lng = 114.1694 where ctr_code_3 = 'HKG';--
update country set ctr_coord_lat = 47.4979, ctr_coord_lng = 19.0402 where ctr_code_3 = 'HUN';--
update country set ctr_coord_lat = 64.1466, ctr_coord_lng = -21.9426 where ctr_code_3 = 'ISL';--
update country set ctr_coord_lat = 28.6139, ctr_coord_lng = 77.209 where ctr_code_3 = 'IND';--
update country set ctr_coord_lat = -6.2088, ctr_coord_lng = 106.8456 where ctr_code_3 = 'IDN';--
update country set ctr_coord_lat = 35.6892, ctr_coord_lng = 51.389 where ctr_code_3 = 'IRN';--
update country set ctr_coord_lat = 33.3152, ctr_coord_lng = 44.3661 where ctr_code_3 = 'IRQ';--
update country set ctr_coord_lat = 53.3498, ctr_coord_lng = -6.2603 where ctr_code_3 = 'IRL';--
update country set ctr_coord_lat = 31.7683, ctr_coord_lng = 35.2137 where ctr_code_3 = 'ISR';--
update country set ctr_coord_lat = 41.9028, ctr_coord_lng = 12.4964 where ctr_code_3 = 'ITA';--
update country set ctr_coord_lat = 18.1096, ctr_coord_lng = -77.2975 where ctr_code_3 = 'JAM';--
update country set ctr_coord_lat = 35.6828, ctr_coord_lng = 139.7595 where ctr_code_3 = 'JPN';--
update country set ctr_coord_lat = 31.9539, ctr_coord_lng = 35.9106 where ctr_code_3 = 'JOR';--
update country set ctr_coord_lat = 51.1694, ctr_coord_lng = 71.4491 where ctr_code_3 = 'KAZ';--
update country set ctr_coord_lat = -1.2921, ctr_coord_lng = 36.8219 where ctr_code_3 = 'KEN';--
update country set ctr_coord_lat = 1.4518, ctr_coord_lng = 172.9784 where ctr_code_3 = 'KIR';--
update country set ctr_coord_lat = 39.0392, ctr_coord_lng = 125.7625 where ctr_code_3 = 'PRK';--
update country set ctr_coord_lat = 37.5665, ctr_coord_lng = 126.978 where ctr_code_3 = 'KOR';--
update country set ctr_coord_lat = 42.6026, ctr_coord_lng = 20.902 where ctr_code_3 = 'XKX';--
update country set ctr_coord_lat = 29.3759, ctr_coord_lng = 47.9774 where ctr_code_3 = 'KWT';--
update country set ctr_coord_lat = 42.8746, ctr_coord_lng = 74.5698 where ctr_code_3 = 'KGZ';--
update country set ctr_coord_lat = 17.9757, ctr_coord_lng = 102.6331 where ctr_code_3 = 'LAO';--
update country set ctr_coord_lat = 56.9496, ctr_coord_lng = 24.1052 where ctr_code_3 = 'LVA';--
update country set ctr_coord_lat = 33.8938, ctr_coord_lng = 35.5018 where ctr_code_3 = 'LBN';--
update country set ctr_coord_lat = -29.61, ctr_coord_lng = 28.2336 where ctr_code_3 = 'LSO';--
update country set ctr_coord_lat = 6.3156, ctr_coord_lng = -10.8074 where ctr_code_3 = 'LBR';--
update country set ctr_coord_lat = 32.8872, ctr_coord_lng = 13.1913 where ctr_code_3 = 'LBY';--
update country set ctr_coord_lat = 47.1416, ctr_coord_lng = 9.5215 where ctr_code_3 = 'LIE';--
update country set ctr_coord_lat = 54.6872, ctr_coord_lng = 25.2797 where ctr_code_3 = 'LTU';--
update country set ctr_coord_lat = 49.6117, ctr_coord_lng = 6.1319 where ctr_code_3 = 'LUX';--
update country set ctr_coord_lat = 22.1987, ctr_coord_lng = 113.5439 where ctr_code_3 = 'MAC';--
update country set ctr_coord_lat = 41.9981, ctr_coord_lng = 21.4254 where ctr_code_3 = 'MKD';--
update country set ctr_coord_lat = -18.8792, ctr_coord_lng = 47.5079 where ctr_code_3 = 'MDG';--
update country set ctr_coord_lat = -13.9626, ctr_coord_lng = 33.7741 where ctr_code_3 = 'MWI';--
update country set ctr_coord_lat = 3.139, ctr_coord_lng = 101.6869 where ctr_code_3 = 'MYS';--
update country set ctr_coord_lat = 4.1755, ctr_coord_lng = 73.5093 where ctr_code_3 = 'MDV';--
update country set ctr_coord_lat = 12.6392, ctr_coord_lng = -8.0029 where ctr_code_3 = 'MLI';--
update country set ctr_coord_lat = 35.9375, ctr_coord_lng = 14.3754 where ctr_code_3 = 'MLT';--
update country set ctr_coord_lat = 7.1315, ctr_coord_lng = 171.1845 where ctr_code_3 = 'MHL';--
update country set ctr_coord_lat = 14.6415, ctr_coord_lng = -61.0242 where ctr_code_3 = 'MTQ';--
update country set ctr_coord_lat = 18.0735, ctr_coord_lng = -15.9582 where ctr_code_3 = 'MRT';--
update country set ctr_coord_lat = -20.3484, ctr_coord_lng = 57.5522 where ctr_code_3 = 'MUS';--
update country set ctr_coord_lat = 19.4326, ctr_coord_lng = -99.1332 where ctr_code_3 = 'MEX';--
update country set ctr_coord_lat = 6.9248, ctr_coord_lng = 158.161 where ctr_code_3 = 'FSM';--
update country set ctr_coord_lat = 47.0105, ctr_coord_lng = 28.8638 where ctr_code_3 = 'MDA';--
update country set ctr_coord_lat = 43.7384, ctr_coord_lng = 7.4246 where ctr_code_3 = 'MCO';--
update country set ctr_coord_lat = 47.8864, ctr_coord_lng = 106.9057 where ctr_code_3 = 'MNG';--
update country set ctr_coord_lat = 42.4304, ctr_coord_lng = 19.2594 where ctr_code_3 = 'MNE';--
update country set ctr_coord_lat = 16.7425, ctr_coord_lng = -62.1874 where ctr_code_3 = 'MSR';--
update country set ctr_coord_lat = 33.9716, ctr_coord_lng = -6.8498 where ctr_code_3 = 'MAR';--
update country set ctr_coord_lat = -25.9655, ctr_coord_lng = 32.5832 where ctr_code_3 = 'MOZ';--
update country set ctr_coord_lat = 16.8409, ctr_coord_lng = 96.1735 where ctr_code_3 = 'MMR';--
update country set ctr_coord_lat = -22.5609, ctr_coord_lng = 17.0658 where ctr_code_3 = 'NAM';--
update country set ctr_coord_lat = -0.5258, ctr_coord_lng = 166.9315 where ctr_code_3 = 'NRU';--
update country set ctr_coord_lat = 27.7172, ctr_coord_lng = 85.324 where ctr_code_3 = 'NPL';--
update country set ctr_coord_lat = 52.3676, ctr_coord_lng = 4.9041 where ctr_code_3 = 'NLD';--
update country set ctr_coord_lat = 12.1784, ctr_coord_lng = -68.2385 where ctr_code_3 = 'ANT';--
update country set ctr_coord_lat = -22.2558, ctr_coord_lng = 166.4505 where ctr_code_3 = 'NCL';--
update country set ctr_coord_lat = -41.2865, ctr_coord_lng = 174.7762 where ctr_code_3 = 'NZL';--
update country set ctr_coord_lat = 12.1364, ctr_coord_lng = -86.2514 where ctr_code_3 = 'NIC';--
update country set ctr_coord_lat = 13.5126, ctr_coord_lng = 2.1128 where ctr_code_3 = 'NER';--
update country set ctr_coord_lat = 9.0765, ctr_coord_lng = 7.3986 where ctr_code_3 = 'NGA';--
update country set ctr_coord_lat = -19.0544, ctr_coord_lng = -169.8672 where ctr_code_3 = 'NIU';--
update country set ctr_coord_lat = -29.0408, ctr_coord_lng = 167.9547 where ctr_code_3 = 'NFK';--
update country set ctr_coord_lat = 15.2123, ctr_coord_lng = 145.7545 where ctr_code_3 = 'MNP';--
update country set ctr_coord_lat = 59.9139, ctr_coord_lng = 10.7522 where ctr_code_3 = 'NOR';--
update country set ctr_coord_lat = 23.5859, ctr_coord_lng = 58.4059 where ctr_code_3 = 'OMN';--
update country set ctr_coord_lat = 30.3753, ctr_coord_lng = 69.3451 where ctr_code_3 = 'PAK';--
update country set ctr_coord_lat = 7.5149, ctr_coord_lng = 134.5825 where ctr_code_3 = 'PLW';--
update country set ctr_coord_lat = 31.9522, ctr_coord_lng = 35.2332 where ctr_code_3 = 'PSE';--
update country set ctr_coord_lat = 8.9824, ctr_coord_lng = -79.5199 where ctr_code_3 = 'PAN';--
update country set ctr_coord_lat = -9.4438, ctr_coord_lng = 147.1803 where ctr_code_3 = 'PNG';--
update country set ctr_coord_lat = -25.2637, ctr_coord_lng = -57.5759 where ctr_code_3 = 'PRY';--
update country set ctr_coord_lat = -12.0464, ctr_coord_lng = -77.0428 where ctr_code_3 = 'PER';--
update country set ctr_coord_lat = 14.5995, ctr_coord_lng = 120.9842 where ctr_code_3 = 'PHL';--
update country set ctr_coord_lat = -24.3764, ctr_coord_lng = -128.324 where ctr_code_3 = 'PCN';--
update country set ctr_coord_lat = 52.2297, ctr_coord_lng = 21.0122 where ctr_code_3 = 'POL';--
update country set ctr_coord_lat = 38.7169, ctr_coord_lng = -9.1399 where ctr_code_3 = 'PRT';--
update country set ctr_coord_lat = 18.2208, ctr_coord_lng = -66.5901 where ctr_code_3 = 'PRI';--
update country set ctr_coord_lat = 25.276, ctr_coord_lng = 51.52 where ctr_code_3 = 'QAT';--
update country set ctr_coord_lat = -21.1151, ctr_coord_lng = 55.5364 where ctr_code_3 = 'REU';--
update country set ctr_coord_lat = 44.4268, ctr_coord_lng = 26.1025 where ctr_code_3 = 'ROU';--
update country set ctr_coord_lat = 55.7558, ctr_coord_lng = 37.6173 where ctr_code_3 = 'RUS';--
update country set ctr_coord_lat = -1.9706, ctr_coord_lng = 30.1044 where ctr_code_3 = 'RWA';--
update country set ctr_coord_lat = 17.8974, ctr_coord_lng = -62.825 where ctr_code_3 = 'BLM';--
update country set ctr_coord_lat = -15.965, ctr_coord_lng = -5.7089 where ctr_code_3 = 'SHN';--
update country set ctr_coord_lat = 17.3578, ctr_coord_lng = -62.783 where ctr_code_3 = 'KNA';--
update country set ctr_coord_lat = 13.9094, ctr_coord_lng = -60.9789 where ctr_code_3 = 'LCA';--
update country set ctr_coord_lat = 18.0669, ctr_coord_lng = -63.0501 where ctr_code_3 = 'MAF';--
update country set ctr_coord_lat = 46.7811, ctr_coord_lng = -56.1773 where ctr_code_3 = 'SPM';--
update country set ctr_coord_lat = 13.2528, ctr_coord_lng = -61.1971 where ctr_code_3 = 'VCT';--
update country set ctr_coord_lat = -13.759, ctr_coord_lng = -172.1046 where ctr_code_3 = 'WSM';--
update country set ctr_coord_lat = 43.9333, ctr_coord_lng = 12.4489 where ctr_code_3 = 'SMR';--
update country set ctr_coord_lat = 0.1864, ctr_coord_lng = 6.6131 where ctr_code_3 = 'STP';--
update country set ctr_coord_lat = 24.7136, ctr_coord_lng = 46.6753 where ctr_code_3 = 'SAU';--
update country set ctr_coord_lat = 14.4974, ctr_coord_lng = -14.4524 where ctr_code_3 = 'SEN';--
update country set ctr_coord_lat = 44.7866, ctr_coord_lng = 20.4489 where ctr_code_3 = 'SRB';--
update country set ctr_coord_lat = -4.6796, ctr_coord_lng = 55.492 where ctr_code_3 = 'SYC';--
update country set ctr_coord_lat = 8.4657, ctr_coord_lng = -13.2317 where ctr_code_3 = 'SLE';--
update country set ctr_coord_lat = 1.3521, ctr_coord_lng = 103.8198 where ctr_code_3 = 'SGP';--
update country set ctr_coord_lat = 48.1486, ctr_coord_lng = 17.1077 where ctr_code_3 = 'SVK';--
update country set ctr_coord_lat = 46.0511, ctr_coord_lng = 14.5051 where ctr_code_3 = 'SVN';--
update country set ctr_coord_lat = -9.6457, ctr_coord_lng = 160.1562 where ctr_code_3 = 'SLB';--
update country set ctr_coord_lat = 2.0469, ctr_coord_lng = 45.3182 where ctr_code_3 = 'SOM';--
update country set ctr_coord_lat = -25.7461, ctr_coord_lng = 28.1881 where ctr_code_3 = 'ZAF';--
update country set ctr_coord_lat = -54.4296, ctr_coord_lng = -36.5879 where ctr_code_3 = 'SGS';--
update country set ctr_coord_lat = 40.4168, ctr_coord_lng = -3.7038 where ctr_code_3 = 'ESP';--
update country set ctr_coord_lat = 6.9271, ctr_coord_lng = 79.8612 where ctr_code_3 = 'LKA';--
update country set ctr_coord_lat = 15.5007, ctr_coord_lng = 32.5599 where ctr_code_3 = 'SDN';--
update country set ctr_coord_lat = 5.852, ctr_coord_lng = -55.2038 where ctr_code_3 = 'SUR';--
update country set ctr_coord_lat = 78.2232, ctr_coord_lng = 15.6469 where ctr_code_3 = 'SJM';--
update country set ctr_coord_lat = -26.5225, ctr_coord_lng = 31.4659 where ctr_code_3 = 'SWZ';--
update country set ctr_coord_lat = 59.3293, ctr_coord_lng = 18.0686 where ctr_code_3 = 'SWE';--
update country set ctr_coord_lat = 46.2044, ctr_coord_lng = 6.1432 where ctr_code_3 = 'CHE';--
update country set ctr_coord_lat = 33.5138, ctr_coord_lng = 36.2765 where ctr_code_3 = 'SYR';--
update country set ctr_coord_lat = 25.033, ctr_coord_lng = 121.5654 where ctr_code_3 = 'TWN';--
update country set ctr_coord_lat = 38.5598, ctr_coord_lng = 68.787 where ctr_code_3 = 'TJK';--
update country set ctr_coord_lat = -6.7924, ctr_coord_lng = 39.2083 where ctr_code_3 = 'TZA';--
update country set ctr_coord_lat = 13.7563, ctr_coord_lng = 100.5018 where ctr_code_3 = 'THA';--
update country set ctr_coord_lat = -8.5569, ctr_coord_lng = 125.5603 where ctr_code_3 = 'TLS';--
update country set ctr_coord_lat = 6.1319, ctr_coord_lng = 1.2229 where ctr_code_3 = 'TGO';--
update country set ctr_coord_lat = -9.2005, ctr_coord_lng = -171.8484 where ctr_code_3 = 'TKL';--
update country set ctr_coord_lat = -21.1394, ctr_coord_lng = -175.2042 where ctr_code_3 = 'TON';--
update country set ctr_coord_lat = 10.6918, ctr_coord_lng = -61.2225 where ctr_code_3 = 'TTO';--
update country set ctr_coord_lat = 36.8065, ctr_coord_lng = 10.1815 where ctr_code_3 = 'TUN';--
update country set ctr_coord_lat = 39.9334, ctr_coord_lng = 32.8597 where ctr_code_3 = 'TUR';--
update country set ctr_coord_lat = 37.9601, ctr_coord_lng = 58.3261 where ctr_code_3 = 'TKM';--
update country set ctr_coord_lat = 21.694, ctr_coord_lng = -71.7979 where ctr_code_3 = 'TCA';--
update country set ctr_coord_lat = -7.1095, ctr_coord_lng = 179.08 where ctr_code_3 = 'TUV';--
update country set ctr_coord_lat = 0.3476, ctr_coord_lng = 32.5825 where ctr_code_3 = 'UGA';--
update country set ctr_coord_lat = 50.4501, ctr_coord_lng = 30.5234 where ctr_code_3 = 'UKR';--
update country set ctr_coord_lat = 25.2048, ctr_coord_lng = 55.2708 where ctr_code_3 = 'ARE';--
update country set ctr_coord_lat = 51.5074, ctr_coord_lng = -0.1278 where ctr_code_3 = 'GBR';--
update country set ctr_coord_lat = 38.9072, ctr_coord_lng = -77.0369 where ctr_code_3 = 'USA';--
update country set ctr_coord_lat = -34.9011, ctr_coord_lng = -56.1645 where ctr_code_3 = 'URY';--
update country set ctr_coord_lat = 41.3775, ctr_coord_lng = 64.5853 where ctr_code_3 = 'UZB';--
update country set ctr_coord_lat = -17.7333, ctr_coord_lng = 168.3273 where ctr_code_3 = 'VUT';--
update country set ctr_coord_lat = 41.9029, ctr_coord_lng = 12.4534 where ctr_code_3 = 'VAT';--
update country set ctr_coord_lat = 10.4806, ctr_coord_lng = -66.9036 where ctr_code_3 = 'VEN';--
update country set ctr_coord_lat = 21.0285, ctr_coord_lng = 105.8542 where ctr_code_3 = 'VNM';--
update country set ctr_coord_lat = 18.4207, ctr_coord_lng = -64.64 where ctr_code_3 = 'VGB';--
update country set ctr_coord_lat = 18.3358, ctr_coord_lng = -64.8963 where ctr_code_3 = 'VIR';--
update country set ctr_coord_lat = 24.2155, ctr_coord_lng = -12.8858 where ctr_code_3 = 'ESH';--
update country set ctr_coord_lat = 15.5527, ctr_coord_lng = 48.5164 where ctr_code_3 = 'YEM';--
update country set ctr_coord_lat = -15.3875, ctr_coord_lng = 28.3228 where ctr_code_3 = 'ZMB';--
update country set ctr_coord_lat = -17.8252, ctr_coord_lng = 31.0335 where ctr_code_3 = 'ZWE';--
update country set ctr_coord_lat = -13.7688, ctr_coord_lng = -177.1561 where ctr_code_3 = 'WLF';--
update country set ctr_coord_lat = 4.8594, ctr_coord_lng = 31.5713 where ctr_code_3 = 'SSD';--

