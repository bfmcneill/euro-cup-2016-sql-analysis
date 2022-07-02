-- find all venues where matches with penalty shootouts were played

select DISTINCT sv.venue_name
from match_mast mm
join soccer_venue sv on mm.venue_id = sv.venue_id
where mm.decided_by = 'P'