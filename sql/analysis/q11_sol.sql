-- players, jersy number, playing club who were goal kepers for england

select *
from player_mast pm
where team_id in (
select country_id from soccer_country sc where sc.country_name like 'england'
) and posi_to_play ='GK'