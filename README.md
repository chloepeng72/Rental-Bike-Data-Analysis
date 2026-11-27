# Bike Rental Availability & Nearby Bike Shops – Full Stack Data Warehouse

Term project for CS CS 689 Designing and Implementing Data Warehouse Boston University (Fall 2023)

## Objective

Assessed the correlation between rental bike availability and the number of bike shops nearby using Python dataframes. Built and maintained a data pipeline able to handle recurring data flow and slowly changing dimensions with the pyodbc package.

## Data

- Cyclistic Bike Share Trip Data https://www.kaggle.com/datasets/rubyphan/bike-share
- 99Bikes Sales Data https://www.kaggle.com/datasets/tforsyth/99bikes-sales-data
- Bike Accessories Sales Dataset https://www.kaggle.com/datasets/nivethithaamurugan/bike-accessories-sales-dataset


## Process

1. **Design:** defined five business questions and built a constellation schema with <!-- number --> fact tables (snapshot and cumulative), <!-- number --> dimensions and time dimensions at different grains.
2. **ETL:** loaded the data with SQL and Python (pandas, pyodbc), including delta loads for slowly changing dimensions for SCD2 updates.
3. **Analytics:** answered business questions with analytical SQL queries using <!-- e.g. window functions, CTEs, pivots -->.
4. **Visualization:** built dashboards in Tableau  with drill-down, filtering and calculated fields.

## Key Outcomes

- Designed a constellation schema with <!-- number --> fact tables (transactional snapshot and cumulative) and <!-- number --> dimensions, with time dimensions at different grains (<!-- e.g. day, month -->).
- Built an ETL pipeline in SQL and Python (pandas, pyodbc) that handles recurring data loads.
- Implemented delta loads for slowly changing dimensions:
  - **SCD Type 2** on <!-- dimension.attribute -->: keeps full history with new rows, effective dates and a current flag.
  - **SCD Type 3** on <!-- dimension.attribute -->: keeps the previous value in a separate column.
  - **SCD Type 0/1** on <!-- dimension.attribute -->.
- Wrote analytical queries using <!-- window functions, CTEs, pivots --> to answer the business questions.
- Built Tableau visualizations with drill-down, filtering and calculated fields.

## SCD Type 2 Example

Before delta load:
![Before](images/scd2_before.png)

After delta load:
![After](images/scd2_after.png)

## Tools

- Python (pandas, pyodbc)
- SQL 
- Tableau 
- Lucidchart for the database schema as well as the physical data flow

## Files

- `sql/` table creation, ETL and analytical queries
- `python/` ETL scripts
- `Rental_Bike_Analysis` final presentation (schema, data flows, code samples, visualizations)
- `Bike_schema.pdf` database design
