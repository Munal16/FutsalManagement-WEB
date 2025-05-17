<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.futsal.model.bookingmodel" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
<div class="dashboard-container">
    <header class="dashboard-header">
        <div class="welcome-text">
            <h1>Welcome, Admin</h1>
            <p>Here's your overview & control panel.</p>
        </div>
        <form action="${pageContext.request.contextPath}/logout" method="post" class="logout-form">
            <button type="submit" class="logout-btn">Logout</button>
        </form>
    </header>

    <section class="stats">
        <div class="stat-card">
            <h2>120</h2>
            <p>Total Bookings</p>
        </div>
        <div class="stat-card">
            <h2>58</h2>
            <p>Active Products</p>
        </div>
        <div class="stat-card">
            <h2>200+</h2>
            <p>Registered Users</p>
        </div>
    </section>

    <section class="quick-links">
        <a href="${pageContext.request.contextPath}/productlist" class="quick-card">
            <h3>Product List</h3>
            <p>Manage futsal gears & accessories.</p>
        </a>
        <a href="${pageContext.request.contextPath}/usermanagement" class="quick-card">
            <h3>User Management</h3>
            <p>View and manage registered customers.</p>
        </a>
        <a href="${pageContext.request.contextPath}/bookinglistController?action=list" class="quick-card">
            <h3>Booking List</h3>
            <p>View and manage court bookings.</p>
        </a>
    </section>

    <section class="active-bookings">
        <h2>Active Bookings</h2>
        <div class="table-wrapper">
            <table class="booking-table">
                <thead>
                <tr>
                    <th>ID</th>
                    <th>Full Name</th>
                    <th>Contact</th>
                    <th>Booking Date</th>
                    <th>Location</th>
                    <th>Time</th>
                    <th>Payment Status</th>
                </tr>
                </thead>
                <tbody>
                <%
                    List<bookingmodel> bookings = (List<bookingmodel>) request.getAttribute("bookings");
                    if (bookings != null && !bookings.isEmpty()) {
                        for (bookingmodel booking : bookings) {
                %>
                <tr>
                    <td><%= booking.getId() %></td>
                    <td><%= booking.getFullname() %></td>
                    <td><%= booking.getContact() %></td>
                    <td><%= booking.getBookingDate() %></td>
                    <td><%= booking.getLocation() %></td>
                    <td><%= booking.getTime() %></td>
                    <td><%= booking.getPaymentStatus() %></td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="7" style="text-align:center;">No active bookings found.</td>
                </tr>
                <%
                    }
                %>
                </tbody>
            </table>
        </div>
    </section>

    <footer>
        <p>&copy; 2025 Futsal Management System | Designed for Speed & Control</p>
    </footer>
</div>
</body>
</html>
