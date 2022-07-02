-- all defenders who scored a goal

select distinct pm.player_name
from goal_details gd
join player_mast pm on gd.player_id = pm.player_id
where pm.posi_to_play = 'DF'