<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Cafeteria - Futsal Management System</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/cafeteria.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<body>
	<section class="cafeteria-section">
		<div class="container">
			<h1>Sports Cafeteria</h1>
			<p class="intro-text">Recharge your energy with our specially
				selected refreshments designed for before and after your futsal
				matches!</p>

			<h2>Before Game Boosters</h2>
			<div class="menu-items">
				<div class="item-card">
					<img
						src="${pageContext.request.contextPath}/images/system/energy_drink.jpg"
						alt="Energy Drink">
					<h3>Energy Drink</h3>
					<p>Boosts stamina and prepares you for high-energy gameplay.</p>
					<span class="price">$3.99</span>
				</div>

				<div class="item-card">
					<img
						src="${pageContext.request.contextPath}/images/system/protein_bar.jpg"
						alt="Protein Bar">
					<h3>Protein Bar</h3>
					<p>Packed with protein to fuel your body before you hit the
						court.</p>
					<span class="price">$2.50</span>
				</div>

				<div class="item-card">
					<img
						src="${pageContext.request.contextPath}/images/system/banana.jpg"
						alt="Banana">
					<h3>Fresh Banana</h3>
					<p>Natural energy loaded with potassium and goodness.</p>
					<span class="price">$1.00</span>
				</div>
			</div>

			<h2>After Game Refreshments</h2>
			<div class="menu-items">
				<div class="item-card">
					<img
						src="${pageContext.request.contextPath}/images/system/smoothie.jpg"
						alt="Fruit Smoothie">
					<h3>Fruit Smoothie</h3>
					<p>Cool down and rehydrate with our refreshing smoothies.</p>
					<span class="price">$4.50</span>
				</div>

				<div class="item-card">
					<img
						src="${pageContext.request.contextPath}/images/system/grilled_sandwich.jpg"
						alt="Grilled Sandwich">
					<h3>Grilled Sandwich</h3>
					<p>Perfect post-game meal to restore your energy.</p>
					<span class="price">$5.99</span>
				</div>

				<div class="item-card">
					<img
						src="${pageContext.request.contextPath}/images/system/water.jpg"
						alt="Mineral Water">
					<h3>Mineral Water</h3>
					<p>Stay hydrated with chilled mineral water bottles.</p>
					<span class="price">$1.50</span>
				</div>
			</div>

			<div class="footer-note">
				<p>All items are prepared with hygiene and quality standards to
					keep you at your best!</p>
			</div>
		</div>
	</section>
</body>
</html>
