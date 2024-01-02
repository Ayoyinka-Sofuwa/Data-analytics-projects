# SQL Queries and Predictive Analysis
### SQL
In this project, the first task was to work on [SQL queries](https://github.com/Ayoyinka-Sofuwa/Financial-project/blob/main/SQL%20problem.ipynb) on a small dataset, I used [SQLite3 in python](https://docs.python.org/3/library/sqlite3.html) to execute and perform operations using pandas.

In the first data, provided, we have 15 entries for 5 unique customers with the amount they spent, and on what day it was spent.
I calculated:
* The total amount spent by all visitors.
* All users who visited in February AND spent more than 1000 naira
* The highest and lowest amount spent in each month
* The total monthly purchases.
* How much each user spends on their second purchase.

### Predictive Analysis
#### Overview
Here I explored a financial dataset, withdrew insights from it, preprocessed the data and performed predictive analysis using Logistic Regression and RandomForestClassifier algorithms from Scikit learn
#### Summary

This dataset contains 10,000 entries of data about loan defaulters in a financial institution with 5 features based on their employment status, the loan amount and their bank balance, and to predict whether or not they will default on repaying a loan."

The best performing model was the model trained with the RandomForestClassifier algoritm with an accuracy of 0.9696

#### Some Insights:
[I worked on a dataset with 10,000 entries using python](https://github.com/Ayoyinka-Sofuwa/Financial-project/blob/main/Financial%20data.ipynb), and from the data, we see that:
* About 71% of the customers are employed and 29% aren't.
* Some of the customers at every income level defaulted (about 3% total), regardless of whether they were earning high or not. This indicates that a high income is not an absolute determinant that a customer will repay a loan.
* The bank balance feature has a very low significance in determining whether a person will repay or default on a loan
* And the annual salary has the most significance on whether a person will repay a loan

#### Classification tasks
I used the LogisticRegression algorithm to predict whether a customer will default on a loan and got an accuracy of 0.9676 and the RandomForestClassifier algorithm to predict the same and got an accuracy of 0.9696.
The RandomForestClassifier algorithm performed a little better but generally, this scores indicated a good performing model.
