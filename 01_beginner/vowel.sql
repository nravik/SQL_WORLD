/*Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.

Input Format

The STATION table is described as follows:

Station.jpg

where LAT_N is the northern latitude and LONG_W is the western longitude.
*/


SET NOCOUNT ON;

select distinct city from STATION 
where left(city,1) in ('a','e','i','o','u') and right(city,1) in ('a','e','i','o','u')


go
