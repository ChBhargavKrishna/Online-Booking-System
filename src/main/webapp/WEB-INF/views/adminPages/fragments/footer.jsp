<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<style>
*, *::before, *::after {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	margin: 0;
	padding: 0;
	text-decoration: none;
	outline: none;
}

body, html {
	color: #061738;
	font-size: 10px;
	font-weight: 400;
	font-family: 'Barlow Condensed', sans-serif;
	scroll-behavior: smooth;
	line-height: 1.5;
}

/* Footer CSS */
.footer_wrapper {
	background-image: url('/background/footer.png');
	background-repeat: no-repeat;
	background-size: cover;
	background-position: top center;
	background-color: #f1f1f1;
	padding-top: 15rem;
	padding-bottom: 0rem;
}

.footer_wrapper h5 {
	color: #fff;
	font-size: 2.5rem;
	margin-bottom: 1.25rem;
}

.footer_wrapper ul li {
	margin-bottom: .5rem;
	list-style: none;
}

.footer_wrapper .company_details {
	font-size: 1.4rem;
}

.footer_wrapper .contact-info li a {
	color: #dee2e6;
	font-size: 1.6rem;
}

.footer_wrapper .link-widget li a, .footer_wrapper p {
	color: #dee2e6;
	font-size: 1.6rem;
	padding-left: 1.5rem;
	position: relative;
	transition: all 0.3s ease-out 0s;
}

.footer_wrapper .link-widget li a::before {
	content: '\f105';
	font-family: "Font Awesome 5 Free";
	font-weight: 900;
	position: absolute;
	left: 0.3rem;
	top: 50%;
	transform: translateY(-50%);
}

.footer_wrapper .link-widget li a:hover {
	margin-left: .625rem;
	color: #ff7400;
}

.footer_wrapper .social-network a {
	width: 3.5rem;
	height: 3.5rem;
	margin: .5rem;
	line-height: 3.2rem;
	font-size: 1.5rem;
	display: inline-block;
	border: .125rem solid #dee2e6;
	color: #dee2e6;
	text-align: center;
	border-radius: 100%;
	transition: all 0.3s cubic-bezier(0.645, 0.045, 0.355, 1);
}

.footer_wrapper .social-network a:hover {
	background-color: #ff7400;
	border-color: #ff7400;
	color: #fff;
	box-shadow: 0 .625rem .9375rem 0 rgb(0 0 0/ 10%);
}

.footer_wrapper .copyright-section {
	background-color: #ff7400;
	text-align: center;
	margin-top: 5rem;
}

.footer_wrapper .copyright-section p {
	margin-top: 0;
	padding: 3rem 0;
	line-height: 0;
	color: #000204;
}

.footer_wrapper .copyright-section a {
	color: #061738;
	font-weight: 600;
}

/* Footer Section Adjustments */
@media ( max-width : 767px) {
	.footer_wrapper .container {
		padding: 0;
	}
	.footer_wrapper .social-network {
		justify-content: center;
	}
	.footer_wrapper h5 {
		font-size: 2rem;
	}
	.footer_wrapper .company_details, .footer_wrapper .contact-info li a {
		font-size: 1.4rem;
	}
}
</style>
<section class="footer_wrapper mt-3 mt-md-0">
	<div class="container px-5 px-lg-0">
		<div class="row">
			<div class="col-lg-3 col-sm-6 mb-5 mb-lg-0">
				<a href="/"> <img src="/background/footer_logo.png" alt="logo"
					class="footer_logo"></a>
				<ul class="social-network d-flex align-items-center p-0">
					<li><a href="https://github.com/ChBhargavKrishna"><i
							class="fab fa-github"></i></a></li>
					<li><a
						href="https://www.linkedin.com/in/chiruvolubhargavkrishna/"><i
							class="fab fa-linkedin-in"></i></a></li>
					<li><a
						href="https://www.facebook.com/bhargavkrishna.chiruvolu"><i
							class="fab fa-facebook-f"></i></a></li>
					<li><a href="https://www.instagram.com/just_call_bhargav/"><i
							class="fab fa-instagram"></i></a></li>
				</ul>
			</div>
			<div class="col-lg-3 col-sm-6 mb-5 mb-lg-0">
				<h5>Customer Support</h5>
				<ul class="link-widget p-0">
					<li><a href="#">About Us</a></li>
					<li><a href="#">Privacy Policy</a></li>
					<li><a href="#">Terms & Conditions</a></li>
				</ul>
			</div>
			<div class="col-lg-3 col-sm-6 mb-5 mb-lg-0">
				<h5>Quick Links</h5>
				<ul class="link-widget p-0">
					<li><a href="#">Terms & Conditions</a></li>
					<li><a href="#">Contact Us</a></li>
					<li><a href="#">Blogs</a></li>
					<li><a href="#">Term Of Use</a></li>
				</ul>
			</div>
			<div class="col-lg-3 col-sm-6 mb-5 mb-lg-0">
				<h5>C.B.K</h5>
				<p class="mb-4 ps-0 company_details">Venkatadri Township,
					Hyderabad</p>
				<div class="contact-info">
					<ul class="list-unstyled">
						<li><a href="#"><i class="fa fa-home me-3"></i>Phase 1,
								Venkatadri Township, Chowdariguda, Hyderabad</a></li>
						<li><a href="#"><i class="fas fa-phone-alt me-3"></i>+91
								8919250936</a></li>
						<li><a href="#"><i class="fa fa-envelope me-3"></i>chiruvolubhargavkrishna@gmail.com</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="container-fluid copyright-section">
		<p>
			Design & Developed By <i class="fas fa-copyright"></i><a href="#">Bhargav
				Krishna</a> All Rights Reserved
		</p>
	</div>
</section>
<script>
	(function() {
		if (typeof history.pushState === "function") {
			history.pushState(null, null, location.href);
			window.onpopstate = function() {
				history.go(1);
			};
		}
	})();

	// Prevent backspace from going back
	document.addEventListener("keydown", function(event) {
		if (event.key === "Backspace"
				&& !event.target.closest("textarea, input")) {
			event.preventDefault();
		}
	});
</script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.min.js"></script>