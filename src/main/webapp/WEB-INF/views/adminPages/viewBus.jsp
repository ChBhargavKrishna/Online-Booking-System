<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Bus List</title>
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
/**Table Section**/
.table-section {
	display: flex;
	min-height: 80vh;
	background-color: #f1f1f1;
	padding: 20px;
}

.table-container {
	width: 100%;
	height: 100%;
	background: #000;
	padding: 2rem;
	margin-top: 2rem;
	border-radius: 10px;
}

.title {
	color: #00f504;
	position: relative;
	padding-bottom: 14px;
	margin-bottom: 25px;
	font-weight: 700;
	font-size: 3.5rem;
	text-transform: uppercase;
	text-align: center;
}

.content-table {
	width: 100%;
	border-collapse: collapse;
	margin: 25px 0;
	font-size: 1rem;
}

.content-table thead {
	background-color: #6c757d;
	color: #000;
}

.content-table th, .content-table td {
	padding: 12px 10px;
	text-align: center;
	border: 1px solid #fff;
	margin-bottom: 10px;
	font-size: 20px;
}

.content-table tbody tr:nth-child(odd) {
	color: #ffe000;
}

.content-table tbody tr:nth-child(even) {
	color: #ff2770;
}

.content-table i.delete {
	color: #ff0004;
	font-size: 18px;
}

.content-table i.update {
	color: #1fff00;
	font-size: 18px;
}

.content-table i:hover {
	color: #f1f1f1;
	font-size: 18px;
}

/**Resopnsive CSS**/
@media ( max-width : 992px) {
	.content-table th, .content-table td {
        font-size: 24px;
        padding: 10px 8px;
    }

    .title {
        font-size: 4rem;
    }

    .table-container {
        padding: 2rem;
    }
}

@media ( max-width : 768px) {
	.content-table th, .content-table td {
        font-size: 14px;
        padding: 8px 6px;
    }

    .title {
        font-size: 2rem;
    }

    .table-container {
        padding: 1rem;
    }
}

@media ( max-width : 549px) {
	.content-table th, .content-table td {
        font-size: 10px;
        padding: 6px 4px;
    }

    .title {
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
			<h2 class="title">Bus List</h2>
			<table class="content-table">
				<thead>
					<tr>
						<th>Bus ID</th>
						<th>Bus Name</th>
						<th>Bus Category</th>
						<th>Travel Date</th>
						<th>Travel Time</th>
						<th>Departure Place</th>
						<th>Arrival Place</th>
						<th>Bus Price</th>
						<th>Bus Seats</th>
						<th>Actions</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="bus" items="${buses}">
						<tr>
							<td>${bus.bus_id}</td>
							<td>${bus.busName}</td>
							<td>${bus.category}</td>
							<td>${bus.travelDate}</td>
							<td>${bus.travelTime}</td>
							<td>${bus.departurePlace}</td>
							<td>${bus.arrivalPlace}</td>
							<td>${bus.price}</td>
							<td><c:choose>
									<c:when test="${empty bus.availableSeats}">No seats available</c:when>
									<c:otherwise>
										<c:forEach var="row" items="${bus.seatGroups}">
											<c:forEach var="seat" items="${row}">
												<span
													class="badge 
                                    <c:choose>
                                        <c:when test="${bus.booked_Seats.contains(seat)}">bg-danger</c:when>
                                        <c:otherwise>bg-success</c:otherwise>
                                    </c:choose>">${seat}
												</span>&nbsp;
                                                 </c:forEach>
										</c:forEach>
									</c:otherwise>
								</c:choose></td>
							<td><a href="/bus/delete/${bus.bus_id}"
								onclick="return confirmDelete(${bus.bus_id})"><i
									class="fas fa-trash-alt me-3 delete"></i></a> <a
								href="/bus/update/${bus.bus_id}"><i
									class="fas fa-edit update"></i></a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</section>

	<jsp:include page="\fragments\footer.jsp" />

	<script>		
		 window.onload = function() {
	         var message = "${message}"; // Message from server-side
	         if (message) {
	             showSuccessMessage(message); // Call function from included fragment
	         }
	     }
			function confirmDelete(busId) {
				if (confirm("Are you sure you want to delete this bus?")) {
					
					return true; 
				} else {
					return false; 
				}
			}
	</script>
</body>
</html>
