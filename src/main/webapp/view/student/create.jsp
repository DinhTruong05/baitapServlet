<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 7/31/2025
  Time: 2:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Create Student</title>
</head>
<body>
<h2>Create New Student</h2>
<form action="student/store" method="post">
    <table>
        <tr>
            <td>Name:</td>
            <td><input type="text" name="name"></td>
        </tr>
        <tr>
            <td>Gender:</td>
            <td>
            <input type="radio" name="gender" value="1"> Male
            <input type="radio" name="gender" value="2"> Female
            </td>
        </tr>
        <tr>
            <td>Email</td>
            <td><input type="text" name="email"></td>
            </td>
        </tr>
        <tr>
            <td>Phone</td>
            <td><input type="text" name="phone"></td>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <button type="submit">Save</button>
                <button type="reset">Reset</button>
            </td>
        </tr>
    </table>
</form>

</body>
</html>
