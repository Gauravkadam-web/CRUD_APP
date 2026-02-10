<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Register | Student Management System</title>

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

        .auth-card {
            border-radius: 16px;
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.08);
            border: none;
        }

        .auth-icon {
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

        .auth-title {
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

        .btn-auth {
            background: #5b5cf6;
            border: none;
            border-radius: 10px;
            padding: 10px;
            transition: background-color 0.25s ease;
        }

        .btn-auth:hover {
            background: #4a4af0;
        }
    </style>
</head>

<body>

<div class="container min-vh-100 d-flex align-items-center justify-content-center">
    <div class="col-md-6 col-lg-4">

        <div class="card auth-card p-4">
            <div class="card-body">

                <!-- Header -->
                <div class="text-center mb-4">
                    <div class="auth-icon mb-3">
                        <i class="bi bi-person-plus"></i>
                    </div>
                    <h4 class="auth-title mb-1">Create Account</h4>
                    <small class="text-muted">
                        Fill in the details to register
                    </small>
                </div>

                <!-- Form -->
                <form action="auth" method="post">
                    <input type="hidden" name="action" value="register"/>

                    <div class="mb-3 field">
                        <i class="bi bi-person-badge"></i>
                        <input type="text"
                               name="fullName"
                               class="form-control"
                               placeholder="Full Name"
                               required>
                    </div>

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
                        <button class="btn btn-primary btn-auth">
                            <i class="bi bi-person-check me-1"></i>
                            Register
                        </button>
                    </div>
                </form>

                <!-- Footer -->
                <div class="text-center mt-4">
                    <small class="text-muted">
                        Already have an account?
                        <a href="auth?action=showLogin" class="fw-medium text-decoration-none">
                            Login
                        </a>
                    </small>
                </div>

            </div>
        </div>

    </div>
</div>

</body>
</html>
