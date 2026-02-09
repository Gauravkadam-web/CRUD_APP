<%@ page import="java.util.List" %>
<%@ page import="com.stackninjas.crudapp.model.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
 <jsp:include page="header.jsp" />
<head>
    <title>Student Management System</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
</head>

<body class="bg-light">

<div class="container py-5">

    <!-- Header -->
    <div class="text-center mb-4">
        <h1 class="fw-bold text-primary">MVC CRUD Application</h1>
        <p class="text-muted">Student Management System</p>
    </div>

    <!-- Action Button -->
    <div class="d-flex justify-content-end mb-3">
        <a href="students?action=new" class="btn btn-success">
            <i class="bi bi-plus-circle"></i> Add New Student
        </a>
    </div>
    <% int cnt = 1 ;%>

    <!-- Table Card -->
    <div class="card shadow-sm">
        <div class="card-body p-0">
            <table class="table table-hover table-striped mb-0 text-center align-middle">
                <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Mobile</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>

                <%
                    List<Student> students =
                            (List<Student>) request.getAttribute("students");

                    if (students != null && !students.isEmpty()) {
                        for (Student student : students) {
                %>
                <tr>
                    <td><%= cnt++ %></td>
                    <td class="fw-semibold"><%= student.getName() %></td>
                    <td><%= student.getEmail() %></td>
                    <td><%= student.getMobile() %></td>
                    <td>
                        <a href="students?action=edit&id=<%= student.getId() %>"
                           class="btn btn-sm btn-outline-warning me-1">
                            <i class="bi bi-pencil-square"></i> Edit
                        </a>

                        <a href="students?action=delete&id=<%= student.getId() %>"
                           class="btn btn-sm btn-outline-danger"
                           onclick="return confirm('Are you sure you want to delete this student?');">
                            <i class="bi bi-trash"></i> Delete
                        </a>
                    </td>
                </tr>
                <%
                        }
                    } else {
                %>
                <tr>
                    <td colspan="5" class="text-muted py-4">
                        <i class="bi bi-info-circle"></i> No students found
                    </td>
                </tr>
                <%
                    }
                %>

                </tbody>
            </table>
        </div>
    </div>

    <!-- Footer -->
    <div class="text-center mt-4 text-muted small">
        © 2026 Student Management System
    </div>

</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
