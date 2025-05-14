<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>User Profile</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userprofile.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <div class="profile-container">
        <div class="profile-box">
            <h2>Edit Profile</h2>
            <form action="${pageContext.request.contextPath}/user" method="post">
                <input type="text" name="firstName" placeholder="First Name" value="${customer.firstName}" required>
                <input type="text" name="lastName" placeholder="Last Name" value="${customer.lastName}" required>
                <input type="text" name="username" placeholder="Username" value="${customer.username}" required readonly>
                <input type="password" name="password" placeholder="Password" value="${customer.password}" required>
                <input type="text" name="address" placeholder="Address" value="${customer.address}" required>
                <input type="text" name="contact" placeholder="Contact Number" value="${customer.contact}" required>
                <button type="submit">Update Profile</button>
            </form>

            <c:if test="${not empty message}">
                <p class="status">${message}</p>
            </c:if>
        </div>
    </div>
<%@ include file="footer.jsp" %>
</body>
</html>
