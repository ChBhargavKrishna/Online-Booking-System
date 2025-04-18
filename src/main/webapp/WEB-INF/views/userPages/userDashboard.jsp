<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${fullName} Dashboard</title>
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

/** filter section **/
.search-filter {
	position: absolute;
	width: calc(100% - 300px);
	min-height: 100vh;
	left: 300px;
	background: #bfbaa8;
	transition: margin-left 0.3s ease-in-out;
	overflow: auto;
}

.data {
	display: flex;
	justify-content: center;
	position: relative;
}

/** Search Category **/
.categories {
	background-color: #000;
	width: 850px;
	margin: 15px auto;
	border-radius: 10px;
	box-shadow: 0px 1px 15px 1px #7a7a7a;
	display: flex;
	justify-content: space-evenly;
	gap: 30px;
	z-index: 2;
}

.categories .category {
	font-size: 14px;
	padding: 10px;
	color: #00ffd4;
	display: flex;
	align-items: center;
	flex-direction: column;
	gap: 5px;
	text-align: center;
	cursor: pointer;
}

.category.active {
	border-bottom: 2px solid #46ff00;
	color: #46ff00;
}

.category.active i {
	color: #46ff00;
}

.fas {
	font-size: 32px;
	margin-bottom: 5px;
	color: #00ffd4;
}

/** Search Form **/
.search-form {
	width: 1000px;
	height: 300px;
	padding: 10px;
	position: absolute;
	border-radius: 10px;
	background: linear-gradient(to right, #3b0035, #00143b);
	box-shadow: 0px 1px 15px 1px #7a7a7a;
	top: 60px;
	z-index: 1;
}

.search-form .search {
	display: none;
	padding: 20px;
	width: 100%;
	margin: 50px auto;
}

.search-form .search.active {
	display: flex;
}

.search-form form {
	display: flex;
	gap: 20px;
	border: 2px solid #00ff00;
	border-radius: 10px;
	background: transparent;
	color: #f1f1f1;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	width: 100%;
}

.form-row {
	display: flex;
	flex-direction: column;
	flex: 1;
	padding: 10px;
	border-right: 2px solid #00ff00;
	gap: 20px;
}

.form-row:nth-child(3) {
	border-right: none;
}

.form-row label {
	font-weight: 600;
	font-size: 20px;
	margin-bottom: 5px;
}

.form-row input {
	padding: 10px;
	font-size: 14px;
	border: 2px solid #ccc;
	border-radius: 10px;
	width: 100%;
	color: #fff;
	background-color: #000;
	transition: border-color 0.3s ease;
}

.form-row input:hover, .form-row input:focus {
	border-color: #007bff;
	outline: none;
}

.form-row input:hover::placeholder {
	color: #fff;
}

.form-row input::placeholder {
	color: #fff;
}

.form-row input:focus::placeholder {
	color: #fff;
}

.car-form:nth-child(3) {
	border-right: 2px solid #00ff00;
}

.car-form:nth-child(5) {
	border-right: none;
}

.form-btn .btn {
	width: 216px;
	height: 44px;
	background: linear-gradient(45deg, #fb7403, #07fb03);
	color: #000;
	font-size: 28px;
	text-align: center;
	border-radius: 35px;
	display: flex;
	align-items: center;
	justify-content: center;
	position: absolute;
	bottom: -20px;
	left: 37%;
	cursor: pointer;
}

.form-btn .btn:hover {
	background: linear-gradient(45deg, #07fb03, #fb7403);
	color: #fff;
}

/** Content **/
.content-section {
	width: 1000px;
	margin: 300px auto 10px;
	border: 1px solid #fff;
	background: linear-gradient(45deg, #5f0147, #000);
	padding-bottom: 10px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
}

.content-data {
	display: flex;
	flex-wrap: wrap;
	width: 1000px;
	height: auto;
	padding: 10px 20px;
	gap: 20px;
	justify-content: space-between;
}

.content-data .content {
	display: none;
	flex-wrap: wrap;
	gap: 20px;
	justify-content: space-around;
}

.content-data .content.active {
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
	border: 2px solid #03fbec;
	margin-right: 15px;
	object-fit: cover;
}

.item-text h3 {
	margin: 0;
	font-size: 1.1rem;
	color: #00ff00;
}

.item-text p {
	margin: 5px 0 0;
	color: #f1f1f1;
	font-size: 0.9rem;
}

/* Responsive */
.toggle-btn {
	display: none;
	font-size: 24px;
	background: transparent;
	color: white;
	border: none;
	cursor: pointer;
	position: absolute;
	left: 30px;
	top: 35px;
	z-index: 3;
}

@media ( max-width : 1332px) {
	.search-filter {
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
	.search-filter.shifted {
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
	.search-form {
		width: 100% !important;
	}
	.categories {
		flex-wrap: wrap;
		width: 100% !important;
		gap: 15px;
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
	.search-filter {
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
	.search-filter.shifted {
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
	.search-form {
		width: 100% !important;
	}
	.categories {
		flex-wrap: wrap;
		width: 100% !important;
		gap: 15px;
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
				<li><a href="/userDashboard" class="nav-item active"><i
						class="fas fa-home"></i>Home</a></li>
				<li><a href="/user/profile" class="nav-item"><i
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

		<section class="search-filter">
			<div class="data">
				<div id="categories" class="categories">
					<!-- Categories -->
					<div id="flightBtn" class="category active">
						<i class="fas fa-plane"></i>Flights
					</div>
					<div id="busBtn" class="category">
						<i class="fas fa-bus"></i>Buses
					</div>
					<div id="carBtn" class="category">
						<i class="fas fa-car"></i>Cars
					</div>
				</div>

				<!-- Search Forms -->
				<div class="search-form">
					<!-- Flight Form -->
					<div id="flightForm" class="search">
						<form action="/searchFlights" method="post">
							<div class="form-row">
								<label for="startLocation">From</label> <input type="text"
									id="startLocation" placeholder="Start Location"
									name="startLocation" required>
							</div>
							<div class="form-row">
								<label for="destination">To</label> <input type="text"
									id="destination" placeholder="Destination" name="destination"
									required>
							</div>
							<div class="form-row">
								<label for="departDate">Departure</label> <input type="date"
									id="departDate" name="departDate" required>
							</div>
							<div class="form-btn">
								<button type="submit" class="btn">Search</button>
							</div>
						</form>
					</div>

					<!-- Bus Form -->
					<div id="busForm" class="search">
						<form action="/searchBuses" method="post">
							<div class="form-row">
								<label for="departurePlace">From</label> <input type="text"
									id="departurePlace" placeholder="Depart Location"
									name="departurePlace" required>
							</div>
							<div class="form-row">
								<label for="arrivalPlace">To</label> <input type="text"
									id="arrivalPlace" placeholder="Arrive Location"
									name="arrivalPlace" required>
							</div>
							<div class="form-row">
								<label for="travelDate">Travel Date</label> <input type="date"
									id="travelDate" name="travelDate" required>
							</div>
							<div class="form-btn">
								<button type="submit" class="btn">Search</button>
							</div>
						</form>
					</div>

					<!-- Car Form -->
					<div id="carForm" class="search">
						<form action="/searchCars" method="post"
							onsubmit="return validateDates()">
							<div class="form-row">
								<label for="pickupLocation">Pickup Location</label> <input
									type="text" placeholder="Pickup Location" name="pickupLocation"
									required>
							</div>
							<div class="form-row">
								<label for="pickupDate">Pickup Date</label> <input type="date"
									name="pickupDate" required>
							</div>
							<div class="form-row car-form">
								<label for="pickupTime">Pickup Time</label> <input type="time"
									name="pickupTime" required>
							</div>
							<div class="form-row">
								<label for="dropoffDate">Dropoff Date</label> <input type="date"
									name="dropoffDate" required>
							</div>
							<div class="form-row car-form">
								<label for="dropoffTIme">Dropoff Time</label> <input type="time"
									name="dropoffTime" required>
							</div>
							<div class="form-btn">
								<button type="submit" class="btn">Search</button>
							</div>
						</form>
					</div>
				</div>
			</div>

			<div class="content-section">
				<div class="content-data">
					<div id="flightContent" class="content active">
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
								<h3>Goa Flights</h3>
								<p>Via - Delhi , Mumbai, Bangalore, Ahmedabad</p>
							</div>
						</div>
						<div class="item">
							<img src="/user_service/content/content-5.jpg" alt="Image 1">
							<div class="item-text">
								<h3>Delhi Flights</h3>
								<p>Via - Mumbai, Pune, Bangalore, Chennai</p>
							</div>
						</div>
						<div class="item">
							<img src="/user_service/content/content-6.jpg" alt="Image 1">
							<div class="item-text">
								<h3>Bangalore Flights</h3>
								<p>Via - Delhi, Pune, Mumbai, Kolkata</p>
							</div>
						</div>
						<div class="item">
							<img src="/user_service/content/content-7.jpg" alt="Image 1">
							<div class="item-text">
								<h3>Mumbai Flights</h3>
								<p>Via - Delhi, Bangalore, Chennai, Ahmedabad</p>
							</div>
						</div>
						<div class="item">
							<img src="/user_service/content/content-8.jpg" alt="Image 1">
							<div class="item-text">
								<h3>Pune Flights</h3>
								<p>Via - Delhi, Bangalore, Chennai, Ahmedabad</p>
							</div>
						</div>
						<div class="item">
							<img src="/user_service/content/content-9.jpg" alt="Image 1">
							<div class="item-text">
								<h3>Jaipur Flights</h3>
								<p>Via - Mumbai, Delhi, Pune, Bangalore</p>
							</div>
						</div>
					</div>
					<div id="busContent" class="content">
						<div class="item">
							<img src="/user_service/content/content-6.jpg" alt="Image 1">
							<div class="item-text">
								<h3>Buses From Bangalore To</h3>
								<p>Chennai, Hyderabad, Coimbatore, Mumbai, Goa</p>
							</div>
						</div>
						<div class="item">
							<img src="/user_service/content/content-8.jpg" alt="Image 1">
							<div class="item-text">
								<h3>Buses From Pune To</h3>
								<p>Goa, Bangalore, Nagpur, Hyderabad, Mumbai</p>
							</div>
						</div>
						<div class="item">
							<img src="/user_service/content/content-4.jpg" alt="Image 1">
							<div class="item-text">
								<h3>Buses From Ahmedabad To</h3>
								<p>Mumbai, Rajkot, Surat, Pune, Indore</p>
							</div>
						</div>
						<div class="item">
							<img src="/user_service/content/content-1.jpg" alt="Image 1">
							<div class="item-text">
								<h3>Buses From Chennai To</h3>
								<p>Bangalore, Coimbatore, Madurai, Hyderabad, Trichy</p>
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
							<img src="/user_service/content/content-9.jpg" alt="Image 1">
							<div class="item-text">
								<h3>Buses From Coimbatore To</h3>
								<p>Chennai, Bangalore, Madurai, Pondicherry, Nagercoil</p>
							</div>
						</div>
						<div class="item">
							<img src="/user_service/content/content-2.jpg" alt="Image 1">
							<div class="item-text">
								<h3>Buses From Hyderabad To</h3>
								<p>Bangalore, Chennai, Mumbai, Pune, Vijayawada</p>
							</div>
						</div>
						<div class="item">
							<img src="/user_service/content/content-7.jpg" alt="Image 1">
							<div class="item-text">
								<h3>Buses From Mumbai To</h3>
								<p>Bangalore, Goa, Pune, Indore, Ahmedabad</p>
							</div>
						</div>
						<div class="item">
							<img src="/user_service/content/content-3.jpg" alt="Image 1">
							<div class="item-text">
								<h3>Buses From Kolkata To</h3>
								<p>Durgapur, Asansol, Siliguri, Bhubaneshwar, Bardhaman</p>
							</div>
						</div>
					</div>
					<div id="carContent" class="content">
						<div class="item">
							<img src="/user_service/content/content-5.jpg" alt="Image 1">
							<div class="item-text">
								<h3>Cars In Delhi</h3>
							</div>
						</div>
						<div class="item">
							<img src="/user_service/content/content-4.jpg" alt="Image 1">
							<div class="item-text">
								<h3>Cars In Goa</h3>
							</div>
						</div>
						<div class="item">
							<img src="/user_service/content/content-9.jpg" alt="Image 1">
							<div class="item-text">
								<h3>Cars In Gujarat</h3>
							</div>
						</div>
						<div class="item">
							<img src="/user_service/content/content-3.jpg" alt="Image 1">
							<div class="item-text">
								<h3>Cars In Mumbai</h3>
							</div>
						</div>
						<div class="item">
							<img src="/user_service/content/content-1.jpg" alt="Image 1">
							<div class="item-text">
								<h3>Cars In Chennai</h3>
							</div>
						</div>
						<div class="item">
							<img src="/user_service/content/content-2.jpg" alt="Image 1">
							<div class="item-text">
								<h3>Cars In Hyderabad</h3>
							</div>
						</div>
						<div class="item">
							<img src="/user_service/content/content-6.jpg" alt="Image 1">
							<div class="item-text">
								<h3>Cars In Bangalore</h3>
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
	
	document.addEventListener('DOMContentLoaded', () => {
        const categories = document.querySelectorAll('.category');
        const forms = {
            flightBtn: document.getElementById('flightForm'),
            busBtn: document.getElementById('busForm'),
            carBtn: document.getElementById('carForm'),
        };
        forms.flightBtn.style.display = 'flex';
        categories.forEach(category => {
            category.addEventListener('click', () => {
                categories.forEach(cat => cat.classList.remove('active'));
                category.classList.add('active');
                Object.values(forms).forEach(form => (form.style.display = 'none'));
                forms[category.id].style.display = 'flex';
            });
        });
    });
	
	document.addEventListener('DOMContentLoaded', () => {
        const categories = document.querySelectorAll('.category');
        const content = document.querySelectorAll('.content');
        const contents = {
            flightBtn: document.getElementById('flightContent'),
            busBtn: document.getElementById('busContent'),
            carBtn: document.getElementById('carContent'),
        };
        contents.flightBtn.style.display = 'flex';
        categories.forEach(category => {
            category.addEventListener('click', () => {
                categories.forEach(cat => cat.classList.remove('active'));
                category.classList.add('active');
                Object.values(contents).forEach(form => (form.style.display = 'none'));
                contents[category.id].style.display = 'flex';
                contents[content.id].style.display = 'flex';
            });
        });
    });
	
	  document.addEventListener('DOMContentLoaded', () => {
	    const toggler = document.querySelector('.toggle-btn');
	    const sideMenu = document.querySelector('.side-menu');
	    const searchFilter = document.querySelector('.search-filter');
	    const contentSection = document.querySelector('.content-section');

	    toggler.addEventListener('click', () => {
	      sideMenu.classList.toggle('active');
	      searchFilter.classList.toggle('shifted');
	      toggler.classList.toggle('moved');
	      contentSection.classList.toggle('shift');
	    });
	  });

	function validateDates() {
        let pickupDate = document.querySelector('input[name="pickupDate"]').value;
        let dropoffDate = document.querySelector('input[name="dropoffDate"]').value;
        let pickupTime = document.querySelector('input[name="pickupTime"]').value;
        let dropoffTime = document.querySelector('input[name="dropoffTime"]').value;
        
        let today = new Date().toISOString().split("T")[0];

        if (pickupDate < today) {
            alert("Pickup date must be today or a future date.");
            return false;
        }

        // Convert dates and times to Date objects
        let pickupDateTime = new Date(pickupDate + "T" + pickupTime);
        let dropoffDateTime = new Date(dropoffDate + "T" + dropoffTime);

        if (dropoffDateTime <= pickupDateTime) {
            alert("Dropoff time must be after the pickup time.");
            return false;
        }

        // Calculate rental duration in hours and minutes
        let rentalMillis = dropoffDateTime - pickupDateTime;
        let rentalHours = Math.floor(rentalMillis / (1000 * 60 * 60));
        let rentalMinutes = Math.floor((rentalMillis % (1000 * 60 * 60)) / (1000 * 60));

        let rentalTime = rentalHours + " hours " + rentalMinutes + " minutes";

        // Store rental time in a hidden input field to send to the backend
        document.getElementById("rentalTime").value = rentalTime;

        return true;
    }
	
    </script>
</body>
</html>