<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${fullName} Password Change</title>
<link rel="website icon" type="png" href="/background/footer_logo.png" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Roboto', sans-serif;
}

html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

/** container **/
.container {
	position: relative;
	width: 100%;
}

/** Side-Menu **/
.side-menu {
	position: fixed;
	width: 300px;
	height: 100%;
	top: 0;
	left: 0;
	background: linear-gradient(45deg, #40873e, #00045d);
	overflow-x: hidden;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	z-index: 2;
}

.side-menu.hidden {
	transform: translateX(-100%);
}

.side-menu ul li {
	width: 100%;
	list-style: none;
}

.side-menu ul li:hover {
	background-color: #07c4c2;
	color: #ffb601;
}

.side-menu ul .nav-item.active {
	color: #ffb601;
}

.side-menu ul li:first-child {
	line-height: 60px;
	margin-bottom: 30px;
	font-weight: 600;
	border-bottom: 1px solid #fff;
	text-align: center;
}

.side-menu ul li:first-child:hover {
	background: none;
}

.side-menu ul li a {
	width: 100%;
	text-decoration: none;
	color: #fff;
	height: 60px;
	display: flex;
	align-items: center;
}

.side-menu ul li a.logo {
	display: flex;
	align-items: center;
	gap: 10px;
}

.side-menu ul li a.logo img {
	width: 55px;
	height: 50px;
	border-radius: 50%;
	background: #000;
	object-fit: contain;
}

.side-menu ul li a.logo span {
	font-weight: 600;
	font-size: 18px;
	color: #fff;
	white-space: nowrap;
	overflow: visible;
	text-overflow: ellipsis;
}

.logout {
	position: absolute;
	bottom: 0;
}

.side-menu ul li a i {
	min-width: 60px;
	font-size: 24px;
	text-align: center;
	color: #fff;
}

/** Change Password **/
.change-password {
	position: absolute;
	width: calc(100% - 300px);
	min-height: 100vh;
	left: 300px;
	background: #c1c1c1;
	transition: margin-left 0.3s ease-in-out;
	overflow: auto;
}

.form-section {
	display: flex;
	justify-content: center;
	align-items: center;
	padding-top: 1rem;
}

.form-container {
	width: 100%;
	max-width: 500px;
	background: #000;
	border-radius: 10px;
	box-shadow: 0 0 25px #00ff00;
	padding: 30px 30px 30px;
	color: #fff;
}

.form-container .title {
	text-align: center;
	margin-bottom: 30px;
	font-size: 32px;
	color: #ff00ff;
	position: relative;
	padding-bottom: 14px;
	font-weight: 700;
}

.form-section .title span {
	color: #ff6800;
}

.form-section .title:before {
	content: '';
	position: absolute;
	bottom: 0;
	left: 50%;
	width: 250px;
	height: 3px;
	background-color: #00ff00;
	transform: translateX(-50%);
}

.form-section .title:after {
	content: '';
	position: absolute;
	bottom: -1px;
	left: 50%;
	width: 85px;
	height: 6px;
	background-color: #00ff00;
	transform: translateX(-50%);
}

.input-box {
	position: relative;
	margin-bottom: 20px;
}

.input-row {
	display: flex;
	justify-content: space-between;
	gap: 10px;
}

.input-row .input-box {
	flex: 1;
}

.confirm-password {
	display: flex;
	justify-content: center;
}

.confirm-password .input-box {
	width: 48%;
}

.input-box input {
	width: 100%;
	padding: 15px 0 15px 15px;
	font-size: 14px;
	border-radius: 6px;
	border: 2px solid rgba(255, 255, 255, 0.2);
	background: transparent;
	color: #fff;
	transition: border-color 0.3s ease, background-color 0.3s ease;
}

.input-box input::placeholder {
	color: #0ef;
	text-align: left;
}

.input-box input:hover {
	border-color: #ffb233;
	background-color: rgba(51, 255, 122, 0.1);
}

.form-container .btn {
	width: 100%;
	padding: 15px;
	font-size: 1rem;
	font-weight: 600;
	border: none;
	background-color: #3eff00;
	color: #000;
	border-radius: 20px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.form-container .btn:hover {
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

/** Content Section **/
.content-section {
	width: 1000px;
	margin: 50px auto 10px;
	border: 2px solid #0ef;
	background: linear-gradient(45deg, #40015f, #000);
	padding-bottom: 10px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
}

.content-data {
	display: flex;
	flex-wrap: wrap;
	width: 1000px;
	height: auto;
	padding: 20px 10px;
	gap: 20px;
	justify-content: space-between;
}

.content-data .content {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
	justify-content: space-around;
}

.item {
	display: flex;
	align-items: center;
	flex: 1 1 280px;
    min-width: 250px;
    max-width: 100%;
	padding: 15px;
	border: 2px solid #00ff00;
}

.item img {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	margin-right: 15px;
	object-fit: cover;
	border: 2px solid #0ef;
}

.item-text h3 {
	margin: 0;
	font-size: 1.1rem;
	color: #f7ff00;
}

.item-text p {
	margin: 5px 0 0;
	color: #f1f1f1;
	font-size: 0.9rem;
}

/* Responsive */
.toggle-btn {
	display: none;
	font-size: 22px;
	background-color: #000;
	color: white;
	padding: 5px 10px;
	border-radius: 6px;
	cursor: pointer;
	position: absolute;
	left: 10px;
	z-index: 3;
}

@media ( max-width : 1332px) {
	.change-password {
		width: 100%;
		left: 0;
		padding-left: 20px;
		padding-right: 20px;
	}
	.side-menu {
		transform: translateX(-100%);
	}
	.side-menu.active {
		transform: translateX(0);
	}
	.change-password.shifted {
		transform: translateX(300px); /* move right when menu active */
		width: calc(100% - 300px);
	}
	.toggle-btn {
		display: block;
		transition: all 0.3s ease;
	}
	.toggle-btn.moved {
		left: 310px;
	}
	.form-section {
		width: 100% !important;
	}
	.content-section {
		width: 85%;
		left: 0;
		padding-left: 20px;
		padding-right: 20px;
	}
	.content-section.shift {
		display: flex;
		flex: 1 1 calc(50% - 20px);
	}
}

@media ( max-width : 992px) {
	.change-password {
		width: 100%;
		left: 0;
		padding-left: 20px;
		padding-right: 20px;
	}
	.side-menu {
		transform: translateX(-100%);
	}
	.side-menu.active {
		transform: translateX(0);
	}
	.change-password.shifted {
		transform: translateX(300px); /* move right when menu active */
		width: calc(100% - 300px);
	}
	.toggle-btn {
		display: block;
		transition: all 0.3s ease;
	}
	.toggle-btn.moved {
		top: 18px;
		left: 310px;
	}
	.form-section {
		width: 100% !important;
	}
	.content-section {
		width: 85%;
		left: 0;
		padding-left: 20px;
		padding-right: 20px;
	}
	.content-section.shift {
		display: flex;
		flex: 1 1 calc(50% - 20px);
	}
}
</style>
</head>
<body>
	<!-- Toggler Button -->
	<button class="toggle-btn">
		<i class="fas fa-bars"></i>
	</button>

	<div class="container">
		<div id="side-menu" class="side-menu">
			<ul>
				<li><a href="#" class="logo"> <img
						src="${sessionScope.gender == 'Female' ? '/user_service/female.png' : '/user_service/male.png'}"
						alt="Profile Image" /> <span class="nav-item">Welcome
							${fullName}</span>
				</a></li>
				<li><a href="/userDashboard" class="nav-item"><i
						class="fas fa-home"></i>Home</a></li>
				<li><a href="/user/profile" class="nav-item"><i
						class="fas fa-user"></i>Profile</a></li>
				<li><a href="/booking/history" class="nav-item"><i
						class="fas fa-wallet"></i>Booking History</a></li>
				<li><a href="/change/password/form" class="nav-item active"><i
						class="fas fa-key"></i>Change Password</a></li>
				<li><a href="/help" class="nav-item"><i
						class="fas fa-question-circle"></i>Help</a></li>
				<li><a href="/logout" class="logout"><i
						class="fas fa-sign-out-alt"></i><span class="nav-item">Log
							out</span></a></li>
			</ul>
		</div>
	</div>

	<section class="change-password">
		<div class="form-section">
			<div class="form-container">
				<h2 class="title">
					Change <span>Password</span>
				</h2>
				<form action="/change/password" method="post">
					<input type="hidden" name="userName"
						value="${register.login.userName}" />
					<div class="input-row">
						<div class="input-box">
							<input type="password" name="currentPassword"
								placeholder="Enter Old Password" required>
						</div>
						<div class="input-box">
							<input type="password" name="newPassword"
								placeholder="Enter New Password" required>
						</div>
					</div>
					<div class="confirm-password">
						<div class="input-box">
							<input type="password" name="confirmPassword"
								placeholder="Confirm New Password" required>
						</div>
					</div>
					<div class="input-box">
						<button type="submit" class="btn">Change Password</button>
					</div>
				</form>
				<c:if test="${not empty message}">
					<p class="error-message">${message}</p>
				</c:if>
				<c:if test="${not empty error}">
					<p class="error">${error}</p>
				</c:if>
			</div>
		</div>

		<div class="content-section">
			<div class="content-data">
				<div class="content">
					<div class="item">
						<img src="/user_service/content/content-1.jpg" alt="Image 1">
						<div class="item-text">
							<h3>Chennai Flights</h3>
							<p>Via - Delhi, Mumbai, Coimbatore, Madurai</p>
						</div>
					</div>
					<div class="item">
						<img src="/user_service/content/content-2.jpg" alt="Image 1">
						<div class="item-text">
							<h3>Hyderabad Flights</h3>
							<p>Via - Chennai, Mumbai, Bangalore, Delhi</p>
						</div>
					</div>
					<div class="item">
						<img src="/user_service/content/content-3.jpg" alt="Image 1">
						<div class="item-text">
							<h3>Kolkata Flights</h3>
							<p>Via - Delhi, Mumbai, Bangalore, Pune</p>
						</div>
					</div>
					<div class="item">
						<img src="/user_service/content/content-4.jpg" alt="Image 1">
						<div class="item-text">
							<h3>Buses From Mumbai To</h3>
							<p>Bangalore, Goa, Pune, Indore, Ahmedabad</p>
						</div>
					</div>
					<div class="item">
						<img src="/user_service/content/content-5.jpg" alt="Image 1">
						<div class="item-text">
							<h3>Buses From Delhi To</h3>
							<p>Lucknow, Dehradun, Manali, Kanpur, Jaipur</p>
						</div>
					</div>
					<div class="item">
						<img src="/user_service/content/content-6.jpg" alt="Image 1">
						<div class="item-text">
							<h3>Buses From Bangalore To</h3>
							<p>Chennai, Hyderabad, Coimbatore, Mumbai, Goa</p>
						</div>
					</div>
					<div class="item">
						<img src="/user_service/content/content-9.jpg" alt="Image 1">
						<div class="item-text">
							<h3>Cars In Gujarat</h3>
						</div>
					</div>
					<div class="item">
						<img src="/user_service/content/content-8.jpg" alt="Image 1">
						<div class="item-text">
							<h3>Cars In Vizag</h3>
						</div>
					</div>
					<div class="item">
						<img src="/user_service/content/content-7.jpg" alt="Image 1">
						<div class="item-text">
							<h3>Cars In Kerala</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script>
	document.addEventListener('DOMContentLoaded', () => {
	    const toggler = document.querySelector('.toggle-btn');
	    const sideMenu = document.querySelector('.side-menu');
	    const change = document.querySelector('.change-password');
	    const contentSection = document.querySelector('.content-section');

	    toggler.addEventListener('click', () => {
	      sideMenu.classList.toggle('active');
	      change.classList.toggle('shifted');
	      toggler.classList.toggle('moved');
	      contentSection.classList.toggle('shift'); 
	    });
	  });
    </script>
</body>
</html>