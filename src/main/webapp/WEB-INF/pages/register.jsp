
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Futsal Registration</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/register.css">
</head>
<body>
	<div class="container">
		<div class="form-box">
			<div class="logo-container">
				<img src="images/system/mainlogo.png" alt="Futsal Management Logo">
			</div>
			<h2>Register & Join the Futsal Arena</h2>
			<form action="${pageContext.request.contextPath}/register"
				method="post">
				<input type="text" name="firstName" placeholder="First Name"
					required> <input type="text" name="lastName"
					placeholder="Last Name" required> <input type="text"
					name="username" placeholder="Username" required> <input
					type="email" name="email" placeholder="Email" required> <input
					type="password" name="password" placeholder="Password" required>
				<input type="text" name="address" placeholder="Address" required>
				<input type="text" name="contact" placeholder="Contact Number"
					required>
				<button type="submit">Register</button>
				<p class="login-link">
					Already registered? <a
						href="${pageContext.request.contextPath}/login">Login here</a>
				</p>
			</form>
		</div>
	</div>
</body>
</html>
