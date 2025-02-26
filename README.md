

# 📞 Online Customer Care System  

## 🌟 Overview  
The *Online Customer Care System* is a *web-based platform* designed to enhance customer service efficiency. It enables users to *register complaints, track resolutions, and communicate with support agents. The system provides role-based access to **admins, agents, billing staff, technical officers, and customers* for seamless issue resolution.  

---

## 🎯 Features  
✔ *User Authentication* – Secure login, signup, and password recovery.  
✔ *Role-Based Access* – Admin, agents, billing, and technical officers with different permissions.  
✔ *Complaint Management* – Customers can file and monitor complaints.  
✔ *Admin Dashboard* – Manage users, complaints, and assignments.  
✔ *Agent Assignment* – Assign complaints to agents for resolution.  
✔ *Database Integration* – Stores and retrieves data using *MySQL*.  

---
🛠 How to Use

👤 Customer:
✅ Register/Login → Submit complaints → Track complaint status

👨‍💼 Admin:
✅ Manage users & complaints → Assign agents

👨‍🔧 Agent:
✅ View assigned complaints → Update complaint status


👤 My Contribution

Keerthigan T. (Admin Panel | Full-Stack Development)
	•	Admin Dashboard: Designed and developed a fully functional admin panel for user & complaint management.
	•	Frontend Development: Built responsive UI components using JSP, HTML, CSS, JavaScript.
	•	Backend Development: Implemented secure authentication, MySQL database integration, and server-side logic using Java Servlets.
	•	Role-Based Access Control: Configured different permissions for Admin, Agents, Billing, and Technical Officers.
	•	Deployment: Assisted in setting up the Apache Tomcat server and MySQL database.

📌 GitHub Repository: 🔗 Online Customer Care System


## 🚀 Installation & Setup  

### 📌 Prerequisites  
Ensure you have the following installed:  
- *JDK 8+* (Java Development Kit)  
- *Apache Tomcat 9+* (or compatible server)  
- *MySQL Server* (for database management)  
- *Eclipse/IntelliJ IDEA* (for development, optional)  

---

## 🔧 Steps to Set Up  

### 1️⃣ Clone the Repository  
```sh
git clone https://github.com/Keerthithev/OnlineCustomercareSystem.git
cd OnlineCustomercareSystem

2️⃣ Import Project into Eclipse/IntelliJ
	•	Open Eclipse → File → Import → Existing Projects into Workspace
	•	Select the OnlineCustomercareSystem folder and click Finish

3️⃣ Set Up the Database
	•	Open MySQL and create a new database:

CREATE DATABASE customer_care;


	•	Import the provided CCS.sql file into MySQL

4️⃣ Update Database Credentials

Edit DBConnection.java and enter your MySQL details:

String url = "jdbc:mysql://localhost:3306/customer_care";
String user = "root";
String password = "yourpassword";

5️⃣ Deploy on Apache Tomcat
	•	Right-click the project → Run on Server → Select Apache Tomcat
	•	Start the server and access the system via a browser

6️⃣ Access the System
	•	Open a browser and go to:

http://localhost:8080/OnlineCustomercareSystem/


	•	Admin Login: (Change password after first login)

Username: admin
Password: admin123

🗂 Project Structure

/OnlineCustomercareSystem
│── src/
│   ├── Controller/        # Servlets handling request processing
│   ├── Model/             # Database connection & models
│── webapp/
│   ├── pages/             # JSP views (Login, Dashboard, Complaints)
│   ├── assets/            # CSS, JS, and images
│── CCS.sql                # Database schema
│── pom.xml                # Dependencies (if using Maven)



📩 Contact

For any queries or suggestions, feel free to reach out:
📧 keerthiganthevarasa@gmail.com

📜 License

This project is open-source under the MIT License.

🌟 If you found this project helpful, give it a ⭐ on GitHub!



