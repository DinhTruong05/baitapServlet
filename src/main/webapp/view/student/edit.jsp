<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="student" value="${requestScope.studentEdit}"/>
<c:set var="listGroup" value="${requestScope.listGroup}"/>
<html>
<head>
    <title>Edit Student</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">Edit Student</h2>

    <form action="/student/edit?id=<c:out value='${student.id}'/>" method="post">
        <div class="mb-3">
            <label class="form-label">Name:</label>
            <input type="text" name="name" class="form-control" value="<c:out value='${student.name}'/>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Gender:</label><br>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="gender" value="1" <c:if test="${student.gender == 1}">checked</c:if>>
                <label class="form-check-label">Male</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="gender" value="2" <c:if test="${student.gender == 2}">checked</c:if>>
                <label class="form-check-label">Female</label>
            </div>
        </div>

        <div class="mb-3">
            <label class="form-label">Email:</label>
            <input type="email" name="email" class="form-control" value="<c:out value='${student.email}'/>" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Phone:</label>
            <input type="text" name="phone" class="form-control" value="<c:out value='${student.phone}'/>">
        </div>

        <div class="mb-3">
            <label class="form-label">Group:</label>
            <select class="form-select" name="group_id">
                <c:forEach var="group" items="${listGroup}">
                    <option value="${group.id}" <c:if test="${student.group.id == group.id}">selected</c:if>>
                        <c:out value="${group.name}"/>
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="d-flex gap-2">
            <button type="submit" class="btn btn-primary">Save</button>
            <button type="reset" class="btn btn-secondary">Reset</button>
            <a href="/student" class="btn btn-outline-dark">Back</a>
        </div>
    </form>
</div>

<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
