## README: Vehicle Sales and Customer Satisfaction Analysis

### Project Overview
This project focuses on analyzing vehicle sales data and customer satisfaction metrics using **SQL** for data querying and analysis, while **Looker Studio** was used to create visual representations of the findings. The final output, including all visualizations and insights, was published in a **PowerPoint presentation** for ease of access and communication.

### Data Sources
The project is built around four main data tables, as detailed in the provided **Entity-Relationship Diagram (ERD)**:

1. **`product_t`**:
   - **Description**: Contains data on vehicles sold.
   - **Columns**: `PRODUCT_ID`, `VEHICLE_MAKER`, `VEHICLE_MODEL`, `VEHICLE_COLOR`, `VEHICLE_MODEL_YEAR`, `VEHICLE_PRICE`.
  
2. **`customer_t`**:
   - **Description**: Contains information on customers.
   - **Columns**: `CUSTOMER_ID`, `CUSTOMER_NAME`, `GENDER`, `CITY`, `COUNTRY`, `EMAIL_ADDRESS`, `CREDIT_CARD_TYPE`, etc.

3. **`order_t`**:
   - **Description**: Represents sales transactions.
   - **Columns**: `ORDER_ID`, `CUSTOMER_ID`, `PRODUCT_ID`, `QUANTITY`, `ORDER_DATE`, `SHIP_MODE`, `DISCOUNT`, etc.

4. **`shipper_t`**:
   - **Description**: Contains details of shipping companies.
   - **Columns**: `SHIPPER_ID`, `SHIPPER_NAME`, `SHIPPER_CONTACT_DETAILS`.

### SQL Analysis
SQL was used for the following key analyses:

1. **Revenue and Sales Trends**:
   - Querying the `order_t` and `product_t` tables to calculate total sales, revenue by quarter, and trends over time.
   
2. **Customer Distribution**:
   - Analyzing customer distribution across different states and countries by querying the `customer_t` table.
   
3. **Customer Satisfaction**:
   - Using data on customer feedback from the `order_t` table to track satisfaction trends over time.

4. **Shipping Efficiency**:
   - Calculating average shipping times and their changes over quarters from the `order_t` table.

### Visualization with Looker Studio
The following key graphs and dashboards were created in Looker Studio to summarize insights:
1. **Revenue and Orders by Quarter**: Visualized the decline in sales and revenue across quarters.
2. **Top Vehicle Makers**: Chevrolet and Ford were identified as the most popular brands.
3. **Customer Distribution by State**: Highlighted key states (California, Texas, Florida, New York) with the highest customer concentration.
4. **Customer Satisfaction Over Time**: Displayed a declining trend in customer ratings towards the end of the year.
5. **Shipping Times and Discounts**: Illustrated shipping delays over the year and average discounts offered by different credit card types.

### PowerPoint Presentation
The final PowerPoint presentation contains all the graphs and insights, structured as follows:
- **Business Overview**: Total revenue, customers, and orders.
- **Customer Metrics**: Distribution of customers and satisfaction trends.
- **Revenue and Sales Trends**: Quarterly changes in revenue and orders.
- **Shipping Metrics**: Time to ship orders and discounts offered.

### Key Insights and Recommendations
1. **Revenue and Sales Decline**: A steady drop in sales and revenue was observed over the year, particularly after Q1.
2. **Customer Satisfaction**: Ratings consistently dropped towards the end of the year, possibly due to longer shipping times.
3. **Shipping Delays**: Increasing shipping times may have contributed to declining customer satisfaction and lower repeat orders.

**Recommendations**:
- Investigate reasons for increasing shipping delays and customer dissatisfaction.
- Implement strategies to improve logistics and enhance customer experience, particularly towards the end of the year.

### How to Access the Report
- **SQL Queries**: The SQL scripts used for analysis are available in the repository.
- **PowerPoint**: The final presentation is provided as a PowerPoint file for review.

This project demonstrates how SQL and Looker Studio can be combined effectively to analyze business performance and communicate insights in a visually compelling manner.
