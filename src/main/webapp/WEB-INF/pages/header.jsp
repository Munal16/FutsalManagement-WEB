<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/header.css">

<header class="site-header">
    <div class="header-container">
        <div class="title">Futsal Management System</div>
        <nav class="nav-links">
            <a href="${pageContext.request.contextPath}/home">Home</a>
            <a href="${pageContext.request.contextPath}/booking">Booking</a>
            <a href="${pageContext.request.contextPath}/product">Shop Now</a>
            <a href="${pageContext.request.contextPath}/contactus">Contact Us</a>
            <a href="${pageContext.request.contextPath}/aboutus">About Us</a>
            <a href="${pageContext.request.contextPath}/cafeteria">Cafeteria</a>
            <a href="${pageContext.request.contextPath}/user">User Profile</a>
        </nav>
        <form action="${pageContext.request.contextPath}/logout" method="post" class="logout-form">
    <button type="submit" class="logout-btn">Logout</button>
</form>
    </div>
</header>
