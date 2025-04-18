<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Update Bus</title>
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
	background: url('/admin_service/editBus.png') no-repeat;
	background-position: center;
	background-size: cover;
	padding: 20px;
}

.form-container {
	width: 70%;
	max-width: 600px;
	background: #558c96;
	padding: 2rem;
	border-radius: 8px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
}

.form-section h2 {
	color: #fff700;
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
	color: #000;
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
	border-color: #00ff00;
}

.btn {
	position: relative;
	color: #fff;
	background: linear-gradient(to right, #ffe000, #ff0400);
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
	color: #ffe000;
	border: 0.2rem solid #ffe000;
	box-shadow: 0 0 5px orange, 0 0 25px orange, 0 0 50px orange, 0 0 100px
		orange, 0 0 200px orange;
}
</style>
</head>
<body>
	<jsp:include page="\fragments\message.jsp" />

	<section class="form-section">
		<div class="form-container">
			<h2>Update Bus</h2>
			<form action="/bus/update" method="post">
				<div class="row">
					<div class="input-field">
						<label for="busId">Bus Id</label> <input type="number"
							name="bus_id" value="${bus.bus_id}" readonly />
					</div>
					<div class="input-field">
						<label for="busName">Bus Name</label> <input type="text"
							id="busName" name="busName" value="${bus.busName}" required>
					</div>
					<div class="input-field">
						<label for="category">Category</label> <select id="category"
							name="category">
							<option>Choose Category</option>
							<option ${bus.category == 'AC Sleeper' ? 'selected' : ''}
								value="AC Sleeper">AC Sleeper</option>
							<option ${bus.category == 'AC Seater' ? 'selected' : ''}
								value="AC Seater">AC Seater</option>
							<option ${bus.category == 'Non Ac Sleeper' ? 'selected' : ''}
								value="Non Ac Sleeper">Non AC Sleeper</option>
							<option ${bus.category == 'Non Ac Seater' ? 'selected' : ''}
								value="Non Ac Seater">Non AC Seater</option>
						</select>
					</div>
					<div class="input-field">
						<label for="travelDate">Travel Date</label> <input type="date"
							id="travelDate" name="travelDate" value="${bus.travelDate}"
							required>
					</div>
					<div class="input-field">
						<label for="travelTime">Travel Time</label> <input type="time"
							id="travelTime" name="travelTime" value="${bus.travelTime}"
							required>
					</div>
					<div class="input-field">
						<label for="departurePlace">Departure Place</label> <input
							type="text" id="departurePlace" name="departurePlace"
							value="${bus.departurePlace}" required>
					</div>
					<div class="input-field">
						<label for="arrivalPlace">Arrival Place</label> <input type="text"
							id="arrivalPlace" name="arrivalPlace" value="${bus.arrivalPlace}"
							required>
					</div>
					<div class="input-field">
						<label for="price">Price</label> <input type="number" id="price"
							name="price" value="${bus.price}" required>
					</div>
				</div>
				<button type="submit" class="btn">Update Bus</button>
			</form>
		</div>
	</section>

	<!-- Footer section Start-->
	<jsp:include page="\fragments\footer.jsp" />

</body>
</html>
