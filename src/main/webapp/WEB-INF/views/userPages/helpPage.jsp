<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${fullName} Help/Contact</title>
<link rel="website icon" type="png" href="/background/footer_logo.png" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" />
<link rel="stylesheet" type="text/css"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap">
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Roboto', sans-serif;
}

html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

/** container **/
.container {
	position: relative;
	width: 100%;
}

/** Side-Menu **/
.side-menu {
	position: fixed;
	width: 300px;
	height: 100%;
	top: 0;
	left: 0;
	background: linear-gradient(45deg, #40873e, #00045d);
	overflow-x: hidden;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
	z-index: 2;
}

.side-menu.hidden {
	transform: translateX(-100%);
}

.toggler {
	display: none;
	position: fixed;
	top: 10px;
	left: 10px;
	z-index: 3;
	background: #000;
	color: #fff;
	border: none;
	padding: 10px 15px;
	font-size: 20px;
	cursor: pointer;
	border-radius: 5px;
}

.side-menu ul li {
	width: 100%;
	list-style: none;
}

.side-menu ul li:hover {
	background-color: #07c4c2;
	color: #ffb601;
}

.side-menu ul .nav-item.active {
	color: #ffb601;
}

.side-menu ul li:first-child {
	line-height: 60px;
	margin-bottom: 30px;
	font-weight: 600;
	border-bottom: 1px solid #fff;
	text-align: center;
}

.side-menu ul li:first-child:hover {
	background: none;
}

.side-menu ul li a {
	width: 100%;
	text-decoration: none;
	color: #fff;
	height: 60px;
	display: flex;
	align-items: center;
}

.side-menu ul li a.logo {
	display: flex;
	align-items: center;
	gap: 10px;
}

.side-menu ul li a.logo img {
	width: 55px;
	height: 50px;
	border-radius: 50%;
	background: #000;
	object-fit: contain;
}

.side-menu ul li a.logo span {
	font-weight: 600;
	font-size: 18px;
	color: #fff;
	white-space: nowrap;
	overflow: visible;
	text-overflow: ellipsis;
}

.logout {
	position: absolute;
	bottom: 0;
}

.side-menu ul li a i {
	min-width: 60px;
	font-size: 24px;
	text-align: center;
	color: #fff;
}

/** contact **/
.contact {
	position: absolute;
	width: calc(100% - 300px);
	min-height: 100vh;
	left: 300px;
	background: #bfbaa8;
	transition: margin-left 0.3s ease-in-out;
	overflow: auto;
}

.contact-details {
	position: relative;
	margin: 20px auto;
	width: 90%;
	max-width: 600px;
	background: linear-gradient(45deg, #000, #159802);
	padding: 30px;
	border: 2px solid #06de02;
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
	border-radius: 10px;
}

.contact-details h2 {
	font-size: 32px;
	color: #0ef;
	text-align: center;
	margin-bottom: 20px;
}

.contact-details form {
	display: flex;
	flex-direction: column;
	gap: 15px;
}

form .input-box {
	display: flex;
	flex-wrap: wrap;
	gap: 15px;
	justify-content: space-between;
}

.input-box .input-field {
	flex: 1;
	min-width: 48%;
}

.field .item {
	width: 100%;
	padding: 14px;
	background: transparent;
	border: 2px solid #f7ff00;
	outline: none;
	border-radius: 6px;
	font-size: 16px;
	color: #fff;
	transition: 0.3s ease-in-out;
}

.field .item::placeholder {
	color: #ffd800;
}

.field .item:focus, .field .item:hover {
	border-color: #0ef;
	box-shadow: 0 0 8px #0ef;
}

form .textarea-field .item {
	resize: none;
	height: 120px;
}

form button {
	padding: 12px 32px;
	background: #0ef;
	border: none;
	outline: none;
	border-radius: 6px;
	box-shadow: 0 0 10px #0ef;
	font-size: 16px;
	color: #000;
	letter-spacing: 1px;
	font-weight: 600;
	cursor: pointer;
	margin-top: 20px;
	transition: .5s;
}

form button:hover {
	box-shadow: 0 0 5px cyan, 0 0 25px cyan, 0 0 50px cyan, 0 0 100px cyan,
		0 0 200px cyan;
}

/** Content Section **/
.content-section {
	width: 1000px;
	margin: 50px auto 10px;
	border: 2px solid #00ff00;
	background: #000;
	padding-bottom: 10px;
	box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
	border-radius: 8px;
}

.content-data {
	display: flex;
	flex-wrap: wrap;
	width: 1000px;
	height: auto;
	padding: 20px 10px;
	gap: 20px;
	justify-content: space-between;
}

.content-data .content {
	display: flex;
	flex-wrap: wrap;
	gap: 20px;
	justify-content: space-around;
}

.item {
	display: flex;
	align-items: center;
	width: 300px;
	padding: 15px;
	border: 2px solid #ff00ff;
}

.item img {
	width: 50px;
	height: 50px;
	border-radius: 50%;
	margin-right: 15px;
	object-fit: cover;
	border: 2px solid #0ef;
}

.item-text h3 {
	margin: 0;
	font-size: 1.1rem;
	color: #f7ff00;
}

.item-text p {
	margin: 5px 0 0;
	color: #0ef;
	font-size: 0.9rem;
} 

/* Responsive */
.toggle-btn {
	display: none;
	font-size: 22px;
	background-color: #000;
	color: white;
	padding: 5px 10px;
	border-radius: 6px;
	cursor: pointer;
	position: absolute;
	left: 10px;
	z-index: 3;
}

@media ( max-width : 1332px) {
	.contact {
		width: 100%;
		left: 0;
		padding-left: 20px;
		padding-right: 20px;
	}
	.side-menu {
		transform: translateX(-100%);
	}
	.side-menu.active {
		transform: translateX(0);
	}
	.contact.shifted {
		transform: translateX(300px); /* move right when menu active */
		width: calc(100% - 300px);
	}
	.toggle-btn {
		display: block;
		transition: all 0.3s ease;
	}
	.toggle-btn.moved {
		left: 310px;
	}
	.form-section {
		width: 100% !important;
	}
	.content-section {
		width: 85%;
		left: 0;
		padding-left: 20px;
		padding-right: 20px;
	}
	.content-section.shift {
		display: flex;
		flex: 1 1 calc(50% - 20px);
	}
}

@media ( max-width : 992px) {
	.contact {
		width: 100%;
		left: 0;
		padding-left: 20px;
		padding-right: 20px;
	}
	.side-menu {
		transform: translateX(-100%);
	}
	.side-menu.active {
		transform: translateX(0);
	}
	.contact.shifted {
		transform: translateX(300px); /* move right when menu active */
		width: calc(100% - 300px);
	}
	.toggle-btn {
		display: block;
		transition: all 0.3s ease;
	}
	.toggle-btn.moved {
		top: 18px;
		left: 310px;
	}
	.contact-details {
		width: 100% !important;
	}
	.content-section {
		width: 85%;
		left: 0;
		padding-left: 20px;
		padding-right: 20px;
	}
	.content-section.shift {
		display: flex;
		flex: 1 1 calc(50% - 20px);
	}
}
</style>
</head>
<body>
	<!-- Toggler Button -->
<button class="toggle-btn">
		<i class="fas fa-bars"></i>
	</button>

	<div class="container">
		<div id="side-menu" class="side-menu">
			<ul>
				<li><a href="#" class="logo"> <img
						src="${sessionScope.gender == 'Female' ? '/user_service/female.png' : '/user_service/male.png'}"
						alt="Profile Image" /> <span class="nav-item">Welcome
							${fullName}</span>
				</a></li>
				<li><a href="/userDashboard" class="nav-item"><i
						class="fas fa-home"></i>Home</a></li>
				<li><a href="/user/profile" class="nav-item"><i
						class="fas fa-user"></i>Profile</a></li>
				<li><a href="/booking/history" class="nav-item"><i
						class="fas fa-wallet"></i>Booking History</a></li>
				<li><a href="/change/password/form" class="nav-item"><i
						class="fas fa-key"></i>Change Password</a></li>
				<li><a href="/help" class="nav-item active"><i
						class="fas fa-question-circle"></i>Help</a></li>
				<li><a href="/logout" class="logout"><i
						class="fas fa-sign-out-alt"></i><span class="nav-item">Log
							out</span></a></li>
			</ul>
		</div>
	</div>

	<section class="contact">
		<div class="contact-details">
			<h2>Contact Me!</h2>
			<form action="https://formspree.io/f/xldegdvj" method="post">
				<div class="input-box">
					<div class="input-field field">
						<input type="text" placeholder="Full Name" class="item" required>
					</div>
					<div class="input-field field">
						<input type="text" placeholder="Email Address" class="item"
							required>
					</div>
				</div>
				<div class="input-box">
					<div class="input-field field">
						<input type="text" placeholder="Phone Number" class="item"
							pattern="^\d{10}$" required>
					</div>
					<div class="input-field field">
						<input type="text" placeholder="Query" class="item" required>
					</div>
				</div>
				<div class="textarea-field field">
					<textarea name="msg" id="msg" cols="10" rows="10"
						placeholder="Your Message" class="item" required></textarea>
				</div>
				<button type="submit">Send Message</button>
			</form>
		</div>
		
		<div class="content-section">
			<div class="content-data">
				<div class="content">
					<div class="item">
						<img src="/user_service/content/content-1.jpg" alt="Image 1">
						<div class="item-text">
							<h3>Chennai Flights</h3>
							<p>Via - Delhi, Mumbai, Coimbatore, Madurai</p>
						</div>
					</div>
					<div class="item">
						<img src="/user_service/content/content-2.jpg" alt="Image 1">
						<div class="item-text">
							<h3>Hyderabad Flights</h3>
							<p>Via - Chennai, Mumbai, Bangalore, Delhi</p>
						</div>
					</div>
					<div class="item">
						<img src="/user_service/content/content-3.jpg" alt="Image 1">
						<div class="item-text">
							<h3>Kolkata Flights</h3>
							<p>Via - Delhi, Mumbai, Bangalore, Pune</p>
						</div>
					</div>
					<div class="item">
						<img src="/user_service/content/content-4.jpg" alt="Image 1">
						<div class="item-text">
							<h3>Buses From Mumbai To</h3>
							<p>Bangalore, Goa, Pune, Indore, Ahmedabad</p>
						</div>
					</div>
					<div class="item">
						<img src="/user_service/content/content-5.jpg" alt="Image 1">
						<div class="item-text">
							<h3>Buses From Delhi To</h3>
							<p>Lucknow, Dehradun, Manali, Kanpur, Jaipur</p>
						</div>
					</div>
					<div class="item">
						<img src="/user_service/content/content-6.jpg" alt="Image 1">
						<div class="item-text">
							<h3>Buses From Bangalore To</h3>
							<p>Chennai, Hyderabad, Coimbatore, Mumbai, Goa</p>
						</div>
					</div>
					<div class="item">
						<img src="/user_service/content/content-9.jpg" alt="Image 1">
						<div class="item-text">
							<h3>Cars In Gujarat</h3>
						</div>
					</div>
					<div class="item">
						<img src="/user_service/content/content-8.jpg" alt="Image 1">
						<div class="item-text">
							<h3>Cars In Vizag</h3>
						</div>
					</div>
					<div class="item">
						<img src="/user_service/content/content-7.jpg" alt="Image 1">
						<div class="item-text">
							<h3>Cars In Kerala</h3>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<script>
	document.addEventListener('DOMContentLoaded', () => {
	    const toggler = document.querySelector('.toggle-btn');
	    const sideMenu = document.querySelector('.side-menu');
	    const change = document.querySelector('.contact');
	    const contentSection = document.querySelector('.content-section');

	    toggler.addEventListener('click', () => {
	      sideMenu.classList.toggle('active');
	      change.classList.toggle('shifted');
	      toggler.classList.toggle('moved');
	      contentSection.classList.toggle('shift'); 
	    });
	  });
    </script>
</body>
</html>