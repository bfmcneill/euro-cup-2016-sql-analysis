-- subs that went on to field in first half of play on normal play schedule

select count(*) as 'sub count'
from player_in_out pio
where play_schedule  = 'NT' and in_out = 'I' and play_half = 1