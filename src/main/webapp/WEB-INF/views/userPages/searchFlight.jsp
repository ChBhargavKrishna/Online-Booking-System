<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Flights</title>
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
	background: linear-gradient(to right, #1d8348, #154360);
}

body.no-flights {
	background: #f1f1f1 !important;
}

/** Scroll **/
.scroll-container {
	width: 100%;
	padding: 5px;
	position: fixed;
	background: linear-gradient(15deg, #ba4a00, #2e4053);
	top: 0;
	left: 0;
}

.scroll-container h1 {
	color: #00ff00;
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
	background: #000;
	color: #f1f1f1;
	padding: 10px;
	gap: 10px;
	border: 2px solid #fff;
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

/**Search flight **/
.searchFlight {
	width: 80%;
	margin: 120px auto 0;
	padding: 10px;
}

.flight-container {
	background: transparent;
	padding: 15px;
	margin-bottom: 15px;
	border: 1px solid #f1f1f1;
	border-radius: 10px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	display: flex;
	flex-direction: column;
}

.flight-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	text-align: center;
}

.flight-left {
	text-align: left;
	color: #f7dc6f;
}

.flight-middle {
	text-align: center;
	color: #85C1E9;
}

.flight-right {
	text-align: right;
	color: #dc7633;
}

.flight-details {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.flight-details h2 {
	font-size: 18px;
	color: #ff599a;
}

.flight-details p {
	font-size: 18px;
	font-weight: bold;
	color: #ff599a;
}

.flight-details a {
	background: #000;
	color: #f1f1f1;
	padding: 8px 12px;
	text-decoration: none;
	border: none;
	border-radius: 10px;
	cursor: pointer;
	margin: 5px 0;
}

.flight-details a:hover {
	box-shadow: 0 0 8px lime, 0 0 20px green, 0 0 50px darkgreen;
	color: #0ef;
}

/** No Flight Msg **/
.no-flights-message {
	text-align: center;
	font-size: 20px;
	color: #00ffff;
	gap: 20px;
	background: linear-gradient(45deg, #145a32, #000);
	padding: 20px;
	border-radius: 10px;
	width: fit-content;
	margin: 30px auto;
	box-shadow: 0px 0px 10px rgba(255, 255, 255, 0.2);
}

.no-flights-message a {
	display: inline-block;
	text-decoration: none;
	color: #000;
	background: #ffff00;
	box-shadow: 0px 0px 10px rgba(255, 255, 255, 0.2);
	padding: 10px 10px;
	margin: 10px 10px;
	border-radius: 10px;
}

.no-flights-message a:hover {
	box-shadow: 0 0 5px yellow, 0 0 25px yellow, 0 0 50px yellow, 0 0 100px
		yellow, 0 0 200px yellow;
}

/* Responsive Css */
@media ( max-width : 992px) {
	body {
		font-family: 'Roboto', sans-serif;
		margin: 0;
		padding: 0;
		background: linear-gradient(to right, #1d8348, #154360);
		font-size: clamp(22px, 3vw, 24px); /* This line is new */
	}
}

@media ( max-width : 660px) {
	body {
		font-family: 'Roboto', sans-serif;
		margin: 0;
		padding: 0;
		background: linear-gradient(to right, #1d8348, #154360);
		font-size: clamp(32px, 3vw, 34px); /* This line is new */
	}
}

@media ( max-width : 549px) {
	body {
		font-family: 'Roboto', sans-serif;
		margin: 0;
		padding: 0;
		background: linear-gradient(to right, #1d8348, #154360);
		font-size: clamp(42px, 3vw, 44px); /* This line is new */
	}
}
</style>
</head>
<body class="${empty flights ? 'no-flights' : ''}">
	<div class="scroll-container">
		<h1>Service Flights</h1>
		<div class="scroll-content">
			<div class="scroll-item">
				<img src="/user_service/search-flight/scroll-1.png" alt="Indigo">
				<p>Indigo</p>
			</div>
			<div class="scroll-item">
				<img src="/user_service/search-flight/scroll-2.png" alt="SpiceJet">
				<p>SpiceJet</p>
			</div>
			<div class="scroll-item">
				<img src="/user_service/search-flight/scroll-3.png" alt="Akasa Air">
				<p>Akasa Air</p>
			</div>
			<div class="scroll-item">
				<img src="/user_service/search-flight/scroll-4.png" alt="AirIndia">
				<p>AirIndia</p>
			</div>
			<div class="scroll-item">
				<img src="/user_service/search-flight/scroll-5.jpg"
					alt="AirIndia Express">
				<p>AirIndia Express</p>
			</div>
			<div class="scroll-item">
				<img src="/user_service/search-flight/scroll-6.png" alt="Lufthansa">
				<p>Lufthansa</p>
			</div>
			<div class="scroll-item">
				<img src="/user_service/search-flight/scroll-7.png" alt="Delta">
				<p>Delta</p>
			</div>
			<div class="scroll-item">
				<img src="/user_service/search-flight/scroll-8.jpg" alt="Vistara">
				<p>Vistara</p>
			</div>
		</div>
	</div>
	<div class="searchFlight">
		<c:if test="${not empty flights}">
			<c:forEach var="flight" items="${flights}">
				<div class="flight-container">
					<div class="flight-header">
						<div class="flight-left">
							<h2>${flight.flightName}</h2>
							<p>${flight.id}</p>
						</div>
						<div class="flight-middle">
							<p>${flight.category}</p>
						</div>
						<div class="flight-right">
							<p>${flight.departDate}</p>
							<p>${flight.price}</p>
						</div>
					</div>
					<div class="flight-details">
						<h2>${flight.startLocation}(${flight.departTime})</h2>
						<p>(${flight.arriveTime}) ${flight.destination}</p>
						<c:choose>
							<c:when test="${flight.flightSeatsCount > 0}">
								<a href="/flight/book/${flight.id}">Select Seats</a>
							</c:when>
							<c:otherwise>
								<a href="#" onclick="showNoSeatsMessage(); return false;">Select
									Seats</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>

			</c:forEach>
		</c:if>
		<c:if test="${empty flights}">
			<div class="no-flights-message">
				<h3>${message}</h3>
				<a href="/userDashboard">Back</a>
			</div>
		</c:if>
	</div>
	<script>
		function showNoSeatsMessage() {
			alert("No seats to book in this Flight. Please select another Flight.");
		}
	</script>
</body>
</html>
