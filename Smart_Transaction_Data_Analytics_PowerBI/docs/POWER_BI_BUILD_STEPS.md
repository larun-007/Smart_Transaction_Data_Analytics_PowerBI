# Power BI Desktop build steps

## 1. Import the sample data

1. Install Power BI Desktop from Microsoft's official page: https://learn.microsoft.com/en-us/power-bi/fundamentals/desktop-get-the-desktop
2. Open Power BI Desktop → **Home → Get data → Excel**.
3. Open `data/Smart_Digital_Payment_Analytics_Dataset.xlsx`.
4. Select `Transactions_Raw` and click **Transform data**.

## 2. Clean the dataset in Power Query

1. Select `Transaction_ID`.
2. Choose **Home → Remove Rows → Remove Duplicates**.
3. For `Category`, `Location`, and `Payment_Method`, replace nulls with `Unknown`. In the UI, select the column and use **Transform → Replace Values**; depending on the Power BI version, null replacement may be easiest via the column filter or the M starter in `powerbi/Power_Query_Cleaning.pq`.
4. Set these types: `Transaction_ID` Text; `Transaction_Date` Date; `Transaction_Time` Time; `Amount_INR` Decimal Number; all remaining descriptive columns Text.
5. Rename the query `Transactions_Raw`.
6. Click **Home → Close & Apply**.

Expected: 1,500 distinct transaction IDs after duplicate removal.

## 3. Create DAX measures

Open **Modeling → New measure** and create the measures listed in `powerbi/DAX_Measures.dax`, one at a time. Format `Total Amount`, `Average Transaction Amount`, and `Maximum Transaction Amount` as currency/INR. Format `Success Rate %`, `Failure Rate %`, and `Anomaly Rate %` as percentages. Add `Anomaly Flag` as a **New column** if you want an explicit anomaly label in a table visual (it is a calculated column, not a measure).

## 4. Report page 1 — Executive Dashboard

Add a title text box: **Smart Digital Payment Transaction Analytics and Monitoring Dashboard**.

KPI cards:
- `Total Transactions`
- `Total Amount`
- `Success Rate %`
- `Failed Transactions`
- `Pending Transactions`

Charts:
- **Line chart:** X-axis `Transaction_Date`; Y-axis `Total Transactions`.
- **Donut chart:** Legend `Payment_Method`; Values `Total Transactions`.
- **Clustered column chart:** X-axis `Transaction_Status`; Y-axis `Total Transactions`.
- **Bar chart:** Y-axis `Category`; X-axis `Total Amount`.
- **Bar chart:** Y-axis `Location`; X-axis `Total Transactions`.

Add slicers for `Transaction_Date`, `Payment_Method`, `Transaction_Status`, `Category`, and `Location`.

## 5. Report page 2 — Payment Performance

Use visuals comparing transactions and total amount by payment method, status, category, and location. Include success and failure rate cards. Keep slicers synchronized if helpful (**View → Sync slicers**).

## 6. Report page 3 — Anomaly Monitoring

- Card: `Anomalous Transactions`.
- Card: `Anomaly Rate %`.
- Table columns: `Transaction_ID`, `Transaction_Date`, `Amount_INR`, `Payment_Method`, `Transaction_Status`, `Category`, `Customer_ID`, `Location`, and `Anomaly Flag`.
- Filter `Anomaly Flag` to `Anomaly`, or set a visual-level filter `Amount_INR > 25000`.
- Optional bar chart: anomalous transaction amount by payment method or category.

**Interpretation:** the ₹25,000 rule is a simple educational threshold for highlighting transactions for review. Do not describe it as a validated fraud-detection algorithm.

## 7. Save and run the project

1. Choose **File → Save As**.
2. Save as `Smart_Transaction_Data_Analytics_PowerBI.pbix` inside this `powerbi/` folder.
3. To run the project later, open that `.pbix` file in Power BI Desktop. Use slicers and click chart elements to explore cross-filtering.
4. For submission, capture screenshots of all three pages and place them in `outputs/`.

## Validation checks

- Total Transactions should show 1,500 when there are no slicers active.
- Successful + Failed + Pending should equal Total Transactions (assuming every row has one of these statuses).
- The high-value anomaly count is based on `Amount_INR > 25000`.
- The dashboard preview in `outputs/` is a static design reference; it is not an interactive Power BI report.
