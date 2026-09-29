<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.studentmanagement.model.Student" %>
<%
    List<Student> students = (List<Student>) request.getAttribute("students");
    String message = request.getParameter("message");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student Management System</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<div class="container">
    <div class="header">
        <div>
            <h1>Student Management System</h1>
            <p class="subtitle">Java Servlet + JDBC + MySQL</p>
        </div>
        <a class="btn primary" href="<%= request.getContextPath() %>/students?action=new"
           onclick="event.preventDefault(); window.location.href='<%= request.getContextPath() %>/student-form.jsp';">
            Add Student
        </a>
    </div>

    <% if ("added".equals(message)) { %>
        <div class="alert success">Student added successfully.</div>
    <% } else if ("updated".equals(message)) { %>
        <div class="alert success">Student updated successfully.</div>
    <% } else if ("deleted".equals(message)) { %>
        <div class="alert success">Student deleted successfully.</div>
    <% } else if ("notfound".equals(message)) { %>
        <div class="alert error">Student was not found.</div>
    <% } %>

    <div class="card">
        <h2>All Students</h2>

        <% if (students == null || students.isEmpty()) { %>
            <div class="empty">No students found.</div>
        <% } else { %>
            <div class="table-wrapper">
                <table>
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Department</th>
                        <th>Grade</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <% for (Student student : students) { %>
                        <tr>
                            <td><%= student.getId() %></td>
                            <td><%= student.getName() %></td>
                            <td><%= student.getEmail() %></td>
                            <td><%= student.getDepartment() %></td>
                            <td><span class="grade"><%= student.getGrade() %></span></td>
                            <td>
                                <a class="btn small edit"
                                   href="<%= request.getContextPath() %>/students?action=edit&id=<%= student.getId() %>">
                                    Edit
                                </a>

                                <a class="btn small delete"
                                   href="<%= request.getContextPath() %>/students?action=delete&id=<%= student.getId() %>"
                                   onclick="return confirm('Are you sure you want to delete this student?');">
                                    Delete
                                </a>
                            </td>
                        </tr>
                    <% } %>
                    </tbody>
                </table>
            </div>
        <% } %>
    </div>
</div>

</body>
</html>
