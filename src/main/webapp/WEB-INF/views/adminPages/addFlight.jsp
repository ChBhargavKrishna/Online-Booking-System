<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Flight</title>
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
/* Form CSS */
.form-section {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 80vh;
	background: url('/admin_service/addFlight.png') no-repeat;
	background-position: center;
	background-size: cover;
	padding: 20px;
}

.form-container {
	width: 100%;
	max-width: 1000px;
	background: #784212;
	padding: 2rem;
	border-radius: 8px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
}

.form-section .title {
	color: #e402ff;
	position: relative;
	padding-bottom: 14px;
	margin-bottom: 25px;
	font-weight: 700;
	font-size: 32px;
	text-transform: capitalize;
	text-align: center;
}

.form-section .title span {
	color: #06ff02;
}

.form-section .title:before {
	content: '';
	position: absolute;
	bottom: 0;
	left: 50%;
	width: 150px;
	height: 3px;
	background-color: #00d1e6;
	transform: translateX(-50%);
}

.form-section .title:after {
	content: '';
	position: absolute;
	bottom: -1px;
	left: 50%;
	width: 45px;
	height: 6px;
	background-color: #00d1e6;
	transform: translateX(-50%);
}

.form-row {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
}

.middle-row {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}

.input-field {
	width: 48%;
	margin-bottom: 1.5rem;
	position: relative;
}

.input-field label {
	display: block;
	font-weight: 600;
	font-size: 2rem;
	margin-bottom: 0.5rem;
	color: #f1f1f1;
}

.input-field input {
	width: 100%;
	padding: 1rem 1rem 1rem 3rem;
	background: transparent;
	border: 2px solid rgba(255, 255, 255, .2);
	border-radius: 6px;
	outline: none;
	font-size: 16px;
	font-weight: 500;
	color: #fff;
	transition: all 0.3s;
	transition: border-color 0.3s ease;
}

.input-field select {
	width: 100%;
	padding: 1rem;
	background: transparent;
	border: 2px solid rgba(255, 255, 255, .2);
	border-radius: 6px;
	outline: none;
	font-size: 16px;
	font-weight: 500;
	color: #fff;
	transition: all 0.3s;
}

.input-field select option, .input-field select option:first-child {
	color: #000;
	background-color: #fff;
}

.form-row .input-field i {
	position: absolute;
	left: 13px;
	top: 50%;
	transform: translateX(-50%);
	font-size: 20px;
	color: #fff;
	padding: 7px 0 20px 5px;
	z-index: 2;
}

.input-field input:hover, .input-field select:hover {
	border-color: #0ef;
}

.input-field input:hover::placeholder {
	color: #fff;
}

.input-field input::placeholder {
	color: #fff;
}

.input-field input:focus::placeholder {
	color: #fff;
}

.btn {
	width: 100%;
	height: 45px;
	background: #0ef;
	border: none;
	outline: none;
	border-radius: 40px;
	cursor: pointer;
	font-size: 16px;
	font-weight: 600;
	color: #1f293a;
}

.btn:hover {
	box-shadow: 0 0 5px green, 0 0 25px green, 0 0 50px green, 0 0 100px
		green, 0 0 200px green;
}
</style>
</head>
<body>
	<jsp:include page="\fragments\message.jsp" />

	<section class="form-section">
		<div class="form-container">
			<h2 class="title">
				Add <span>Flight</span>
			</h2>
			<form action="/add/flight" method="post">
				<div class="form-row">
					<div class="input-field">
						<label for="flightName">Flight Name</label> <input type="text"
							id="flightName" name="flightName" placeholder="Enter Flight Name"
							required><i class="fas fa-plane"></i>
					</div>
					<div class="input-field">
						<label for="category">Category</label> <select id="category"
							name="category">
							<option>Choose Category</option>
							<option value="VIP">VIP</option>
							<option value="Business">Business</option>
							<option value="Economy">Economy</option>
						</select>
					</div>
				</div>
				<div class="form-row">
					<div class="input-field">
						<label for="departDate">Departure Date</label> <input type="date"
							id="departDate" name="departDate" required> <i
							class="fas fa-calendar-alt"></i>
					</div>
					<div class="input-field">
						<label for="departTime">Departure Time</label> <input type="time"
							id="departTime" name="departTime" required> <i
							class="fas fa-clock"></i>
					</div>
				</div>
				<div class="form-row">
					<div class="input-field">
						<label for="startLocation">Start Location</label> <input
							type="text" id="startLocation" placeholder="Enter Start Location"
							name="startLocation" required> <i
							class="fas fa-map-marker-alt"></i>
					</div>
					<div class="input-field">
						<label for="destination">Destination</label> <input type="text"
							id="destination" name="destination"
							placeholder="Enter Destination" required> <i
							class="fas fa-location-arrow"></i>
					</div>
				</div>
				<div class="form-row middle-row">
					<div class="input-field">
						<label for="price">Price</label> <input type="number" id="price"
							name="price" placeholder="Enter Price" required> <i
							class="fas fa-money-bill"></i>
					</div>
				</div>
				<button type="submit" class="btn">Add Flight</button>
			</form>
		</div>
	</section>

	<!-- Footer section Start-->
	<jsp:include page="\fragments\footer.jsp" />
</body>
</html>
