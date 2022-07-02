-- match number for game with highest # of penalty shots & countries

select md.match_no,md.team_id, md.penalty_score, sc.country_name
from match_details md
join soccer_country sc on md.team_id  = sc.country_id
where md.match_no in (
select md.match_no
from match_details md
where md.penalty_score  = (select max(penalty_score)from match_details md2)
);