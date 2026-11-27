-- Term Project
-- Chloe Yihe Peng
-- SCD2 Maintain for Product tables

use Bike;

--Drop TABLE Product_BikeDim;
CREATE TABLE Product_BikeDim (Product_BikeDim_ID INT PRIMARY KEY, 
						Product_ID INT, 
						ProductCategory VARCHAR(255), 
						Product_Subcategory VARCHAR(255),
						Quantity INT,
						Sale_price FLOAT,
						Revenue FLOAT,
						Rating FLOAT,
						EffectiveDate Date,
						Expire_Date DATE,
						CurrentFlag VARCHAR(255));
Select * From Product_BikeDim;

--DROP TABLE Product_Bike_Staging;
CREATE TABLE Product_Bike_Staging (Product_BikeDim_ID INT PRIMARY KEY, 
						Product_ID INT, 
						ProductCategory VARCHAR(255), 
						Product_Subcategory VARCHAR(255),
						Quantity INT,
						Sale_price FLOAT,
						Revenue FLOAT,
						Rating FLOAT,
						EffectiveDate Date,
						Expire_Date DATE,
						CurrentFlag VARCHAR(255));
Select * From Product_Bike_Staging;

UPDATE Product_BikeDim
SET Expire_Date = GETDATE(), CurrentFlag = 'Expire'
FROM BikeAccessoriesDim PBD
INNER JOIN Product_Bike_Staging PBS ON PBD.Product_ID = PBS.Product_ID
WHERE PBD.Product_ID = PBS.Product_ID;

Select * From Product_BikeDim
Where Product_ID ='19';

-----------------------------------------------------------------------------------------------------------

--DROP TABLE BikeAccessoriesDim;
CREATE TABLE BikeAccessoriesDim (BikeAccessoriesDim_ID INT PRIMARY KEY, 
						Product_ID INT, 
						ProductCategory VARCHAR(255), 
						Product_Subcategory VARCHAR(255),
						Quantity INT,
						Sale_price FLOAT,
						Revenue FLOAT,
						Rating FLOAT,
						EffectiveDate Date,
						Expire_Date Date,
						CurrentFlag VARCHAR(255));
Select * From BikeAccessoriesDim;

--DROP TABLE BikeAccessories_Staging;
CREATE TABLE BikeAccessories_Staging (BikeAccessoriesDim_ID INT PRIMARY KEY, 
						Product_ID INT, 
						ProductCategory VARCHAR(255), 
						Product_Subcategory VARCHAR(255),
						Quantity INT,
						Sale_price FLOAT,
						Revenue FLOAT,
						Rating FLOAT,
						EffectiveDate Date,
						Expire_Date Date,
						CurrentFlag VARCHAR(255));
Select * From BikeAccessories_Staging;


UPDATE BikeAccessoriesDim
SET Expire_Date = GETDATE(), CurrentFlag = 'Expire'
FROM BikeAccessoriesDim Ad
INNER JOIN BikeAccessories_Staging BAS ON Ad.Product_ID = BAS.Product_ID
WHERE Ad.Product_ID = BAS.Product_ID;

Select * From BikeAccessoriesDim
Where Product_ID ='76';