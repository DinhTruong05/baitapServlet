<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
  <title>Student List</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
  <h2 class="text-center mb-4 fw-bold">Students List</h2>

  <!-- Search Form -->
  <form class="d-flex mb-3" action="/student/search" method="get">
    <input class="form-control me-2" type="text" name="keyword" placeholder="Search by name..." aria-label="Search">
    <button class="btn btn-outline-success" type="submit">Search</button>
  </form>

  <!-- Navigation buttons -->
  <div class="mb-3">
    <a href="/student/create" class="btn btn-primary me-2">+ Create</a>
    <a href="/student/subject" class="btn btn-secondary">Subject List</a>
  </div>

  <!-- Student Table -->
  <table class="table table-bordered table-hover align-middle">
    <thead class="table-dark text-center">
    <tr>
      <th>STT</th>
      <th>Name</th>
      <th>Gender</th>
      <th>Email</th>
      <th>Phone</th>
      <th>Group</th>
      <th colspan="2">Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${requestScope.listStudent}" var="student" varStatus="status">
      <tr>
        <td class="text-center">${status.index + 1}</td>
        <td>${student.name}</td>
        <td>
          <c:choose>
            <c:when test="${student.gender == 1}">Male</c:when>
            <c:when test="${student.gender == 2}">Female</c:when>
            <c:otherwise>Other</c:otherwise>
          </c:choose>
        </td>
        <td>${student.email}</td>
        <td>${student.phone}</td>
        <td>${student.group.name}</td>
        <td class="text-center">
          <a href="/student/edit?id=${student.id}" class="btn btn-sm btn-warning">Edit</a>
        </td>
        <td class="text-center">
          <a href="/student/delete?id=${student.id}" class="btn btn-sm btn-danger" >Delete</a>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
