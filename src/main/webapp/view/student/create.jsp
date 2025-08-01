<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 7/31/2025
  Time: 2:46 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="student" value="${requestScope.studentEdit}"/>
<c:set var="listGroup" value="${requestScope.listGroup}"/>
<!-- Bootstrap 5 CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<html>
<head>
    <title>Create Student</title>
</head>
<body>
<h2>Create New Student</h2>
<form action="/student/store" method="post">
    <table class="table-primary">
        <div class="row mb-3">
            <label for="inputEmail3" class="col-sm-2 col-form-label text-center fw-bold">Name</label>
            <div class="col-sm-4">
                <input type="email" class="form-control text-center fw-bold " id="inputEmail3">
            </div>
        </div>
        <tr class="table-primary">
            <td class="table-primary text-center fw-bold ">Gender:</td>
            <td>
                <div class="form-check form-check-inline">
                    <input class="form-check-input" type="radio" name="gender" id="radioDefault1" value="1">
                    <label class="form-check-label" for="radioDefault1">
                    Male
                    </label>
                </div>
                <div class="form-check form-check-inline col-sm-4">
                    <input class="form-check-input col-sm-4" type="radio" name="gender" id="radioDefault1" value="2">
                    <label class="form-check-label col-sm-4" for="radioDefault1">
                        Female
                    </label>
                </div>
            </td>

        </tr>
        <div class="row mb-3">
            <label for="inputEmail3" class="col-sm-2 col-form-label text-center fw-bold">Email</label>
            <div class="col-sm-4">
                <input type="email" class="form-control" id="inputEmail3">
            </div>
        </div>
        <div class="row mb-3">
            <label for="inputEmail3" class="col-sm-2 col-form-label text-center fw-bold">Phone</label>
            <div class="col-sm-4">
                <input type="email" class="form-control" id="inputEmail3">
            </div>
        </div>
        <tr class="table-primary">
            <td>
                Group
            </td>
            <td>
                <select name="group_id">
                    <c:forEach var="group" items="${listGroup}">
                        <option value="${group.id}">${group.name}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td></td>
            <td>
                <button class="btn btn-primary" type="submit">Save</button>
                <button class="btn btn-primary" type="reset">Reset</button>
                <a class="btn btn-outline-primary" href="/student">Back</a>
            </td>
        </tr>
    </table>
</form>
<!-- Bootstrap 5 JS + Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
