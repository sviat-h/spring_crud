<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8"/>
    <title>Person List</title>
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
<h1>Gavno List</h1>

<a href="${pageContext.request.contextPath}/index">Home page</a>
<br>

<br/><br/>
<div>
    <table border="1">
        <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Brat Name</th>
        </tr>
        <c:forEach items="${gavnos}" var="gavno">
            <tr>
                <td>${gavno.firstName}</td>
                <td>${gavno.lastName}</td>
                <td>${gavno.bratName}</td>
            </tr>
        </c:forEach>
    </table>
</div>



</body>

</html>