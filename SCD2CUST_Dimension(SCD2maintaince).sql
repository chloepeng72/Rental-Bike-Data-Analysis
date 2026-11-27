-- Term Project
-- Chloe Yihe Peng
-- SCD2 maintain for CurrentCustDim

use Bike;

-- SCD 2 for CurrentCustDim
Select * From CurrentCustDim;
Update CurrentCustDim
Set EffectiveDate = GETDATE(), CurrentFlag = 'Y';

UPDATE CurrentCustDim
SET Expire_Date = '2099-12-31';

-- staging table
--DROP TABLE StagingCurrentCustDim;
CREATE TABLE StagingCurrentCustDim (CurrentCustDim_ID INT PRIMARY KEY, 
						Customer_ID INT,
						Cust_Firstname VARCHAR(255), 
						Cust_Lastname VARCHAR(255), 
						Gender VARCHAR(255),
						Own_car VARCHAR(255), 
						Address1 VARCHAR(255), 
						State VARCHAR(255),
						Country VARCHAR(255),
						deceased_indicator VARCHAR(255),
						EffectiveDate DATE,
						Expire_Date DATE,
						CurrentFlag VARCHAR(255));
Select * From StagingCurrentCustDim;


-- compare to the dim table record:
Select* From CurrentCustDim;

-- then update the dimension for expired records based on CurrentCustDim_ID
UPDATE CurrentCustDim
SET Expire_Date = GETDATE(), CurrentFlag = 'N'
FROM CurrentCustDim C
INNER JOIN (
    SELECT Customer_ID FROM CurrentCustDim
    INTERSECT
    SELECT Customer_ID FROM StagingCurrentCustDim
) AS S ON C.Customer_ID = S.Customer_ID;


-- then insert new records into the Dimension table based on CurrentCustDim_ID
INSERT INTO CurrentCustDim (
    CurrentCustDim_ID, Customer_ID, Cust_Firstname, Cust_Lastname, Gender, Own_car, Address1, State, Country,
    deceased_indicator, EffectiveDate, Expire_Date, CurrentFlag
)
SELECT
    ROW_NUMBER() OVER (ORDER BY Customer_ID) AS CurrentCustDim_ID,
    S.Customer_ID, S.Cust_Firstname, S.Cust_Lastname, S.Gender, S.Own_car, S.Address1, S.State, S.Country,
    S.deceased_indicator, GETDATE() AS EffectiveDate, NULL, 'Y'
FROM StagingCurrentCustDim S
WHERE S.Customer_ID NOT IN (
    SELECT C.Customer_ID
    FROM CurrentCustDim C
    WHERE S.Customer_ID = C.Customer_ID
);

-- Check see the update:
SELECT * FROM CurrentCustDim;