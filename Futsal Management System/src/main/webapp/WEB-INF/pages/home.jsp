<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Home | Futsal Management System</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/home.css">
</head>
<body>
	<header>
		<h1>🏆 Futsal Management System</h1>
		<nav>
			<a href="${pageContext.request.contextPath}/futsal courts.jsp">Futsal
				Courts</a> <a href="${pageContext.request.contextPath}/booking.jsp">Booking</a>
			<a href="${pageContext.request.contextPath}/shop now.jsp">Shop
				Now</a> <a href="${pageContext.request.contextPath}/contact us.jsp">Contact
				Us</a> <a href="${pageContext.request.contextPath}/about us.jsp">About
				Us</a> <a href="${pageContext.request.contextPath}/login.jsp"
				class="logout-btn">Logout</a>

		</nav>
	</header>

	<div class="hero-slider">
		<div class="slider-track">
			<img src="images/system/futsal.jpeg" alt="Court 1"> <img
				src="images/system/futsal1.jpeg" alt="Court 2"> <img
				src="images/system/futsal2.jpeg" alt="Court 3"> <img
				src="images/system/court.jpeg" alt="Court 4">
		</div>
	</div>

	<main>
		<section class="products">
			<h2>⚽ Shop Futsal Gear</h2>
			<div class="product-grid">
				<div class="product-card">
					<img src="images/system/back.jpg" alt="Jersey">
					<h3>Futsal Jersey</h3>
					<p>High-quality breathable jerseys built for performance and
						comfort.</p>
					<button onclick="location.href='shop now.jsp'">Buy Now</button>
				</div>
				<div class="product-card">
					<img src="images/system/logo.jpeg" alt="Boots">
					<h3>Futsal Boots</h3>
					<p>Non-slip grip soles with cushioned soles for speed &
						control.</p>
					<button onclick="location.href='shop now.jsp'">Buy Now</button>
				</div>
				<div class="product-card">
					<img src="images/system/kickball.jpeg" alt="Football">
					<h3>Pro Football</h3>
					<p>Official-size futsal balls engineered for maximum control
						and speed.</p>
					<button onclick="location.href='shop now.jsp'">Buy Now</button>
				</div>
			</div>
		</section>

		<section class="gallery">
			<h2>🔥 Play in Style</h2>
			<div class="gallery-grid">
				<div class="gallery-card">
					<img src="images/system/futsal1.jpeg" alt="Futsal Action">
					<button onclick="location.href='booking.jsp'">Book Now</button>
				</div>
				<div class="gallery-card">
					<img src="images/system/futsal2.jpeg" alt="Indoor Court">
					<button onclick="location.href='booking.jsp'">Book Now</button>
				</div>
				<div class="gallery-card">
					<img src="images/system/futsal3.jpeg" alt="Players Training">
					<button onclick="location.href='booking.jsp'">Book Now</button>
				</div>
			</div>
		</section>
	</main>

	<footer>
		<p>© 2025 Futsal Management System | All rights reserved.</p>
	</footer>
</body>
</html>
