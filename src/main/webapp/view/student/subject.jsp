<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 8/1/2025
  Time: 8:08 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<h2>Danh Sách Môn Hoc</h2>
<a href="/student/createsubject">Add Subject</a>
<table>
    <tr>
        <th>STT</th>
        <th>Name</th>

    </tr>
    <c:forEach items="${requestScope.listSubject}" var="subject">
        <tr>
            <td>${status.index + 1}</td>
            <td><c:out value="${subject.name}"/></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
