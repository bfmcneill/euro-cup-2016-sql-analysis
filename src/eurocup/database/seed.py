from eurocup.database.db_ddl import Table

tables = [
    "asst_referee_mast",
    "coach_mast",
    "goal_details",
    "match_captain",
    "match_details",
    "match_mast",
    "penalty_gk",
    "penalty_shootout",
    "player_booked",
    "player_in_out",
    "player_mast",
    "playing_position",
    "referee_mast",
    "soccer_city",
    "soccer_country",
    "soccer_team",
    "soccer_venue",
    "team_coaches",
]


def make_and_seed_table(table_name):
    t = Table(table_name)
    t.create_from_sql()
    t.seed()


if __name__ == "__main__":
    [make_and_seed_table(t) for t in tables]
    # make_and_seed_table('match_mast')
