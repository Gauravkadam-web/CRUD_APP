<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.stackninjas.crudapp.auth.model.User" %>

<%
    // Get the logged-in user from session
    User loggedUser = (User) session.getAttribute("loggedUser");
%>

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet">

<div class="container-fluid mt-3 mb-3">
    <div class="d-flex justify-content-end align-items-center gap-3">

        <% if (loggedUser != null) { %>
            <!-- User Icon + Name -->
            <div class="d-flex align-items-center text-muted">
                <i class="bi bi-person-circle fs-5 me-2"></i>
                <span>
                    Welcome,
                    <strong><%= loggedUser.getFullName() %></strong>
                </span>
            </div>

            <!-- Settings Icon -->
            <button type="button" class="btn btn-outline-secondary btn-sm rounded-pill px-3"
                    data-bs-toggle="modal" data-bs-target="#userSettingsModal">
                <i class="bi bi-gear-fill"></i>
            </button>

            <!-- Logout Button -->
            <a href="<%= request.getContextPath() %>/auth?action=logout"
               class="btn btn-outline-danger btn-sm rounded-pill px-3">
                Logout
            </a>

            <!-- User Details Modal -->
            <div class="modal fade" id="userSettingsModal" tabindex="-1" aria-labelledby="userSettingsModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="userSettingsModalLabel">User Details</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <ul class="list-group list-group-flush">
                                <li class="list-group-item"><strong>ID:</strong> <%= loggedUser.getId() %></li>
                                <li class="list-group-item"><strong>Full Name:</strong> <%= loggedUser.getFullName() %></li>
                                <li class="list-group-item"><strong>Username:</strong> <%= loggedUser.getUsername() %></li>
                            </ul>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">Close</button>
                        </div>
                    </div>
                </div>
            </div>
        <% } else { %>
            <!-- Optional: show login link if no user is logged in -->
            <a href="<%= request.getContextPath() %>/auth?action=login"
               class="btn btn-primary btn-sm rounded-pill px-3">
                Login
            </a>
        <% } %>

    </div>
</div>

<!-- Bootstrap JS (required for modal functionality) -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.8/dist/js/bootstrap.bundle.min.js"></script>
