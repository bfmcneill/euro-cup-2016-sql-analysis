create table player_mast(
player_id numeric
,team_id numeric
,jersey_no numeric
,player_name varchar(40)
,posi_to_play char(2)
,dt_of_bir date
,age numeric
,playing_club varchar(40)
,constraint player_mast primary key(player_id)
);