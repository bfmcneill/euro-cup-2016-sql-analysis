-- number of matches that were won by penalty shootout

select count(*) as wins_by_penalty_shootout
from match_mast
where decided_by = 'P';