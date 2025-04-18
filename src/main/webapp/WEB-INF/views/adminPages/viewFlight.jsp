<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Flight List</title>
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
	background-color: #f1f1f1;
	padding: 10px;
}

.table-row {
	width: 100%;
	height: 100%;
	background: linear-gradient(to right, #3b0035, #00143b);
	padding: 2rem;
	margin-top: 2rem;
	border-radius: 20px;
}

.table-section .title {
	color: #0ef;
	position: relative;
	padding-bottom: 14px;
	margin-bottom: 25px;
	font-weight: 700;
	font-size: 3.5rem;
	text-transform: uppercase;
	text-align: center;
}

.table-section .title span {
	color: #ffa600;
}

.table-section .title:before {
	content: '';
	position: absolute;
	bottom: 0;
	left: 50%;
	width: 150px;
	height: 3px;
	background-color: #ff00ec;
	transform: translateX(-50%);
}

.table-section .title:after {
	content: '';
	position: absolute;
	bottom: -1px;
	left: 50%;
	width: 45px;
	height: 6px;
	background-color: #ff00ec;
	transform: translateX(-50%);
}

.table-context {
	width: 100%;
	border-collapse: collapse;
	margin: 25px 0;
	font-size: 1.2rem;
}

.table-context thead {
	background-color: #026656;
	color: #fff;
}

.table-context th, .table-context td {
	padding: 12px 10px;
	text-align: center;
	border: 1px solid #f1f1f1;
	margin-bottom: 10px;
	font-size: 20px;
}

.table-context tbody tr:nth-child(odd) {
	color: #0ef;
}

.table-context tbody tr:nth-child(even) {
	color: #fff;
}

.actions-btn {
	display: flex;
	justify-content: center;
}

.edit-btn, .remove-btn {
	background: #000;
	color: #fff;
	padding: 10px 12px;
	font-size: 1.8rem;
	border-radius: 3.5rem;
	cursor: pointer;
	text-decoration: none;
	text-align: center;
}

.edit-btn:hover {
	background: #1ad104;
	color: #000;
	box-shadow: 0 0 5px orange, 0 0 25px orange, 0 0 50px orange, 0 0 100px
		orange, 0 0 200px orange;
}

.remove-btn:hover {
	background: #fd0000;
	color: #000;
	box-shadow: 0 0 5px red, 0 0 25px red, 0 0 50px red, 0 0 100px red, 0 0
		200px red;
}

/**Resopnsive CSS**/
@media ( max-width : 992px) {
	.table-context th, .table-context td {
        font-size: 24px;
        padding: 10px 8px;
    }

    .title {
        font-size: 4rem;
    }

    .table-row {
        padding: 2rem;
    }
}

@media ( max-width : 768px) {
	.table-context th, .table-context td {
        font-size: 14px;
        padding: 8px 6px;
    }

    .title {
        font-size: 2rem;
    }

    .table-row {
        padding: 1rem;
    }
}

@media ( max-width : 549px) {
	.table-context th, .table-context td {
        font-size: 10px;
        padding: 6px 4px;
    }

    .title {
        font-size: 1rem;
    }

    .table-row {
        padding: 0.5rem;
    }
}
</style>
</head>
<body>
	<jsp:include page="\fragments\message.jsp" />

	<section class="table-section">
		<div class="table-row">
			<h2 class="title">
				Flight <span>List</span>
			</h2>
			<table class="table-context">
				<thead>
					<tr>
						<th>Flight ID</th>
						<th>Flight Name</th>
						<th>Category</th>
						<th>Departure Date</th>
						<th>Departure Time</th>
						<th>Arrive Time</th>
						<th>Start Location</th>
						<th>Destination</th>
						<th>Price</th>
						<th>Flight Seats</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="flg" items="${flights}">
						<tr>
							<td>${flg.id}</td>
							<td>${flg.flightName}</td>
							<td>${flg.category}</td>
							<td>${flg.departDate}</td>
							<td>${flg.departTime}</td>
							<td>${flg.arriveTime}</td>
							<td>${flg.startLocation}</td>
							<td>${flg.destination}</td>
							<td>${flg.price}</td>
							<td><c:choose>
									<c:when test="${empty flg.availableFlgSeats}">No seats available</c:when>
									<c:otherwise>
										<c:forEach var="row" items="${flg.seat}">
											<c:forEach var="seat" items="${row}">
												<span
													class="badge 
                                    <c:choose>
                                        <c:when test="${flg.bookedSeats.contains(seat)}">bg-danger</c:when>
                                        <c:otherwise>bg-success</c:otherwise>
                                    </c:choose>">${seat}
												</span>&nbsp;
                                                 </c:forEach>
										</c:forEach>
									</c:otherwise>
								</c:choose></td>
							<td>
								<div class="actions-btn">
									<a class="edit-btn me-2" href="/flights/edit/${flg.id}">Update
									</a> <a class="remove-btn"
										onclick="return confirmDelete(${flg.id})"
										href="/flights/delete/${flg.id}">Remove</a>
								</div>
							</td>

						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</section>

	<!-- Footer section Start-->
	<jsp:include page="\fragments\footer.jsp" />


	<script>
	function confirmDelete(flgId) {
		if (confirm("Are you sure you want to delete this flight?")) {
			return true;
		} else {
			return false;
		}
	}	
	 window.onload = function() {
         var message = "${message}"; // Message from server-side
         if (message) {
             showSuccessMessage(message); // Call function from included fragment
         }
     }
	</script>
</body>
</html>
