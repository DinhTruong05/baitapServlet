<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Thêm Môn Học</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">Thêm Môn Học</h2>

    <form action="/student/createsubject" method="post" class="w-50">
        <div class="mb-3">
            <label for="name" class="form-label">Tên Môn Học:</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>

        <div class="d-flex gap-2">
            <button type="submit" class="btn btn-success">Lưu</button>
            <button type="reset" class="btn btn-warning">Làm lại</button>
            <a href="/student/subject" class="btn btn-secondary">Quay lại</a>
        </div>
    </form>
</div>
</body>
</html>
