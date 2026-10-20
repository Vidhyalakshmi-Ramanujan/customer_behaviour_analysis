# Customer Behaviour Analysis

An end-to-end data analytics project focused on customer shopping behaviour using **Python, Pandas, PostgreSQL, Supabase, and SQL**. This project covers data exploration, data cleaning, feature engineering, cloud database integration, and SQL-based analysis to explore purchasing patterns and customer segments.

## Project Overview

The project uses a customer shopping behaviour dataset containing **3,900 customer records**. The data is cleaned and transformed in Google Colab, stored in a Supabase PostgreSQL database, and analysed using SQL to investigate customer purchases, discounts, subscription behaviour, product ratings, and revenue contribution.

## Tech Stack

- **Language:** Python
- **Notebook Environment:** Google Colab
- **Data Analysis:** Pandas, NumPy
- **Database:** PostgreSQL, Supabase
- **Database Connectivity:** SQLAlchemy, psycopg2
- **Query Language:** SQL
- **Visualisation:** Power BI (data integration and reporting workflow)

## Dataset

The dataset, `customer_shopping_behavior.csv`, contains 3,900 records covering customer demographics, product purchases, spending, and shopping preferences.

Key attributes include:

- Customer ID, age, and gender
- Purchased item and product category
- Purchase amount and location
- Product size, colour, and season
- Review rating and subscription status
- Shipping type and discount usage
- Previous purchases and purchase frequency

## Project Workflow

### 1. Data Loading and Exploration

Loaded the CSV dataset into a Pandas DataFrame in Google Colab and examined its structure, summary statistics, data types, and missing values using:

- `head()`
- `info()`
- `describe()`
- `describe(include='all')`
- `isnull().sum()`

### 2. Data Cleaning and Transformation

- Identified 37 missing values in the review rating column.
- Imputed missing review ratings using the median rating of the corresponding product category.
- Standardised column names to lowercase with underscores.
- Renamed `purchase_amount_(usd)` to `purchase_amount`.
- Created an `age_group` feature using `pd.qcut()` to segment customers into four age groups.
- Converted categorical purchase frequencies into numerical day intervals using `purchase_frequency_days`.
- Compared `discount_applied` and `promo_code_used` and removed the latter after confirming that the values matched.
- Checked for duplicate records; no duplicate rows were found.

### 3. Supabase PostgreSQL Integration

- Connected Google Colab to a cloud PostgreSQL database hosted on Supabase.
- Used SQLAlchemy and psycopg2 for database connectivity.
- Configured an SSL-enabled connection and verified connectivity.
- Loaded the cleaned DataFrame into the `customer` table using Pandas `to_sql()`.
- Verified that 3,900 records were loaded into the database.

The resulting table contains 19 columns after cleaning and feature engineering.

### 4. SQL Analysis

SQL queries were written to explore customer shopping patterns, including:

| Analysis | Objective |
|---|---|
| Gender-wise purchases | Compare total purchase amounts by gender |
| Discount usage and spending | Identify discounted purchases above average purchase amount |
| Product ratings | Find products with the highest average review ratings |
| Shipping methods | Compare average purchase amounts for Express and Standard shipping |
| Subscription analysis | Compare customer counts, average spending, and total spending by subscription status |
| Product discount rates | Calculate the percentage of purchases using discounts by product |
| Customer segmentation | Classify customers as new, returning, or loyal based on previous purchases |
| Top products by category | Rank the three most purchased products within each category using `ROW_NUMBER()` |
| Repeat buyer analysis | Examine subscription status among customers with more than five previous purchases |
| Revenue by age group | Calculate and rank total revenue contributed by each age group |

SQL concepts used include:

- Aggregate functions: `COUNT()`, `SUM()`, and `AVG()`
- Grouping and sorting: `GROUP BY` and `ORDER BY`
- Filtering with `WHERE`
- Conditional logic using `CASE`
- Subqueries
- Common Table Expressions (CTEs)
- Window functions using `ROW_NUMBER()`

## Repository Contents

- `Customer_Behaviour_Analysis.ipynb` — Google Colab notebook containing data exploration, cleaning, transformation, and database integration.
- `customer_shopping_behavior.csv` — Source dataset, if included in the repository.
- `README.md` — Project overview, workflow, and documentation.

## How to Run

1. Clone or download this repository.
2. Open `Customer_Behaviour_Analysis.ipynb` in Google Colab.
3. Upload `customer_shopping_behavior.csv` or configure the notebook to access the dataset.
4. Install any required libraries that are not already available in the environment.
5. Configure your Supabase PostgreSQL connection using your own credentials.
6. Run the notebook cells in order to explore, clean, and transform the data.
7. Load the processed data into the `customer` table.
8. Execute the SQL queries against the resulting PostgreSQL table.


## Key Outcomes

- Prepared and validated a 3,900-record customer shopping dataset.
- Handled missing review ratings using category-specific median imputation.
- Engineered age-group and purchase-frequency features.
- Removed a redundant column after validating its values.
- Integrated the cleaned dataset with a cloud PostgreSQL database.
- Developed SQL queries for customer segmentation, product ranking, discount analysis, subscription behaviour, and revenue analysis.

## Future Improvements

- Build an interactive Power BI dashboard to communicate the analysis results.
- Develop additional customer segmentation and product performance metrics.
- Validate complete data refreshes between Supabase and Power BI.
- Document key findings and actionable business recommendations.

## Author

Developed as a hands-on data analytics project to practise Python-based data preparation, SQL analysis, and cloud database integration.
