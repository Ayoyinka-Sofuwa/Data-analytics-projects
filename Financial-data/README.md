## SQL Analysis and Predictive Modeling for Financial Dataset - 2021

### Project Overview
This project consists of two main phases:
1. **SQL Query Analysis**: Executing SQL queries using SQLite3 and pandas to derive insights from a small dataset of customer purchases.
2. **Predictive Analysis**: Building machine learning models using Logistic Regression and RandomForestClassifier to predict loan defaults in a financial dataset.

---

### SQL Queries

#### Data Overview
A small dataset of 15 entries for 5 unique customers was analyzed using **SQLite3** in Python, with pandas used for data manipulation. The dataset included details about customer purchases, the amount spent, and the purchase date.

#### SQL Operations
Key operations performed on the dataset:
1. **Total Amount Spent by All Visitors**: Calculated the total expenditure by all customers.
2. **Customers Who Visited in February and Spent More than 1000 Naira**: Queried customers who made significant purchases in February.
3. **Highest and Lowest Amount Spent in Each Month**: Extracted the maximum and minimum amounts spent monthly.
4. **Total Monthly Purchases**: Calculated the total purchases per month.
5. **Second Purchase Amount for Each User**: Identified how much each customer spent on their second purchase.

### Predictive Analysis

#### Overview
A financial dataset containing 10,000 entries was explored to predict loan defaults using machine learning models. The dataset included 5 features, such as **employment status**, **loan amount**, and **bank balance**, which were used to predict whether a customer would default on their loan repayment.

#### Data Preprocessing
- Cleaned and preprocessed the data to handle missing values and prepare it for modeling.
- Split the dataset into training and testing sets for model evaluation.

#### Model Building and Evaluation
Two models were built using **Scikit-learn**:
1. **Logistic Regression**: Achieved an accuracy of 0.9676.
2. **RandomForestClassifier**: Achieved a higher accuracy of 0.9696, making it the best-performing model.

#### Key Insights
- **Employment Status**: 71% of the customers were employed, while 29% were not.
- **Loan Defaults Across Income Levels**: About 3% of customers defaulted on their loans, regardless of income level, indicating that income alone does not guarantee loan repayment.
- **Bank Balance**: The bank balance feature had a low significance in predicting loan defaults.
- **Annual Salary**: This feature was the most significant in determining whether a customer would repay a loan.

#### Model Performance
- The **Logistic Regression** model performed well with an accuracy of **0.9676**.
- The **RandomForestClassifier** model slightly outperformed with an accuracy of **0.9696**, indicating that it was better suited for this dataset.

---

### Conclusion
This project demonstrated the power of SQL for quick insights into customer purchasing behaviour and machine learning for predicting financial outcomes. The RandomForestClassifier was the best model for predicting loan defaults, offering actionable insights for this financial institution.


