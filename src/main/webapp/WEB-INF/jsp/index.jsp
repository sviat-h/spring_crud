<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8" />
    <title>Welcome</title>
    <style>
        a {
            background-color: red;
            box-shadow: 0 5px 0 darkred;
            color: white;
            padding: 1em 1.5em;
            position: relative;
            text-decoration: none;
            text-transform: uppercase;
        }

        a:hover {
            background-color: #ce0606;
            cursor: pointer;
        }

        a:active {
            box-shadow: none;
            top: 5px;
        }

        table {
            font-family: arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        td, th {
            border: 1px solid #dddddd;
            text-align: left;
            padding: 8px;
        }

        tr:nth-child(even) {
            background-color: #dddddd;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css"/>
</head>
<body>
<h1>Welcome</h1>
<h2>${message}</h2>


<table>
<a href="${pageContext.request.contextPath}/personList">Person List</a>
<a href="${pageContext.request.contextPath}/gavnoList">Gavno List</a>
</table>

</body>

</html>