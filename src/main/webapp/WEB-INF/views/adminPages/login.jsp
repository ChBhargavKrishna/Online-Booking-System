<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login Page</title>
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
/** Message **/
.message {
	background-color: #11ca00;
	color: #000;
	padding: 10px;
	text-align: center;
	border-radius: 10px;
	font-size: 3rem;
	font-weight: 600;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	border: 2px solid #218838;
	max-width: 600px;
	position: fixed;
	top: 10px;
	width: 100%;
	left: 50%;
	transform: translateX(-50%);
	z-index: 9999;
}

.message .close-btn {
	position: absolute;
	top: 10px;
	right: 10px;
	cursor: pointer;
	font-size: 28px;
	color: red;
	z-index: 10;
	transition: color 0.3s;
}

.progress-bar-container {
	width: 100%;
	height: 5px;
	background-color: #e0e0e0;
	margin-top: 5px;
	border-radius: 5px;
	overflow: hidden;
}

.progress-bar {
	height: 100%;
	width: 0;
	background-color: #ff7400;
	transition: width 0.1s linear;
}

/* 01 navbar css */
.header {
	position: fixed;
	width: 100%;
	top: 1rem;
	left: 0;
	z-index: 999;
	background-color: #f1f1f1;
}

.header .navbar {
	background-image: url('/background/header_bg.png');
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	background-color: rgba(0, 0, 0, 0.5);
	padding: 1rem 5rem;
}

.navbar-brand {
	width: 0.5rem;
	margin-top: -0.1rem;
}

.header .navbar-nav .nav-link {
	color: #fff;
	text-transform: uppercase;
	font-size: 1.6rem;
	font-weight: 600;
	padding: 0.5rem 2rem;
	margin: 0 0.2rem;
	font-family: 'Barlow Condensed', sans-serif;
	background-color: #1d9901;
	border: none;
	cursor: pointer;
	border-radius: 20px 20px 20px 20px;
}

.header .navbar-nav .nav-link:hover, .header .navbar-nav .nav-link.active
	{
	color: #ffa833;
}

.header .navbar-toggler {
	color: #fff;
	font-size: 2rem;
	height: 2.7rem;
	padding: 0;
}

.header .navbar-toggler:focus {
	outline: none;
	box-shadow: none;
}

.header-scrolled {
	position: fixed;
	top: -0.4rem;
	left: 0;
	right: 0;
	width: 100%;
	max-width: 1320px;
	margin: auto;
	z-index: 999;
	transition: 0.3s ease-in-out;
}
/* Form CSS */
.form-section {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	margin-top: 8rem;
	background: #f1f1f1;
}

.form-container {
	position: relative;
	width: 750px;
	height: 450px;
	border: 2px solid #ff2770;
	box-shadow: 0 0 25px #ff2770;
	overflow: hidden;
}

.form-container .form-box {
	position: relative;
	top: 0;
	width: 50%;
	height: 100%;
	display: flex;
	justify-content: center;
	flex-direction: column;
}

.form-container .form-box.login {
	left: 0;
	padding: 0 40px;
}

.form-box h2 {
	font-size: 32px;
	font-weight: 500;
	text-align: center;
}

.form-box .input-box {
	position: relative;
	width: 100%;
	height: 50px;
	margin-top: 25px;
}

.input-box .form-style {
	width: 100%;
	height: 100%;
	background: transparent;
	border: none;
	outline: none;
	font-size: 16px;
	color: #000;
	font-weight: 700;
	padding-right: 23px;
	border-bottom: 2px solid #fff;
	transition: .5s;
}

.input-box .form-style:focus, .input-box .form-style:valid {
	border-bottom: 2px solid #ff2770;
}

.input-box label {
	position: absolute;
	top: -5px;
	left: 0;
	transform: translateY(-50%);
	font-size: 16px;
	color: #ff2770;
	transition: .5s;
	font-weight: 700;
}

.input-box .form-style:focus ~ label, .input-box .form-style:valid ~
	label {
	top: -5px;
	color: #ff2770;
	border-bottom: 2px solid #ff2770;
}

.input-box i {
	position: absolute;
	top: 50%;
	right: 0;
	transform: translateY(-50%);
	font-size: 18px;
	transition: .5s;
}

.input-box .form-style:focus ~ i, .input-box .form-style:valid ~ i {
	color: #000;
}

.btn {
	position: relative;
	width: 100%;
	height: 45px;
	background: transparent;
	border-radius: 40px;
	cursor: pointer;
	font-size: 16px;
	font-weight: 600;
	border: 2px solid #ff2770;
	color: #fff;
	overflow: hidden;
	z-index: 1;
}

.btn::before {
	content: "";
	position: absolute;
	height: 300%;
	width: 100%;
	background: linear-gradient(#25252b, #ff2770, #25252b, #ff2770);
	top: -100%;
	left: 0;
	z-index: -1;
	transition: .5s;
}

.btn:hover:before {
	top: 0;
}

.form-box .logreg-link {
	font-size: 14px;
	text-align: center;
	margin-top: 5px;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.form-container .logreg-link a {
	color: #000;
	text-decoration: none;
	font-weight: 600;
}

.form-container .logreg-link a:hover {
	color: #0fff00;
	text-decoration: underline;
}

.form-container .logreg-link p {
	color: #000;
	margin: 0;
	font-weight: 600;
}

.form-container .logreg-link p a {
	color: #ff2770;
	font-weight: 600;
}

.form-container .logreg-link p a:hover {
	color: #0fff00;
}

.info-content {
	position: absolute;
	top: 0;
	height: 100%;
	width: 50%;
	display: flex;
	justify-content: center;
	flex-direction: column;
}

.info-content.login {
	right: 0;
	text-align: right;
	padding: 0 40px 60px 150px;
	color: #fff;
}

.info-content h2 {
	font-size: 26px;
	line-height: 1.3;
}

.info-content p {
	font-size: 16px;
}

.form-container .curved-shape {
	position: absolute;
	right: 0;
	top: -5px;
	height: 600px;
	width: 850px;
	background: linear-gradient(45deg, #25252b, #ff2770);
	transform: rotate(11deg) skewY(40deg);
	transform-origin: bottom right;
	transition: 1.5s ease;
}

/*Responsive Css */
@media ( max-width :1170px) {
	/* General CSS */
	.section-subtitle {
		max-width: 60%;
	}

	/* 01 Navbar CSS */
	.header .navbar {
		background-size: cover;
		padding: 2rem;
	}
	.header .navbar-nav {
		margin-top: 2rem;
	}
	.header .navbar-nav .nav-link {
		padding: 0.2rem 0.5rem;
		margin-bottom: 1rem;
	}
	.header .header_right span {
		padding: 0.2rem 0.5rem;
	}
}

@media ( max-width :991px) {
	/* 01 Navbar CSS */
	.header .navbar {
		background-size: cover;
		padding: 1rem 2rem;
	}
	.header .navbar-nav {
		margin-top: 2rem;
	}
	.header .navbar-nav .nav-link {
		padding: 0.2rem 0.5rem;
		margin-bottom: 1rem;
	}
	.header .header_right span {
		padding: 0.2rem 0.5rem;
	}
	.navbar-collapse.show .nav-link {
		background-color: transparent;
		border-radius: 0;
	}
}

@media ( max-width :767px) {
	/* General CSS */
	body, html {
		font-size: 8px;
	}
	.section-subtitle {
		max-width: 80%;
	}
}

@media ( max-width :590px) {
	/* General CSS */
	body, html {
		font-size: 7px;
	}
	.form-container .curved-shape {
		height: 450px;
		width: 700px;
	}
}

@media ( max-width :450px) {
	/* General CSS */
	body, html {
		font-size: 6px;
	}
	.form-container .curved-shape {
		height: 350px;
		width: 550px;
	}
	.info-content h2 {
		font-size: 20px;
		line-height: 1.3;
	}
	.info-content p {
		font-size: 10px;
	}
}
</style>
</head>

<body>
	<c:if test="${not empty message}">
		<div id="message" class="message">
			${message} <span class="close-btn" onclick="closeMessage()">&times;</span>
			<!-- Progress bar under the message -->
			<div class="progress-bar-container">
				<div id="progress-bar" class="progress-bar"></div>
			</div>
		</div>
	</c:if>

	<!-- Navbar Section Start -->
	<header id="full_nav">
		<div class="header">
			<div class="container">
				<nav class="navbar navbar-expand-lg">
					<a class="navbar-brand" href="/"> <img
						src="/background/logo.png" alt="logo">
					</a>
					<button class="navbar-toggler" type="button"
						data-bs-toggle="collapse" data-bs-target="#main-nav"
						aria-controls="main-nav" aria-expanded="false"
						aria-label="Toggle navigation">
						<i class="fas fa-stream navbar-toggler-icon"></i>
					</button>
					<div class="collapse navbar-collapse" id="main-nav">
						<ul class="navbar-nav ms-auto">
							<li class="nav-item"><button class="nav-link active"
									onclick="window.location.href='/login/form';">
									<i class="fas fa-user me-2"></i>Login
								</button></li>
							<li class="nav-item"><button class="nav-link"
									onclick="window.location.href='/register/form';">
									<i class="fas fa-user-circle me-2"></i>Register
								</button></li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
	</header>

	<!-- Form Section -->
	<section class="form-section">
		<div class="form-container">
			<div class="curved-shape"></div>
			<div class="form-box login">
				<h2>Login Form</h2>
				<form:form modelAttribute="reg" action="/login" method="post">
					<div class="input-box">
						<form:input type="email" name="userName" class="form-style"
							path="userName" placeholder="Enter Your Username" id="userName"
							required="true" />
						<label>User Name</label> <i class="fas fa-user-tie"></i>
					</div>
					<div class="input-box">
						<form:input type="password" name="passCode" class="form-style"
							path="passCode" placeholder="Enter Your Password" id="passCode"
							required="true" />
						<label>Password</label> <i class="fas fa-lock"></i>
					</div>
					<div class="input-box">
						<button type="submit" class="btn">Login</button>
					</div>
					<div class="logreg-link">
						<a href="/check/username">Forgot Your Password</a>
						<p>
							Don't Have Account? <a href="/register/form" class="SignUplink">Sign
								Up</a>
						</p>
					</div>
				</form:form>
			</div>
			<div class="info-content login">
				<h2>Welcome! Please Login</h2>
				<p>To go forward please login with your details and do register
					before login.</p>
			</div>
		</div>
	</section>


	<!-- Footer section Start-->
	<jsp:include page="\fragments\footer.jsp" />

	<!-- Custom JS -->
	<script type="text/javascript">
		// Header Scroll 
		let nav = document.querySelector(".navbar");
		window.onscroll = function() {
			if (document.documentElement.scrollTop > 50) {
				nav.classList.add("header-scrolled");
			} else {
				nav.classList.remove("header-scrolled");
			}
		}

		// nav hide  
		let navBar = document.querySelectorAll(".nav-link");
		let navCollapse = document.querySelector(".navbar-collapse.collapse");
		navBar.forEach(function(a) {
			a.addEventListener("click", function() {
				navCollapse.classList.remove("show");
			})
		})

		function closeMessage() {
			document.getElementById('message').style.display = 'none';
		}
		window.onload = function() {
			var progressBar = document.getElementById('progress-bar');
			var totalTime = 10000; // 10 seconds
			var intervalTime = 100; // Update every 100ms
			var currentTime = 0;

			// Set the progress bar to 0 at the start
			progressBar.style.width = '0%';

			var progressInterval = setInterval(function() {
				currentTime += intervalTime;
				var percentage = (currentTime / totalTime) * 100;

				// Update the progress bar width
				progressBar.style.width = percentage + '%';

				// After 10 seconds, hide the message
				if (currentTime >= totalTime) {
					clearInterval(progressInterval);
					closeMessage(); // Automatically close the message after 10 seconds
				}
			}, intervalTime);
		}
	</script>
</body>
</html>