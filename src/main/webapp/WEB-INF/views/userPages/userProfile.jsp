<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${fullName} Profile</title>
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

/** Message **/
.message {
	background-color: #11ca00;
	color: #000;
	padding: 10px;
	text-align: center;
	border-radius: 10px;
	font-size: 1rem;
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

/** Profile **/
.profile {
	position: absolute;
	width: calc(100% - 300px);
	min-height: 100vh;
	left: 300px;
	background: #697f82;
	transition: margin-left 0.3s ease-in-out;
}

.profile-content {
	position: relative;
	margin: 30px auto;
	width: 1000px;
	background: linear-gradient(45deg, black, purple);
	padding: 20px;
	border: 2px solid #06de02;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
}

.profile-title {
	font-size: 24px;
	font-weight: 600;
	margin-bottom: 10px;
	color: #0ef;
}

.profile-content p {
	font-size: 16px;
	font-weight: 500;
	margin-bottom: 20px;
	color: #f1f1f1;
}

.profile-content a {
	position: absolute;
	top: 20px;
	right: 20px;
	margin: 0;
	display: inline-flex;
	align-items: center;
	padding: 10px 12px;
	background-color: #00ff00;
	color: #000;
	font-size: 16px;
	font-weight: 500;
	text-decoration: none;
	border-radius: 20px;
	cursor: pointer;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	transition: background-color 0.3s ease;
}

.profile-content a:hover {
	box-shadow: 0 0 5px lime, 0 0 25px lime, 0 0 50px lime, 0 0 100px lime,
		0 0 200px lime;
}

.profile-content i {
	color: #000;
	padding-right: 10px;
	cursor: pointer;
	text-align: center;
	font-size: 14px;
}

.profile-data {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 20px 30px;
}

.profile-item {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px;
	border-bottom: 1px solid #f1f1f1;
}

.profile-item h3 {
	font-size: 18px;
	color: #ff00ff;
}

.profile-item span {
	font-size: 16px;
	color: #00ffff;
}

/** Login Details **/
.login-details {
	width: 1000px;
	margin: 0 auto;
	border: 2px solid #ff00ff;
	background: #000;
	padding: 20px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
}

.login-details h2 {
	font-size: 24px;
	font-weight: 600;
	margin-bottom: 10px;
	color: #00ff00
}

.login-details p {
	font-size: 16px;
	font-weight: 500;
	margin-bottom: 10px;
	color: #f1f1f1;
}

.field {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px;
	border-bottom: 1px solid #0ef;
	margin-bottom: 15px;
	color: #00ff93;
}

.field span {
	font-weight: 500;
	color: #f1f1f1;
}

.password-action {
	text-align: right;
	margin-top: 10px;
}

.login-details a {
	color: #000;
	text-decoration: none;
	font-size: 14px;
	padding: 10px 12px;
	background-color: #00ffff;
	font-weight: 500;
	border-radius: 20px;
	cursor: pointer;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.login-details a:hover {
	box-shadow: 0 0 5px cyan, 0 0 25px cyan, 0 0 50px cyan, 0 0 100px cyan,
		0 0 200px cyan;
}

/* Modal styling */
.modal {
	display: none;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 600px;
	background: linear-gradient(45deg, #c30b91, #0bc317);
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
	border-radius: 10px;
	z-index: 10;
	padding: 20px;
}

.modal.active {
	display: block;
}

.modal h3 {
	color: #f1f1f1;
	position: relative;
	padding-bottom: 14px;
	margin-bottom: 25px;
	font-weight: 700;
	font-size: 32px;
	text-decoration: underline;
	text-align: center;
}

.modal .input-box {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
}

.modal .input-group {
	width: 48%;
	margin-bottom: 1.5rem;
	position: relative;
}

.modal .input-group label {
	display: block;
	font-weight: 600;
	font-size: 1rem;
	margin-bottom: 0.5rem;
	color: #fff;
}

.modal .input-group input {
	outline: none;
	font-weight: 500;
	width: 100%;
	padding: 15px 0 15px 15px;
	font-size: 14px;
	border-radius: 6px;
	border: 2px solid rgba(255, 255, 255, 0.2);
	background: transparent;
	color: #fff;
	transition: border-color 0.3s ease, background-color 0.3s ease;
}

.input-group input:hover {
	border-color: #33ff7a;
}

.input-group input:hover::placeholder {
	color: #fff;
}

.input-group input::placeholder {
	color: #fff;
}

.input-group input:focus::placeholder {
	color: #fff;
}

.modal .btn {
	width: 100%;
	padding: 15px;
	font-size: 1rem;
	font-weight: 600;
	border: none;
	background: #0ef;
	color: #000;
	border-radius: 20px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.modal .btn:hover {
	box-shadow: 0 0 5px cyan, 0 0 25px cyan, 0 0 50px cyan, 0 0 100px cyan,
		0 0 200px cyan;
}

.overlay {
	display: none;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0, 0, 0, 0.5);
	z-index: 9;
}

.overlay.active {
	display: block;
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
	.profile {
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
	.profile.shifted {
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
	.profile-content {
		width: 100% !important;
	}
	.login-details {
		width: 100%;
		left: 0;
		padding-left: 20px;
		padding-right: 20px;
	}
}

@media ( max-width : 992px) {
	.profile {
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
	.profile.shifted {
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
	.profile-content {
		width: 100% !important;
	}
	.login-details {
		width: 100%;
		left: 0;
		padding-left: 20px;
		padding-right: 20px;
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
				<li><a href="/user/profile" class="nav-item active"><i
						class="fas fa-user"></i>Profile</a></li>
				<li><a href="/booking/history" class="nav-item"><i
						class="fas fa-wallet"></i>Booking History</a></li>
				<li><a href="/change/password/form" class="nav-item"><i
						class="fas fa-key"></i>Change Password</a></li>
				<li><a href="/help" class="nav-item"><i
						class="fas fa-question-circle"></i>Help</a></li>
				<li><a href="/logout" class="logout"><i
						class="fas fa-sign-out-alt"></i><span class="nav-item">Log
							out</span></a></li>
			</ul>
		</div>
	</div>

	<section class="profile">
		<div class="profile-content">
			<h2 class="profile-title">My Profile</h2>
			<p>Basic Info For Better Experience</p>

			<a href="javascript:void(0)" id="edit-button"><i
				class="fas fa-pencil-alt"></i>Edit</a>

			<div class="profile-data">
				<div class="profile-item">
					<h3>Full Name</h3>
					<span>${register.fullName}</span>
				</div>
				<div class="profile-item">
					<h3>Birthday</h3>
					<span>${register.DOB}</span>
				</div>
				<div class="profile-item">
					<h3>Age</h3>
					<span>${register.age}</span>
				</div>
				<div class="profile-item">
					<h3>Gender</h3>
					<span>${register.gender}</span>
				</div>
				<div class="profile-item">
					<h3>Email Address</h3>
					<span>${register.login.userName}</span>
				</div>
				<div class="profile-item">
					<h3>Mobile Number</h3>
					<span>${register.contactNo}</span>
				</div>
				<div class="profile-item">
					<h3>Pincode</h3>
					<span>${register.pinCode}</span>
				</div>
				<div class="profile-item">
					<h3>State</h3>
					<span>${register.state}</span>
				</div>
			</div>
		</div>
		<div class="login-details">
			<h2>Login Details</h2>
			<p>Manage email address and password</p>

			<div class="field">
				<h3>User Name</h3>
				<span>${register.login.userName }</span>
			</div>

			<div class="field">
				<h3>Password</h3>
				<span> <c:if test="${not empty register.login.passCode}">
						<c:set var="passwordLength"
							value="${fn:length(register.login.passCode)}" />
						<c:out
							value="${fn:substring('********************', 0, passwordLength)}" />
					</c:if>
				</span>
			</div>

			<div class="password-action">
				<a href="/change/password/form">Change Password?</a>
			</div>
		</div>
	</section>

	<div class="overlay" id="overlay">
		<div class="modal" id="edit-modal">
			<h3>Edit Profile</h3>
			<form action="/edit/profile" method="POST">
				<div class="input-box">
					<div class="input-group">
						<label>Full Name</label> <input type="text" name="fullName"
							value="${register.fullName}" required>
					</div>
					<div class="input-group">
						<label>Birthday</label> <input type="date" name="DOB"
							value="${register.DOB}" required>
					</div>
				</div>
				<div class="input-box">
					<div class="input-group">
						<label>Age</label> <input type="number" name="age"
							value="${register.age}" min="18" max="70" required>
					</div>
					<div class="input-group">
						<label>Gender</label> <input type="text" name="gender"
							value="${register.gender}" required>
					</div>
				</div>
				<div class="input-box">
					<div class="input-group">
						<label>Email</label> <input type="email" name="userName"
							value="${register.login.userName}" disabled required>
					</div>
					<div class="input-group">
						<label>Mobile Number</label> <input type="tel" name="contactNo"
							value="${register.contactNo}" pattern="^\d{10}$" maxLength="10"
							required>
					</div>
				</div>
				<div class="input-box">
					<div class="input-group">
						<label>Pincode</label> <input type="text" name="pinCode"
							value="${register.pinCode}" pattern="^\d{6}$" maxLength="6"
							required>
					</div>
					<div class="input-group">
						<label>State</label> <input type="text" name="state"
							value="${register.state}" required>
					</div>
					<button type="submit" class="btn">Save Changes</button>
				</div>
			</form>
		</div>
	</div>
	<script>
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
	
	const editButton = document.getElementById('edit-button');
    const modal = document.getElementById('edit-modal');
    const overlay = document.getElementById('overlay');

    editButton.addEventListener('click', () => {
        modal.classList.add('active');
        overlay.classList.add('active');
    });

    const form = modal.querySelector('form');
    form.addEventListener('submit', (e) => {
        modal.classList.remove('active');
        overlay.classList.remove('active');
    });
	
    document.addEventListener('DOMContentLoaded', () => {
	    const toggler = document.querySelector('.toggle-btn');
	    const sideMenu = document.querySelector('.side-menu');
	    const profile = document.querySelector('.profile');

	    toggler.addEventListener('click', () => {
	      sideMenu.classList.toggle('active');
	      profile.classList.toggle('shifted');
	      toggler.classList.toggle('moved');
	    });
	  });
    </script>
</body>
</html>