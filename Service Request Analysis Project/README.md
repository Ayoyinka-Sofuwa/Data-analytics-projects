# Service Request Analysis Project

## Overview

This project analyzes service requests within an organization, focusing on the efficiency of service departments, response times, and overall performance. The dataset includes key details like the off-time status, requester information, service department, and workflow status, among others. By leveraging this dataset, the analysis seeks to uncover insights that can lead to improved response times, better resource allocation, and increased service satisfaction.

## Project Objective

The primary objectives of this project are:
- **Identify Patterns in Service Requests:** Understand which departments and service units handle the most requests and explore recurring off-time statuses.
- **Analyze Service Performance:** Measure how long requests take to be picked and completed, and evaluate the performance of service units and departments.
- **SLA Compliance:** Check if service departments meet their Service Level Agreement (SLA) hours and analyze any deviations.
- **Off-time Analysis:** Identify the causes and patterns behind off-time durations to mitigate service delays.
- **Satisfaction Assessment:** Analyze the final ratings of the completed requests to determine satisfaction levels and pinpoint areas for improvement.
- **Automation:** Inform how requests and deliveries can be automated between departments within the organisation, [especially for departments that have high and more regular requests]

## Dataset

The dataset consists of the following key fields:

- `Reference Id`: Unique identifier for each service request.
- `Name`: The name of the service request.
- `Off-time Status`: Whether the service was delayed or off-track at any point.
- `Off-time Duration (Days)`: The total duration in days the request was off-time.
- `Requester Name`: Name of the individual who made the service request.
- `Requester Department`: The department from which the request was made.
- `Requester Eid`: Employee ID of the requester.
- `Requesting Date Time`: The date and time when the service request was made.
- `Service Department`: The department responsible for handling the request.
- `Service Unit`: The unit within the service department handling the task.
- `SLA Hours`: The Service Level Agreement time, defining the expected maximum time for handling the request.
- `Workflow Status`: The current status of the request (e.g., in-progress, completed, pending).
- `Task Owner Department`: The department that owns the task.
- `Created`: The timestamp of when the request was first created in the system.
- `Final Rating`: The rating provided by the requester upon completion of the service.
- `Year`: The year in which the service request was made.
- `Request Picked`: Timestamp showing when the service request was officially picked up by the service department.

## Data Cleaning and Preprocessing

The dataset required several preprocessing steps to prepare it for analysis. Python was used to clean the data, including:
1. **Missing Value Handling:** Fields like `Final Rating` and `Off-time Status` had missing values, which were handled by either imputing values or excluding them, depending on their significance.
2. **Date-Time Conversion:** Columns like `Requesting Date Time`, `Created`, and `Request Picked` were converted to proper datetime formats to calculate metrics such as response times.
3. **Off-time Calculation:** The `Off-time Status` and `Off-time Duration` were used to calculate how frequently and for how long requests were delayed.
4. **SLA Compliance Check:** Calculated the difference between `Request Picked` and the SLA hours to determine if requests were completed within agreed timeframes.
5. **Data Standardization:** Standardized names for departments and service units to avoid discrepancies in spelling or naming conventions.

## Exploratory Data Analysis (EDA)

Key questions explored during the analysis included:
- What are the most common service requests and which departments handle them?
- How frequently do requests exceed SLA hours?
- Which departments or service units have the longest response and off-time durations?
- Are there any patterns in `Final Rating` that correlate with certain service departments or request types?
- How has the performance of service departments evolved over time (e.g., by year)?

EDA was conducted using:
- **Python (Pandas, Matplotlib, Seaborn):** For analyzing trends, patterns, and visualizing insights.
- **Looker Studio:** To create interactive dashboards for tracking key metrics like off-time duration, SLA compliance, and satisfaction ratings.

## Data Modeling & Analysis

Key analysis components include:
- **Response Time Analysis:** Calculate the time difference between `Requesting Date Time` and `Request Picked` to evaluate departmental responsiveness.
- **Off-time Impact:** Analyze how the `Off-time Status` and `Off-time Duration` impact final service outcomes and satisfaction.
- **SLA Compliance:** Compare actual task duration against SLA hours to identify departments with consistent SLA breaches.
- **Satisfaction Insights:** Investigate how `Final Rating` is influenced by factors like response times, off-time duration, and service department performance.

## Visualizations & Dashboards

An interactive dashboard was created using **Looker Studio** to present:
- **Service Request Volume by Department:** A breakdown of the number of requests handled by each service department and unit.
- **SLA Compliance:** A visual analysis of how well departments meet their SLA times.
- **Off-time Duration Analysis:** A detailed view of which requests experienced delays and the total off-time duration.
- **Satisfaction Ratings:** Trends in satisfaction scores based on final ratings and corresponding service departments.

Find the link to the interactive dashboard here:
https://lookerstudio.google.com/reporting/edc58a34-f2bd-401a-a035-71d27b292044


## Conclusion

This analysis provides insights into the handling of service requests, helping the organization to identify inefficiencies, optimize resource allocation, and improve overall service quality. By examining response times, SLA compliance, and satisfaction ratings, the organization can better understand areas that need improvement and develop actionable strategies for future service management.

## Tools & Technologies Used
- **Python (Pandas, Matplotlib, Seaborn):** For data cleaning, preprocessing, and exploratory data analysis.
- **Looker Studio:** For building interactive dashboards to visualize the service performance metrics.
- **Jupyter Notebooks:** To present the analysis, visualizations, and findings in an organized manner.
- **GitHub:** To store and share the code, project documentation, and outputs.
