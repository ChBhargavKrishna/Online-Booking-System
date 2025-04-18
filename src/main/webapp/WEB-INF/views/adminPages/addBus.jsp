<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Bus Details</title>
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
/**Form Section **/
.form-section {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 80vh;
	background: url('/admin_service/addBus.png') no-repeat;
	background-position: center;
	background-size: cover;
	padding: 20px;
}

.form-container {
	width: 100%;
	max-width: 700px;
	background: #051129;
	padding: 2rem;
	border-radius: 8px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
}

.form-section .title {
	color: #ff830e;
	position: relative;
	padding-bottom: 14px;
	margin-bottom: 25px;
	font-weight: 700;
	font-size: 32px;
	text-transform: capitalize;
	text-align: center;
}

.form-section .title span {
	color: #f1f1f1;
}

.form-section .title:before {
	content: '';
	position: absolute;
	bottom: 0;
	left: 50%;
	width: 150px;
	height: 3px;
	background-color: #099d4a;
	transform: translateX(-50%);
}

.form-section .title:after {
	content: '';
	position: absolute;
	bottom: -1px;
	left: 50%;
	width: 45px;
	height: 6px;
	background-color: #099d4a;
	transform: translateX(-50%);
}

.form-row {
	display: flex;
	flex-wrap: wrap;
	justify-content: space-between;
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
	color: #fff;
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
	border-color: #33ff7a;
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
	position: relative;
	width: 100%;
	height: 45px;
	background: transparent;
	border-radius: 40px;
	cursor: pointer;
	font-size: 16px;
	font-weight: 600;
	border: 2px solid #d4ff00;
	color: #fff;
	overflow: hidden;
	z-index: 1;
}

.btn::before {
	content: "";
	position: absolute;
	height: 300%;
	width: 100%;
	background: linear-gradient(#25252b, #d4ff00, #25252b, #d4ff00);
	top: -100%;
	left: 0;
	z-index: -1;
	transition: .5s;
}

.btn:hover:before {
	top: 0;
}

@media ( max-width : 768px) {
	.form-container {
		padding: 1.5rem;
	}
	.input-field {
		width: 100%;
	}
}

@media ( max-width : 480px) {
	.form-section {
		padding: 10px;
	}
	h2 {
		font-size: 1.5rem;
	}
}
</style>

</head>
<body>
	<jsp:include page="\fragments\message.jsp" />

	<section class="form-section">
		<div class="form-container">
			<h2 class="title">
				Add <span>Bus</span>
			</h2>
			<form action="/add/bus" method="post">
				<div class="form-row">
					<div class="input-field">
						<label for="busName">Bus Name</label> <input type="text"
							placeholder="Enter Bus Name" id="busName" name="busName" required>
						<i class="fas fa-bus-alt"></i>
					</div>
					<div class="input-field">
						<label for="category">Category</label> <select id="category"
							name="category" required>
							<option>Choose Category</option>
							<option value="AC Sleeper">AC Sleeper</option>
							<option value="AC Seater">AC Seater</option>
							<option value="Non AC Sleeper">Non AC Sleeper</option>
							<option value="Non AC Seater">Non AC Seater</option>
						</select>
					</div>
				</div>
				<div class="form-row">
					<div class="input-field">
						<label for="travelDate">Travel Date</label> <input type="date"
							id="travelDate" name="travelDate" required> <i
							class="fas fa-calendar-alt"></i>
					</div>
					<div class="input-field">
						<label for="travelTime">Travel Time</label> <input type="time"
							id="travelTime" name="travelTime" required> <i
							class="fas fa-clock"></i>
					</div>
				</div>
				<div class="form-row">
					<div class="input-field">
						<label for="departurePlace">Departure Place</label> <input
							type="text" id="departurePlace"
							placeholder="Enter Departure Place" name="departurePlace"
							required> <i class="fas fa-map-marker-alt"></i>
					</div>
					<div class="input-field">
						<label for="arrivalPlace">Arrived Place</label> <input type="text"
							id="arrivalPlace" placeholder="Enter Arrived Place"
							name="arrivalPlace" required> <i
							class="fas fa-location-arrow"></i>
					</div>
				</div>
				<div class="form-row">
					<div class="input-field">
						<label for="price">Price</label> <input type="number" id="price"
							name="price" placeholder="Enter Price" required> <i
							class="fas fa-rupee-sign"></i>
					</div>
				</div>
				<button type="submit" class="btn">Add Bus</button>
			</form>
		</div>
	</section>

	<!-- Footer section Start-->
	<jsp:include page="\fragments\footer.jsp" />
</body>
</html>
