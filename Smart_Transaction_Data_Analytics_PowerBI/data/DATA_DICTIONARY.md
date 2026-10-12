# Dataset dictionary

| Column | Meaning | Recommended Power BI type |
|---|---|---|
| `Transaction_ID` | Unique transaction identifier (`TXN...`) | Text |
| `Transaction_Date` | Transaction date (Jan–Sep 2026) | Date |
| `Transaction_Time` | Time component of transaction timestamp | Time |
| `Amount_INR` | Transaction value in Indian rupees | Decimal number |
| `Payment_Method` | UPI, card, net banking, or wallet; missing values become `Unknown` | Text |
| `Transaction_Status` | Success, Failed, or Pending | Text |
| `Category` | Example spending category; missing values become `Unknown` | Text |
| `Customer_ID` | Synthetic customer identifier | Text |
| `Location` | Example city; missing values become `Unknown` | Text |

## Files and expected row counts

- `Smart_Digital_Payment_Transactions_Raw.csv`: 1,508 rows, including 8 duplicate `Transaction_ID` records and a small number of missing categorical values.
- `Smart_Digital_Payment_Analytics_Dataset.xlsx`: raw sheet with the same test data plus a pre-cleaned reference sheet.
- `transactions_clean.csv`: 1,500 unique transactions after deduplicating on `Transaction_ID` and filling missing categorical values with `Unknown`.

## Data caveats

This is generated synthetic data, not a sample from a real payment processor. The high-value threshold of ₹25,000 is chosen for demonstrative anomaly monitoring only. A high-value payment is not necessarily fraudulent.
