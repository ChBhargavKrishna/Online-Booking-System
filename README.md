# Online Booking System Project
![](https://github.com/Bhargav2662D/Doctor-Appointment-System/blob/my-new-branch/Screenshots/Screenshot1.png)

[Online Booking System](https://github.com/Bhargav2662D/Doctor-Appointment-System/tree/my-new-branch) is a Full Stack web responsive project is made by using SpringBoot, Javascript, Css Jsp.This Project is about the booking Service of Car, Flight, Bus seats to travel from one place to another and in this two modules are present i.e Admin and User Modules.Each Module has different work in this project. Best Services also mentioned and taking feedbacks and 24/7 contact support also available.

## Features

| Admin Dashboard Page | User Dashboard Page | Login Page | Register Page | Help/Contact Page |
| -------| -------| -------| -------| -------|
| ![](https://github.com/Bhargav2662D/Doctor-Appointment-System/blob/my-new-branch/Screenshots/Screenshot2.png)| ![](https://github.com/Bhargav2662D/Doctor-Appointment-System/blob/my-new-branch/Screenshots/Screenshot3.png) |    ![](https://github.com/Bhargav2662D/Doctor-Appointment-System/blob/my-new-branch/Screenshots/Screenshot4.png)  |

-----------------------------------------------

## Key Features
In this two modules are present They are
1. Admin Module
    - Login Aunthentication(No registration).
    - CRUD Operations For Bus, Flight and Car.
    - View Payment Details of User Total Booked count including Bus, Flight and Car.
    - Fetching all complete details of registered Users.
    - Admin has only one credentials that should be inserted into table by below command with that details only Admin can make operations of above all.
      | Insert Command | Description | 
      | -------| -------|
      | `INSERT INTO login VALUES('admin12@login.com', 'admin12');`| Inserts admin credentials into the database |
      | `COMMIT;`| Saves the changes (shows `Commit complete`) |
      
## Admin Module Screenshots

| ![](https://github.com/Bhargav2662D/Doctor-Appointment-System/blob/my-new-branch/Screenshots/Screenshot1.png) | ![](https://github.com/Bhargav2662D/Doctor-Appointment-System/blob/my-new-branch/Screenshots/Screenshot2.png)| ![](https://github.com/Bhargav2662D/Doctor-Appointment-System/blob/my-new-branch/Screenshots/Screenshot3.png)| ![](https://github.com/Bhargav2662D/Doctor-Appointment-System/blob/my-new-branch/Screenshots/Screenshot4.png)|
|--------------| --------------|   --------------|  --------------|    
|  ![](https://github.com/Bhargav2662D/Doctor-Appointment-System/blob/my-new-branch/Screenshots/Screenshot5.png)| ![](https://github.com/Bhargav2662D/Doctor-Appointment-System/blob/my-new-branch/Screenshots/Screenshot6.png)| ![](https://github.com/Bhargav2662D/Doctor-Appointment-System/blob/my-new-branch/Screenshots/Screenshot7.png)| ![](https://github.com/Bhargav2662D/Doctor-Appointment-System/blob/my-new-branch/Screenshots/Screenshot8.png)|

2. User Module
    - User Should Register first and Login with email and password credentials and have user profile that can be edited.
    - Booking implementations for Bus, Flight and Car Based on his Requirement.
    - User can search for Bus and Flight seats Not allowed past dates in travel date only Acceptable present or future dates.
    - User can add Card Details for better experience. Each user can ad one card that is saved in database and it is saved card by this card payment can be done.
    - Payment Operation for booked seat (either Bus or Flight) or booked Car.Not a real Payment gateway just to save in database.
    - User can cancel his booking before the travel or depart date. Also for Booked cars can cancel for partial cancellation and Amount updated or Full cancellation also available.
    - User can change his/her password and View Booking History of his/her booking for Bus, Flight and Car.
    - Best Services also mentioned and taking feedbacks and 24/7 contact support also available by the help page. 
    
      
## User Module Screenshots

| ![](https://github.com/Bhargav2662D/Doctor-Appointment-System/blob/my-new-branch/Screenshots/Screenshot1.png) | ![](https://github.com/Bhargav2662D/Doctor-Appointment-System/blob/my-new-branch/Screenshots/Screenshot2.png)| ![](https://github.com/Bhargav2662D/Doctor-Appointment-System/blob/my-new-branch/Screenshots/Screenshot3.png)| ![](https://github.com/Bhargav2662D/Doctor-Appointment-System/blob/my-new-branch/Screenshots/Screenshot4.png)|
|--------------| --------------|   --------------|  --------------|    
|  ![](https://github.com/Bhargav2662D/Doctor-Appointment-System/blob/my-new-branch/Screenshots/Screenshot5.png)| ![](https://github.com/Bhargav2662D/Doctor-Appointment-System/blob/my-new-branch/Screenshots/Screenshot6.png)| ![](https://github.com/Bhargav2662D/Doctor-Appointment-System/blob/my-new-branch/Screenshots/Screenshot7.png)| ![](https://github.com/Bhargav2662D/Doctor-Appointment-System/blob/my-new-branch/Screenshots/Screenshot8.png)|

# Get Started
1. Download the project.
2. Open Spring Tool Suite (STS).
3. Import the project as a Maven Project.
4. Make sure Oracle 10g is installed and running.
5. Update the application.properties with your Oracle DB credentials:
    | spring.datasource.url=jdbc:oracle:thin:@localhost:1521:orcl
      spring.datasource.username=your_username
      spring.datasource.password=your_password |
6. Run the project on SpringBoot App i.e http://localhost:8086/

# Technologies Used or Tech Stack:
Spring Tool Suite: 	`4.20.0`
Java : `21`
Oracle Version: 		`10g Enterprise Edition Release 10.2.0.1.0`
Frontend : `JSP`
Framework : `SpringBoot`
Dependency Management : `Maven`
Tomcat Server: `10.1`
