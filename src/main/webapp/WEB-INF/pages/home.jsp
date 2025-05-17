<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Home | Futsal Management System</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/home.css?v=1.1">
</head>
<body>

<main>
    <section class="courts-section">
        <h2>🏟️ Our Futsal Courts</h2>
        <div class="court-grid">
            <div class="court-card">
                <img src="${pageContext.request.contextPath}/images/system/futsal.jpeg" alt="Imadol Futsal">
                <h3>Imadol Futsal</h3>
                <p>Indoor premium court with advanced lighting and turf.</p>
            </div>
            <div class="court-card">
                <img src="${pageContext.request.contextPath}/images/system/futsal1.jpeg" alt="Jadibuti Futsal">
                <h3>Jadibuti Futsal</h3>
                <p>Outdoor court perfect for quick matches and practice.</p>
            </div>
            <div class="court-card">
                <img src="${pageContext.request.contextPath}/images/system/futsal2.jpeg" alt="Bandit Court">
                <h3>Bandit Court</h3>
                <p>Spacious court designed for tournaments and events.</p>
            </div>
            <div class="court-card">
                <img src="${pageContext.request.contextPath}/images/system/court.jpeg" alt="Yalla Court">
                <h3>Yalla Court</h3>
                <p>Enclosed court with seating and player facilities.</p>
            </div>
        </div>
    </section>

    <section class="products">
        <h2>⚽ Shop Futsal Gear</h2>
        <div class="product-grid">
            <div class="product-card">
                <img src="${pageContext.request.contextPath}/images/system/shop2.jpeg" alt="Jersey">
                <h3>Futsal Jersey</h3>
                <p>High-quality breathable jerseys built for performance and comfort.</p>
                <button onclick="location.href='${pageContext.request.contextPath}/shopnow'">Buy Now</button>
            </div>
            <div class="product-card">
                <img src="${pageContext.request.contextPath}/images/system/shop5.jpeg" alt="Boots">
                <h3>Futsal Boots</h3>
                <p>Non-slip grip soles with cushioned soles for speed & control.</p>
                <button onclick="location.href='${pageContext.request.contextPath}/shopnow'">Buy Now</button>
            </div>
            <div class="product-card">
                <img src="${pageContext.request.contextPath}/images/system/shop3.jpeg" alt="Football">
                <h3>Pro Football</h3>
                <p>Official-size futsal balls engineered for control and speed.</p>
                <button onclick="location.href='${pageContext.request.contextPath}/product'">Buy Now</button>
            </div>
        </div>
    </section>

    <section class="gallery">
        <h2>🔥 Play in Style</h2>
        <div class="gallery-grid">
            <div class="gallery-card">
                <img src="${pageContext.request.contextPath}/images/system/futsal1.jpeg" alt="Book Arena">
                <h3>Bandit Court</h3>
                <button onclick="location.href='${pageContext.request.contextPath}/booking'">Book Now</button>
            </div>
            <div class="gallery-card">
                <img src="${pageContext.request.contextPath}/images/system/futsal2.jpeg" alt="Book Arena">
                <h3>Imadol Futsal</h3>
                <button onclick="location.href='${pageContext.request.contextPath}/booking'">Book Now</button>
            </div>
            <div class="gallery-card">
                <img src="${pageContext.request.contextPath}/images/system/futsal.jpeg" alt="Book Arena">
                <h3>Yalla Court</h3>
                <button onclick="location.href='${pageContext.request.contextPath}/booking'">Book Now</button>
            </div>
        </div>
    </section>
</main>

<%@ include file="footer.jsp" %>
</body>
</html>
