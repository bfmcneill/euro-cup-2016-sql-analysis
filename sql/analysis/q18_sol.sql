-- highest number of foul cards given in one match

select count(*) as max_foul_card_count_in_one_match
from player_booked pb
group by match_no
order by max_foul_card_count_in_one_match desc
limit 1