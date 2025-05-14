<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Book Your Futsal</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/booking.css">
</head>
<body>

<main>
    <section class="form-section">
        <div class="form-container">
            <h2 class="booking-title">Book Your Game. Rule the Court.</h2>
            <form class="booking-form" method="post" action="${pageContext.request.contextPath}/booking">
                <label for="fullname">Full Name</label>
                <input type="text" name="fullname" id="fullname" placeholder="e.g. Munal Pandey" required />

                <label for="contact">Contact Number</label>
                <input type="tel" name="contact" id="contact" placeholder="e.g. 9848791255" required />

                <label for="booking-date">Booking Date</label>
                <input type="date" name="bookingDate" id="booking-date" required />

                <label for="location">Futsal Location</label>
                <select name="location" id="location" required>
                    <option value="">-- Select Location --</option>
                    <option value="Imadol Futsal">Imadol Futsal</option>
                    <option value="Jadibuti Futsal">Jadibuti Futsal</option>
                    <option value="Yalla Court">Yalla Court</option>
                    <option value="Bandit Court">Bandit Court</option>
                </select>

                <label for="time">Booking Time</label>
                <select name="time" id="time" required>
                    <option value="">-- Select Time --</option>
                    <% for (int i = 5; i <= 21; i++) {
                        String label = i < 12 ? i + " AM" : (i == 12 ? "12 PM" : (i - 12) + " PM");
                    %>
                        <option value="<%= label %>"><%= label %></option>
                    <% } %>
                </select>

                <label for="payment">Payment Made?</label>
                <select name="payment" id="payment" required>
                    <option value="">-- Select Payment Option --</option>
                    <option value="yes">Yes</option>
                    <option value="no">No</option>
                </select>

                <button type="submit">Book Now</button>
            </form>
        </div>
    </section>
</main>

<%@ include file="footer.jsp" %>

</body>
</html>
