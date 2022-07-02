CREATE TABLE goal_details (
    goal_id NUMERIC,
    match_no NUMERIC,
    player_id NUMERIC,
    team_id NUMERIC,
    goal_time NUMERIC,
    goal_type CHAR(1),
    play_stage CHAR(1),
    goal_schedule CHAR(2),
    goal_half NUMERIC,
    CONSTRAINT goal_details_pk PRIMARY KEY (goal_id)
);