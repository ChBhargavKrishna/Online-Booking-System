<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${fullName} Booking History</title>
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

/** History **/
.booking-history {
	position: absolute;
	width: calc(100% - 300px);
	min-height: 100vh;
	left: 300px;
	background: #697f82;
	transition: margin-left 0.3s ease-in-out;
}

.bus-history {
	width: 1000px;
	margin: 30px auto;
	background: linear-gradient(45deg, black, purple);
	padding: 20px;
	border: 2px solid #06de02;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
}

.bus-history thead {
	background-color: #000;
	color: #fe8c03;
}

.bus-history tbody tr:nth-child(odd) {
	color: #ffe000;
}

.bus-history tbody tr:nth-child(even) {
	color: #ff2770;
}

.flight-history {
	width: 1000px;
	margin: 10px auto;
	border: 2px solid #ff00ff;
	background: #000;
	color: #f1f1f1;
	padding: 20px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
}

.flight-history thead {
	background-color: #fbff00;
	color: #ff0000;
}

.flight-history tbody tr:nth-child(odd) {
	color: #0ef;
}

.flight-history tbody tr:nth-child(even) {
	color: #00ff00;
}

.car-history {
	width: 1000px;
	margin: 10px auto;
	border: 2px solid #fe8c03;
	background: #051129;
	color: #fff;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
	padding: 20px;
}

.car-history thead {
	background-color: #ff8700;
	color: #000;
}

.booking-history .title {
	color: #ff830e;
	position: relative;
	padding-bottom: 14px;
	margin-bottom: 25px;
	font-weight: 700;
	font-size: 32px;
	text-transform: capitalize;
	text-align: center;
}

.booking-history .title span {
	color: #f1f1f1;
}

.booking-history .title:before {
	content: '';
	position: absolute;
	bottom: 0;
	left: 50%;
	width: 150px;
	height: 3px;
	background-color: #099d4a;
	transform: translateX(-50%);
}

.booking-history .title:after {
	content: '';
	position: absolute;
	bottom: -1px;
	left: 50%;
	width: 45px;
	height: 6px;
	background-color: #099d4a;
	transform: translateX(-50%);
}

table {
	width: 100%;
	border-collapse: collapse;
	text-align: left;
}

th, td {
	padding: 8px;
	border: 1px solid #f1f1f1;
	overflow: auto;
	white-space: normal;
}

.form-control {
	display: flex;
	justify-content: flex-end;
	align-items: center;
	gap: 10px;
}

.form-select {
	width: 80px;
	height: auto;
	padding: 5px;
	border-radius: 5px;
	border: 1px solid #ccc;
	background-color: #fff;
	font-size: 14px;
	cursor: pointer;
	transition: all 0.3s ease-in-out;
}

.form-select:focus {
	border-color: #007bff;
	outline: none;
	box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
}

.btn {
	background: linear-gradient(to right, #ff4b2b, #ff0000);
	color: #000;
	padding: 10px 12px;
	border: none;
	border-radius: 20px;
	cursor: pointer;
	font-size: 14px;
	font-weight: 500;
}

.btn:hover {
	background: #000;
	color: #ff0000;
	border-color: #ff0000;
	box-shadow: 0 0 5px orange, 0 0 25px orange, 0 0 50px orange, 0 0 100px
		orange, 0 0 200px orange;
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
	.booking-history {
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
	.booking-history.shifted {
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
	.bus-history, .flight-history, .car-history {
		width: 100%;
		left: 0;
		padding-left: 20px;
		padding-right: 20px;
	}
}

@media ( max-width : 992px) {
	.booking-history {
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
	.booking-history.shifted {
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
	.bus-history, .flight-history, .car-history {
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
				<li><a href="/user/profile" class="nav-item"><i
						class="fas fa-user"></i>Profile</a></li>
				<li><a href="/booking/history" class="nav-item active"><i
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

	<section class="booking-history">
		<div class="bus-history">
			<h2 class="title">
				Bus <span>History</span>
			</h2>
			<table>
				<thead>
					<tr>
						<th>Id</th>
						<th>Payment ID</th>
						<th>Bus Name</th>
						<th>Travel Date</th>
						<th>Booked Seats</th>
						<th>Amount Paid</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="payment" items="${userPayments}">
						<c:if test="${not empty payment.bus}">
							<tr>
								<td>${payment.id}</td>
								<td>${payment.paymentId.substring(0,4)}****
									${payment.paymentId.substring(32,36)}</td>
								<td>${payment.bus.busName}</td>
								<td>${payment.bus.travelDate}</td>
								<td>${payment.paymentSeats}</td>
								<td>${payment.amount}</td>
								<td>
									<form action="/cancelBus/${payment.bus.bus_id}" method="post"
										class="form-control" onsubmit="return cancelSeat()">
										<input type="hidden" name="paymentId" value="${payment.id}" />
										<select name="seat" class="form-select">
											<c:forEach var="seat" items="${payment.paymentSeats}">
												<option value="${seat}">${seat}</option>
											</c:forEach>
										</select>
										<button type="submit" class="btn">Cancel</button>
									</form>
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="flight-history">
			<h2 class="title">
				Flight <span>History</span>
			</h2>
			<table>
				<thead>
					<tr>
						<th>Id</th>
						<th>Payment ID</th>
						<th>Flight Name</th>
						<th>Departure Date</th>
						<th>Booked Seats</th>
						<th>Amount Paid</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="payment" items="${userPayments}">
						<c:if test="${not empty payment.flight}">
							<tr>
								<td>${payment.id}</td>
								<td>${payment.paymentId.substring(0,4)}****
									${payment.paymentId.substring(32,36)}</td>
								<td>${payment.flight.flightName}</td>
								<td>${payment.flight.departDate}</td>
								<td>${payment.paymentSeats}</td>
								<td>${payment.amount}</td>
								<td>
									<form action="/cancelFlight/${payment.flight.id}" method="post"
										class="form-control" onsubmit="return cancelSeat()">
										<input type="hidden" name="paymentId" value="${payment.id}" />
										<select name="seat" class="form-select">
											<c:forEach var="seat" items="${payment.paymentSeats}">
												<option value="${seat}">${seat}</option>
											</c:forEach>
										</select>
										<button type="submit" class="btn">Cancel</button>
									</form>
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="car-history">
			<h2 class="title">
				Car <span>History</span>
			</h2>
			<table>
				<thead>
					<tr>
						<th>Id</th>
						<th>Payment ID</th>
						<th>Car Name & Model</th>
						<th>Pickup Location</th>
						<th>Pickup Date</th>
						<th>Drop-off Date</th>
						<th>Pickup Time</th>
						<th>Drop-off Time</th>
						<th>Rental Days</th>
						<th>Amount Paid</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="payment" items="${userPayments}">
						<c:if test="${not empty payment.car}">
							<tr>
								<td>${payment.id}</td>
								<td>${payment.paymentId.substring(0,4)}****
									${payment.paymentId.substring(32,36)}</td>
								<td>${payment.car.carName}-${payment.car.carModel}</td>
								<td>${payment.car.pickupLocation}</td>
								<td>${payment.car.pickupDate}</td>
								<td>${payment.car.dropoffDate}</td>
								<td>${payment.car.pickupTime}</td>
								<td>${payment.car.dropoffTime}</td>
								<td><c:choose>
										<c:when test="${payment.car.rentalDays == 0}">Paid For 12hrs</c:when>
										<c:otherwise>${payment.car.rentalDays}</c:otherwise>
									</c:choose></td>
								<td>${payment.amount}</td>
								<td colspan="2"><c:choose>
										<c:when test="${payment.car.dropoffDate lt currentDate}">
                                    Booking Period Completed
                                </c:when>
										<c:otherwise>
											<c:if test="${payment.car.rentalDays > 1}">
												<form action="/cancelCar/${payment.car.carId}" method="post"
													class="form-control">
													<input type="hidden" name="paymentId" value="${payment.id}" />
													<select name="cancelDays" class="form-select">
														<c:forEach begin="1" end="${payment.car.rentalDays}"
															var="day">
															<option value="${day}">${day}Day(s)</option>
														</c:forEach>
													</select>
													<button type="submit" class="btn">Cancel Per Day</button>
												</form>
											</c:if>
											<form action="/cancelCarFull/${payment.car.carId}"
												method="post">
												<input type="hidden" name="paymentId" value="${payment.id}" />
												<button type="submit" class="btn"
													onclick="return confirm('Are you sure you want to cancel the entire booking?')">
													Cancel Car</button>
											</form>
										</c:otherwise>
									</c:choose></td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</section>
	<script>
	function closeMessage() {
		document.getElementById('message').style.display = 'none';
	}
	
	document.addEventListener('DOMContentLoaded', () => {
	    const toggler = document.querySelector('.toggle-btn');
	    const sideMenu = document.querySelector('.side-menu');
	    const booking = document.querySelector('.booking-history');

	    toggler.addEventListener('click', () => {
	      sideMenu.classList.toggle('active');
	      booking.classList.toggle('shifted');
	      toggler.classList.toggle('moved');
	    });
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
	
	function cancelSeat() {
		if (confirm("Are you sure you want to cancel this Seat?")) {
			return true; 
		} else {
			return false; 
		}
	}
    </script>
</body>
</html>