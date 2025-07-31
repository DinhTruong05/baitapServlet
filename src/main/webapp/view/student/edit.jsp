<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 7/31/2025
  Time: 4:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="student" value="${requestScope.studentEdit}"/>
<c:set var="listGroup" value="${requestScope.listGroup}"/>
<html>
<head>
    <title>Edit Students</title>
</head>
<body>
<h2>Edit Student</h2>
<form action="/student/edit?id=<c:out value="${student.id}"/>" method="post">
    <table>
        <tr>
            <td>
                <label>Name:</label>
            </td>
            <td>
                <input type="text" name="name" value="<c:out value="${student.name}"/>">
            </td>
        </tr>
        <tr>
            <td>
                <label>Group:</label>
            </td>
            <td>
                <input type="radio" name="gender" <c:if test="${student.gender == 1}"> checked </c:if>value="1"> Male
                <input type="radio" name="gender" <c:if test="${student.gender == 2}"> checked </c:if> value="2"> Female
            </td>
        </tr>
        <tr>
            <td>
            <label>Email:</label>
            </td>
            <td>
                <input type="text" name="email" value="<c:out value="${student.email}"/>">
            </td>
        </tr>
        <tr>
            <td>
            <label>Phone:</label>
            </td>
            <td>
                <input type="text" name="phone" value="<c:out value="${student.phone}"/>">
            </td>
        </tr>
        <tr>
            <td>
            <label>Group:</label>
            </td>
            <td>
                <select name="group_id">
                    <c:forEach var="group" items="${listGroup}">
                        <option <c:if test="${student.getGroup().getId() == group.getId()}">selected</c:if> value="<c:out value="${group.getId()}"/>"><c:out value="${group.getName()}"/></option>
                    </c:forEach>
                </select>
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
