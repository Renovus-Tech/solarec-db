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

CREATE VIEW vw_cli_setting AS
select 
  s.set_name,
  s.set_cat_name,
  s.set_type,
  s.set_unit,
  s.set_value_default,
  s.set_value_min,
  s.set_value_max,
  s.set_flags,
  s.cli_id_auto as cli_id,
  cs.cli_set_name,
  cs.cli_set_value
from 
(select s.*, c.cli_id_auto from settings s, client c) as s
left join cli_setting cs on s.set_name = cs.cli_set_name and s.cli_id_auto = cs.cli_id
where s.set_flags ilike '_1%';--

CREATE VIEW vw_usr_setting AS
select 
  s.set_name,
  s.set_cat_name,
  s.set_type,
  s.set_unit,
  s.set_value_default,
  s.set_value_min,
  s.set_value_max,
  s.set_flags,
  s.usr_id_auto as usr_id,
  us.usr_set_name,
  us.usr_set_value
from 
(select s.*, u.usr_id_auto from settings s, users u) as s
left join usr_setting us on s.set_name = us.usr_set_name and s.usr_id_auto = us.usr_id
where s.set_flags ilike '1%';--


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