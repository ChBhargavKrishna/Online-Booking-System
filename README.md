# 🧳 Online Booking System - Bus | Flight | Car Services

Online Booking System is a full-stack web application built using Spring Boot that enables users to search, book, and manage transportation services such as buses, flights, and cars. A full-stack web application that enables users to register, log in, and book services such as **buses**, **flights**, and **cars**. The system also provides a separate **admin module** to manage services and monitor all activities. This project is built using **Java**, **Spring Boot**, **JSP**, and **Oracle 10g**, and follows a modular and secure architecture.

---

## 🛠️ Tech Stack

- **Backend**: Java, Spring Boot
- **Frontend**: JSP, HTML, CSS
- **Database**: Oracle 10g
- **Web Server**: Apache Tomcat
- **Tools**: Spring Tool Suite (STS), Postman (for API testing)

---

## 🧩 Project Modules

### 👑 Admin Module

- 🔐 **Login Only** – Admin credentials are pre-inserted (`admin12@login.com` / `admin12`)
- 🧾 **CRUD Operations** – Add, update, delete, and view:
  - Bus details (20 seats per bus)
  - Flight details (20 seats per flight)
  - Car details
- 📊 **Admin Dashboard** – Displays:
  - Total registered users
  - Booking statistics (booked bus/flight seats, booked/active/available cars)
  - Latest 6 payments and recent user registrations
  - Full booking/payment history access
- ❌ No registration for admin – access only if credentials match

### 🙋‍♂️ User Module

- ✅ **User Registration and Login**
- 🧑‍💼 **User Dashboard** – Personalized view with name displayed
- ✏️ **Profile Management** – View and edit personal details
- 🔒 **Change Password**
- 📞 **Help / Contact Page** – FAQs, support info, terms & conditions
- 📖 **Booking History** – View all bookings (bus, flight, car)
- 🚍 **Bus Seat Booking**
  - Seat selection (A1–A10, B1–B10)
  - Multi-seat support
  - Passenger details stored
- ✈️ **Flight Seat Booking**
  - Auto seat allocation (A1–A5, B1–B5, C1–C10)
  - Seat count selected before booking
- 🚗 **Car Rental Booking**
  - Enter pickup/drop-off date, location, time
  - Full-day or half-day pricing
  - Cars filtered by availability
- 💳 **Card & Payment System**
  - Save dummy card details
  - Confirm and proceed with booking
  - Single card per user (can delete and re-add)
- ❌ **Cancellation System**
  - Partial/full booking cancellation
  - Amount and seat updates in database
  - Car rental cancellation restrictions (before pickup or within 1 day)
  - Status updated accordingly

---
