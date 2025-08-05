<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="listGroup" value="${requestScope.listGroup}" />

<!DOCTYPE html>
<html>
<head>
    <title>Create Student</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="text-center fw-bold mb-4">Create New Student</h2>

    <form action="/student/store" method="post" class="w-75 mx-auto">

        <!-- Name -->
        <div class="mb-3">
            <label for="name" class="form-label fw-bold">Name</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>

        <!-- Gender -->
        <div class="mb-3">
            <label class="form-label fw-bold">Gender</label><br>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="gender" id="male" value="1" required>
                <label class="form-check-label" for="male">Male</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" name="gender" id="female" value="2">
                <label class="form-check-label" for="female">Female</label>
            </div>
        </div>

        <!-- Email -->
        <div class="mb-3">
            <label for="email" class="form-label fw-bold">Email</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>

        <!-- Phone -->
        <div class="mb-3">
            <label for="phone" class="form-label fw-bold">Phone</label>
            <input type="text" class="form-control" id="phone" name="phone" required>
        </div>

        <!-- Group -->
        <div class="mb-3">
            <label for="group_id" class="form-label fw-bold">Group</label>
            <select class="form-select" name="group_id" id="group_id" required>
                <c:forEach var="group" items="${listGroup}">
                    <option value="${group.id}">${group.name}</option>
                </c:forEach>
            </select>
        </div>

        <!-- Buttons -->
        <div class="d-flex gap-2">
            <button type="submit" class="btn btn-success">Save</button>
            <button type="reset" class="btn btn-warning">Reset</button>
            <a href="/student" class="btn btn-secondary">Back</a>
        </div>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
