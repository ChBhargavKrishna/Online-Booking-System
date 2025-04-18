<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
/** Back **/
.back-btn {
	position: fixed;
	top: 1.1rem;
	left: 1.1rem;
}

.back-btn i {
	color: #000;
	background: #0ef;
	font-size: 20px;
	padding: 10px;
	border-radius: 20px;
}

.back-btn i:hover {
	color: #ff0000;
}

/** Message **/
.message {
	display: none;
	background-color: #11ca00;
	color: #f1f1f1;
	padding: 10px;
	text-align: center;
	border-radius: 10px;
	font-size: 2rem;
	font-weight: 600;
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
	border: 2px solid #218838;
	max-width: 600px;
	position: fixed;
	top: 10px;
	width: 100%;
	left: 50%;
	transform: translateX(-50%);
	z-index: 9999;
}

.message .close-btn {
	position: absolute;
	top: 10px;
	right: 10px;
	cursor: pointer;
	font-size: 28px;
	color: red;
	z-index: 10;
	transition: color 0.3s;
}

.progress-bar-container {
	width: 100%;
	height: 5px;
	background-color: #e0e0e0;
	margin-top: 5px;
	border-radius: 5px;
	overflow: hidden;
}

.progress-bar {
	height: 100%;
	width: 0;
	background-color: #ff7400;
	transition: width 0.1s linear;
}
</style>
<a href="/adminDashboard" class="back-btn"> <i
	class="fas fa-arrow-left"></i>
</a>

<div id="successMessage" class="message" style="display: none;">
	<span id="successText"></span> <span class="close-btn"
		onclick="closeMessage()">&times;</span>
	<!-- Progress Bar -->
	<div class="progress-bar-container">
		<div id="progress-bar" class="progress-bar"></div>
	</div>
</div>

<script>
	function showSuccessMessage(message) {
		var successMessageDiv = document.getElementById('successMessage');
		var successText = document.getElementById('successText');
		successText.textContent = message; // Set message text
		successMessageDiv.style.display = 'block'; // Show message

		// Start progress bar animation
		var progressBar = document.getElementById('progress-bar');
		var totalTime = 10000; // 10 seconds
		var intervalTime = 100; // Update every 100ms
		var currentTime = 0;

		progressBar.style.width = '0%'; // Start progress bar at 0%

		// Update progress bar
		var progressInterval = setInterval(function() {
			currentTime += intervalTime;
			var percentage = (currentTime / totalTime) * 100;
			progressBar.style.width = percentage + '%';

			// After 10 seconds, hide the message
			if (currentTime >= totalTime) {
				clearInterval(progressInterval);
				closeMessage(); // Automatically close the message after 10 seconds
			}
		}, intervalTime);
	}

	// Function to close the message
	function closeMessage() {
		document.getElementById('successMessage').style.display = 'none';
	}
</script>
