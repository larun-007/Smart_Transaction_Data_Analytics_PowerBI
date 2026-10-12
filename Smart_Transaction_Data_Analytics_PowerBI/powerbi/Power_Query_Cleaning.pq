/*
Power Query M starter.
Update the File.Contents path to the actual location of the Excel workbook.
To use it: Power BI Desktop > Transform data > Advanced Editor.
*/
let
    Source = Excel.Workbook(
        File.Contents("C:\\YOUR_FOLDER\\Smart_Digital_Payment_Analytics_Dataset.xlsx"),
        null,
        true
    ),
    RawSheet = Source{[Item="Transactions_Raw", Kind="Sheet"]}[Data],
    PromotedHeaders = Table.PromoteHeaders(RawSheet, [PromoteAllScalars=true]),
    UniqueTransactions = Table.Distinct(PromotedHeaders, {"Transaction_ID"}),
    FillCategoricalNulls = Table.ReplaceValue(
        UniqueTransactions,
        null,
        "Unknown",
        Replacer.ReplaceValue,
        {"Category", "Location", "Payment_Method"}
    ),
    CorrectTypes = Table.TransformColumnTypes(
        FillCategoricalNulls,
        {
            {"Transaction_ID", type text},
            {"Transaction_Date", type date},
            {"Transaction_Time", type time},
            {"Amount_INR", type number},
            {"Payment_Method", type text},
            {"Transaction_Status", type text},
            {"Category", type text},
            {"Customer_ID", type text},
            {"Location", type text}
        }
    )
in
    CorrectTypes
