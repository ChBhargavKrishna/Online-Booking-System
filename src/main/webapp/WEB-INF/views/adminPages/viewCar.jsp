<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Car List</title>
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
.table-section {
	display: flex;
	min-height: 80vh;
	background: #f1f1f1;
	padding: 10px;
}

.table-container {
	width: 100%;
	height: 100%;
	background: #558c96;
	padding: 2rem;
	margin-top: 2rem;
	border-radius: 40px;
}

h2 {
	color: #fff700;
	position: relative;
	padding-bottom: 14px;
	margin-bottom: 25px;
	font-weight: 700;
	font-size: 3.5rem;
	text-transform: uppercase;
	text-align: center;
}

.table-context {
	width: 100%;
	border-collapse: collapse;
	margin: 25px 0;
	font-size: 1.2rem;
	border-radius: 40px;
}

.table-context thead {
	background-color: #05f5ea;
	color: #000;
}

.table-context th, .table-context td {
	padding: 12px 10px;
	text-align: center;
	border: 1px solid #b1b9b8;
	margin-bottom: 10px;
	font-size: 20px;
}

.table-context tbody tr:nth-child(odd) {
	color: #f1f1f1;
}

.table-context tbody tr:nth-child(even) {
	color: #430264;
}

.table-context i.delete {
	background-color: #fa4444;
	color: #000;
	border-radius: 3.5rem;
	padding: 10px 12px;
	cursor: pointer;
	text-align: center;
	font-size: 1.8rem;
}

.table-context i.delete:hover {
	background: #000;
	color: #ff0000;
	border: 0.1rem solid #ff0000;
	box-shadow: 0 0 5px cyan, 0 0 25px cyan, 0 0 50px cyan, 0 0 100px cyan,
		0 0 200px cyan;
}

.table-context i.update {
	background: #4CAF50;
	color: #000;
	border-radius: 3.5rem;
	padding: 10px 12px;
	cursor: pointer;
	text-align: center;
	font-size: 1.8rem;
}

.table-context i.update:hover {
	background: #000;
	color: #42ff00;
	border: 0.2rem solid #42ff00;
	box-shadow: 0 0 5px cyan, 0 0 25px cyan, 0 0 50px cyan, 0 0 100px cyan,
		0 0 200px cyan;
}

/**Resopnsive CSS**/
@media ( max-width : 992px) {
	.table-context th, .table-context td {
        font-size: 24px;
        padding: 10px 8px;
    }

    h2 {
        font-size: 4rem;
    }

    .table-container {
        padding: 2rem;
    }
}

@media ( max-width : 768px) {
	.table-context th, .table-context td {
        font-size: 14px;
        padding: 8px 6px;
    }

    h2 {
        font-size: 2rem;
    }

    .table-container {
        padding: 1rem;
    }
}

@media ( max-width : 549px) {
	.table-context th, .table-context td {
        font-size: 10px;
        padding: 6px 4px;
    }

    h2 {
        font-size: 1rem;
    }

    .table-container {
        padding: 0.5rem;
    }
}
</style>
</head>
<body>
	<jsp:include page="\fragments\message.jsp" />

	<section class="table-section">
		<div class="table-container">
			<h2>Car List</h2>
			<table class="table-context">
				<thead>
					<tr>
						<th>Car ID</th>
						<th>Car Name</th>
						<th>Car Model</th>
						<th>Seater</th>
						<th>Half Day Price</th>
						<th>Full Day Price</th>
						<th>Status</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="car" items="${cars}">
						<tr>
							<td>${car.carId}</td>
							<td>${car.carName}</td>
							<td>${car.carModel}</td>
							<td>${car.seater}Seater</td>
							<td>${car.halfDayPrice}</td>
							<td>${car.fullDayPrice}</td>
							<td>${car.status}</td>
							<td><a href="/car/update/${car.carId}"><i
									class="fas fa-edit me-3 update"></i></a> <a
								href="/car/delete/${car.carId}"
								onclick="return confirmDelete(${car.carId})"><i
									class="fas fa-trash-alt delete"></i></a>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</section>

	<!-- Footer section Start-->
	<jsp:include page="\fragments\footer.jsp" />

	<script>
		 window.onload = function() {
	         var message = "${message}"; // Message from server-side
	         if (message) {
	             showSuccessMessage(message); // Call function from included fragment
	         }
	     }
		 
		 function confirmDelete(carId) {
				if (confirm("Are you sure you want to delete this Car?")) {
					
					return true; 
				} else {
					return false; 
				}
			}
	</script>
</body>
</html>
