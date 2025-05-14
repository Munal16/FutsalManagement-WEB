<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>User Management</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dashboard.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/usermanagement.css">
    
</head>
<body>
    <div class="dashboard-container">
        <header>
            <h1>User Management</h1>
            <a href="${pageContext.request.contextPath}/dashboard.jsp">← Back to Dashboard</a>
        </header>

        <section>
            <h2>Add New Customer</h2>
            <form method="post" action="${pageContext.request.contextPath}/usermanagement">
                <input type="text" name="firstname" placeholder="First Name" required>
                <input type="text" name="lastname" placeholder="Last Name" required>
                <input type="text" name="contact" placeholder="Contact" required>
                <input type="text" name="address" placeholder="Address" required>
                <input type="text" name="username" placeholder="Username" required>
                <input type="password" name="password" placeholder="Password" required>
                <button type="submit">Add Customer</button>
            </form>
        </section>

        <section>
            <h2>Customer List</h2>
            <table border="1" cellpadding="10">
                <tr>
                    <th>Name</th>
                    <th>Contact</th>
                    <th>Address</th>
                    <th>Username</th>
                    <th>Action</th>
                </tr>
                <c:forEach var="c" items="${customers}">
                    <tr>
                        <td>${c.firstName} ${c.lastName}</td>
                        <td>${c.contact}</td>
                        <td>${c.address}</td>
                        <td>${c.username}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/usermanagement?action=delete&id=${c.customerId}" onclick="return confirm('Delete this user?');">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </section>

        <footer>
            <p>&copy; 2025 Futsal Management System</p>
        </footer>
    </div>
</body>
</html>
