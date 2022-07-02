-- match_no, date, score for matches where no stoppage time was added in the 1st half

select match_no,play_date,goal_score
from match_mast
where stop1_sec = 0;