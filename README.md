# Smart Digital Payment Transaction Analytics and Monitoring Dashboard

A Power BI academic project built around the project presentation provided for Professional Training I.

## Project overview

This project analyzes digital payment transactions using Power Query, DAX, and interactive Power BI reports. Its workflow follows the supplied presentation:

1. Transaction data acquisition
2. Data cleaning and transformation
3. Payment performance analytics
4. Anomaly detection and monitoring
5. Interactive visualization and reporting

## Dataset

The included CSV sample is synthetic academic data (not real banking/customer data). It covers transaction IDs, date/time, amount in INR, payment method, status, category, customer ID, and location. It intentionally contains a few duplicate IDs, missing dimension values, and high-value transactions for demonstrating data cleaning and anomaly monitoring.

After removing duplicate Transaction_ID values, the dataset has 1,500 unique transactions.

## Repository layout

- `data/` — raw and cleaned transaction data, plus data dictionary
- `powerbi/` — DAX measures and Power Query M transformation
- `docs/` — build instructions, project report, and viva questions
- `outputs/` — computed KPI results and dashboard preview
- `visuals/` — architecture illustration

## Build and run

1. Install Power BI Desktop.
2. In Power BI Desktop, choose **Home → Get Data → Text/CSV** and import `data/Smart_Digital_Payment_Transactions_Raw.csv`.
3. Choose **Transform Data** and follow `docs/POWER_BI_BUILD_STEPS.md`.
4. Create measures from `powerbi/DAX_Measures.dax`.
5. Build the report pages described in the guide.
6. Save the completed report as `Smart_Digital_Payment_Analytics_Dashboard.pbix`.

## Important

The charts and numeric results in `outputs/` are computed from the synthetic sample dataset. The repository contains Power BI source assets and a dashboard preview; a native `.pbix` file must be created and saved in Power BI Desktop before it can be committed here.
