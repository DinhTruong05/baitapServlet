<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 7/31/2025
  Time: 2:37 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
  <style>
    table {
      width: 500px;
      border-collapse: collapse;
    }

    tr, td, th {
      border:  1px solid rgba(144, 136, 136, 0.15);
    }
  </style>
</head>
<body>
<h2>Students List</h2>
<form action="/student/search" method="get">
  <input type="text" name="keyword">
  <input type="submit" value="Search">
</form>
<a href="/student/create">Create</a>
<a href="/student/subject">Subject</a>

<table>
  <tr>
    <th>Stt</th>
    <th>Name</th>
    <th>Gender</th>
    <th>Email</th>
    <th>Phone</th>
    <th>Group</th>
    <th>Thao tác</th>
    <th></th>
  </tr>
  <c:forEach items="${requestScope.listStudent}" var="student">
    <tr>
      <td>1</td>
      <td><c:out value="${student.name}"/></td>
      <c:if test="${student.gender == 1 }">
      <td>
        <c:out value="Male"/>
      </td>
      </c:if>
      <c:if test="${student.gender == 2 }">
        <td>
          <c:out value="Female"/>
        </td>
      </c:if>
      <td>${student.email}</td>
      <td>${student.phone}</td>
      <td>${student.getGroup().getName()}</td>
      <td><a href="/student/edit?id=${student.id}">Edit</a></td>
      <td><a href="/student/delete/${student.id}">Delete</a></td>
    </tr>
  </c:forEach>
</table>
</body>
</html>
