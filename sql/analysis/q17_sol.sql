-- country where the most assistant referees com from and the count of assistant referees

select
arm.ass_ref_name
, sc.country_name
, count(*) over (partition by country_name) as 'assistant_ref_count'
from asst_referee_mast arm
join soccer_country sc on arm.country_id =sc.country_id