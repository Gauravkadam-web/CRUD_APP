package com.stackninjas.crudapp.controller;

import com.stackninjas.crudapp.dao.StudentDAO;
import com.stackninjas.crudapp.dao.StudentDAOImpl;
import com.stackninjas.crudapp.exception.StudentDAOException;
import com.stackninjas.crudapp.model.Student;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/students")
public class StudentController extends HttpServlet {

    private StudentDAO studentDAO;

    @Override
    public void init() {
        studentDAO = new StudentDAOImpl();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) action = "list";

        try {
            switch (action) {
                case "new": showStudentForm(request, response);
                    break;
                case "insert": insertStudent(request, response);
                    break;
                case "edit": showEditForm(request, response);
                    break;
                case "update": updateStudent(request, response);
                    break;
                case "delete": deleteStudent(request, response);
                    break;
                default: listStudents(request, response);
            }
        } catch (StudentDAOException e) {
            request.setAttribute("errorMessage",e.getMessage());
            request.setAttribute("errorCause",e.getCause());
            request.setAttribute("errorException",e);

            e.printStackTrace(); //developers logs

            request.getRequestDispatcher("error.jsp").forward(request,response);
        }
    }

    /* ================= DAO METHOD USAGE (EXACT MATCH) ================= */

    private void listStudents(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<Student> students = studentDAO.getAllStudents();
        request.setAttribute("students", students);

        request.getRequestDispatcher("student-list.jsp").forward(request, response);
    }

    private void showStudentForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.getRequestDispatcher("student-form.jsp")
                .forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        Student student = studentDAO.getStudentById(id);

        request.setAttribute("student", student);
        request.getRequestDispatcher("student-form.jsp")
                .forward(request, response);
    }

    private void insertStudent(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        Student student = new Student(
                request.getParameter("name"),
                request.getParameter("email"),
                request.getParameter("mobile")
        );

        studentDAO.insert(student);
        response.sendRedirect("students");
    }

    private void updateStudent(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        Student student = new Student(
                Integer.parseInt(request.getParameter("id")),
                request.getParameter("name"),
                request.getParameter("email"),
                request.getParameter("mobile")
        );

        studentDAO.update(student);
        response.sendRedirect("students");
    }

    private void deleteStudent(HttpServletRequest request, HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(request.getParameter("id"));
        studentDAO.delete(id);

        response.sendRedirect("students");
    }
}
