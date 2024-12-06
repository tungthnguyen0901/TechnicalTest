SELECT c.customer_id, c.name, c.email, COUNT(bd.seat_id) AS seats_booked
FROM Customer c
JOIN Booking b ON c.customer_id = b.customer_id
JOIN BookingDetails bd ON b.booking_id = bd.booking_id
JOIN Seat s ON bd.seat_id = s.seat_id
JOIN Studio st ON s.studio_id = st.studio_id
WHERE st.name = 'studio A' 
GROUP BY c.customer_id
HAVING COUNT(bd.seat_id) > 3; 
