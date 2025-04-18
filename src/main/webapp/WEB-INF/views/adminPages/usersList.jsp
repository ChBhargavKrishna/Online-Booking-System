<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registered Users</title>
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
/**user Section **/
.user-section {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 80vh;
	background: url('/admin_service/card.jpg') no-repeat;
	background-position: center;
	background-size: cover;
	padding: 20px;
}

.list-container {
	width: 100%;
	height: 100%;
	max-width: 1000px;
	background: #000;
	padding: 2rem;
	border-radius: 10px;
	box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
}

.user-section .title {
	color: #ff00ff;
	position: relative;
	padding-bottom: 14px;
	margin-bottom: 25px;
	font-weight: 700;
	font-size: 32px;
	text-transform: capitalize;
	text-align: center;
}

.user-section .title span {
	color: #00ffff;
}

.user-section .title:before {
	content: '';
	position: absolute;
	bottom: 0;
	left: 50%;
	width: 180px;
	height: 3px;
	background-color: #00ff00;
	transform: translateX(-50%);
}

.user-section .title:after {
	content: '';
	position: absolute;
	bottom: -1px;
	left: 50%;
	width: 60px;
	height: 6px;
	background-color: #00ff00;
	transform: translateX(-50%);
}

.reg_users {
	width: 100%;
	border-collapse: collapse;
	margin: 25px 0;
	font-size: 1rem;
}

.reg_users thead {
	background-color: #6c757d;
	color: #0ef;
	font-weight: bold;
}

.reg_users th, .reg_users td {
	padding: 12px 10px;
	text-align: center;
	border: 1px solid #fff;
	margin-bottom: 10px;
	font-size: 20px;
}

.reg_users tbody tr:nth-child(odd) {
	color: #ffe000;
}

.reg_users tbody tr:nth-child(even) {
	color: #ff7000;
}

/**Resopnsive CSS**/
@media ( max-width : 992px) {
	.reg_users th, .reg_users td {
        font-size: 24px;
        padding: 10px 8px;
    }

    .title {
        font-size: 4rem;
    }

    .list-container {
        padding: 2rem;
    }
}

@media ( max-width : 768px) {
	.reg_users th, .reg_users td {
        font-size: 14px;
        padding: 8px 6px;
    }

    .title {
        font-size: 2rem;
    }

    .list-container {
        padding: 1rem;
    }
}

@media ( max-width : 549px) {
	.reg_users th, .reg_users td {
        font-size: 10px;
        padding: 6px 4px;
    }

    .title {
        font-size: 1rem;
    }

    .list-container {
        padding: 0.5rem;
    }
}
</style>
</head>
<body>
	<jsp:include page="\fragments\message.jsp" />

	<section class="user-section">
		<div class="list-container">
			<h1 class="title">
				Registered <span>Users</span>
			</h1>
			<table class="reg_users">
				<thead>
					<tr>
						<td>Full Name</td>
						<td>UserName</td>
						<td>Gender</td>
						<td>Age</td>
						<td>Date Of Birth</td>
						<td>Contact No</td>
						<td>State</td>
						<td>Pincode</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="register" items="${users}">
						<tr>
							<td>${register.fullName}</td>
							<td>${register.login.userName}</td>
							<td>${register.gender}</td>
							<td>${register.age}</td>
							<td>${register.DOB}</td>
							<td>${register.contactNo}</td>
							<td>${register.state}</td>
							<td>${register.pinCode}</td>
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
