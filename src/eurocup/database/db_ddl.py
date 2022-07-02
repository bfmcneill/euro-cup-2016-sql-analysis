import csv
import logging
import sqlalchemy as sa
from eurocup.settings import sql_dir, data_dir, config_json_path
from eurocup.database.db_secret import DatabaseSecret

logger = logging.getLogger(__name__)


class Table:
    def __init__(self, table_name):
        self.table_name = table_name
        self.db_secret = DatabaseSecret.from_json_config(config_json_path)

    @property
    def engine(self):
        return sa.create_engine(self.db_secret.uri)

    def _truncate(self):
        logger.debug(f"dropping table `{self.table_name}`")
        sql_text = f"TRUNCATE TABLE {self.table_name};"
        self._execute(sa.text(sql_text))

    def _drop_table_if_exists(self):
        logger.debug(f"dropping table `{self.table_name}`")
        sql_text = f"DROP TABLE IF EXISTS {self.table_name};"
        self._execute(sa.text(sql_text))

    def _execute(self, stmt, params=None):
        try:
            with self.engine.connect() as cnxn:
                cnxn.execute(stmt, params)
        except Exception as e:
            raise

    def read_sql_from_path(self, sql_path):
        with open(sql_path) as fin:
            sql = "\n".join([line.strip("\n") for line in fin.readlines()])
        return sql

    def create_from_sql(self):
        logger.debug(f"creating table `{self.table_name}`")
        sql_path = sql_dir / "ddl" / f"{self.table_name}.sql"
        sql_text = self.read_sql_from_path(sql_path)
        self._drop_table_if_exists()
        self._execute(sa.text(sql_text))

    def insert_data(self, data):
        table = sa.Table(self.table_name, sa.MetaData(), autoload_with=self.engine)
        stmt = sa.insert(table).values(**data)
        with self.engine.connect() as conn:
            conn.execute(stmt)

    def seed(self):
        logger.debug(f"loading data into `{self.table_name}`")
        csv_path = data_dir / f"{self.table_name}.csv"

        with open(csv_path, mode="r", encoding="utf-8-sig") as csvfile:
            reader = csv.DictReader(csvfile)
            for record in reader:
                _data = {k: v for k, v in record.items() if v}
                self.insert_data(data=_data)
