-- Term Project
-- Chloe Yihe Peng
-- SCD3 Maintainess For TransactionDim

use Bike;
--DROP TABLE TransactionDim;
CREATE TABLE TransactionDim (TransactionDim_ID INT PRIMARY KEY, 
						Product_ID INT, 
						Customer_ID INT, 
						Store_ID INT,
						order_status VARCHAR(255), 
						online_order VARCHAR(255), 
						transaction_date DATE,
						Brand VARCHAR(255),
						Revenue FLOAT,
						Transaction_2023_first_quarter FLOAT,
						Transaction_2023_sec_quarter FLOAT,
						Transaction_2023_third_quarter FLOAT,
						Transaction_2023_fourth_quarter FLOAT);
Select * From TransactionDim;

-- SCD 3 store procedure 
CREATE PROCEDURE UpdateSCDType3
AS
BEGIN
    DECLARE @StartDate DATE = '2023-01-01';
    DECLARE @EndDate DATE = '2023-03-31';
    DECLARE @SumListPrice DECIMAL(18, 2);

    -- Calculate the sum of 'list_price' for the first quarter of 2023
    SELECT @SumListPrice = SUM(Revenue)
    FROM TransactionDim
    WHERE transaction_date >= @StartDate AND transaction_date <= @EndDate;

    -- Update existing rows with the sum value
    UPDATE TransactionDim
    SET Transaction_2023_first_quarter = @SumListPrice
    WHERE transaction_date >= @StartDate AND transaction_date <= @EndDate;

    -- Insert new rows for the first quarter of 2023 if not already present
    INSERT INTO TransactionDim (transaction_date, Revenue, Transaction_2023_first_quarter)
    SELECT DISTINCT transaction_date, 0 AS list_price, @SumListPrice AS Transaction_2023_first_quarter
    FROM TransactionDim
    WHERE transaction_date >= @StartDate AND transaction_date <= @EndDate
        AND transaction_date NOT IN (SELECT transaction_date FROM TransactionDim);

END;
