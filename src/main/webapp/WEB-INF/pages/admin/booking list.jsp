<%@ page import="java.util.List" %>
<%@ page import="com.futsal.model.bookingmodel" %> 
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Booking List - Admin Dashboard</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/booking list.css">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>

<section class="booking-section">
  <div class="container">
    <h1>Booking Management</h1>
    <p class="intro-text">Manage all Futsal bookings. Add, Update, Delete or Search bookings easily!</p>

    <div class="top-actions">
      <div class="add-button">
        <a href="${pageContext.request.contextPath}/addBooking" class="btn">Add New Booking</a>
      </div>
      <form method="get" action="bookinglistController">
        <input type="text" name="searchName" placeholder="Search by Customer Name"
               value="${param.searchName != null ? param.searchName : ''}" />
        <button type="submit">Search</button>
        <input type="hidden" name="action" value="list" />
      </form>
    </div>

    <table class="booking-table" id="bookingTable">
      <thead>
        <tr>
          <th>ID</th>
          <th>Full Name</th>
          <th>Contact</th>
          <th>Booking Date</th>
          <th>Location</th>
          <th>Time</th>
          <th>Payment Status</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody>
        <%
          List<bookingmodel> bookings = (List<bookingmodel>) request.getAttribute("bookings");
          if (bookings != null && !bookings.isEmpty()) {
            for (bookingmodel booking : bookings) {
        %>
          <tr>
            <form action="bookinglistController" method="post">
              <td><%= booking.getId() %>
                <input type="hidden" name="id" value="<%= booking.getId() %>">
              </td>
              <td><input type="text" name="fullname" value="<%= booking.getFullname() %>" required></td>
              <td><input type="text" name="contact" value="<%= booking.getContact() %>" required></td>
              <td><input type="date" name="bookingDate" value="<%= booking.getBookingDate() %>" required></td>
              <td><input type="text" name="location" value="<%= booking.getLocation() %>" required></td>
              <td>
                <select name="time" required>
                  <%
                    for (int h = 5; h <= 21; h++) {
                      String time = h + ":00";
                  %>
                    <option value="<%= time %>" 
                      <%= (booking.getTime() != null && booking.getTime().equals(time)) ? "selected" : "" %>>
                      <%= time %>
                    </option>
                  <%
                    }
                  %>
                </select>
              </td>
              <td>
                <select name="paymentStatus" required>
                  <option value="Paid" <%= "Paid".equals(booking.getPaymentStatus()) ? "selected" : "" %>>Paid</option>
                  <option value="Pending" <%= "Pending".equals(booking.getPaymentStatus()) ? "selected" : "" %>>Pending</option>
                </select>
              </td>
              <td>
                <button type="submit" class="btn edit-btn">Save</button>
                <a href="bookinglistController?action=delete&id=<%= booking.getId() %>" 
                   class="btn delete-btn" onclick="return confirm('Delete this booking?');">Delete</a>
              </td>
            </form>
          </tr>
        <%
            }
          } else {
        %>
          <tr><td colspan="8">No bookings found!</td></tr>
        <%
          }
        %>
      </tbody>
    </table>
  </div>
</section>

</body>
</html>
