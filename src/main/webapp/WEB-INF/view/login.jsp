<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>

<head>

    <title>Login - Seven Tab Project</title>

    <style>

        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            padding: 0;

            font-family: Arial, sans-serif;

            background-color: #f4f6f8;

            display: flex;

            justify-content: center;

            align-items: center;

            height: 100vh;
        }


        .login-container {

            width: 350px;

            background-color: white;

            padding: 35px;

            border-radius: 6px;

            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.15);

            text-align: center;
        }


        .login-container h2 {

            margin-top: 0;

            margin-bottom: 25px;
        }


        .login-button {

            width: 100%;

            padding: 11px;

            background-color: #1677c8;

            color: white;

            border: none;

            border-radius: 4px;

            font-size: 15px;

            cursor: pointer;
        }


        .login-button:hover {

            background-color: #125fa0;
        }

    </style>

</head>


<body>


<div class="login-container">

    <h2>
        Welcome
    </h2>


    <button
            type="button"
            class="login-button"
            onclick="login()">
        Login
    </button>
</div>
<script>

    function login() {
      window.location.href =
           "${pageContext.request.contextPath}/home";
    }

</script>
</body>
</html>