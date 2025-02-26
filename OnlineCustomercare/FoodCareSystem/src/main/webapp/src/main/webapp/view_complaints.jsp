<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    // Check if the user is logged in
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("loginandsignup.jsp");
        return;
    }

    // Database connection details
    String DB_URL = "jdbc:mysql://localhost:3306/customercaresystem";
    String DB_USER = "root";
    String DB_PASSWORD = "Keerthi@2002";

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Complaints</title>
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            background-image: url('complaint.jpg'); /* Background image */
            background-size: cover;
            background-position: center;
            margin: 0;
            padding: 0;
            color: #333;
        }

        .container {
            max-width: 900px;
            width: 100%;
            background-color: rgba(255, 255, 255, 0.9); /* Semi-transparent background */
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            margin-top: 100px;
            margin-left:310px;
            justify-content: center;
   			align-items: center;
        }
       

        h2 {
            font-size: 2rem;
            margin-bottom: 20px;
            color: rgba(0, 64, 128, 0.8);
        }

        /* Complaints Table */
        .complaints-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        .complaints-table th, .complaints-table td {
            padding: 12px 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        .complaints-table th {
            background-color: rgba(0, 64, 128, 0.8);
            color: white;
        }

        .complaints-table tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .complaints-table tr:hover {
            background-color: rgba(0, 64, 128, 0.1);
        }

        .navbar {
            background-color: rgba(0, 64, 128, 0.8);
            overflow: hidden;
            padding: 14px 20px;
            position: fixed;
            width: 100%;
            top: 0;
            color: white;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }

        .navbar a {
            color: white;
            padding: 14px 20px;
            text-decoration: none;
            display: inline-block;
            transition: background-color 0.3s ease;
        }

        .navbar a:hover {
            background-color: #0066cc;
        }

        .logout-button {
            background-color: #ff4c4c;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            float: right;
            margin-right: 35px;
            transition: background-color 0.3s ease;
        }

        .logout-button:hover {
            background-color: #d43d3d;
        }

        .edit-button, .delete-button {
            padding: 8px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            color: white;
        }

        .edit-button {
            background-color: rgba(0, 64, 128, 0.8);
            margin-right: 5px;
        }

        .edit-button:hover {
            background-color: rgba(0, 64, 128, 1);
        }

        .delete-button {
            background-color: #ff4c4c;
        }

        .delete-button:hover {
            background-color: #d43d3d;
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <div class="navbar">
        <a href="customer_dashboard.jsp">Dashboard</a>
        <a href="raise_complaint.jsp">Raise Complaint</a>
        <a href="view_complaints.jsp">My Complaints</a>

        <form action="LogoutServlet" method="post" style="display: inline;">
            <button class="logout-button" type="submit">Logout</button>
        </form>
    </div>

    <div class="container">
        <!-- Table of Raised Complaints -->
        <h2>Your Raised Complaints</h2>
        <table class="complaints-table">
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Issue Type</th>
                <th>Description</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
            <%
                try {
                    // Load MySQL JDBC Driver
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

                    // SQL query to retrieve complaints for the logged-in user
                    String sql = "SELECT complaint_id, title, issue_type, description, status FROM complaints WHERE customer_id = (SELECT id FROM users WHERE username = ?)";
                    pstmt = conn.prepareStatement(sql);
                    pstmt.setString(1, username);
                    rs = pstmt.executeQuery();

                    // Loop through the result set and display the complaints
                    while (rs.next()) {
                        int complaintId = rs.getInt("complaint_id");
                        String complaintTitle = rs.getString("title");
                        String issueType = rs.getString("issue_type");
                        String complaintDescription = rs.getString("description");
                        String status = rs.getString("status");
            %>
            <tr>
                <td><%= complaintId %></td>
                <td><%= complaintTitle %></td>
                <td><%= issueType %></td>
                <td><%= complaintDescription %></td>
                <td><%= status %></td>
                <td>
                    <form action="edit_complaint.jsp" method="get" style="display:inline;">
                        <input type="hidden" name="complaintId" value="<%= complaintId %>">
                        <button type="submit" class="edit-button">Edit</button>
                    </form>
                    
                    <form action="DeleteComplaintServlet" method="post" style="display:inline;" onsubmit="return confirmDelete();">
                        <input type="hidden" name="complaintId" value="<%= complaintId %>">
                        <button type="submit" class="delete-button">Delete</button>
                    </form>
                </td>
            </tr>
            <%
                    }
                    if (!rs.isBeforeFirst()) {
                        out.println("<tr><td colspan='6'>No complaints found.</td></tr>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                    out.println("<tr><td colspan='6'>Error retrieving complaints.</td></tr>");
                } finally {
                    if (rs != null) rs.close();
                    if (pstmt != null) pstmt.close();
                    if (conn != null) conn.close();
                }
            %>
        </table>
    </div>
</body>
</html>
