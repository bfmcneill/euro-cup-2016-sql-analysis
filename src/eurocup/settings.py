import pathlib
import logging.config
import yaml

logger = logging.getLogger(__name__)

project_root = pathlib.Path(__file__).parents[2]
data_dir = project_root / "data"
sql_dir = project_root / "sql"
config_json_path = project_root / "config.json"
logger_config = project_root / "logging.yml"

with open(logger_config, "r") as stream:
    config = yaml.load(stream, Loader=yaml.FullLoader)

logging.config.dictConfig(config)
