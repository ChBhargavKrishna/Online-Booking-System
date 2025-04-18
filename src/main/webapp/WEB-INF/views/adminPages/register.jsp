<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registration Page</title>
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
	/* box-shadow: .5084rem 1.1419rem 2.5rem 0 rgb(0 0 0 / 8%); */
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
	height: 600px;
	margin: 12px auto;
	border: 2px solid #00ff00;
	box-shadow: 0 0 25px #00ff00;
	background: #000;
	border-radius: 10px;
	overflow: hidden;
	padding: 40px 35px 55px;
	border: 2px solid #00ff00;
}

.form-container h2 {
	font-size: 36px;
	text-align: center;
	maargin-bottom: 20px;
	color: #fff;
}

.form-container .input-box {
	display: flex;
	justify-content: space-between;
	flex-wrap: wrap;
}

.input-box.middle-box {
	display: flex;
	justify-content: center; /* Centers the input field horizontally */
}

.input-box .input-field {
	position: relative;
	width: 48%;
	height: 50px;
	margin: 13px 0;
}

.input-box .form-style {
	width: 100%;
}

.input-box .input-field input {
	width: 100%;
	height: 100%;
	background: transparent;
	border: 2px solid rgba(255, 255, 255, .2);
	outline: none;
	font-size: 16px;
	color: #fff;
	border-radius: 6px;
	padding: 15px 15px 15px 40px;
	transition: border-color 0.3s ease, background-color 0.3s ease;
}

.input-field input:hover {
	border-color: #33ff7a;
	background-color: rgba(51, 255, 122, 0.1);
}

.input-field input:hover::placeholder {
	color: #fff;
}

.input-field input::placeholder {
	color: #fff;
}

.input-field input:focus::placeholder {
	color: #fff;
}

.radio-buttons {
	display: flex;
	justify-content: flex-start;
	align-items: center;
	gap: 20px;
	padding-right: 10rem;
	font-size: 16px;
	color: #fff;
}

.radio-buttons input[type="radio"] {
	width: 20px;
	height: 20px;
	margin: 0 5px;
	opacity: 0;
	position: absolute;
}

.radio-buttons label {
	padding: 10px 20px;
	background-color: rgba(255, 255, 255, .2);
	color: #fff;
	border-radius: 30px;
	font-size: 18px;
	cursor: pointer;
	transition: background-color 0.3s ease, color 0.3s ease;
}

.radio-buttons input[type="radio"]:checked+label {
	background-color: #33ff7a;
	color: #000;
}

.radio-buttons label:hover {
	background-color: #33ff7a;
}

.input-box .input-field i {
	position: absolute;
	left: 15px;
	top: 0;
	bottom: 0;
	width: 20px;
	text-align: center;
	font-size: 20px;
	color: #fff;
	border-right: 1px solid #cccccc;
	padding-right: 10px;
	display: flex;
	align-items: center;
	justify-content: center;
}

.age-icon {
	display: inline-block;
	color: #fff;
	font-size: 20px;
	border-radius: 50%;
	padding: 2px 4px;
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
	border: 2px solid #02ff65;
	color: #fff;
	overflow: hidden;
	z-index: 1;
}

.btn::before {
	content: "";
	position: absolute;
	height: 300%;
	width: 100%;
	background: linear-gradient(#25252b, #02ff65, #25252b, #02ff65);
	top: -100%;
	left: 0;
	z-index: -1;
	transition: .5s;
}

.btn:hover:before {
	top: 0;
}

.form-container .logreg-link {
	display: flex;
	justify-content: center;
	align-items: center;
	font-size: 18px;
	margin-top: 5px;
}

.form-container .logreg-link p {
	color: #fff;
	margin-top: 5px;
}

.form-container .logreg-link p a {
	color: #00ff00;
}

.form-container .logreg-link p a:hover {
	color: #ffa833;
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

/* Media Query 991px */
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
		background-color: transparent ;
		border-radius: 0 ;
	}
}

/* Media Query 767px */
@media ( max-width :767px) {
	/* General CSS */
	body, html {
		font-size: 8px;
	}
	.section-subtitle {
		max-width: 80%;
	}
}

/* Media Query 590px */
@media ( max-width :590px) {
	/* General CSS */
	body, html {
		font-size: 7px;
	}
}
</style>
</head>

<body>
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
						<i class="fas fa-stream navbar-toggler-icon" style="color: white;"></i>
					</button>
					<div class="collapse navbar-collapse" id="main-nav">
						<ul class="navbar-nav ms-auto">
							<li class="nav-item"><button class="nav-link"
									onclick="window.location.href='/login/form';">
									<i class="fas fa-user me-2"></i>Login
								</button></li>
							<li class="nav-item"><button class="nav-link active"
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
			<h2>Registration Form</h2>
			<form:form modelAttribute="reg" action="/register" method="post">
				<div class="input-box">
					<div class="input-field">
						<form:input type="text" name="fullName" class="form-style"
							placeholder="Your Full Name" path="fullName" id="fullName"
							required="true" />
						<i class="fas fa-user-alt"></i>
					</div>
					<div class="radio-buttons">
						<input type="radio" id="male" name="gender" value="Male">
						<label for="male">Male</label> <input type="radio" id="female"
							name="gender" value="Female"> <label for="female">Female</label>
					</div>
				</div>
				<div class="input-box">
					<div class="input-field">
						<form:input type="email" name="userName" placeholder="Your Email"
							id="login.userName" path="login.userName" required="true" />
						<i class="fas fa-envelope"></i>
					</div>
					<div class="input-field">
						<form:input type="password" name="passCode"
							placeholder="Your Password" path="login.passCode"
							id="login.passCode" required="true" />
						<i class="fas fa-lock"></i>
					</div>
				</div>
				<div class="input-box">
					<div class="input-field">
						<form:input type="date" name="DOB" id="DOB" path="DOB"
							required="true" />
						<i class="fas fa-calendar"></i>
					</div>
					<div class="input-field">
						<form:input type="tel" name="contactNo" pattern="^\d{10}$"
							maxLength="10" placeholder="Contact Number" path="contactNo"
							id="contactNo" required="true" />
						<i class="fas fa-phone"></i>
					</div>
				</div>
				<div class="input-box">
					<div class="input-field">
						<form:input type="number" name="age" class="form-style" min="18"
							max="70" placeholder="Your Age" path="age" id="age"
							required="true" value="disabled"/>
						<i><span class="age-icon">18+</span></i>
					</div>
					<div class="input-field">
						<form:input type="text" name="state" id="state" path="state"
							placeholder="Enter State" required="true" />
						<i class="fas fa-location-arrow"></i>
					</div>
				</div>
				<div class="input-box middle-box">
					<div class="input-field">
						<form:input type="text" name="pinCode" pattern="^\d{6}$"
							maxLength="6" placeholder="Enter Pincode" path="pinCode"
							id="pinCode" required="true" />
						<i class="fas fa-map-pin"></i>
					</div>
				</div>
				<button type="submit" class="btn">Register</button>
				<div class="logreg-link">
					<p>
						Already Have an Account? <a href="/login/form" class="SignInlink">Sign
							In</a>
					</p>
				</div>
			</form:form>
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
	</script>
</body>

</html>