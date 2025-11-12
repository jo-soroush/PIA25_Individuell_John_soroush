Electronics Shop – Database Project
Overview

This project is an individual examination for the course Databasteknik (PIA25).
It demonstrates SQL database design, data analysis, and Python integration with PostgreSQL.

Structure
electronics_shop/
├── schema.sql              # Database structure and constraints
├── testdata.sql            # Realistic sample data
├── queries.sql             # Basic SQL queries (Del 1)
├── queries_advanced.sql    # Advanced SQL queries (Del 2)
├── optimization.sql        # Index optimization and EXPLAIN ANALYZE
├── REPORT.md               # Documentation and results
├── database.py             # Database connection functions
├── queries.py              # Python query functions
├── main.py                 # Main program for testing
├── requirements.txt        # Python dependencies
└── venv/                   # Virtual environment (not included in ZIP)

Installation and Setup

Create and activate the virtual environment:

python -m venv venv
source venv/Scripts/activate


Install dependencies:

pip install -r requirements.txt


Run PostgreSQL and create the database:

CREATE DATABASE electronics_db;


Import schema and test data:

\i schema.sql
\i testdata.sql

Run the Python Application
python main.py

Author

This project was developed as part of the PIA25 – Databasteknik individual examination.