<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Forgot Password</title>
<link rel="website icon" type="png" href="/background/footer_logo.png" />
<!-- Bootstrap 5 CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Font Awesome 5 CDN -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />

<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css2?family=Barlow+Condensed:wght@200;300;400;500;600;700;800;900&display=swap">
<style>
/** Form Section **/
.form-section {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 60vh;
	background-color: #f1f1f1;
	padding-top: 5rem;
}

.form-container {
	width: 100%;
	max-width: 500px;
	background: #000;
	border-radius: 10px;
	box-shadow: 0 0 25px #ff5d00;
	padding: 30px 35px 40px;
	color: #fff;
}

.form-container h2 {
	text-align: center;
	margin-bottom: 30px;
	font-size: 32px;
}

.input-box {
	position: relative;
	margin-bottom: 20px;
}

.input-box input {
	width: 100%;
	padding: 15px 15px 15px 40px;
	font-size: 16px;
	border-radius: 6px;
	border: 2px solid rgba(255, 255, 255, 0.2);
	background: transparent;
	color: #fff;
	transition: border-color 0.3s ease, background-color 0.3s ease;
}

.input-box input::placeholder {
	color: #fff;
}

.input-box input:hover {
	border-color: #ffb233;
	background-color: rgba(51, 255, 122, 0.1);
}

.input-box i {
	position: absolute;
	left: 15px;
	top: 50%;
	transform: translateY(-50%);
	font-size: 20px;
	color: #fff;
}

.input-box input:focus+i, .input-box input:hover+i {
	color: #ffb233;
}

.form-container button {
	width: 100%;
	padding: 15px;
	font-size: 2rem;
	font-weight: 600;
	border: none;
	background-color: #3eff00;
	color: #000;
	border-radius: 20px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.form-container button:hover {
	background-color: #ff5d00;
}

.error-message {
	color: green;
	text-align: center;
	margin-top: 15px;
	font-size: 20px;
}

.error {
	color: red;
	text-align: center;
	margin-top: 15px;
	font-size: 20px;
}

/* Responsive Design for Smaller Screens */
@media ( max-width : 1170px) {
	.form-container {
		padding: 20px;
	}
}

@media ( max-width : 991px) {
	.form-container h2 {
		font-size: 28px;
	}
	.form-container button {
		font-size: 1.6rem;
	}
}

@media ( max-width : 767px) {
	body, html {
		font-size: 8px;
	}
	.form-container {
		padding: 20px 25px;
		width: 90%;
	}
}

@media ( max-width : 590px) {
	body, html {
		font-size: 7px;
	}
	.form-container h2 {
		font-size: 24px;
	}
}
</style>

</head>
<body>
	<section class="form-section">
		<div class="form-container">
			<h2>Enter New Password</h2>
			<form action="/forgot/password" method="post">
				<input type="hidden" name="userName" value="${userName}" />
				<div class="input-box">
					<input type="password" name="newPassword"
						placeholder="Enter New Password" required> <i
						class="fas fa-lock"></i>
				</div>
				<div class="input-box">
					<input type="password" name="confirmPassword"
						placeholder="Confirm New Password" required> <i
						class="fas fa-lock"></i>
				</div>

				<div class="input-box">
					<button type="submit" class="btn">Reset Password</button>
				</div>
			</form>
			<c:if test="${not empty message}">
				<p class="error-message">${message}</p>
				<p class="error">${error}</p>
			</c:if>
		</div>
	</section>

	<!-- Footer section Start-->
	<jsp:include page="\fragments\footer.jsp" />
</body>
</html>