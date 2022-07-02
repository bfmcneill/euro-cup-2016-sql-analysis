from setuptools import setup, find_packages

setup(
    name="eurocup",
    description="eurocup project",
    version="0.0.1",
    package_dir={"": "src"},
    packages=find_packages(where="src"),
    python_requires=">=3.6, <4",
    install_requires=[
        "click==8.1.3",
        "PyMySQL==1.0.2",
        "mariadb==1.1.2",
        "SQLAlchemy==1.4.37",
        "pendulum==2.1.2",
    ],
    extras_require={
        "docs":[
            "mkdocs-material==8.2.15",
            "mkdocstrings[python]>=0.18",
            "lightgallery"
        ],
        "ipy":[
            "jupyterlab",
            "ipython-sql",
            "jupyterlab-sql"
        ],
        "dev": [
            "black",
            "pytest",
            "pylint",
        ]
    },
    entry_points={"console_scripts": ["pcmd=eurocup.cli.entrypoint:cli"]},
)