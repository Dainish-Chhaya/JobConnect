<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Error</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fa;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            flex-direction: column;
        }

        .container {
            text-align: center;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 80%;
            max-width: 500px;
        }

        h2 {
            color: #e74c3c;
            font-size: 32px;
            margin-bottom: 20px;
        }

        p {
            color: #555;
            font-size: 18px;
            margin-bottom: 30px;
        }

        button {
            background-color: #e74c3c;
            color: #fff;
            border: none;
            padding: 12px 25px;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        button:hover {
            background-color: #c0392b;
        }

        a {
            text-decoration: none;
            color: #3498db;
            font-weight: bold;
        }

        a:hover {
            text-decoration: underline;
        }

        .footer {
            margin-top: 30px;
            font-size: 14px;
            color: #777;
        }

        .footer a {
            color: #3498db;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Error</h2>
    <!-- Display the dynamic error message -->
    <p>${errorMessage}</p>

    <!-- Go Back button -->
    <button onclick="goBack()">Go Back</button>

    <!-- Link to go back to the last visited page if available -->
    <p>
        <c:if test="${not empty lastVisitedPage}">
            Or, <a href="${lastVisitedPage}">click here to return to the previous page</a>.
        </c:if>
    </p>

    <!-- Footer with some useful links or message -->
    <div class="footer">
        <p>If you need assistance, please contact support.</p>
    </div>
</div>

<script type="text/javascript">
    function goBack() {
        window.history.back();
    }
</script>

</body>
</html>
