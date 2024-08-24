<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Withdraw Amount</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
            text-align: center;
        }
        h2 {
            background-color: #5f3f7f; /* PhonePe purple */
            color: #ffffff;
            padding: 20px;
            margin: 0;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        form {
            background-color: #ffffff;
            margin: 20px auto;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 400px;
        }
        form input[type="text"] {
            width: calc(100% - 22px);
            padding: 10px;
            margin: 10px 0;
            border-radius: 4px;
            border: 1px solid #ddd;
            font-size: 16px;
        }
        form input[type="submit"] {
            background-color: #5f3f7f; /* PhonePe purple */
            color: #ffffff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        form input[type="submit"]:hover {
            background-color: #4e2c6f; /* Darker purple */
        }
        .message {
            margin-top: 20px;
            font-size: 18px;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <h2>Withdraw Amount from Account</h2>
    <form method="post">
        Account ID: <input type="text" name="account_id" required><br>
        Amount: <input type="text" name="amount" required><br>
        <input type="submit" value="Withdraw">
    </form>

    <%
    if (request.getMethod().equalsIgnoreCase("POST")) {
        String accountId = request.getParameter("account_id");
        String amountStr = request.getParameter("amount");
        double amount = Double.parseDouble(amountStr);

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/banking_system", "prashanth", "Pra12+34");
            Statement stmt = con.createStatement();
            
            // Check for sufficient funds
            String checkQuery = "SELECT account_balance FROM accounts WHERE account_id = " + accountId;
            ResultSet rs = stmt.executeQuery(checkQuery);
            if (rs.next()) {
                double currentBalance = rs.getDouble("account_balance");
                if (currentBalance < amount) {
                    out.println("<div class='message'>Insufficient funds!</div>");
                } else {
                    // Perform withdrawal
                    String query = "UPDATE accounts SET account_balance = account_balance - " + amount + " WHERE account_id = " + accountId;
                    int rowsUpdated = stmt.executeUpdate(query);
                    if (rowsUpdated > 0) {
                        out.println("<div class='message'>Amount withdrawn successfully!</div>");
                    } else {
                        out.println("<div class='message'>Account not found.</div>");
                    }
                }
            } else {
                out.println("<div class='message'>Account not found.</div>");
            }
            
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<div class='message'>Error: " + e.getMessage() + "</div>");
        }
    }
    %>
</body>
</html>
