create database ecommerce;
use ecommerce;
SELECT
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS churned_customers,
    COUNT(*) AS total_customers,
    (SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS overall_churn_rate_percentage
FROM
    ecommerce_data;

SELECT 
    Gender,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS churned_customers,
    (SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS churn_rate_percentage
FROM 
    ecommerce_data
GROUP BY 
    Gender;

/* Churn Rate by Age Group
This query uses a CASE statement to create age groups and then calculates the churn rate for each. This is a crucial step for identifying at-risk demographics.
 */
SELECT
    CASE
        WHEN `Customer Age` BETWEEN 18 AND 24 THEN '18-24'
        WHEN `Customer Age` BETWEEN 25 AND 34 THEN '25-34'
        WHEN `Customer Age` BETWEEN 35 AND 44 THEN '35-44'
        WHEN `Customer Age` BETWEEN 45 AND 54 THEN '45-54'
        ELSE '55+'
    END AS age_group,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS churned_customers,
    (SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) * 100.0) / COUNT(*) AS churn_rate_percentage
FROM
    ecommerce_data
GROUP BY
    age_group
ORDER BY
    age_group;
    
    /* Here are the SQL queries for the next part of your analysis, focused on customer purchase habits.

Average Purchase Amount for Churned vs. Retained Customers
This query uses AVG() and a GROUP BY on the Churn column to see if there's a difference in spending habits between customers who stayed and those who left. This is a key metric to show the financial impact of churn.

SQL */

SELECT
    CASE
        WHEN Churn = 1 THEN 'Churned'
        ELSE 'Retained'
    END AS customer_status,
    AVG(`Total Purchase Amount`) AS average_purchase_amount
FROM
    ecommerce_data
GROUP BY
    customer_status;
    
    /* commerce_data table has a Purchase Date column, we can use that to track changes in churn over time. The query below will give you a monthly breakdown of total customers and churned customers.
Here is the SQL query for your time-based analysis.
*/
SELECT
    DATE_FORMAT(STR_TO_DATE(`Purchase Date`, '%Y-%m-%d %H:%i:%s'), '%Y-%m') AS purchase_month,
    COUNT(DISTINCT `Customer ID`) AS total_customers_in_month,
    SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) AS churned_customers_in_month,
    (SUM(CASE WHEN Churn = 1 THEN 1 ELSE 0 END) * 100.0) / COUNT(DISTINCT `Customer ID`) AS churn_rate_in_month
FROM
    ecommerce_data
GROUP BY
    purchase_month
ORDER BY
    purchase_month;

/* This query uses a Common Table Expression (CTE) to first calculate the CLV for each individual customer and then uses that result to find the average for both churned and retained groups.*/
WITH CustomerCLV AS (
    SELECT
        `Customer ID`,
        MAX(Churn) AS Churn_Status,
        SUM(`Total Purchase Amount`) AS Lifetime_Value
    FROM
        ecommerce_data
    GROUP BY
        `Customer ID`
)
SELECT
    CASE
        WHEN Churn_Status = 1 THEN 'Churned'
        ELSE 'Retained'
    END AS customer_segment,
    AVG(Lifetime_Value) AS average_clv
FROM
    CustomerCLV
GROUP BY
    customer_segment;
    
    /* Recency, Frequency, Monetary (RFM) Analysis
This query will calculate the three core RFM metrics for each customer. It's a stepping stone to a full segmentation, so we'll store the results in a new table to make the next step easier.*/
SELECT
    `Customer ID`,
    DATEDIFF(CURRENT_DATE(), MAX(`Purchase Date`)) AS Recency,
    COUNT(`Purchase Date`) AS Frequency,
    SUM(`Total Purchase Amount`) AS Monetary
FROM
    ecommerce_data
GROUP BY
    `Customer ID`;

/* Great, let's tackle these two advanced analysis queries. They are crucial for showing a recruiter you can go beyond basic analysis.

Recency, Frequency, Monetary (RFM) Analysis
This query will calculate the three core RFM metrics for each customer. It's a stepping stone to a full segmentation, so we'll store the results in a new table to make the next step easier.

SQL

SELECT
    `Customer ID`,
    DATEDIFF(CURRENT_DATE(), MAX(`Purchase Date`)) AS Recency,
    COUNT(`Purchase Date`) AS Frequency,
    SUM(`Total Purchase Amount`) AS Monetary
FROM
    ecommerce_data
GROUP BY
    `Customer ID`;
Returns and Purchase Amount Correlation
This query will help you understand if high-value customers have a different return behavior. This is a creative way to do a "funnel" analysis with the data you have.*/
SELECT
    CASE
        WHEN T1.Total_Purchase_Amount > (SELECT AVG(`Total Purchase Amount`) FROM ecommerce_data) THEN 'High Spender'
        ELSE 'Low Spender'
    END AS spending_segment,
    AVG(T1.Returns) AS average_returns,
    COUNT(T1.`Customer ID`) AS total_customers_in_segment
FROM
    (SELECT
        `Customer ID`,
        SUM(`Total Purchase Amount`) AS Total_Purchase_Amount,
        SUM(Returns) AS Returns
    FROM
        ecommerce_data
    GROUP BY
        `Customer ID`) AS T1
GROUP BY
    spending_segment;