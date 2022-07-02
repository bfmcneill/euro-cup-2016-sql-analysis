CREATE TABLE match_mast(
match_no NUMERIC,
play_stage CHAR(1),
play_date DATE,
results CHAR(5),
decided_by CHAR(1),
goal_score CHAR(5),
venue_id NUMERIC,
referee_id NUMERIC,
audence NUMERIC,
plr_of_match NUMERIC,
stop1_sec NUMERIC,
stop2_sec NUMERIC,
CONSTRAINT match_mast_pk PRIMARY KEY(match_no)
);