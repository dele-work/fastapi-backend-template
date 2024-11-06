import logging
import logging.config
import os
from pathlib import Path


def setup_logging(log_directory: str = "./logs"):
    """
    Configure logging settings.

    :param log_directory: Path to the directory where log files will be saved.
    """
    # Create log directory
    Path(log_directory).mkdir(parents=True, exist_ok=True)

    logging_config = {
        "version": 1,
        "disable_existing_loggers": False,  # Do not disable existing loggers
        "formatters": {
            "default": {
                "format": "%(levelname)s %(asctime)s %(name)s %(message)s",
            },
            "access": {
                "format": "%(levelname)s %(asctime)s %(name)s %(message)s",
            },
        },
        "handlers": {
            "console": {
                "class": "logging.StreamHandler",
                "formatter": "default",
                "stream": "ext://sys.stdout",
            },
            "file_app": {
                "level": "INFO",
                "class": "logging.FileHandler",
                "formatter": "default",
                "filename": os.path.join(log_directory, "app.log"),
                "encoding": "utf8",
            },
            "file_access": {
                "level": "INFO",
                "class": "logging.FileHandler",
                "formatter": "access",
                "filename": os.path.join(log_directory, "access.log"),
                "encoding": "utf8",
            },
        },
        "loggers": {
            "uvicorn": {
                "handlers": ["console", "file_app"],
                "level": "INFO",
                "propagate": False,
            },
            "uvicorn.error": {
                "handlers": ["console", "file_app"],
                "level": "INFO",
                "propagate": False,
            },
            "uvicorn.access": {
                "handlers": ["console", "file_access"],
                "level": "INFO",
                "propagate": False,
            },
        },
        "root": {
            "level": "INFO",
            "handlers": ["console", "file_app"],
        },
    }

    logging.config.dictConfig(logging_config)