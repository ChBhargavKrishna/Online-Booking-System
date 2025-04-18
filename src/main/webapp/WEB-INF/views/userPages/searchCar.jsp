<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Cars</title>
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
}

body {
	font-family: 'Roboto', sans-serif;
	margin: 0;
	padding: 0;
	background: #051129;
}

body.no-buses {
	background: #f1f1f1 !important;
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

/** Scroll **/
.scroll-container {
	width: 100%;
	padding: 5px;
	position: fixed;
	background: linear-gradient(15deg, #0ef, #000);
	top: 0;
	left: 0;
}

.scroll-container h1 {
	color: #ec7063;
	position: relative;
	font-weight: bold;
	font-size: 32px;
	text-align: center;
}

.scroll-content {
	display: flex;
	gap: 20px;
	width: max-content;
	animation: scroll 25s linear infinite;
}

.scroll-item {
	display: flex;
	flex: 0 0 auto;
	flex-direction: row;
	align-items: center;
	min-width: 200px;
	background: #e67e22;
	color: #000;
	padding: 10px;
	gap: 10px;
	border: 2px solid #00ff00;
	border-radius: 10px;
	box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.2);
}

.scroll-item img {
	width: 40px;
	height: 40px;
	border-radius: 50%;
	border: 2px solid #00ff00;
}

.scroll-container:hover .scroll-content {
	animation-play-state: paused;
}

@keyframes scroll {from { transform:translateX(50%);
	
}

to {
	transform: translateX(-100%);
}

}

/**Search Car **/
.searchCar {
	width: 80%;
	margin: 120px auto 0;
	padding: 10px;
}

.car-container {
	background: transparent;
	padding: 15px;
	margin-bottom: 15px;
	border: 1px solid #f1f1f1;
	border-radius: 10px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	display: flex;
	flex-direction: column;
}

.car-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	text-align: center;
}

.car-image img {
	width: 100px;
	height: 100px;
	border-radius: 10px;
}

.car-left, .car-middle, .car-right {
	flex: 1;
	padding-left: 1rem;
}

.car-left {
	text-align: left;
	color: #00ff00;
}

.car-middle {
	text-align: center;
	padding-left: 3rem;
	color: #0ef;
}

.car-right {
	text-align: right;
	color: #f7a500;
}

.car-details {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.car-details h2 {
	font-size: 18px;
	color: #f7f000;
}

.car-details a {
	background: #0ef;
	color: #000;
	padding: 8px 12px;
	text-decoration: none;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin: 5px 0;
}

.car-details a:hover {
	box-shadow: 0 0 5px cyan, 0 0 25px cyan, 0 0 50px cyan, 0 0 100px cyan,
		0 0 200px cyan;
}

/** No Car Msg **/
.no-cars-message {
	text-align: center;
	font-size: 20px;
	color: #ff0000;
	gap: 20px;
	background: linear-gradient(45deg, #6e2c00, #000);
	padding: 20px;
	border-radius: 10px;
	width: fit-content;
	margin: 30px auto;
	box-shadow: 0px 0px 10px rgba(255, 255, 255, 0.2);
}

.no-cars-message a {
	display: inline-block;
	text-decoration: none;
	color: #000;
	background: orange;
	box-shadow: 0px 0px 10px rgba(255, 255, 255, 0.2);
	padding: 10px 10px;
	margin: 10px 10px;
	border-radius: 10px;
}

.no-cars-message a:hover {
	box-shadow: 0 0 5px orange, 0 0 25px orange, 0 0 50px orange, 0 0 100px
		orange, 0 0 200px orange;
}

/* Responsive Css */
@media ( max-width : 992px) {
	body {
		font-family: 'Roboto', sans-serif;
		margin: 0;
		padding: 0;
		background: #051129;
		font-size: clamp(22px, 3vw, 24px); /* This line is new */
	}
}

@media ( max-width : 660px) {
	body {
		font-family: 'Roboto', sans-serif;
		margin: 0;
		padding: 0;
		background: #051129;
		font-size: clamp(32px, 3vw, 34px); /* This line is new */
	}
}

@media ( max-width : 549px) {
	body {
		font-family: 'Roboto', sans-serif;
		margin: 0;
		padding: 0;
		background: #051129;
		font-size: clamp(42px, 3vw, 44px); /* This line is new */
	}
}
</style>
</head>
<body class="${empty cars ? 'no-cars' : ''}">
	<c:if test="${not empty message}">
		<div id="message" class="message">
			${message} <span class="close-btn" onclick="closeMessage()">&times;</span>
			<!-- Progress bar under the message -->
			<div class="progress-bar-container">
				<div id="progress-bar" class="progress-bar"></div>
			</div>
		</div>
	</c:if>

	<!-- Scroll Section -->
	<div class="scroll-container">
		<h1>Service Cars</h1>
		<div class="scroll-content">
			<c:set var="carImages"
				value="${{
				'Indica': '/user_service/search-car/scroll-1.png',
				'Ertiga': '/user_service/search-car/scroll-2.png',
				'Baleno': '/user_service/search-car/scroll-3.png',
				'Crista': '/user_service/search-car/scroll-4.png',
				'Innova': '/user_service/search-car/scroll-5.png',
				'Swift Dzire': '/user_service/search-car/scroll-6.png',
				'Thar': '/user_service/search-car/scroll-7.png',
				'Wagon R': '/user_service/search-car/scroll-8.png'
			}}" />

			<!-- Scroll Items -->
			<div class="scroll-item">
				<img src="/user_service/search-car/scroll-1.png" alt="Indica">
				<p>Indica</p>
			</div>
			<div class="scroll-item">
				<img src="/user_service/search-car/scroll-2.png" alt="Ertiga">
				<p>Ertiga</p>
			</div>
			<div class="scroll-item">
				<img src="/user_service/search-car/scroll-3.png" alt="Baleno">
				<p>Baleno</p>
			</div>
			<div class="scroll-item">
				<img src="/user_service/search-car/scroll-4.png" alt="Crista">
				<p>Crista</p>
			</div>
			<div class="scroll-item">
				<img src="/user_service/search-car/scroll-5.png" alt="Innova">
				<p>Innova</p>
			</div>
			<div class="scroll-item">
				<img src="/user_service/search-car/scroll-6.png" alt="Swift Dzire">
				<p>Swift Dzire</p>
			</div>
			<div class="scroll-item">
				<img src="/user_service/search-car/scroll-7.png" alt="Thar">
				<p>Thar</p>
			</div>
			<div class="scroll-item">
				<img src="/user_service/search-car/scroll-8.png" alt="Wagon R">
				<p>Wagon R</p>
			</div>
		</div>
	</div>

	<!-- Search Car Section -->
	<div class="searchCar">
		<c:if test="${not empty cars}">
			<c:forEach var="car" items="${cars}">
				<div class="car-container">
					<div class="car-header">
						<!-- Display Car Image above Car Name -->
						<div class="car-image">
							<c:set var="imagePath" value="${carImages[car.carName]}" />
							<img src="${imagePath}" alt="${car.carName}">
						</div>
						<div class="car-left">
							<h2>${car.carName}</h2>
							<p>${car.carId}</p>
						</div>
						<div class="car-middle">
							<h4>Car Model - ${car.carModel}</h4>
						</div>
						<div class="car-right">
							<h4>Seater - ${car.seater}</h4>
						</div>
					</div>

					<div class="car-details">
						<h2>Half Day Price - ${car.halfDayPrice}</h2>
						<h2>Full Day Price - ${car.fullDayPrice}</h2>
						<a href="/carPayment/${car.carId}" id="bookCar-${car.carId}"
							onclick="return carMessage('${car.status}', '${car.carId}')">Book
							Car</a>

					</div>
				</div>
			</c:forEach>
		</c:if>

		<c:if test="${empty cars}">
			<div class="no-cars-message">
				<h3>${message}</h3>
				<a href="/userDashboard">Back</a>
			</div>
		</c:if>
	</div>
	<script>
		function carMessage(status, carId) {
			if (status === "Booked") {
				alert("This car is already booked!");
				return false; // Prevents navigation
			}
			return true; // Allows navigation to /carPayment/{carId}
		}

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