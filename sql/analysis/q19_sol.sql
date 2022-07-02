-- number of captains who were also goal keepers


select count(*)as '# of captains who were also goal keeps'
from match_captain mc
join player_mast pm on mc.player_captain  = pm.player_id
where pm.posi_to_play = 'GK'