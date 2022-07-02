import click
from eurocup.cli.commands import database as db_cmd


@click.group()
def cli():
    """cli entrypoint"""


cli.add_command(db_cmd.cmds, "database")
