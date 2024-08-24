<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pay Amount</title>
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
    </style>
</head>
<body>
    <h2>Pay Amount</h2>
    <form method="post" action="verifyOtpAndPay.jsp">
        Sender Account ID: <input type="text" name="sender_account_id" required><br>
        Receiver Account ID: <input type="text" name="receiver_account_id" required><br>
        Amount: <input type="text" name="amount" required><br>
        Enter OTP: <input type="text" name="otp" required><br>
        <input type="submit" value="Pay Amount">
    </form>
</body>
</html>
