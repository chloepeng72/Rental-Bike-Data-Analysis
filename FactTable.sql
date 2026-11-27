-- Term Project
-- Chloe Yihe Peng
-- Facts tables


use Bike;

--DROP TABLE BikeSaleFact;
CREATE TABLE BikeSaleFact(CurrentCustDim_ID INT, 
						Bike_ShopDim_ID INT,
						Product_BikeDim_ID INT, 
						TransactionDim_ID INT,
						BikeSharingDim_ID INT,
						T_transaction_date Date,
						TimeDim_ID INT,
						number_of_bike_trip INT);
Select * From BikeSaleFact;

--DROP TABLE Bike_RevenueFact;
CREATE TABLE Bike_RevenueFact(CurrentCustDim_ID INT, 
						Bike_ShopDim_ID INT, 
						Product_BikeDim_ID INT,
						TransactionDim_ID INT,
						BikeSharingDim_ID INT,
						T_transaction_date Date,
						DateDim_ID INT,
						Monthly_total_revenue FLOAT,
						Monthly_avg_revenue FLOAT);
Select * From Bike_RevenueFact;


--DROP TABLE Bike_Accessory_SaleFact;
CREATE TABLE Bike_Accessory_SaleFact(CurrentCustDim_ID INT, 
						BikeAccessories_ShopDim_ID INT, 
						BikeAccessoriesDim_ID INT,
						TransactionDim_ID INT,
						BikeSharingDim_ID INT,
						T_transaction_date Date,
						TimeDim_ID INT,
						number_of_bike_trip INT);
Select * From Bike_Accessory_SaleFact;


-- DROP TABLE Bike_Accessory_RevenueFact;
CREATE TABLE Bike_Accessory_RevenueFact(CurrentCustDim_ID INT, 
						BikeAccessories_ShopDim_ID INT, 
						BikeAccessoriesDim_ID INT,
						TransactionDim_ID INT,
						BikeSharingDim_ID INT,
						T_transaction_date Date,
						DateDim_ID INT,
						Monthly_total_revenue FLOAT,
						Monthly_avg_revenue FLOAT);
Select * From Bike_Accessory_RevenueFact;