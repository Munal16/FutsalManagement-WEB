<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Futsal Login</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/login.css">
</head>
<body>
	<div class="container">
		<div class="login-box">
			<div class="logo-container">
				<img src="images/system/mainlogo.png" alt="Futsal Management Logo">
			</div>
			<h2>Login to Futsal Arena</h2>
			<form action="${pageContext.request.contextPath}/login" method="post">
				<input type="text" name="username" placeholder="Username" required>
				<input type="password" name="password" placeholder="Password"
					required>
				<button type="submit">Login</button>
				<p class="register-link">
					Not a member yet? <a
						href="${pageContext.request.contextPath}/register">Register
						here</a>
				</p>
			</form>
		</div>
	</div>
</body>
</html>