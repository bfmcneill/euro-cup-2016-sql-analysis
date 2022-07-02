-- total # of goals scored by each position for each country


select sc.country_abbr , pm.posi_to_play, count(1) as 'total_goals'
from goal_details gd
join player_mast pm on gd.player_id = pm.player_id
join soccer_country sc on gd.team_id = sc.country_id
group by sc.country_abbr, pm.posi_to_play
order by country_abbr, posi_to_play