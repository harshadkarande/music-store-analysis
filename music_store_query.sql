/* Q1: Let's invite the artists who have written the most rock music in our dataset. 
Write a query that returns the Artist name and total track count of the top 10 rock bands. */


use project
SELECT top 1  artist.artist_id,COUNT(artist.artist_id) AS number_of_songs
FROM track
JOIN album ON album.album_id = track.album_id
JOIN artist ON artist.artist_id = album.artist_id
JOIN genre ON genre.genre_id = track.genre_id
WHERE genre.name LIKE 'Rock'
GROUP BY artist.artist_id
ORDER BY number_of_songs DESC





--Q2: Who is the best customer? The customer who has spent the most money will be declared the best customer. 
--Write a query that returns the person who has spent the most money.*/

select top 1 c.first_name ,c.last_name ,SUM(total) as total_spent
from invoice as i
join 
customer as c
on c.customer_id = i.customer_id
group by c.first_name,c.last_name
order by total_spent desc





--3. Who is the senior most employee based on job title?

select * from employee 
where
levels = (Select MAX(levels) from employee)




--4. Which countries have the most Invoices?
select top 1 billing_country,COUNT(*) as count_of_country 
from invoice
group by billing_country 
order by count_of_country desc



--Q.5 What are top 3 values of total invoice?

select top 3 total from invoice




--Q6Which city has the best customers? We would like to throw a promotional Music
--Festival in the city we made the most money. Write a query that returns one city that
--has the highest sum of invoice totals. Return both the city name & sum of all invoice
--totals

select top 1 city,SUM(i.total) 
from invoice as i
join customer  as c
on I.customer_id = C.customer_id 
group by city



/* Q7: Write query to return the email, first name, last name, & Genre of all Rock Music listeners. 
Return your list ordered alphabetically by email starting with A. */

select email,first_name,last_name ,g.name
from customer as c join invoice as i on c.customer_id = i.customer_id 
join invoice_line as il  on i.invoice_id = il.invoice_id
join track as t on il.track_id = t.track_id
join genre as g on g.genre_id = t.genre_id



-- Q8: Return all the track names that have a song length longer than the average song length. 
--Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first.

select name,milliseconds from track
where milliseconds >
(select AVG(milliseconds) from track) 
order by milliseconds desc


