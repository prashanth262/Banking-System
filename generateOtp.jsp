<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Generate a 6-digit OTP
    int otp = (int)(Math.random() * 9000) + 1000;
    session.setAttribute("generatedOtp", otp);

    // Simulate sending OTP (e.g., via email/SMS)
    // For demonstration, we're simply displaying it
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Generate OTP</title>
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
        .otp-container {
            background-color: #ffffff;
            margin: 20px auto;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 80%;
            max-width: 400px;
        }
        .otp-container p {
            font-size: 18px;
            margin: 20px 0;
        }
        .otp-container a {
            display: inline-block;
            background-color: #5f3f7f; /* PhonePe purple */
            color: #ffffff;
            padding: 10px 20px;
            border-radius: 4px;
            text-decoration: none;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }
        .otp-container a:hover {
            background-color: #4e2c6f; /* Darker purple */
        }
    </style>
</head>
<body>
    <h2>OTP Generated</h2>
    <div class="otp-container">
        <p>Your OTP is: <%= otp %></p>
        <p><a href="payAmount.jsp">Proceed to Pay Amount</a></p>
    </div>
</body>
</html>
