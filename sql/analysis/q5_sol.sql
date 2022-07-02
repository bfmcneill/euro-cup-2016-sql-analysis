-- number of bookings that happened in stoppage time

select
 p.match_no
,p.play_half
,count(booking_time) as 'bookings_count'
,case
	when play_half = 1 then (select sum(stop1_sec) from match_mast m where m.match_no = p.match_no )
	else (select sum(stop2_sec) from match_mast m where m.match_no = p.match_no) end as 'stop_sec'
from player_booked p
group by match_no, play_half;