import logging
import click

from eurocup.database.db_ddl import Table
from eurocup.database.seed import make_and_seed_table, tables

logger = logging.getLogger(__name__)


@click.group()
def cmds():
    """db commands"""


@click.option("--table-name", "-n")
@cmds.command()
def make_tb(table_name):
    table = Table(table_name=table_name)
    table.create_from_sql()


@click.option("--table-name", "-n")
@cmds.command()
def make_and_seed(table_name):
    make_and_seed_table(table_name)


@cmds.command()
def make_and_seed_all():
    [make_and_seed_table(t) for t in tables]
