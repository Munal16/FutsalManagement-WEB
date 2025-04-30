<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/dashboard.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
	<div class="dashboard-container">
		<header>
			<h1>Welcome, Admin</h1>
			<p>Here's your overview & control panel.</p>
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
			<a href="${pageContext.request.contextPath}/admin/products"
				class="quick-card">
				<h3>Product List</h3>
				<p>Manage futsal gears & accessories.</p>
			</a> <a href="${pageContext.request.contextPath}/admin/bookings"
				class="quick-card">
				<h3>Booking List</h3>
				<p>View and manage court bookings.</p>
			</a>
		</section>

		<footer>
			<p>&copy; 2025 Futsal Management System | Designed for Speed &
				Control</p>
		</footer>
	</div>
</body>
</html>
