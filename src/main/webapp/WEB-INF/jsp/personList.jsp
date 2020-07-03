<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML>
<html>
<head>
    <meta charset="UTF-8" />
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
<h1>Person List</h1>

<a href="${pageContext.request.contextPath}/index">Home page</a>
<br>
<br>
<br>

<form action="#">
    <input id="user_name" placeholder="User name">
    <input id="user_login" placeholder="User login">
    <input id="user_email" placeholder="User email">
    <button onclick="createUser()">Create user.</button>
</form>

<br>

<input id="search_field">
<button onclick="searchByLogin()">Search by login</button>
<button onclick="showAllUsers()">Show all users.</button>

<table id="usersList"></table>



<script>
    function showAllUsers() {
        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                var users = JSON.parse(this.responseText);
                var html = '<th>User id</th>\n' +
                    '        <th>User name</th>\n' +
                    '        <th>User login</th>\n' +
                    '        <th>User email</th>\n' +
                    '        <th>Delete</th>';
                for (var i = 0; i < users.length; i++) {
                    var user = users[i];
                    console.log(user);
                    html = html + '<tr><td>' + user.id + '</td>\n' +
                        '        <td>' + user.name + '</td>\n' +
                        '        <td>' + user.login + '</td>\n' +
                        '        <td>' + user.email + '</td>\n' +
                        '        <td><button onclick="deleteUser(' + user.id + ')">Delete</button></td></tr>';
                }
                document.getElementById("usersList").innerHTML = html;
            }
        };
        xhttp.open("GET", "http://localhost:8080/users/findAll", true);
        xhttp.send();
    }

    function searchByLogin() {
        var login = document.getElementById("search_field").value;

        var xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                var user = JSON.parse(this.responseText);

                var html = '<tr>\n'  +
                    '<th>User id</th>\n' +
                    '        <th>User name</th>\n' +
                    '        <th>User login</th>\n' +
                    '        <th>User email</th>\n' +
                    '        </tr>';

                html = html + '<tr><td>' + user.id + '</td>\n' +
                    '        <td>' + user.name + '</td>\n' +
                    '        <td>' + user.login + '</td>\n' +
                    '        <td>' + user.email + '</td></tr>';
                document.getElementById("usersList").innerHTML = html;

            }
        };
        xhttp.open("GET", "http://localhost:8080/users/findByLogin?login="+login, true);
        xhttp.send();
    }

    function deleteUser(userId) {
        var xhttp = new XMLHttpRequest();

        xhttp.open("DELETE", "http://localhost:8080/users/delete/" + userId, true);
        xhttp.send();
    }

    function createUser() {
        var userName = document.getElementById("user_name").value;
        var userLogin = document.getElementById("user_login").value;
        var userEmail = document.getElementById("user_email").value;

        var xmlhttp = new XMLHttpRequest();
        xmlhttp.open("POST", "http://localhost:8080/users/save");
        xmlhttp.setRequestHeader("Content-Type", "application/json");
        xmlhttp.send(JSON.stringify({name: userName, login: userLogin, email: userEmail}));

        loadUsers();
    }
</script>

</body>

</html>