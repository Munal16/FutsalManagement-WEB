<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Cafeteria - Futsal Management System</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/cafeteria.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
    <main class="cafeteria-wrapper">
        <section class="cafeteria-section">
            <div class="container">
                <h1>Sports Cafeteria</h1>
                <p class="intro-text">Recharge with top-notch refreshments before or after your futsal match!</p>

                <h2>Before Game Boosters</h2>
                <div class="menu-items">
                    <div class="item-card">
                        <img src="${pageContext.request.contextPath}/images/system/drink2.jpeg" alt="Energy Drink">
                        <h3>Energy Drink</h3>
                        <p>Boosts stamina and prepares you for high-energy gameplay.</p>
                        <span class="price">Rs 150</span>
                    </div>

                    <div class="item-card">
                        <img src="${pageContext.request.contextPath}/images/system/protein.jpeg" alt="Protein Bar">
                        <h3>Protein Bar</h3>
                        <p>Packed with protein to fuel your body before you hit the court.</p>
                        <span class="price">Rs 120</span>
                    </div>

                    <div class="item-card">
                        <img src="${pageContext.request.contextPath}/images/system/banana.jpeg" alt="Banana">
                        <h3>Fresh Banana</h3>
                        <p>Natural energy loaded with potassium and goodness.</p>
                        <span class="price">Rs 50</span>
                    </div>
                </div>

                <h2>After Game Refreshments</h2>
                <div class="menu-items">
                    <div class="item-card">
                        <img src="${pageContext.request.contextPath}/images/system/drink3.jpeg" alt="Fruit Smoothie">
                        <h3>Fruit Smoothie</h3>
                        <p>Cool down and rehydrate with our refreshing smoothies.</p>
                        <span class="price">Rs 250</span>
                    </div>

                    <div class="item-card">
                        <img src="${pageContext.request.contextPath}/images/system/drink4.jpeg" alt="Grilled Sandwich">
                        <h3>Grilled Sandwich</h3>
                        <p>Perfect post-game meal to restore your energy.</p>
                        <span class="price">Rs 200</span>
                    </div>

                    <div class="item-card">
                        <img src="${pageContext.request.contextPath}/images/system/drink5.jpeg" alt="Mineral Water">
                        <h3>Mineral Water</h3>
                        <p>Stay hydrated with chilled mineral water bottles.</p>
                        <span class="price">Rs 30</span>
                    </div>
                </div>

                <div class="footer-note">
                    <p>All items are prepared with hygiene and care to keep you at your best on and off the court.</p>
                </div>
            </div>
        </section>
    </main>
<%@ include file="footer.jsp" %>
</body>
</html>
