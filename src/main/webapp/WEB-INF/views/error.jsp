<%@ page language="java" contentType="text/html; charset=ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Error_Page</title>
<link rel="website icon" type="png" href="/background/footer_logo.png" />
<!-- Bootstrap 5 CDN -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	font-family: 'Poppins', sans-serif;
	font-weight: 300;
	font-size: 15px;
	line-height: 1.2;
	color: #f1f1f1;
	overflow-x: hidden;
	background-color: #000;
}

/* 02 Inquiry Section */
.banner_section {
	margin-top: 0.2rem;
	padding: 2rem 0;
}

.btn {
	border-radius: 4px;
	height: 44px;
	font-size: 13px;
	font-weight: 600;
	text-transform: uppercase;
	-webkit-transition: all 200ms linear;
	transition: all 200ms linear;
	padding: 0 30px;
	letter-spacing: 1px;
	display: -webkit-inline-flex;
	display: -ms-inline-flexbox;
	display: inline-flex;
	-webkit-align-items: center;
	-moz-align-items: center;
	-ms-align-items: center;
	align-items: center;
	-webkit-justify-content: center;
	-moz-justify-content: center;
	-ms-justify-content: center;
	justify-content: center;
	-ms-flex-pack: center;
	text-align: center;
	border: none;
	background-color: #00ff00;
	color: #000000;
	box-shadow: 0 8px 24px 0 rgba(255, 235, 167, .2);
}

.btn:active, .btn:focus {
	background-color: #102770;
	color: #ffeba7;
	box-shadow: 0 8px 24px 0 rgba(16, 39, 112, .2);
}

.btn:hover {
	background-color: #102770;
	color: #ffeba7;
	box-shadow: 0 8px 24px 0 rgba(16, 39, 112, .2);
}
}
</style>
</head>

<body>
	<!--inquiry Section Start-->
	<section class="banner_section">
		<div class="container">
			<div class="row align-items-center flex-column flex-lg-row-reverse">
				<div class="col-lg-7 mb-5 mb-lg-0">
					<div class="">
						<img src="/background/error_404.png">
					</div>
				</div>
				<div class="col-lg-5 pb-5 text-center text-lg-start">
					<h2 class="section-title">Opps...... This page is not found.</h2>
					<p class="section-title">Basically,This Is not Right page what
						You are Finding.</p>
					<a href="/login/form" class="btn mt-4">Back To Login</a>
				</div>
			</div>
		</div>
	</section>
	<!--inquiry Section Exit -->
</body>
</html>