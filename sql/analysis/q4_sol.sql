-- list showing # of substitutions that happened in various stages of play for entire tournament

select play_schedule, play_half, count(match_no)/2 as 'subs_count'
from player_in_out
group by play_schedule, play_half;