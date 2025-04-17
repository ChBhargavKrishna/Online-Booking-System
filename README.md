# 🌍 Online Booking System Project
![]()

[Online Booking System](https://github.com/Bhargav2662D/Online-Booking-System) is a Full Stack web responsive project is made by using SpringBoot, Javascript, Css Jsp.This is a full-stack, responsive web application built with Spring Boot, JSP, and Oracle DB that allows users to book car, flight, and bus tickets. It features two modules — Admin and User — each with its own functionalities and access control. This project has two modules i.e Admin and User Modules. Each module has distinct responsibilities in the project. Best Services also mentioned and taking feedbacks and 24/7 contact support also available.

## 🔑 Key Features

| Login Page | Register Page | Admin Dashboard Page | User Dashboard Page |
| -------| -------| -------| -------|
| ![]() | ![]() | ![]() | ![]() |

-----------------------------------------------

## 👥 Module Features
In this two modules are present They are
1. **👨‍💼 Admin Module**
 - Login Authentication (No registration).
 - CRUD Operations For Bus, Flight and Car.
 - View Payment Details of User Total Booked count including Bus, Flight and Car.
 - Fetching all complete details of registered Users.
 - Admin has only one credentials that should be inserted into table by below command with that details only Admin can make operations of above all.
      
      | Insert Command | Description | 
      | -------| -------|
      | `INSERT INTO login VALUES('admin12@login.com', 'admin12');`| Inserts admin credentials into the database |
      | `COMMIT;`| Saves the changes (shows `Commit complete`) |

      ## 📸 Admin Module Screenshots
| ![]() | ![]()| ![]()| ![]()|
|--------------| --------------|   --------------|  --------------|    
|  ![]()| ![]()| ![]()| ![]()|

2. **🙋 User Module**
 - Users must first register and then log in with email and password credentials and have user profile that can be edited.
 - Booking implementations for Bus, Flight and Car Based on his Requirement.
 - User can search for Bus and Flight seats Past travel dates are not allowed; only present or future dates can be selected.
 - User can add Card Details for better experience. Each user can add one card that is saved in database and it is saved card by this card payment can be done.
 - Payment Operation for booked seat (either Bus or Flight) or booked Car. Not a real payment gateway; just saves data in the database.
 - User can cancel his booking before the travel or depart date. Also for Booked cars can cancel for partial cancellation and Amount updated or Full cancellation also available.
 - User can change his/her password and View Booking History of his/her booking for Bus, Flight and Car.
 - Best Services also mentioned and taking feedbacks and 24/7 contact support also available by the help page. 
    
     ## 📸 User Module Screenshots
| ![]() | ![]()| ![]()| ![]()|
|--------------| --------------|   --------------|  --------------|    
|  ![]()| ![]()| ![]()| ![]()|

# 🚀 Get Started
1. Download the project.  
2. Open **Spring Tool Suite (STS)**.  
3. Import the project as a **Maven Project**.  
4. Make sure **Oracle 10g** is installed and running.  
5. Update the `application.properties` file with your Oracle DB credentials:

   | **Edit your Oracle DB details** |
   |-----------------------------|
   | `spring.datasource.url=jdbc:oracle:thin:@localhost:1521:orcl` <br> `spring.datasource.username=your_username` <br> `spring.datasource.password=your_password` |
6. Run the project on SpringBoot App i.e http://localhost:8086/ 

### 💻 Tech Stack

- **Backend:** Spring Boot & Java 21.
- **Database:** Oracle 10g Enterprise Edition Release 10.2.0.1.0.
- **Dependency Management:** Maven.
- **Frontend:** JSP, CSS, JavaScript.
- **Server:** Tomcat 10.1
- **IDE:** Spring Tool Suite 4.20.0

## 📚 Table of Contents

- [📝 Project Overview](#-online-booking-system-project)
- [📌 Key Features](#-key-features)
- [⚙️ Module Features](#-module-features)
- [📸 Screenshots](#-admin-module-screenshots)
- [🚀 Getting Started](#-get-started)
- [💻 Tech Stack](#-tech-stack)
- [👤 Author](#-author)
- [📄 License](#-license)

## 👤 Author
- **Name:** Chiruvolu Bhargav Krishna
- **GitHub:** [@Bhargav2662D](https://github.com/Bhargav2662D)

## 📄 License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🙏 Thank You
![Thank You for visiting this project!](https://img.shields.io/badge/Thank%20You-🙏-green?style=for-the-badge)

We appreciate your time and interest in this project.

If you found it helpful, feel free to ⭐ the repository or contribute!
