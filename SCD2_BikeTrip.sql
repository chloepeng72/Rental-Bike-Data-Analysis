-- Term Project
-- Chloe Yihe Peng
-- SCD2 Maintainess for BikeTrip

use Bike;
-- Drop TABLE BikeSharingDim;
CREATE TABLE BikeSharingDim (BikeSharingDim_ID INT PRIMARY KEY, 
						Ride_ID VARCHAR(255),
						Customer_ID INT,
						Start_BikeStation_ID VARCHAR(255),
						End_BikeStation_ID VARCHAR(255),
						Trip_date Date,
						BikeStation_state VARCHAR(255),
						BikeStation_country VARCHAR(255),
						Rider_membership_EffectiveDate Date,
						Rider_membership_ExpireDate Date,
						membership_status VARCHAR(255));
Select * From BikeSharingDim;


-- Staging Table
-- DROP TABLE BikeSharingDim_staging;
CREATE TABLE BikeSharingDim_staging (BikeSharingDim_ID INT PRIMARY KEY, 
						Ride_ID VARCHAR(255),
						Customer_ID INT,
						Start_BikeStation_ID VARCHAR(255),
						End_BikeStation_ID VARCHAR(255),
						Trip_date Date,
						BikeStation_state VARCHAR(255),
						BikeStation_country VARCHAR(255),
						Rider_membership_EffectiveDate Date,
						Rider_membership_ExpireDate Date,
						membership_status VARCHAR(255));
Select * From BikeSharingDim_staging;
Select * From BikeSharingDim
Where Customer_ID ='76';

-- then update the dimension for expired records based on Customer_ID
-- Customer_ID 76 had a membership change so detected the update below

UPDATE BikeSharingDim
SET Rider_membership_ExpireDate = GETDATE(), membership_status = 'casual'
FROM BikeSharingDim BD
INNER JOIN BikeSharingDim_staging BS ON BD.Customer_ID = BS.Customer_ID
WHERE BD.Customer_ID = BS.Customer_ID;

Select * From BikeSharingDim
Where Customer_ID ='76';

Select *
From BikeSharingDim;

-- SCD2 maintanance
MERGE INTO BikeSharingDim
using
(
Select BS.Customer_ID
From BikeSharingDim_staging BS
UNION all
select * from BikeSharingDim_staging BS JOIN BikeSharingDim BD ON BS.Customer_ID = BD.Customer_ID

)
When MATCHED 
UPDATE BikeSharingDim
SET Rider_membership_ExpireDate = GETDATE(), membership_status = 'casual'
When NOT MATCHED
	Then Insert into BikeSharingDim(Customer_ID, CurrentFlag, EffectiveDate, ExpireDate) VALUES (, 'active', current_date(), '9999-12-31');

-- SCD2 ChatGPT version
MERGE INTO BikeSharingDim AS BS
USING (
    SELECT BS.Customer_ID
    FROM BikeSharingDim_staging BS
    UNION ALL
    SELECT BS.Customer_ID
    FROM BikeSharingDim_staging BS
    JOIN BikeSharingDim BD ON BS.Customer_ID = BD.Customer_ID
) AS source
ON BS.Customer_ID = source.Customer_ID
WHEN MATCHED THEN
    UPDATE SET
        Rider_membership_ExpireDate = GETDATE(),
        membership_status = 'casual'
WHEN NOT MATCHED THEN
    INSERT (Customer_ID, CurrentFlag, EffectiveDate, ExpireDate)
    VALUES (source.Customer_ID, 'active', GETDATE(), '9999-12-31');