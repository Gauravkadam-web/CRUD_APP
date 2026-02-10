<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Login | Student Management System</title>

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Bootstrap Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            background-color: #f6f7fb;
            background-image: radial-gradient(#e3e6ef 1px, transparent 1px);
            background-size: 20px 20px;
        }

        .login-card {
            border-radius: 16px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.08);
            border: none;
        }

        .login-icon {
            width: 56px;
            height: 56px;
            background: #e9f0ff;
            color: #4f46e5;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 28px;
            margin: 0 auto;
        }

        .login-title {
            color: #111827;
            font-weight: 600;
        }

        /* Field wrapper */
        .field {
            position: relative;
        }

        /* Embedded icon */
        .field i {
            position: absolute;
            top: 50%;
            left: 14px;
            transform: translateY(-50%);
            color: #9ca3af;
            font-size: 16px;
            pointer-events: none;
            transition: color 0.25s ease;
        }

        /* Input */
        .form-control {
            border-radius: 10px;
            padding: 12px 12px 12px 42px;
            transition:
                border-color 0.25s ease,
                box-shadow 0.25s ease,
                background-color 0.25s ease;
        }

        /* Inside focus transition */
        .form-control:focus {
            border-color: #5b5cf6;
            box-shadow: inset 0 0 0 1px #5b5cf6;
            background-color: #fafbff;
        }

        .form-control:focus-visible {
            outline: none;
        }

        /* Icon reacts on focus */
        .field:focus-within i {
            color: #5b5cf6;
        }

        .btn-login {
            background: #5b5cf6;
            border: none;
            border-radius: 10px;
            padding: 10px;
            transition: background-color 0.25s ease;
        }

        .btn-login:hover {
            background: #4a4af0;
        }
    </style>
</head>

<body>

<div class="container min-vh-100 d-flex align-items-center justify-content-center">
    <div class="col-md-6 col-lg-4">

        <div class="card login-card p-4">
            <div class="card-body">

                <!-- Header -->
                <div class="text-center mb-4">
                    <div class="login-icon mb-3">
                        <i class="bi bi-person"></i>
                    </div>
                    <h4 class="login-title mb-1">Welcome Back</h4>
                    <small class="text-muted">
                        <i class="bi bi-shield-lock me-1"></i> Sign in to continue
                    </small>
                </div>

                <!-- Messages -->
                <%
                    String error = request.getParameter("error");
                    String success = request.getParameter("success");
                    String logout = request.getParameter("logout");
                %>

                <% if ("invalid".equals(error)) { %>
                    <div class="alert alert-danger py-2 small text-center">
                        Invalid username or password
                    </div>
                <% } %>

                <% if ("registered".equals(success)) { %>
                    <div class="alert alert-success py-2 small text-center">
                        Account created successfully
                    </div>
                <% } %>

                <% if ("true".equals(logout)) { %>
                    <div class="alert alert-secondary py-2 small text-center">
                        Logged out successfully
                    </div>
                <% } %>

                <!-- Form -->
                <form action="auth" method="post">
                    <input type="hidden" name="action" value="login"/>

                    <div class="mb-3 field">
                        <i class="bi bi-person"></i>
                        <input type="text"
                               name="username"
                               class="form-control"
                               placeholder="Username"
                               required>
                    </div>

                    <div class="mb-4 field">
                        <i class="bi bi-lock"></i>
                        <input type="password"
                               name="password"
                               class="form-control"
                               placeholder="Password"
                               required>
                    </div>

                    <div class="d-grid">
                        <button class="btn btn-primary btn-login">
                            <i class="bi bi-box-arrow-in-right me-1"></i>
                            Login
                        </button>
                    </div>
                </form>

                <!-- Footer -->
                <div class="text-center mt-4">
                    <small class="text-muted">
                        Don’t have an account?
                        <a href="auth?action=showRegister" class="fw-medium text-decoration-none">
                            Register
                        </a>
                    </small>
                </div>

            </div>
        </div>

    </div>
</div>

</body>
</html>
