CREATE TABLE penalty_shootout(
kick_id NUMERIC
,match_no NUMERIC
,team_id NUMERIC
,player_id NUMERIC
,score_goal VARCHAR(1)
,kick_no NUMERIC
,CONSTRAINT penalty_shootout_pk PRIMARY KEY(kick_id)
);