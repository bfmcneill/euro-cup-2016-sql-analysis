-- date eurocup started
select max(play_date) as eurocup_begin
from match_mast
order by play_date asc;