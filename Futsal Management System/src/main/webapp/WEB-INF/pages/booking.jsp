<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Book Your Futsal</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/futsal booking.css">
</head>
<body>
	<header>
		<h1>Book Your Game. Rule the Court.</h1>
		<a href="home.html" class="back-btn">Home</a>
	</header>

	<section class="form-section">
		<form class="booking-form">
			<label for="fullname">Full Name</label> <input type="text"
				id="fullname" placeholder="e.g. Munal Pandey" required /> <label
				for="contact">Contact Number</label> <input type="tel" id="contact"
				placeholder="e.g. 9848791255" required /> <label for="booking-date">Booking
				Date</label> <input type="date" id="booking-date" required /> <label
				for="location">Futsal Location</label> <select id="location"
				required>
				<option value="">-- Select Location --</option>
				<option value="Imadol Futsal">Imadol Futsal</option>
				<option value="Jadibuti Futsal">Jadibuti Futsal</option>
				<option value="Yalla Court">Yalla Court</option>
				<option value="Bandit Court">Bandit Court</option>
			</select>

			<button type="submit">Book Now</button>
		</form>
	</section>

	<footer>
		<p>© 2025 Futsal Management System | Game On, Anytime.</p>
	</footer>
</body>
</html>
