<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Danh Sách Môn Học</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">Danh Sách Môn Học</h2>
    <div class="mb-3">
        <a href="/student/createsubject" class="btn btn-primary me-2">Thêm Môn Học</a>
        <a href="/student" class="btn btn-secondary">Danh Sách Sinh Viên</a>
    </div>

    <table class="table table-bordered table-hover">
        <thead class="table-dark text-center">
        <tr>
            <th>STT</th>
            <th>Tên Môn Học</th>
            <th colspan="2">Actions</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${requestScope.listSubject}" var="subject" varStatus="status">
            <tr>
                <td>${status.index + 1}</td>
                <td><c:out value="${subject.name}"/></td>
                <td class="text-center">
                    <a href="/student/delete?id=${subject.id}" class="btn btn-sm btn-danger" >Delete</a>
                </td>
            </tr>
        </c:forEach>    
        </tbody>
    </table>
</div>
</body>
</html>
