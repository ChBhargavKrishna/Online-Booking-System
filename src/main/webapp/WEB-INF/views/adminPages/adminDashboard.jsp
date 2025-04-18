<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard</title>
<link rel="website icon" type="png" href="/background/footer_logo.png" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Poppins', sans-serif;
}

body {
	overflow-x: hidden;
}

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

/** Dashboard **/
.container {
	position: relative;
	width: 100%;
}

.side-menu {
	position: fixed;
	width: 300px;
	height: 100%;
	background: linear-gradient(45deg, #47cebe, #ef4a82);
	overflow-x: hidden;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	z-index: 2;
}

.side-menu ul li {
	width: 100%;
	list-style: none;
}

.side-menu ul li:hover {
	background: #444;
}

.side-menu ul li:first-child {
	line-height: 60px;
	margin-bottom: 20px;
	font-weight: 600;
	border-bottom: 1px solid #fff;
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

.side-menu ul li a i {
	min-width: 60px;
	font-size: 24px;
	text-align: center;
	color: #000;
}

.side-menu .title {
	padding: 0 10px;
	font-size: 20px;
}

.main {
	position: absolute;
	width: calc(100% - 300px);
	min-height: 100vh;
	left: 300px;
	background: #f5f5f5;
}

.top-bar {
	position: fixed;
	height: 60px;
	width: calc(100% - 300px);
	background: linear-gradient(45deg, #47cebe, #ef4a82);
	display: grid;
	justify-content: flex-end;
	align-items: center;
	color: #444;
	padding: 0 20px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.admin-info {
	display: flex;
	align-items: center;
	gap: 10px;
	padding: 5px 15px;
	border-radius: 30px;
	color: #fff;
}

.admin-info h2 {
	font-size: 18px;
	color: #00ff00;
	margin: 0;
}

.admin-info .icon {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 40px;
	height: 40px;
	background: #00ff00;
	color: #444;
	border-radius: 50%;
	font-size: 20px;
}

/** Cards **/
.cards {
	margin-top: 60px;
	width: 100%;
	padding: 35px 20px;
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	grid-gap: 20px;
}

.cards .card {
	background: linear-gradient(45deg, #47cebe, #ef4a82);
	padding: 20px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.4);
}

.number {
	font-size: 35px;
	font-weight: 500;
	color: #fff;
}

.card-name {
	color: #444;
	font-weight: 600;
}

.icon-box i {
	font-size: 40px;
	color: #000;
}

.card-links {
	display: flex;
	justify-content: center;
	gap: 30px;
	padding: 20px 20px;
}

.card-link {
	font-size: 1.5rem;
	padding: 15px 25px;
	color: #000;
	text-decoration: none;
	border-radius: 10px;
	transition: transform 0.3s ease;
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: flex-end;
	text-align: center;
	background-size: cover;
	background-position: center;
	width: 200px;
	height: 200px;
	position: relative;
	overflow: hidden;
}

.card-link span {
	position: relative;
	z-index: 1;
	background: linear-gradient(45deg, #3b0035, #00143b);
	color: #fff;
	font-weight: 600;
	margin-top: 20px;
}

.card-link:nth-child(1) {
	background-image: url('/admin_service/dbBus.jpg');
}

.card-link:nth-child(2) {
	background-image: url('/admin_service/dbFlight.jpg');
}

.card-link:nth-child(3) {
	background-image: url('/admin_service/dbCar.jpg');
}

.card-link:hover {
	transform: scale(1.05);
}

/** Tables **/
.tables {
	width: 100%;
	display: flex;
	flex-direction: column;
	gap: 20px;
	align-items: center;
	padding: 0 20px 20px 20px;
}

.payments, .reg_users {
	width: 100%;
	height: 100%;
	background: #fff;
	padding: 20px;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
}

.heading {
	display: flex;
	align-items: center;
	justify-content: space-between;
	color: #444;
	margin-bottom: 15px;
}

.btn {
	padding: 5px 10px;
	background: linear-gradient(45deg, #e4ff00, #ff3a00);
	color: #000;
	text-decoration: none;
	text-align: center;
}

table {
	margin-top: 10px;
	width: 100%;
	border-collapse: collapse;
}

thead td {
	font-weight: 600;
	color: #333;
}

td {
	padding: 9px 5px;
	border: 1px solid #ff4800;
}

table tr {
	border-bottom: 1px solid rgba(0, 0, 0, 0.1);
}

tbody tr:hover {
	background: #444;
	color: #fff;
}

table tbody tr:last-child {
	border-bottom: none;
}

.payments table tbody td:last-child {
	white-space: nowrap;
}

/** Toggle icon**/
/* Responsive */
.toggle-btn {
	display: none;
	font-size: 24px;
	color: white;
	cursor: pointer;
	position: absolute;
	left: 20px;
	top: 18px;
	z-index: 3;
}

.main, .top-bar {
	transition: all 0.3s ease;
}

@media ( max-width : 992px) {
	.side-menu {
		left: -300px;
		transition: left 0.3s ease;
	}
	.side-menu.active {
		left: 0;
	}
	.top-bar {
		width: 100%;
		left: 0;
		right: 0;
	}
	.toggle-btn {
		display: block;
		transition: all 0.3s ease;
	}
	.main {
		width: 100%;
		left: 0;
		right: 0;
	}
	.cards {
		grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
	}
	.card-links {
		flex-direction: row;
		align-items: center;
	}
	table {
		font-size: 14px;
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

	<span class="toggle-btn" onclick="toggleMenu()"> <i
		class="fas fa-bars"></i>
	</span>

	<div class="container">
		<div class="side-menu">
			<ul>
				<li><a href="#"> <i class="fas fa-home"></i> <span
						class="title">C.B.K</span>
				</a></li>
				<li><a href="/adminDashboard"> <i class="fas fa-th-large"></i>
						<span class="title">Dashboard</span>
				</a></li>
				<li><a href="/registered/users"> <i class="fas fa-users"></i>
						<span class="title">Registered Users</span>
				</a></li>
				<li><a href="/view/buses"> <i class="fas fa-bus"></i> <span
						class="title">Buses</span>
				</a></li>
				<li><a href="/view/flights"> <i
						class="fas fa-plane-departure"></i> <span class="title">Flights</span>
				</a></li>
				<li><a href="/view/cars"> <i class="fas fa-car"></i> <span
						class="title">Cars</span>
				</a></li>
				<li><a href="/payment/history"> <i
						class="fas fa-money-bill-alt"></i> <span class="title">Payments</span>
				</a></li>
				<li><a href="/logout"> <i class="fas fa-cog"></i> <span
						class="title">Sign Out</span>
				</a></li>

			</ul>
		</div>
		<div class="main">
			<div class="top-bar">
				<div class="admin-info">
					<h2>Hi Admin</h2>
					<div class="icon">
						<i class="fas fa-user-edit"></i>
					</div>
				</div>
			</div>
			<div class="cards">
				<div class="card">
					<div class="card-content">
						<h1 class="number">${registerCount}</h1>
						<h3 class="card-name">Users</h3>
					</div>
					<div class="icon-box">
						<i class="fas fa-users"></i>
					</div>
				</div>
				<div class="card">
					<div class="card-content">
						<h1 class="number">${busCount}</h1>
						<h3 class="card-name">Buses</h3>
					</div>
					<div class="icon-box">
						<i class="fas fa-bus-alt"></i>
					</div>
				</div>
				<div class="card">
					<div class="card-content">
						<h1 class="number">${flightCount}</h1>
						<h3 class="card-name">Flights</h3>
					</div>
					<div class="icon-box">
						<i class="fas fa-plane"></i>
					</div>
				</div>
				<div class="card">
					<div class="card-content">
						<div class="seats-available">
							<div class="seat-item">
								<h1 class="number">${carCount}</h1>
								<h3 class="card-name">Cars</h3>
							</div>
							<div class="seat-item">
								<h1 class="number">${availableCars}</h1>
								<h3 class="card-name">Available Cars</h3>
							</div>
						</div>
					</div>
					<div class="icon-box">
						<i class="fas fa-car-side"></i>
					</div>
				</div>
				<div class="card">
					<div class="card-content">
						<h1 class="number">${busBookedSeats}</h1>
						<h3 class="card-name">
							Booked Bus <br> Seat
						</h3>
					</div>
					<div class="icon-box">
						<i class="fas fa-bus"></i>
					</div>
				</div>
				<div class="card">
					<div class="card-content">
						<h1 class="number">${flightBookedSeats}</h1>
						<h3 class="card-name">Booked Flight Seat</h3>
					</div>
					<div class="icon-box">
						<i class="fas fa-fighter-jet"></i>
					</div>
				</div>
				<div class="card">
					<div class="card-content">
						<div class="seats-available">
							<div class="seat-item">
								<h1 class="number">${bookedCars}</h1>
								<h3 class="card-name">Booked Cars</h3>
							</div>
							<div class="seat-item">
								<h1 class="number">${activeCars}</h1>
								<h3 class="card-name">Active Cars</h3>
							</div>
						</div>
					</div>
					<div class="icon-box">
						<i class="fas fa-car-alt"></i>
					</div>
				</div>
				<div class="card">
					<div class="card-content">
						<div class="seats-available">
							<div class="seat-item">
								<h1 class="number">${busAvailableSeats}</h1>
								<h3 class="card-name">Bus Seats</h3>
							</div>
							<div class="seat-item">
								<h1 class="number">${flightAvailableSeats}</h1>
								<h3 class="card-name">Flight Seats</h3>
							</div>
						</div>
					</div>
					<div class="icon-box">
						<i class="fas fa-couch"></i>
					</div>
				</div>
			</div>
			<div class="card-links">
				<a href="/add/bus/form" class="card-link"> <span>Add Bus</span>
				</a> <a href="/add/flight/form" class="card-link"> <span>Add
						Flight</span>
				</a> <a href="/add/car/form" class="card-link"> <span>Add Car</span>
				</a>
			</div>

			<div class="tables">
				<div class="payments">
					<div class="heading">
						<h2>Latest Payments</h2>
						<a href="/payment/history" class="btn">View All</a>
					</div>
					<table class="latest_payments">
						<thead>
							<tr>
								<td>UserName</td>
								<td>Payment Reference Id</td>
								<td>Payment Id</td>
								<td>TransportType Id's</td>
								<td>TransportType</td>
								<td>Travels Name</td>
								<td>Amount</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="pay" items="${payments}">
								<tr>
									<td>${pay.user.fullName}</td>
									<td>${pay.id }</td>
									<td>${pay.paymentId.substring(0,4)}****
										${pay.paymentId.substring(32,36)}</td>
									<td>${pay.referenceId}</td>
									<td>${pay.transportType }</td>
									<td>${pay.flight.flightName }${pay.bus.busName }
										${pay.car.carName }</td>
									<td>${pay.amount}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			<div class="tables">
				<div class="reg_users">
					<div class="heading">
						<h2>Registered Users</h2>
						<a href="/registered/users" class="btn">View All</a>
					</div>
					<table class="users">
						<thead>
							<tr>
								<td>Full Name</td>
								<td>UserName</td>
								<td>Gender</td>
								<td>Contact No</td>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="register" items="${registers}">
								<tr>
									<td>${register.fullName}</td>
									<td>${register.login.userName}</td>
									<td>${register.gender}</td>
									<td>${register.contactNo}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script>
		(function() {
			if (typeof history.pushState === "function") {
				history.pushState(null, null, location.href);
				window.onpopstate = function() {
					history.go(1);
				};
			}
		})();

		// Prevent backspace from going back
		document.addEventListener("keydown", function(event) {
			if (event.key === "Backspace"
					&& !event.target.closest("textarea, input")) {
				event.preventDefault();
			}
		});
	
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

		let menuOpen = false;

		function toggleMenu() {
			const menu = document.querySelector('.side-menu');
			const main = document.querySelector('.main');
			const topBar = document.querySelector('.top-bar');

			menu.classList.toggle('active');
			menuOpen = !menuOpen;

			// Adjust main content on toggle
			if (menuOpen) {
				main.style.left = "300px";
				main.style.width = "calc(100% - 300px)";
				topBar.style.left = "300px";
				topBar.style.width = "calc(100% - 300px)";
			} else {
				if (window.innerWidth > 992) {
					main.style.left = "300px";
					main.style.width = "calc(100% - 300px)";
					topBar.style.left = "300px";
					topBar.style.width = "calc(100% - 300px)";
				} else {
					main.style.left = "0";
					main.style.width = "100%";
					topBar.style.left = "0";
					topBar.style.width = "100%";
				}
			}
		}

		// Fix layout when resizing window
		window.addEventListener('resize', () => {
			const menu = document.querySelector('.side-menu');
			const main = document.querySelector('.main');
			const topBar = document.querySelector('.top-bar');

			if (window.innerWidth > 992) {
				menu.classList.remove('active');
				main.style.left = "300px";
				main.style.width = "calc(100% - 300px)";
				topBar.style.left = "300px";
				topBar.style.width = "calc(100% - 300px)";
				menuOpen = false;
			} else {
				main.style.left = "0";
				main.style.width = "100%";
				topBar.style.left = "0";
				topBar.style.width = "100%";
			}
		});

		function closeMessage() {
			const message = document.getElementById("message");
			if (message) message.style.display = "none";
		}
	</script>
</body>
</html>