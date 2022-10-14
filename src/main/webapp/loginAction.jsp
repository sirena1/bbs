<%--
  Created by IntelliJ IDEA.
  User: handy
  Date: 2022-10-05
  Time: 오후 4:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="user.UserDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userId" />
<jsp:setProperty name="user" property="userPassword" />
<html>
<head>
    <title>JSP 게시판 웹 사이트</title>
</head>
<body>
    <%
        PrintWriter script = response.getWriter();
        script.println("<script>");
        String userId = null;
        if (session.getAttribute("userId") != null) {
            userId = (String) session.getAttribute("userId");
        }
        if ( userId != null) {
            script.println("alert('이미 로그인이 되어있습니다.')");
            script.println("history.back()");
            script.println("location.href = 'main.jsp'");
        }

        UserDAO userDAO = new UserDAO();
        int result = userDAO.login( user.getUserId(), user.getUserPassword());
        if (result == 1) {
            session.setAttribute("userId", user.getUserId());
            script.println("location.href = 'main.jsp'");
        }
        else if (result == 0) {
            script.println("alert('비밀번호가 틀립니다.')");
            script.println("history.back()");
        }
        else if (result == -1) {
            script.println("alert('존재하지 않는 아이디입니다.')");
            script.println("history.back()");
        }
        else if (result == -2) {
            script.println("alert('데이터베이스 오류가 발생했습니다.')");
            script.println("history.back()");
        }
        script.println("</script>");
    %>
</body>
</html>
