import json
import pathlib


class DatabaseSecret:
    """Auth manager for reddit api oauth"""

    driver = "mariadb+pymysql"

    def __init__(self, username, password, host, port, database):
        self.username = username
        self.password = password
        self.host = host
        self.port = port
        self.database = database

    @property
    def uri(self):
        sa_uri_template = "{}://{}:{}@{}:{}/{}"
        return sa_uri_template.format(
            DatabaseSecret.driver,
            self.username,
            self.password,
            self.host,
            self.port,
            self.database,
        )

    def __repr__(self):
        template = "DatabaseSecret(username='{}',password='***',host='{}',port='{}',database='{}')"
        return template.format(
            self.username,
            self.host,
            self.port,
            self.database,
        )

    @classmethod
    def from_json_config(cls, config_json_path: pathlib.Path):
        """Create instance from json config

        Args:
            config_json_path:   path to config file containing secrets
        """

        with open(config_json_path, "r") as fin:
            data = json.load(fin)

        username = data["MARIA_DB_USERNAME"]
        password = data["MARIA_DB_PASSWORD"]
        host = data["MARIA_DB_HOST"]
        port = data["MARIA_DB_PORT"]
        database = data["MARIA_DB_DATABASE"]
        return cls(username, password, host, port, database)
