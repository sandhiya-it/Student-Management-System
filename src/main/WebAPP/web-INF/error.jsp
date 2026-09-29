<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Error - Student Management System</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/css/style.css">
</head>
<body>
<div class="container small-container">
    <div class="card">
        <h1>Something went wrong</h1>
        <div class="alert error">
            <%= request.getAttribute("error") == null
                    ? "An unexpected error occurred."
                    : request.getAttribute("error") %>
        </div>
        <a class="btn primary" href="<%= request.getContextPath() %>/students">Back to Students</a>
    </div>
</div>
</body>
</html>
