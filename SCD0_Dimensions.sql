-- Term Project
-- Chloe Yihe Peng
-- SCD0 Tables


use Bike;

-- Time Dimension and Date Dimension
-- DROP TABLE DateDim;
CREATE TABLE DateDim (DateDim_ID INT PRIMARY KEY, 
						D_Day INT,
						D_Month INT,
						D_Year INT);
Select * From DateDim;

-- DROP TABLE TimeDim;
CREATE TABLE TimeDim (TimeDim_ID INT PRIMARY KEY, 
						T_Time Time,
						T_Day INT,
						T_Month INT,
						T_Year INT);
Select * From TimeDim;