-- find # of matches won by a single point exclude penalty shootout

select
  match_no
, goal_score
, cast(SUBSTRING_INDEX(goal_score,'-',1)as int) home
, cast(SUBSTRING_INDEX(goal_score,'-',-1)as int) away
, ABS(cast(SUBSTRING_INDEX(goal_score,'-',1)as int)-cast(SUBSTRING_INDEX(goal_score,'-',-1)as int)) delta
, m.decided_by
, m.results
, COUNT(*) OVER () as 'matches_won_by_single_point_excluding_penalty_shootout'
from match_mast m
where m.results not like 'DRAW' AND decided_by NOT LIKE 'P'
AND ABS(cast(SUBSTRING_INDEX(goal_score,'-',1)as int)-cast(SUBSTRING_INDEX(goal_score,'-',-1)as int)) = 1