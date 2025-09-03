# E-commerce-Customer-Churn-Retention-Analysis

## 1. Project Description
This project is a comprehensive data analytics solution designed to **predict, analyze, and mitigate customer churn** for an e-commerce business. Leveraging a multi-stage methodology from data preparation to interactive visualization, it **identifies** critical churn drivers, **segments** the customer base, and **proposes** data-driven strategies to enhance customer retention and lifetime value.

## 2. Project Goal
The primary goal of this project is to **empower stakeholders** with actionable insights to **reduce customer churn** and **optimize retention strategies**. It aims to move beyond reactive reporting by providing a holistic view of customer behavior, thereby enabling proactive decision-making and driving sustainable business growth.

## 3. Tech Stack Used
* **Python (Jupyter Notebook):** Data Cleaning, Exploratory Data Analysis (EDA), Database Loading.
* **MySQL Workbench:** Advanced SQL querying, Deeper EDA, Business Question Answering.
* **Power BI Desktop:** Data Visualization, Dashboard Design, Interactive Reporting.
* **DAX (Data Analysis Expressions):** Custom Measure Creation, Calculated Columns, Segmentation Logic.

## 4. Data Source
The project utilizes a **synthetic e-commerce dataset** comprising 250,000 customer records, detailing purchase history, demographic information, and churn status. This dataset enables robust analysis of customer behavior over time.

## 5. Features & Highlights

### Business Problem:
The e-commerce business faced a **significant and stable customer churn rate (20.05%)**, indicating a persistent retention challenge. Initial assumptions were disproven as analysis **revealed** that valuable, high-spending customers were also churning, driven by unclear factors, hindering growth and profitability.

### Goal of the Dashboard:
The dashboard's goal is to **transform raw data into actionable intelligence**. It **provides** real-time insights into churn drivers, **segments** customers for targeted interventions, and **visualizes** key performance indicators to **facilitate proactive strategies** for customer retention and enhanced CLV.

### Walkthrough of Key Visuals:
##### **Key Performance Indicators (KPIs):**
* **Total Customers:** **250,000** – Represents the total analyzed customer base.
* **Churn Rate %:** **20.05%** – **Quantifies** the overall customer attrition.
* **Return Rate %:** **41%** – **Highlights** the proportion of customers making returns.
* **Average CLV:** **$2,725** – **Indicates** the average lifetime value per customer.
* **Average Purchase Amount:** **$2.73K** – **Reflects** the average transaction value.

##### **Charts:**
* **Churn Rate by Age Group:** A **bar chart** effectively **illustrates** the highest churn rate of **21.07%** within the **18-24 age group**, pinpointing a critical demographic for retention efforts.
* **Churn Rate by Gender:** A **bar chart** **compares** churn rates between genders, revealing specific patterns.
* **Churn with/without Returns:** **Gauge charts** **contrast** churn rates for customers who made returns (19.95%) versus those who did not (20.12%), **disproving** a direct link between simple returns and churn.
* **Total Customers by RFM Segment Group:** A **bar chart** (or Treemap) **visualizes** customer distribution across segments like "At-Risk," "Lost," and "Other," enabling targeted marketing.
* **Monthly Churn Trend:** A **line chart** **tracks** the churn rate over time, **revealing** a consistent trend around 20%, reinforcing the need for systemic solutions.

#### **Business Problem Solutions:**
* **Targeted Retention Campaigns:** Insights into the **highest churn among 18-24 year olds** will **inform** dedicated marketing campaigns, aiming to **reduce** churn in this segment.
* **Product Quality & Returns Process Audit:** The **unexpected correlation** between **high-spending customers and elevated return rates** (not directly shown but a key insight in the report) **mandates** an audit of high-value product quality and the return process to **mitigate** churn among valuable customers.
* **Personalized Customer Engagement:** RFM segmentation (implied by the RFM Segment Group chart) will **enable** tailored engagement strategies for "At-Risk," "High-Value," and "Lost" customer groups, moving towards proactive churn prevention and customer win-back.
