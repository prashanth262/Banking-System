<%@ page import="java.sql.*" %>

<%
    String driver = "com.mysql.cj.jdbc.Driver"; // Updated for newer versions
    String connectionUrl = "jdbc:mysql://localhost:3306/banking_system";
    String userid = "prashanth";
    String password = "Pra12+34";

    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    // Load database driver
    try {
        Class.forName(driver);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
        out.println("<p>Error loading database driver.</p>");
        return; // Exit the script if the driver cannot be loaded
    }

    try {
        // Establish a connection
        connection = DriverManager.getConnection(connectionUrl, userid, password);
        statement = connection.createStatement();
        String sql = "SELECT * FROM accounts";
        resultSet = statement.executeQuery(sql);
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Retrieve Data</title>
    <link rel="stylesheet" href="styles.css"> <!-- Link to external CSS file -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
            text-align: center;
        }
        h1 {
            background-color: #5f3f7f; /* PhonePe purple */
            color: #ffffff;
            padding: 20px;
            margin: 0;
        }
        table {
            margin: 20px auto;
            border-collapse: collapse;
            width: 80%;
            background-color: #ffffff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        th, td {
            padding: 15px;
            border: 1px solid #ddd;
            font-size: 16px;
        }
        th {
            background-color: #5f3f7f; /* PhonePe purple */
            color: #ffffff;
        }
        td a {
            text-decoration: none;
            color: #5f3f7f; /* PhonePe purple */
            font-weight: bold;
        }
        td a:hover {
            color: #4e2c6f; /* Darker purple */
        }
        .action-buttons {
            display: flex;
            justify-content: space-around;
        }
        .action-buttons a {
            background-color: #5f3f7f; /* PhonePe purple */
            color: #ffffff;
            padding: 10px 20px;
            border-radius: 4px;
            text-decoration: none;
            margin: 0 5px;
            transition: background-color 0.3s ease;
        }
        .action-buttons a:hover {
            background-color: #4e2c6f; /* Darker purple */
        }
    </style>
</head>
<body>

<h1>Welcome to the Banking System</h1>
<table>
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th colspan="4">Actions</th>
    </tr>

    <%
        while (resultSet.next()) {
            int id = resultSet.getInt("account_id");
            String name = resultSet.getString("account_holder_name");
    %>
    <tr>
        <td><%= id %></td>
        <td><%= name %></td>
        <td class="action-buttons">
            <a href="addAmount.jsp?id=<%= id %>">Add Amount</a>
            <a href="generateOtp.jsp?id=<%= id %>">Pay Amount</a>
            <a href="checkBalance.jsp?id=<%= id %>">Check Balance</a>
            <a href="withdraw.jsp?id=<%= id %>">Withdraw</a>
        </td>
    </tr>
    <%
        }
    %>

</table>

<%
    } catch (SQLException e) {
        out.println("<p>Error retrieving data: " + e.getMessage() + "</p>");
    } finally {
        // Close resources in the finally block to ensure they are closed even if an exception occurs
        try {
            if (resultSet != null) resultSet.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            out.println("<p>Error closing resources: " + e.getMessage() + "</p>");
        }
    }
%>

</body>
</html>
