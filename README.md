# Bike Rental Availability & Nearby Bike Shops – Full Stack Data Warehouse

Term project for CS 689 Designing and Implementing Data Warehouse Boston University (Fall 2023)

## Objective

Assessed the correlation between rental bike availability and the number of bike shops nearby using Python dataframes. Built and maintained a data pipeline able to handle recurring data flow and slowly changing dimensions with the pyodbc package.

## Data

- Cyclistic Bike Share Trip Data https://www.kaggle.com/datasets/rubyphan/bike-share
- 99Bikes Sales Data https://www.kaggle.com/datasets/tforsyth/99bikes-sales-data
- Bike Accessories Sales Dataset https://www.kaggle.com/datasets/nivethithaamurugan/bike-accessories-sales-dataset


## Process

1. **Design:** defined five business questions and built a constellation schema with 4 fact tables (snapshot and cumulative), 9 dimensions and time dimensions at different grains.
2. **ETL:** loaded the data with SQL and Python (pandas, pyodbc), including delta loads for slowly changing dimensions for SCD2 updates.
3. **Analytics:** answered business questions with analytical SQL queries using window functions.
4. **Visualization:** built dashboards in Tableau  with drill-down, filtering and calculated fields.

## Key Outcomes

- time dimensions (SCD Type 0) at different grains design (year, month, day, time) vs (year, month, day), for the advantage of each fact table's grain is defined by its dimensions, as well as optimized storage and performance (ie: a date dimension has about 365 rows per year vs a time-of-day grain has many more 8,760 per year at hourly grain or 525,600 at minute grain). Moreover, they both share year → month → day hierarchy for drill-down and roll-up.


- Built an ETL pipeline in SQL and Python (pandas, pyodbc) that handles recurring data loads.
- Implemented delta loads for slowly changing dimensions:
  - **SCD Type 2** on current customer, bike sharing, bike products, and bike accessories: keeps full history with new rows, effective dates and a current flag.
  - **SCD Type 3** on transaction: keeps the previous value in a separate column.
  - **SCD Type 0** on time, data, and bike accessories shop.

- Window function analytical queries, as well as implementing the COALESCE() function to better adjust to the dataset, since there are expected null values in the Brand column.
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
- `SCD0_Dimensions.sql, SCD2_BikeTrip.sql, SCD2_Product_tables.sql, FactTable.sql` table creation
- `ETL_python.ipynb` ETL
- `Business_questions.sql` analytical queries
- `python/` ETL scripts
- `Rental_Bike_Analysis` final presentation (schema, data flows, code samples, visualizations)
- `Bike_schema.pdf` database design
