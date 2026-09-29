<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="com.studentmanagement.model.Student" %>
<%
    Student student = (Student) request.getAttribute("student");
    boolean editMode = Boolean.TRUE.equals(request.getAttribute("editMode"));
    String error = (String) request.getAttribute("error");

    if (student == null) {
        student = new Student();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title><%= editMode ? "Edit Student" : "Add Student" %></title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>

<div class="container small-container">
    <div class="header">
        <h1><%= editMode ? "Edit Student" : "Add Student" %></h1>
        <a class="btn secondary" href="<%= request.getContextPath() %>/students">Back to Students</a>
    </div>

    <% if (error != null) { %>
        <div class="alert error"><%= error %></div>
    <% } %>

    <form method="post" action="<%= request.getContextPath() %>/students" class="student-form">
        <input type="hidden" name="action" value="<%= editMode ? "update" : "add" %>">

        <label for="id">Student ID</label>
        <input id="id" type="number" name="id"
               value="<%= student.getId() == 0 ? "" : student.getId() %>"
               <%= editMode ? "readonly" : "" %> required>

        <label for="name">Name</label>
        <input id="name" type="text" name="name"
               value="<%= student.getName() == null ? "" : student.getName() %>"
               maxlength="100" required>

        <label for="email">Email</label>
        <input id="email" type="email" name="email"
               value="<%= student.getEmail() == null ? "" : student.getEmail() %>"
               maxlength="150" required>

        <label for="department">Department</label>
        <select id="department" name="department" required>
            <option value="">Select Department</option>
            <option value="CSE" <%= "CSE".equals(student.getDepartment()) ? "selected" : "" %>>CSE</option>
            <option value="IT" <%= "IT".equals(student.getDepartment()) ? "selected" : "" %>>IT</option>
            <option value="ECE" <%= "ECE".equals(student.getDepartment()) ? "selected" : "" %>>ECE</option>
            <option value="EEE" <%= "EEE".equals(student.getDepartment()) ? "selected" : "" %>>EEE</option>
            <option value="MECH" <%= "MECH".equals(student.getDepartment()) ? "selected" : "" %>>MECH</option>
            <option value="CIVIL" <%= "CIVIL".equals(student.getDepartment()) ? "selected" : "" %>>CIVIL</option>
        </select>

        <label for="grade">Grade</label>
        <select id="grade" name="grade" required>
            <option value="">Select Grade</option>
            <option value="A+" <%= "A+".equals(student.getGrade()) ? "selected" : "" %>>A+</option>
            <option value="A" <%= "A".equals(student.getGrade()) ? "selected" : "" %>>A</option>
            <option value="B+" <%= "B+".equals(student.getGrade()) ? "selected" : "" %>>B+</option>
            <option value="B" <%= "B".equals(student.getGrade()) ? "selected" : "" %>>B</option>
            <option value="C" <%= "C".equals(student.getGrade()) ? "selected" : "" %>>C</option>
        </select>

        <button class="btn primary" type="submit">
            <%= editMode ? "Update Student" : "Add Student" %>
        </button>
    </form>
</div>

</body>
</html>
