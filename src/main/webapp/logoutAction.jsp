<%@ page import="java.io.PrintWriter" %>
<%@ page import="user.UserDAO" %><%--
  Created by IntelliJ IDEA.
  User: handy
  Date: 2022-10-05
  Time: 오후 4:02
  To change this template use File | Settings | File Templates.
--%>
<html>
<head>
    <title>JSP 게시판 웹 사이트</title>
</head>
<body>
    <%
        session.invalidate();
    %>
    <script>
        location.href = "main.jsp";
    </script>
</body>
</html>
