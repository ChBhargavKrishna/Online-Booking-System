<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Edit Car</title>
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
	background-color: #f1f1f1;
	padding: 20px;
}

.form-container {
	width: 100%;
	max-width: 700px;
	background: #784212;
	padding: 2rem;
	border-radius: 8px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
}

.form-section .title {
	color: #f1f1f1;
	position: relative;
	padding-bottom: 14px;
	margin-bottom: 25px;
	font-weight: 700;
	font-size: 32px;
	text-transform: capitalize;
	text-align: center;
}

.form-section .title span {
	color: #00ff1b;
}

.row {
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
}

.input-box {
	width: 48%;
	margin-bottom: 1.5rem;
	position: relative;
}

.input-box label {
	display: block;
	font-weight: 600;
	font-size: 2rem;
	margin-bottom: 0.5rem;
	color: #fff;
}

.input-box input {
	width: 100%;
	padding: 1rem;
	background: transparent;
	border: 2px solid rgba(255, 255, 255, .2);
	border-radius: 6px;
	outline: none;
	font-size: 16px;
	font-weight: 500;
	color: #ff8b00;
	transition: all 0.3s;
	transition: border-color 0.3s ease;
}

.input-box input:hover, .input-box input:focus {
	border-color: #fff;
}

.btn {
	position: relative;
	color: #fff;
	background: linear-gradient(to right, #0f7404, #5cb917);
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
	color: #60cd12;
	border: 0.2rem solid #60cd12;
}
</style>
</head>
<body>
	<jsp:include page="\fragments\message.jsp" />

	<section class="form-section">
		<div class="form-container">
			<h2 class="title">
				Edit <span>Car</span>
			</h2>
			<form action="/car/edit" method="post">
				<div class="row">
					<div class="input-box">
						<label for="carId">Car Id</label> <input type="number"
							name="carId" value="${car.carId}" readonly />
					</div>
					<div class="input-box">
						<label for="carName">Car Name</label> <input type="text"
							id="carName" name="carName" value="${car.carName}" required>
					</div>
					<div class="input-box">
						<label for="carModel">Car Model</label> <input type="text"
							id="carModel" name="carModel" value="${car.carModel}" required>
					</div>
					<div class="input-box">
						<label for="seater">Seater</label> <input type="number"
							id="seater" name="seater" value="${car.seater}" required>
					</div>
					<div class="input-box">
						<label for="halfDayPrice">Half Day Price</label> <input
							type="number" id="halfDayPrice" name="halfDayPrice"
							value="${car.halfDayPrice}" required>
					</div>
					<div class="input-box">
						<label for="fullDayPrice">Full Day Price </label> <input
							type="number" id="fullDayPrice" name="fullDayPrice"
							value="${car.fullDayPrice}" required>
					</div>
					<button type="submit" class="btn">Update Car</button>
				</div>
			</form>
		</div>
	</section>

	<!-- Footer section Start-->
	<jsp:include page="\fragments\footer.jsp" />
</body>
</html>
