-- referee and the number of matches they worked in each venue

select rm.referee_name, sv.venue_name, count(*) as 'match_count'
from match_mast mm
join soccer_venue sv on mm.venue_id = sv.venue_id
join referee_mast rm on mm.referee_id = rm.referee_id
group by rm.referee_name , sv.venue_name
order by rm.referee_name, match_count desc