<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 8/1/2025
  Time: 8:17 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="/student/createsubject" method="post">
    <table>
        <tr>
            <td>Name:</td>
            <td><input type="text" name="name" required></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <button type="submit">Save</button>
                <button type="reset">Reset</button>
                <a href="/student/subject">Back</a>
            </td>
        </tr>
    </table>
</form>

</body>
</html>
