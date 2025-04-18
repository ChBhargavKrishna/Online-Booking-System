<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Buses</title>
<link rel="website icon" type="png" href="/background/footer_logo.png" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap">
<style>
* {
	margin: 0;
	padding: 0;
}

body {
	font-family: 'Roboto', sans-serif;
	margin: 0;
	padding: 0;
	background: linear-gradient(to right, #5f0147, #000);
}

body.no-buses {
	background: #f1f1f1 !important;
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

/**Search Bus **/
.searchBus {
	width: 80%;
	margin: 120px auto 0;
	padding: 10px;
}

.bus-container {
	background: transparent;
	padding: 15px;
	margin-bottom: 15px;
	border: 1px solid #f1f1f1;
	border-radius: 10px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	display: flex;
	flex-direction: column;
}

.bus-header {
	display: flex;
	justify-content: space-between;
	align-items: center;
	text-align: center;
}

.bus-left {
	text-align: left;
	color: #00ff00;
}

.bus-middle {
	text-align: center;
	color: #0ef;
}

.bus-right {
	text-align: right;
	color: #f7a500;
}

.bus-details {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.bus-details h2 {
	font-size: 18px;
	color: #f7f000;
}

.bus-details p {
	font-size: 18px;
	color: #f7f000;
	font-weight: bold;
	padding-left: 5rem;
}

.bus-details a {
	background: #0ef;
	color: #000;
	padding: 8px 12px;
	text-decoration: none;
	border: none;
	border-radius: 5px;
	cursor: pointer;
	margin: 5px 0;
}

.bus-details a:hover {
	box-shadow: 0 0 5px cyan, 0 0 25px cyan, 0 0 50px cyan, 0 0 100px cyan,
		0 0 200px cyan;
}

/** No Bus Msg **/
.no-buses-message {
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

.no-buses-message a {
	display: inline-block;
	text-decoration: none;
	color: #000;
	background: orange;
	box-shadow: 0px 0px 10px rgba(255, 255, 255, 0.2);
	padding: 10px 10px;
	margin: 10px 10px;
	border-radius: 10px;
}

.no-buses-message a:hover {
	box-shadow: 0 0 5px orange, 0 0 25px orange, 0 0 50px orange, 0 0 100px
		orange, 0 0 200px orange;
}

/* Responsive Css */
@media ( max-width : 992px) {
	body {
		font-family: 'Roboto', sans-serif;
		margin: 0;
		padding: 0;
		background: linear-gradient(to right, #5f0147, #000);
		font-size: clamp(22px, 3vw, 24px); /* This line is new */
	}
}

@media ( max-width : 660px) {
	body {
		font-family: 'Roboto', sans-serif;
		margin: 0;
		padding: 0;
		background: linear-gradient(to right, #5f0147, #000);
		font-size: clamp(32px, 3vw, 34px); /* This line is new */
	}
}

@media ( max-width : 549px) {
	body {
		font-family: 'Roboto', sans-serif;
		margin: 0;
		padding: 0;
		background: linear-gradient(to right, #5f0147, #000);
		font-size: clamp(42px, 3vw, 44px); /* This line is new */
	}
}
</style>
</head>
<body class="${empty buses ? 'no-buses' : ''}">
	<div class="scroll-container">
		<h1>Service Buses</h1>
		<div class="scroll-content">
			<div class="scroll-item">
				<img src="/user_service/search-bus/scroll-1.png" alt="N.R.B Tourism">
				<p>N.R.B Toursim</p>
			</div>
			<div class="scroll-item">
				<img src="/user_service/search-bus/scroll-2.png"
					alt="KK bro's Travels">
				<p>KK bro's Travels</p>
			</div>
			<div class="scroll-item">
				<img src="/user_service/search-bus/scroll-3.png" alt="C.B.K Travels">
				<p>C.B.K Travels</p>
			</div>
			<div class="scroll-item">
				<img src="/user_service/search-bus/scroll-4.jpg"
					alt="India Tours Travels">
				<p>India Tours & Travels</p>
			</div>
			<div class="scroll-item">
				<img src="/user_service/search-bus/scroll-5.png" alt="Zingbus Plus">
				<p>Zingbus Plus</p>
			</div>
			<div class="scroll-item">
				<img src="/user_service/search-bus/scroll-6.png" alt="V2K Travels">
				<p>V2K Travels</p>
			</div>
			<div class="scroll-item">
				<img src="/user_service/search-bus/scroll-7.jpg"
					alt="Orange Travels">
				<p>Orange Travels</p>
			</div>
			<div class="scroll-item">
				<img src="/user_service/search-bus/scroll-8.png" alt="Jagan Travels">
				<p>Jagan Travels</p>
			</div>
		</div>
	</div>
	<div class="searchBus">
		<c:if test="${not empty buses}">
			<c:forEach var="bus" items="${buses}">
				<div class="bus-container">
					<div class="bus-header">
						<div class="bus-left">
							<h2>${bus.busName}</h2>
							<p>${bus.bus_id}</p>
						</div>
						<div class="bus-middle">
							<p>${bus.category}</p>
						</div>
						<div class="bus-right">
							<p>${bus.travelDate}</p>
							<p>${bus.travelTime}</p>
							<p>${bus.price}</p>
						</div>
					</div>
					<div class="bus-details">
						<h2>${bus.departurePlace}</h2>
						<p>${bus.arrivalPlace}</p>

						<c:choose>
							<c:when test="${bus.availableSeatsCount > 0}">
								<a href="/book/${bus.bus_id}">Select Seats</a>
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
		<c:if test="${empty buses}">
			<div class="no-buses-message">
				<h3>${message}</h3>
				<a href="/userDashboard">Back</a>
			</div>
		</c:if>
	</div>
	<script>
		function showNoSeatsMessage() {
			alert("No seats to book in this bus. Please select another bus.");
		}
	</script>

</body>
</html>
