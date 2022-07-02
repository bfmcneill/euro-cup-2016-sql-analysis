-- referees who booked the most number of players

select rm.referee_name, count(*) as 'tournament_bookings'
from match_mast mm
left join referee_mast rm on mm.referee_id  = rm.referee_id
left join player_booked pb on mm.match_no = pb.match_no
group by rm.referee_name
order by tournament_bookings desc
limit 1