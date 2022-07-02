-- goalkeper's name and jersey number, playing for Germany, who played in Germany's group stage matches

select pm.player_name, pm.jersey_no
from player_mast pm
where pm.team_id in (
select md.team_id
from match_details md
where md.play_stage ='G' and md.team_id = (select country_id from soccer_country where country_name like '%germany%')
) and pm.posi_to_play = 'Gk';