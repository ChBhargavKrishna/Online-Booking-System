<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Car</title>
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
	padding-top: 20px;
	background-size: cover;
}

.form-container {
	width: 100%;
	max-width: 600px;
	background: #000c63;
	padding: 2rem;
	border-radius: 8px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
}

.form-section .title {
	color: #00f504;
	position: relative;
	padding-bottom: 14px;
	margin-bottom: 25px;
	font-weight: 700;
	font-size: 32px;
	text-transform: capitalize;
	text-align: center;
}

.form-section .title span {
	color: #ff8700;
}

.row, .middle-row {
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
	color: #fff;
	transition: all 0.3s;
	transition: border-color 0.3s ease;
}

.input-box input::placeholder {
	color: #fff;
}

.input-box input:hover, .input-box input:focus, .input-box input:valid {
	border-color: #ff8700;
}

.btn {
	display: inline-block;
	padding: 12px 28px;
	background: #ff8700;
	border-radius: 40px;
	font-size: 16px;
	color: #fff;
	letter-spacing: 1px;
	text-decoration: none;
	font-weight: 600;
	opacity: 1;
	box-shadow: 0 0 5px #ff8700, 0 0 25px #ff8700;
}

.btn:hover {
	box-shadow: 0 0 5px orange, 0 0 25px orange, 0 0 50px orange, 0 0 100px
		orange, 0 0 200px orange;
}

/* Responsive Css */
@media ( max-width : 992px) {
	.form-section {
		font-size: 6rem;
	}
}

@media ( max-width : 660px) {
	.form-section {
		font-size: 10rem;
	}
}

@media ( max-width : 549px) {
	.form-section {
		font-size: 16rem;
	}
}

@media ( max-width : 449px) {
	.form-section {
		font-size: 20rem;
	}
}
</style>
</head>
<body>
	<jsp:include page="\fragments\message.jsp" />

	<section class="form-section">
		<div class="form-container">
			<h2 class="title">
				Add <span>Car</span>
			</h2>
			<form action="/add/car" method="post">
				<div class="row">
					<div class="input-box">
						<label for="carName">Car Name</label> <input type="text"
							id="carName" name="carName" placeholder="Enter Car Name" required>
					</div>
					<div class="input-box">
						<label for="carModel">Car Model</label> <input type="text"
							id="carModel" name="carModel" placeholder="Enter Car Model"
							required>
					</div>
					<div class="input-box">
						<label for="seater">Seater</label> <input type="number"
							id="seater" name="seater" placeholder="Enter Seater" required>
					</div>
					<div class="input-box">
						<label for="halfDayPrice">Half Day Price</label> <input
							type="number" id="halfDayPrice"
							placeholder="Enter Half Day Price" name="halfDayPrice" required>
					</div>
				</div>
				<div class="row middle-row">
					<div class="input-box">
						<label for="fullDayPrice">Full Day Price</label> <input
							type="number" id="fullDayPrice"
							placeholder="Enter Full Day Price" name="fullDayPrice" required>
					</div>
					<button type="submit" class="btn">Add Car</button>
				</div>
			</form>
		</div>
	</section>

	<!-- Footer section Start-->
	<jsp:include page="\fragments\footer.jsp" />
</body>
</html>