<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.example.entity.Flight"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Book Flight Seat</title>
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
/**Book Section **/
.book-section {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 80vh;
	background: url('/admin_service/editBus.png') no-repeat;
	background-position: center;
	background-size: cover;
	padding: 20px;
}

.book-container {
	position: relative;
	margin: 15px auto;
	width: 700px;
	background: linear-gradient(45deg, #67024b, #020e67);
	padding: 20px;
	border: 2px solid #06de02;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
}

.book-section .title {
	color: #0ef;
	position: relative;
	padding-bottom: 14px;
	margin-bottom: 25px;
	font-weight: 700;
	font-size: 32px;
	text-transform: capitalize;
	text-align: center;
}

.book-section .title span {
	color: #ff00ff;
}

.book-section .title:before {
	content: '';
	position: absolute;
	bottom: 0;
	left: 50%;
	width: 350px;
	height: 3px;
	background-color: #ffff00;
	transform: translateX(-50%);
}

.book-section .title:after {
	content: '';
	position: absolute;
	bottom: -1px;
	left: 50%;
	width: 95px;
	height: 6px;
	background-color: #ffff00;
	transform: translateX(-50%);
}

.seat-container {
	display: grid;
	grid-template-columns: repeat(4, 80px);
	gap: 15px;
	justify-content: center;
	margin: 20px auto;
	padding: 15px;
	background: transparent;
	width: fit-content;
}

.seat {
	width: 50px;
	height: 50px;
	font-size: 18px;
	border: 2px solid #000;
	text-align: center;
	line-height: 50px;
	cursor: pointer;
	background-color: #f1f1f1;
	border-radius: 7px;
	font-weight: bold;
	transition: background 0.3s, transform 0.2s;
}

.seat:hover {
	background-color: #dcdcdc;
	transform: scale(1.1);
}

.selected {
	background-color: green !important;
	color: white;
}

.seat-info {
	margin: 15px auto;
	font-size: 20px;
	color: #ff7800;
	text-align: center;
	font-weight: bold;
}

.seat-info span {
	margin: 15px auto;
	font-size: 20px;
	color: #ffff00;
	text-align: center;
	font-weight: bold;
}

button {
	position: relative;
	width: 100%;
	height: 45px;
	background: transparent;
	border-radius: 40px;
	cursor: pointer;
	font-size: 18px;
	font-weight: 600;
	border: 2px solid #00ff00;
	color: #000;
	overflow: hidden;
	z-index: 1;
}

button::before {
	content: "";
	position: absolute;
	height: 300%;
	width: 100%;
	background: linear-gradient(#25252b, #00ff00, #25252b, #00ff00);
	top: -100%;
	left: 0;
	z-index: -1;
	transition: .5s;
}

button:hover:before {
	top: 0;
}

/* Responsive Css */
@media ( max-width : 992px) {
	form {
		font-size: 6rem;
	}
}

@media ( max-width : 660px) {
	form {
		font-size: 10rem;
	}
}

@media ( max-width : 549px) {
	form {
		font-size: 16rem;
	}
}

@media ( max-width : 449px) {
	form {
		font-size: 20rem;
	}
}
</style>
</head>
<body>
	<section class="book-section">
		<div class="book-container">
			 <% Flight selectedFlight = (Flight) session.getAttribute("selectedFlight"); %>
	         <h1 class="title">Booking for: <%= selectedFlight.getFlightName() %> <span>(ID: <%= selectedFlight.getId() %>)</span></h1>
			<form action="/flight/payment" method="get"
				onsubmit="validateForm(event)">
				<input type="hidden" name="seats" id="selectedSeats"> <input
					type="hidden" name="id" value="<%=selectedFlight.getId()%>">

				<div class="seat-container">
					<c:forEach var="seat" items="${flight.getAvailableFlgSeats()}">
						<c:set var="isBooked" value="false" />
						<c:set var="bookedUser" value="" />

						<c:forEach var="bookedSeat" items="${bookedSeats}">
							<c:if test="${bookedSeat.seatNumber eq seat}">
								<c:set var="isBooked" value="true" />
								<c:set var="bookedUser" value="${bookedSeat.register.fullName}" />
							</c:if>
						</c:forEach>

						<c:choose>
							<c:when test="${isBooked}">
								<div class="seat booked" title="Booked by ${bookedUser}">${seat}</div>
							</c:when>
							<c:otherwise>
								<div class="seat" id="${seat}" onclick="toggleSeat('${seat}')">${seat}</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>

				<p class="seat-info">
					 You have selected <span id="seatCount">0</span> seat(s):
                     <span id="seatList">None</span>
				</p>

				<button type="submit">Proceed Booking</button>
			</form>
		</div>
	</section>

	<!-- Footer section Start-->
	<jsp:include page="\fragment\footer.jsp" />

	<script>
		let selectedSeats = [];

		function updateSeatList() {
		    let seatCount = selectedSeats.length;
		    document.getElementById('seatCount').innerText = seatCount;
		    document.getElementById('seatList').innerText = seatCount > 0 ? selectedSeats.join(', ') : 'None';
		}


		function toggleSeat(seat) {
			let index = selectedSeats.indexOf(seat);
			if (index === -1) {
				selectedSeats.push(seat);
				document.getElementById(seat).classList.add('selected');
			} else {
				selectedSeats.splice(index, 1);
				document.getElementById(seat).classList.remove('selected');
			}
			document.getElementById('selectedSeats').value = selectedSeats
					.join(',');
			updateSeatList();
		}

		function validateForm(event) {
			if (selectedSeats.length === 0) {
				alert('Please select at least one seat before booking.');
				event.preventDefault();
			}
		}
	</script>
</body>
</html>
