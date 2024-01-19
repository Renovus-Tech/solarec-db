CREATE VIEW vw_usr_cli_functionalities AS
SELECT distinct up.usr_id, up.cli_id, f.*
FROM
  usr_profile up,
  prf_functionality pf,
  functionality f
WHERE
    up.prf_id = pf.prf_id
and pf.fnc_id = f.fnc_id_auto;--


create view view_loc_data as select cli_id, loc_id, date_trunc('minute', data_date + interval '00:00:00.500') as data_date, data_type_id, data_pro_id, data_value, data_date_added from loc_data;--
create view view_gen_data as select cli_id, gen_id, date_trunc('minute', data_date + interval '00:00:00.500') as data_date, data_type_id, data_pro_id, data_value, data_date_added from gen_data;--
create view view_sta_data as select cli_id, sta_id, date_trunc('minute', data_date + interval '00:00:00.500') as data_date, data_type_id, data_pro_id, data_value, data_date_added from sta_data;--

create view view_documents_sorted as select *, COALESCE(doc_date_from, doc_date_added) as doc_date_sort from document;--

CREATE VIEW vw_cli_settings AS
select * from 
settings s left join cli_setting cs on s.set_name = cs.cli_set_name
where s.set_flags ilike '_1%';--

CREATE VIEW vw_usr_settings AS
select * from 
settings s left join usr_setting us on s.set_name = us.usr_set_name
where s.set_flags ilike '1%';--