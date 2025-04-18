<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Online Booking System</title>
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

/* 02 Banner Section */
.banner_section {
	position: relative;
	min-height: 80vh;
	overflow: hidden;
	margin-top: 9rem;
}

.carousel-item {
	background-size: cover;
	background-position: center;
	min-height: 80vh;
}

.slider-text {
	position: absolute;
	left: 50px;
	top: 60%;
	transform: translateY(-50%);
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	gap: 15px;
	max-width: 400px;
}

.slider-text h1 {
	font-size: 3.5rem;
	font-weight: 700;
	line-height: 1.2;
}

.slider-text .btn {
	position: relative;
	color: #fff;
	text-transform: uppercase;
	font-size: 1.6rem;
	font-weight: 600;
	margin: 0 0.2rem;
	align-self: flex-end;
	padding: 10px 32px;
	z-index: 2;
	font-family: 'Barlow Condensed', sans-serif;
	background-color: #1d9901;
	border: none;
	cursor: pointer;
	border-radius: 20px 20px 20px 20px;
}

/* Service CSS */
.service_section {
	padding: 50px 0;
	color: #202020;
}

.service_section .container {
	max-width: 1240px;
	margin: auto;
}

.row {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}

.service_section .title {
	color: #000;
	position: relative;
	padding-bottom: 14px;
	margin-bottom: 25px;
	font-weight: 700;
	font-size: 32px;
	text-transform: capitalize;
	text-align: center;
}

.service_section .title span {
	color: #f36b07;
}

.service_section .title:before {
	content: '';
	position: absolute;
	bottom: 0;
	left: 50%;
	width: 150px;
	height: 3px;
	background-color: #099d4a;
	transform: translateX(-50%);
}

.service_section .title:after {
	content: '';
	position: absolute;
	bottom: -1px;
	left: 50%;
	width: 45px;
	height: 6px;
	background-color: #099d4a;
	transform: translateX(-50%);
}

.service_section .description {
	letter-spacing: 1px;
	font-size: 18px;
	color: #ac0909;
	font-weight: 600;
	text-align: center;
}

.service_section .service-column {
	max-width: 33.333333%;
	padding: 0 15px;
}

.service_section .service-column .single-service {
	position: relative;
	margin-top: 30px;
	background-color: #051129;
	border-radius: 0;
	padding: 40px 30px;
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.5);
	overflow: hidden;
	text-align: center;
	border-radius: 0;
}

.service_section .service-column .single-service .content {
	position: relative;
	z-index: 20;
}

.service_section .service-column .single-service .content .icon {
	display: inline-block;
	margin-bottom: 25px;
	width: 70px;
	height: 70px;
	background-color: #0ef;
	border-radius: 5px;
	line-height: 70px;
	text-align: center;
	color: #a10000;
	font-size: 30px;
	transition: all 0.5s;
}

.service_section .service-column .single-service:hover .icon {
	background-color: #000;
	color: #ff7800;
	border-radius: 50px;
	transition: all 0.5s;
}

.service_section .service-column .single-service .content .main-title {
	color: #f1f1f1;
	margin-bottom: 20px;
	font-weight: 700;
	font-size: 25px;
	transition: color 0.3s;
}

.service_section .service-column .single-service .content .description {
	margin-bottom: 20px;
	letter-spacing: 1px;
	font-size: 15px;
	font-weight: 500;
	color: #12eab5;
	transition: color 0.3s;
}

.service_section .service-column .single-service:hover .description {
	color: #e85b00;
}

.service_section .service-column .single-service .content .learn-more {
	color: #fff;
	text-decoration: none;
	font-size: 18px;
	position: relative;
	font-weight: 500;
	transition: color .3s;
}

.service_section .service-column .single-service .content .learn-more:after
	{
	content: '';
	position: absolute;
	bottom: -2px;
	left: 0;
	right: 0;
	height: 2px;
	background-color: #d612ea;
	transition: background-color .3s;
}

.service_section .service-column .single-service .circle-before {
	position: absolute;
	top: 0;
	right: 0;
	transform: translate(40%, -40%);
	width: 150px;
	height: 150px;
	background-color: #3702fc;
	border-radius: 50%;
	transition: all 0.6s;
}

.service_section .service-column .single-service:hover .circle-before {
	width: 100%;
	height: 100%;
	transform: none;
	border: 0;
	border-radius: 0;
	opacity: 0.8;
}

/* Responsive CSS */
@media ( max-width : 1170px) {
	.navbar-brand {
		width: 6rem;
	}
	.navbar-nav .nav-link {
		font-size: 1.4rem;
		padding: 0.5rem 1.5rem;
	}
	.service-section .title {
		font-size: 28px;
	}
}

@media ( max-width : 991px) {
	.navbar-brand {
		width: 5rem;
	}
	.navbar-nav .nav-link {
		font-size: 1.3rem;
		padding: 0.5rem 1.2rem;
	}
	.service-section .service-column {
		max-width: 50%;
		padding: 0 15px;
	}
	.service-section .title {
		font-size: 26px;
	}
	.service_column {
		max-width: 50%;
	}
	.carousel-item h1 {
		font-size: 2.8rem;
	}
	.carousel-item button {
		font-size: 1.4rem;
	}
	.navbar-collapse.show .nav-link {
		background-color: transparent;
		border-radius: 0;
	}
}

@media ( max-width : 767px) {
	.header .navbar {
		padding: 1rem;
	}
	.navbar-nav .nav-link {
		font-size: 1.2rem;
		padding: 0.5rem 1rem;
	}
	.service_section .service-column {
		max-width: 100%;
	}
	.service-section .title {
		font-size: 24px;
	}
	.service_column {
		max-width: 100%;
	}
	.carousel-item h1 {
		font-size: 2.5rem;
	}
	.carousel-item button {
		font-size: 1.3rem;
	}
}

@media ( max-width : 590px) {
	.navbar-nav .nav-link {
		font-size: 1.1rem;
		padding: 0.5rem;
	}
	.service-section .title {
		font-size: 22px;
	}
	.carousel-item h1 {
		font-size: 2.2rem;
	}
	.carousel-item button {
		font-size: 1.2rem;
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

	<!-- banner Section start -->
	<section class="banner_section">
		<div id="bannerCarousel" class="carousel slide"
			data-bs-ride="carousel">
			<div class="carousel-inner">
				<div class="carousel-item active"
					style="background-image: url('/banner/image1.png');">
					<div class="slider-text">
						<h1 style="color: #000;">
							Welcome To My Website And Travel in comfort, arrive safe <br>
							Book your bus today!
						</h1>
						<button class="btn mt-3"
							onclick="window.location.href='/login/form';">Book Bus</button>
					</div>
				</div>
				<div class="carousel-item"
					style="background-image: url('/banner/image2.png');">
					<div class="slider-text">
						<h1 style="color: #fc6402;">
							Escape the ordinary, experience the extraordinary <br>Book
							your next flight with us!
						</h1>
						<button class="btn mt-3"
							onclick="window.location.href='/login/form';">Book
							Flight</button>
					</div>
				</div>
				<div class="carousel-item"
					style="background-image: url('/banner/image3.png');">
					<div class="slider-text">
						<h1 style="color: #fcb402;">
							No matter the distance, we will get you there <br>Book your
							car ride today!
						</h1>
						<button class="btn mt-3"
							onclick="window.location.href='/login/form';">Rent A Car</button>
					</div>
				</div>
			</div>
			<button class="carousel-control-prev" type="button"
				data-bs-target="#bannerCarousel" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#bannerCarousel" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</section>

	<!-- Service Section -->
	<section class="service_section">
		<div class='container'>
			<div class="row">
				<div class="header-section">
					<h2 class="title">
						Our <span>Services</span>
					</h2>
				</div>
				<p class="description">Our main services are to book a ticket
					from Bus, flight and rent a car. We provide best services with
					effordable rates.</p>
			</div>
			<div class="row">
				<div class="service-column">
					<div class="single-service">
						<div class="content">
							<span class="icon"> <i class="fas fa-bus-alt"></i>
							</span>
							<h3 class="main-title">Bus Services</h3>
							<p class="description">Book a Bus with comfortable seats with
								reasonable rates.</p>
							<a href="/login/form" class="learn-more">Book Bus</a>
						</div>
						<span class="circle-before"></span>
					</div>
				</div>
				<div class="service-column">
					<div class="single-service">
						<div class="content">
							<span class="icon"> <i class="fas fa-plane-arrival"></i>
							</span>
							<h3 class="main-title">Flight Services</h3>
							<p class="description">Book a Flight and get discounts and
								safe journey and reasonable rates.</p>
							<a href="/login/form" class="learn-more">Book Flight</a>
						</div>
						<span class="circle-before"></span>
					</div>
				</div>
				<div class="service-column">
					<div class="single-service">
						<div class="content">
							<span class="icon"> <i class="fas fa-car"></i>
							</span>
							<h3 class="main-title">Rent A Car</h3>
							<p class="description">Book a car and get your comfortable
								rides and journey with reasonable rates.</p>
							<a href="/login/form" class="learn-more">Book Car</a>
						</div>
						<span class="circle-before"></span>
					</div>
				</div>
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
	</script>
</body>
</html>