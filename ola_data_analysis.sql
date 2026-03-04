create database ola;
use ola;

-- Successful Booking:
create view successful_booking AS
select * from Bookings
where Booking_Status='Success';
-- Retrieve all Successful_Booking:
select * from successful_booking;

-- Avg ride distance for each vehicle type:
create view ride_distance_for_each_vehicle As
select Vehicle_Type,avg(Ride_Distance) as avg_distance 
from Bookings
group by Vehicle_Type;
-- Retrieve all avg ride distance for each vehicle type:
select * from ride_distance_for_each_vehicle;

-- Total number of canceled ride by customers:
create view cancelled_ride_by_customers As 
select count(*) as total_canceled_rides
from Bookings
WHERE Booking_Status = 'canceled by customer';
-- Retrieve total number of canceled ride by customers:
select * from cancelled_ride_by_customers;

-- List the top 5 customers who booked the highest number of rides:
create view top_5_customers As
select Customer_ID,count(Booking_ID) As total_rides
from Bookings
group by Customer_ID
order by total_rides desc limit 5;
-- Retrieve  top 5 customers who booked the highest number of rides
select * from top_5_customers;

-- the number of ride canceled by driver due to personal and car-related issues:
create view cancelled_by_drivers As
select count(*) as total_driver_cancellations from Bookings 
where Canceled_Rides_by_Driver='Personal & Car related issue';
-- Retrieve  number of ride canceled by driver due to personal and car-related issues:
select * from cancelled_by_drivers;

-- Max and min driver rating for prime sedan bookings:
create view max_min_driver_rating As
select max(Driver_Ratings) as Max_rating,
min(Driver_Ratings) as min_rating
from Bookings
where Vehicle_Type='Prime Sedan';
-- Retrieve max and min driver rating for prime sedan bookings:
select * from max_min_driver_rating;

-- Retrieve all rides where payment was made using UPI:
create view upi_payment As
select * from Bookings
where Payment_Method='UPI';
-- Retrieve all rides where payment was made using UPI:
select * from upi_payment;

-- Find the avg customer rating per vehicle type:
create view avg_customer_rating As
select Vehicle_Type, avg(Customer_Rating) as avg_customer_rating
from Bookings 
group by Vehicle_Type;
-- Find the avg customer rating per vehicle type:
select * from avg_customer_rating;

-- Calculate the total booking value of rides completed successfully:
create view total_successful_ride_value As
select sum(Booking_Value) as total_successful_ride_value
from Bookings 
where Booking_Status='Success';
-- Calculate the total booking value of rides completed successfully:
select * from total_successful_ride_value;

-- List all incomplete rides along with the reason:
create view incomplete_rides_reason As
select Booking_ID,Incomplete_Rides_Reason
from Bookings 
where Incomplete_Rides='yes';
-- List all incomplete rides along with the reason:
select * from incomplete_rides_reason;

