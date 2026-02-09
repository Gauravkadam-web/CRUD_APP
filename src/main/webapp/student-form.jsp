<%@ page import="com.stackninjas.crudapp.model.Student" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Student Form</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

</head>
<body class="bg-light">

<%
    Student student = (Student) request.getAttribute("student");
    boolean isEdit = (student != null);
%>

<div class="container py-5">

    <!-- Page Title -->
    <div class="text-center mb-4">
        <h1 class="fw-bold text-primary">MVC CRUD APPLICATION</h1>
        <p class="text-muted">
            <%= isEdit ? "Edit Student Details" : "Add New Student" %>
        </p>
    </div>

    <!-- Form Card -->
    <div class="row justify-content-center">
        <div class="col-md-6">

            <div class="card shadow-sm border-0">
                <div class="card-header bg-primary text-white text-center">
                    <h4 class="mb-0">
                        <%= isEdit ? "Update Student" : "Add Student" %>
                    </h4>
                </div>

                <div class="card-body p-4">

                    <form action="students" method="post">

                        <!-- Action -->
                        <input type="hidden" name="action"
                               value="<%= isEdit ? "update" : "insert" %>">

                        <!-- ID for Edit -->
                        <% if (isEdit) { %>
                            <input type="hidden" name="id" value="<%= student.getId() %>">
                        <% } %>

                        <!-- Name -->
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Full Name</label>
                            <input type="text"
                                   name="name"
                                   class="form-control"
                                   placeholder="Enter full name"
                                   value="<%= isEdit ? student.getName() : "" %>"
                                   required>
                        </div>

                        <!-- Email -->
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Email</label>
                            <input type="email"
                                   name="email"
                                   class="form-control"
                                   placeholder="Enter email address"
                                   value="<%= isEdit ? student.getEmail() : "" %>"
                                   required>
                        </div>

                        <!-- Mobile -->
                        <div class="mb-4">
                            <label class="form-label fw-semibold">Mobile</label>
                            <input type="text"
                                   name="mobile"
                                   class="form-control"
                                   placeholder="Enter mobile number"
                                   value="<%= isEdit ? student.getMobile() : "" %>"
                                   required>
                        </div>

                        <!-- Buttons -->
                        <div class="d-flex justify-content-between">
                            <a href="students" class="btn btn-outline-secondary">
                                Cancel
                            </a>

                            <button type="submit" class="btn btn-primary px-4">
                                <%= isEdit ? "Update Student" : "Add Student" %>
                            </button>
                        </div>

                    </form>

                </div>
            </div>

        </div>
    </div>

</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
