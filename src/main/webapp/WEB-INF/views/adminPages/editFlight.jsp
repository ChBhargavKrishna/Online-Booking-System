<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Flight</title>
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
/* Form section style */
.form-section {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 80vh;
	background: url('/admin_service/editFlight.png') no-repeat;
	background-position: center;
	background-size: cover;
	padding: 20px;
}

.form-container {
	width: 100%;
	max-width: 700px;
	background: #000;
	padding: 2rem;
	border-radius: 8px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
}

.form-section h2 {
	color: #ff8b00;
	position: relative;
	padding-bottom: 14px;
	margin-bottom: 25px;
	font-weight: 700;
	font-size: 32px;
	text-transform: uppercase;
	text-align: center;
}

.form-section h2:before {
	content: '';
	position: absolute;
	bottom: 0;
	left: 50%;
	width: 150px;
	height: 3px;
	background-color: #0cff00;
	transform: translateX(-50%);
}

.form-section h2:after {
	content: '';
	position: absolute;
	bottom: -1px;
	left: 50%;
	width: 45px;
	height: 6px;
	background-color: #0cff00;
	transform: translateX(-50%);
}

.row {
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
	padding: 1rem;
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

.input-field input:hover, .input-field input:focus, .input-field select:hover
	{
	border-color: #0f7404;
}

.btn {
	position: relative;
	color: #fff;
	background: linear-gradient(to right, #ff2770, #ff8b00);
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

.btn:hover {
	background: #000;
	color: #ff2770;
	border: 0.2rem solid #ff2770;
	box-shadow: 0 0 5px orange, 0 0 25px orange, 0 0 50px orange, 0 0 100px
		orange, 0 0 200px orange;
}

/* Responsive design */
@media ( max-width : 768px) {
	.form-section {
		padding: 1rem;
	}
	.form-container {
		width: 100%;
		padding: 2rem;
	}
	h2 {
		font-size: 1.6rem;
	}
	form input, form select, form button {
		font-size: 1rem;
	}
	footer {
		padding-top: 3rem;
	}
}
</style>
</head>
<body>
	<jsp:include page="\fragments\message.jsp" />

	<section class="form-section">
		<div class="form-container">
			<h2>Update Flight</h2>
			<form action="/flights/edit" method="post">
				<div class="row">
					<div class="input-field">
						<label for="flightId">Flight Id</label> <input type="number"
							name="id" value="${flight.id}" readonly />
					</div>
					<div class="input-field">
						<label for="flightName">Flight Name</label> <input type="text"
							id="flightName" name="flightName" value="${flight.flightName}"
							required>
					</div>
					<div class="input-field">
						<label for="category">Category</label> <select id="category"
							name="category">
							<option>Choose Category</option>
							<option ${flight.category == 'VIP' ? 'selected' : ''} value="VIP">VIP</option>
							<option ${flight.category == 'Business' ? 'selected' : ''}
								value="Business">Business</option>
							<option ${flight.category == 'Economy' ? 'selected' : ''}
								value="Economy">Economy</option>
						</select>
					</div>
					<div class="input-field">
						<label for="departDate">Departure Date</label> <input type="date"
							id="departDate" name="departDate" value="${flight.departDate}"
							required>
					</div>
					<div class="input-field">
						<label for="departTime">Departure Time</label> <input type="time"
							id="departTime" name="departTime" value="${flight.departTime}"
							required>
					</div>
					<div class="input-field">
						<label for="startLocation">Start Location</label> <input
							type="text" id="startLocation" name="startLocation"
							value="${flight.startLocation}" required>
					</div>
					<div class="input-field">
						<label for="destination">Destination:</label> <input type="text"
							id="destination" name="destination" value="${flight.destination}"
							required>
					</div>
					<div class="input-field">
						<label for="price">Price:</label> <input type="number" id="price"
							name="price" value="${flight.price}" required>
					</div>
				</div>
				<button type="submit" class="btn">Update Flight</button>
			</form>
		</div>
	</section>

	<!-- Footer section Start-->
	<jsp:include page="\fragments\footer.jsp" />
</body>
</html>
