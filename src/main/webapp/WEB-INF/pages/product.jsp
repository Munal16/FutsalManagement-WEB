<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Shop Now - Futsal Gear</title>
  <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/shop now.css">
</head>
<body>

  <section class="intro">
    <h2 class="page-title">Shop Futsal Gear</h2>
    <p>Step into the game with elite futsal gear. From pro jerseys to top-tier boots and balls, everything you need for fast-paced indoor football is right here.</p>
  </section>

  <c:if test="${not empty successMessage}">
    <div style="color: #00ff99; text-align: center; font-size: 1.2rem; margin-top: 10px;">
      ${successMessage}
    </div>
  </c:if>

  <main class="shop-grid">
    <c:forEach var="product" items="${productList}">
      <div class="shop-card">
        <img src="${pageContext.request.contextPath}/images/system/${product.imageUrl}" alt="${product.productName}">
        <h3>${product.productName}</h3>
        <p>Rs. ${product.productPrice}</p>

        <form action="${pageContext.request.contextPath}/order" method="post">
          <input type="hidden" name="productId" value="${product.productId}" />
          <button type="submit">Buy Now</button>
        </form>

      </div>
    </c:forEach>
  </main>

<%@ include file="footer.jsp" %>
</body>
</html>
