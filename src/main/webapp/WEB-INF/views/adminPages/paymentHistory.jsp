<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Latest Payments</title>
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
/**Payment Section **/
.payment-section {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 80vh;
	background: url('/admin_service/addBus.jpg') no-repeat;
	background-position: center;
	background-size: cover;
	padding: 20px;
}

.payment-container {
	width: 100%;
	max-width: 1000px;
	background: #051129;
	padding: 2rem;
	border-radius: 8px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
}

.payment-section .title {
	color: #ff830e;
	position: relative;
	padding-bottom: 14px;
	margin-bottom: 25px;
	font-weight: 700;
	font-size: 32px;
	text-transform: capitalize;
	text-align: center;
}

.payment-section .title span {
	color: #f1f1f1;
}

.payment-section .title:before {
	content: '';
	position: absolute;
	bottom: 0;
	left: 50%;
	width: 200px;
	height: 3px;
	background-color: #099d4a;
	transform: translateX(-50%);
}

.payment-section .title:after {
	content: '';
	position: absolute;
	bottom: -1px;
	left: 50%;
	width: 65px;
	height: 6px;
	background-color: #099d4a;
	transform: translateX(-50%);
}

.latest_payments {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
	background-color: #04364A;
	border-radius: 10px;
	overflow: hidden;
	color: #f1f1f1;
	font-size: 15px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
	font-family: 'Barlow Condensed', sans-serif;
}

.latest_payments thead {
	background-color: #176B87;
	color: #ffff00;
	font-weight: bold;
	text-align: center;
}

.latest_payments th, .latest_payments td {
	padding: 14px 18px;
	text-align: center;
	border-bottom: 1px solid #0C2D48;
}

.latest_payments tbody tr:nth-child(even) {
	background-color: #0C2D48;
}

.latest_payments tbody tr:nth-child(odd) {
	background-color: #145374;
}

/**Resopnsive CSS**/
@media ( max-width : 992px) {
	.latest_payments th, .latest_payments td {
        font-size: 24px;
        padding: 10px 8px;
    }

    .title {
        font-size: 4rem;
    }

    .payment-container {
        padding: 2rem;
    }
}

@media ( max-width : 768px) {
	.latest_payments th, .latest_payments td {
        font-size: 14px;
        padding: 8px 6px;
    }

    .title {
        font-size: 2rem;
    }

    .payment-container {
        padding: 1rem;
    }
}

@media ( max-width : 549px) {
	.latest_payments th, .latest_payments td {
        font-size: 10px;
        padding: 6px 4px;
    }

    .title {
        font-size: 1rem;
    }

    .payment-container {
        padding: 0.5rem;
    }
}
</style>
</head>
<body>
	<jsp:include page="\fragments\message.jsp" />

	<section class="payment-section">
		<div class="payment-container">
			<h1 class="title">
				Total Rides <span>By User</span>
			</h1>
			<table class="latest_payments">
				<thead>
					<tr>
						<th>User Full Name</th>
						<th>No. of Buses</th>
						<th>Total Bus Seats</th>
						<th>No. of Flights</th>
						<th>Total Flight Seats</th>
						<th>No. of Cars Booked</th>
						<th>Total Ride Booked</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="pay" items="${userPayments}">
						<tr>
							<td>${pay.user.fullName}</td>
							<td>${pay.busCount}</td>
							<td>${pay.busSeats}</td>
							<td>${pay.flightCount}</td>
							<td>${pay.flightSeats}</td>
							<td>${pay.carCount}</td>
							<td>${pay.totalCount }</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</section>

	<!-- Footer section Start-->
	<jsp:include page="\fragments\footer.jsp" />
</body>
</html>
