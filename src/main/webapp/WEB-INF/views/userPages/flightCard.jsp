<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add/View Card Details</title>
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
/* General Styling */
.card-section {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 80vh;
	background: url('/admin_service/card.jpg') no-repeat;
	background-position: center;
	background-size: cover;
	padding: 20px;
}

.card-container {
	position: relative;
	margin: 15px auto;
	max-width: 450px;
	width: 100%;
	background: #0ef;
	border: 2px solid #000;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
	padding: 30px;
	text-align: center;
}

.card-section .title {
	color: #000;
	position: relative;
	padding-bottom: 14px;
	margin-bottom: 25px;
	font-weight: 700;
	font-size: 32px;
	text-transform: capitalize;
	text-align: center;
}

.card-section .title span {
	color: #ee0766;
}

.card-section .title:before {
	content: '';
	position: absolute;
	bottom: 0;
	left: 50%;
	width: 150px;
	height: 3px;
	background-color: #ee07e7;
	transform: translateX(-50%);
}

.card-section .title:after {
	content: '';
	position: absolute;
	bottom: -1px;
	left: 50%;
	width: 45px;
	height: 6px;
	background-color: #ee07e7;
	transform: translateX(-50%);
}

.debit-card {
	background: linear-gradient(45deg, #5f0147, #000);
	border-radius: 12px;
	color: white;
	padding: 20px;
	text-align: left;
	font-size: 18px;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.3);
	position: relative;
}

.debit-card .chip {
	width: 50px;
	height: 35px;
	background: gold;
	border-radius: 5px;
	position: absolute;
	top: 15px;
	left: 15px;
}

.debit-card .visa-logo {
	position: absolute;
	top: 15px;
	right: 15px;
	font-size: 24px;
	font-weight: bold;
}

.debit-card-details {
	display: flex;
	justify-content: space-between;
	margin-top: 10px;
}

.debit-card-holder, .debit-card-expiry, .debit-card-cvv {
	font-size: 16px;
	margin-top: 10px;
}

.debit-card-number {
	font-size: 22px;
	letter-spacing: 2px;
	margin-top: 40px;
}

h1 {
	display: block;
	font-size: 16px;
	opacity: 0.8;
	color: #ff830e;
	font-weight: bold;
}

.btn {
	width: 100%;
	padding: 12px;
	font-size: 18px;
	font-weight: bold;
	background: #4c3589;
	color: #fff;
	border: none;
	border-radius: 6px;
	cursor: pointer;
	transition: 0.3s;
	margin-top: 15px;
}

.btn:hover {
	background: #00ff00;
	color: #000;
}

.form-style {
	width: 100%;
	padding: 12px;
	font-size: 16px;
	background: #000;
	color: #f1f1f1;
	border-radius: 6px;
	border: 1px solid #ccc;
	outline: none;
	transition: 0.3s;
}

.form-style:hover {
	background: #000;
	border: 0.1rem solid #ff2770;
	box-shadow: 0 0 5px orange, 0 0 25px orange, 0 0 50px orange, 0 0 100px
		orange, 0 0 200px orange;
}

.form-style:hover::placeholder {
	color: #fff;
}

.form-style::placeholder {
	color: #fff;
}

.form-style:focus::placeholder {
	color: #fff;
}

.form-style:focus {
	background: #000;
	border: 0.1rem solid #ff2770;
	box-shadow: 0 0 5px orange, 0 0 25px orange, 0 0 50px orange, 0 0 100px
		orange, 0 0 200px orange;
}

/* Responsive Css */
@media ( max-width : 992px) {
	.card-section {
		font-size: 6rem;
	}
}

@media ( max-width : 660px) {
	.card-section {
		font-size: 10rem;
	}
}

@media ( max-width : 549px) {
	.card-section {
		font-size: 16rem;
	}
}

@media ( max-width : 449px) {
	.card-section {
		font-size: 20rem;
	}
}
</style>
</head>
<body>
	<section class="card-section">
		<div class="card-container">
			<c:choose>
				<c:when test="${not empty existingCard}">
					<!-- Saved Card Details as Debit Card -->
					<h2 class="title">
						Card <span>Details</span>
					</h2>
					<div class="debit-card">
						<div class="chip"></div>
						<div class="visa-logo">VISA</div>
						<div class="debit-card-number">
							${existingCard.card_number.substring(0,4)} **** ****
							${existingCard.card_number.substring(12,16)}</div>
						<div class="debit-card-holder">
							<h1>Card Holder</h1>
							${existingCard.card_holder}
						</div>
						<div class="debit-card-details">
							<div class="debit-card-expiry">
								<h1>Expiry Date</h1>
								${existingCard.expiryDate}
							</div>
							<div class="debit-card-cvv">
								<h1>CVV</h1>
								${existingCard.cvv}
							</div>
						</div>
					</div>
					<form action="/confirmFlight" method="get">
						<input type="hidden" name="seats" value="${param.seats}" />
						<button type="submit" class="btn">Proceed to Payment</button>
					</form>
				</c:when>

				<c:otherwise>
					<!-- Add Card Form -->
					<h2 class="title">
						Add <span>Card</span>
					</h2>
					<form:form modelAttribute="card" action="/flight/payments"
						method="post">
						<input type="hidden" name="seats" value="${param.seats}" />
						<input type="hidden" name="id" value="${param.id}">
						<form:input type="hidden" name="register" id="register"
							path="register" value="${register.fullName}" />

						<div class="mb-3">
							<form:input type="text" name="card_number" class="form-style"
								placeholder="Card Number" inputmode="numeric"
								pattern="\d{13,19}" maxlength="16" path="card_number"
								id="card_number" required="true" />
						</div>

						<div class="mb-3">
							<form:input type="text" name="card_holder" class="form-style"
								placeholder="Card Holder Name" id="card_holder"
								path="card_holder" required="true" />
						</div>

						<div class="row">
							<div class="col-md-6 mb-3">
								<form:input type="text" name="expiryDate" class="form-style"
									placeholder="MM/YY" pattern="(0[1-9]|1[0-2])\/(2[5-9]|3[0-5])"
									path="expiryDate" required="true" />
							</div>


							<div class="col-md-6 mb-3">
								<form:input type="password" name="cvv" class="form-style"
									placeholder="CVV" inputmode="numeric" pattern="\d{3,4}"
									maxlength="3" required="true" path="cvv" />
							</div>
						</div>

						<button type="submit" class="btn">Add Card</button>
					</form:form>
				</c:otherwise>
			</c:choose>
		</div>
	</section>

	<!-- Footer section Start-->
	<jsp:include page="\fragment\footer.jsp" />
</body>
</html>
