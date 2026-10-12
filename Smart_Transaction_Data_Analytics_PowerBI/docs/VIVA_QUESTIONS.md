# Viva questions and answers

**1. What is the purpose of this project?**  
To analyze digital payment records and monitor transaction volume, value, status, method, and high-value transactions through an interactive Power BI dashboard.

**2. Why is Power BI used?**  
Power BI combines data preparation, data modeling, DAX calculations, interactive visualizations, and report sharing in one analytics tool.

**3. What is Power Query?**  
Power Query is used to import, clean, transform, and shape data before it is loaded into the Power BI model.

**4. Why are duplicates removed?**  
Repeated transaction IDs can inflate counts and totals. The project uses `Transaction_ID` to deduplicate the sample data.

**5. What is DAX?**  
DAX (Data Analysis Expressions) is the formula language used in Power BI to create measures and calculated columns.

**6. What does Success Rate measure?**  
Successful Transactions divided by Total Transactions, displayed as a percentage.

**7. What is the anomaly rule in this project?**  
Transactions above ₹25,000 are labeled for review. It is a demonstration threshold, not proof of fraud.

**8. Why are slicers used?**  
Slicers let a report viewer filter the visuals by date, payment method, transaction status, category, or location.

**9. What is the difference between a measure and calculated column?**  
A measure is evaluated in the current filter context to summarize data; a calculated column is computed for each row in the data model.

**10. What are the limitations?**  
The data is synthetic, the anomaly threshold is simple, and a real-world deployment would require secure approved data access, validation, and more robust anomaly detection.
