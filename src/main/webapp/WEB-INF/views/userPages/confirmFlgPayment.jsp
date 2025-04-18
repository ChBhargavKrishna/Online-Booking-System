<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Payment Confirmation</title>
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
.pay-section {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 80vh;
	background: url('/admin_service/editFlight.png') no-repeat;
	background-position: center;
	background-size: cover;
	padding: 20px;
}

.pay-container {
	position: relative;
	margin: 15px auto;
	width: 600px;
	background: #000;
	padding: 20px;
	border: 2px solid #000;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
}

.pay-section .title {
	color: #f00ff0;
	position: relative;
	padding-bottom: 14px;
	margin-bottom: 25px;
	font-weight: 700;
	font-size: 32px;
	text-transform: capitalize;
	text-align: center;
}

.pay-section .title span {
	color: #fe4404;
}

.pay-section .title:before {
	content: '';
	position: absolute;
	bottom: 0;
	left: 50%;
	width: 320px;
	height: 3px;
	background-color: #00ff00;
	transform: translateX(-50%);
}

.pay-section .title:after {
	content: '';
	position: absolute;
	bottom: -1px;
	left: 50%;
	width: 75px;
	height: 6px;
	background-color: #00ff00;
	transform: translateX(-50%);
}

.data {
	display: grid;
	grid-template-columns: repeat(2, 1fr);
	gap: 20px 30px;
	align-items: center;
}

.details-item {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 10px;
	border-bottom: 2px solid #f1f1f1;
}

.pay-container form {
	display: flex;
	justify-content: center;
	margin-top: 20px;
}

.details-item h3 {
	font-size: 20px;
	font-weight: 600;
	color: #ae04fe;
}

.details-item span {
	font-size: 16px;
	font-weight: 500;
	color: #fe0450;
}

button {
	position: relative;
	color: #0ef;
	background: linear-gradient(to right, #021b40, #5d00a1);
	z-index: 1;
	overflow: hidden;
	border-radius: 3.5rem;
	text-transform: uppercase;
	padding: 1rem 3.5rem;
	font-weight: 600;
	font-size: 1.8rem;
	margin-top: 1.5rem;
	letter-spacing: 0.2rem;
}

button:hover {
	background: #000;
	color: #ffff00;
	border: 0.2rem solid #ffff00;
	box-shadow: 0 0 5px #ffff00, 0 0 25px #ffff00, 0 0 50px #ffff00, 0 0
		100px #ffff00, 0 0 200px #ffff00;
}

/** Popup **/
.popup {
	width: 400px;
	padding: 0 30px 30px;
	color: #000;
	background: linear-gradient(45deg, #ff00ff, #f1f1f1);
	border-radius: 6px;
	position: absolute;
	top: 0;
	left: 50%;
	transform: translate(-50%, -50%) scale(0.1);
	text-align: center;
	visibility: hidden;
	transition: transform 0.4s, top 0.4s;
}

.open-popup {
	visibility: visible;
	top: 50%;
	transform: translate(-50%, -50%) scale(1);
}

.popup img {
	width: 100px;
	margin-top: -50px;
	border-radius: 50%;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
}

.popup h2 {
	font-size: 38px;
	font-weight: 500;
	margin: 30px 0 10px;
}

.popup p {
	font-size: 18px;
}

.popup button {
	width: 100%;
	margin-top: 50px;
	padding: 10px;
	background: #6fd649;
	color: #fff;
	border: 0;
	outline: none;
	font-size: 18px;
	border-radius: 8px;
	cursor: pointer;
	box-shadow: 0 5px 5px rgba(0, 0, 0, 0.2);
}
</style>
</head>
<body>
	<section class="pay-section">
		<div class="pay-container">
			<h2 class="title">
				Booking <span>Flight Confirmation</span>
			</h2>
			<div class="data">
				<div class="details-item">
					<h3>Flight Name</h3>
					<span>${flightName}</span>
				</div>
				<div class="details-item">
					<h3>Flight Id</h3>
					<span>${id}</span>
				</div>
				<div class="details-item">
					<h3>Category</h3>
					<span>${category}</span>
				</div>
				<div class="details-item">
					<h3>Departure Date</h3>
					<span>${departDate}</span>
				</div>
				<div class="details-item">
					<h3>Selected Seats</h3>
					<span>${param.seats}</span>
				</div>
				<div class="details-item">
					<h3>Number of Seats</h3>
					<span>${fn:length(fn:split(param.seats, ','))}</span>
				</div>
				<div class="details-item">
					<h3>Seat Price</h3>
					<span>${price}</span>
				</div>
				<div class="details-item">
					<c:set var="seatCount"
						value="${fn:length(fn:split(param.seats, ','))}" />
					<c:set var="totalCost" value="${price * seatCount}" />
					<h3>Total Cost</h3>
					<span>${totalCost}</span>
				</div>
			</div>
			<form id="flgPayment" action="/flight/book/${id}" method="post">
				<c:forEach var="seat" items="${selectedSeats}">
					<input type="hidden" name="seats" value="${seat}" />
				</c:forEach>
				<button type="button" onclick="openPopup()">Proceed to Pay</button>
				<div class="popup" id="popup">
					<img src="/background/thankYou.png">
					<h2>Thank You</h2>
					<p>Your Booking Payment of ${flightName} has been Successfully
						Completed. Thanks!</p>
					<button type="button" onclick="submitForm()">Ok</button>
				</div>
			</form>
		</div>
	</section>

	<!-- Footer section Start-->
	<jsp:include page="\fragment\footer.jsp" />
	
	<script>
		let popup = document.getElementById("popup");
		let form = document.getElementById("flgPayment");

		function openPopup() {
			popup.classList.add("open-popup");
		}

		function submitForm() {
			popup.classList.remove("open-popup");
			form.submit();
		}

		function closePopup() {
			popup.classList.remove("open-popup");
		}
	</script>
</body>
</html>

