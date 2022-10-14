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
<jsp:setProperty name="user" property="userName" />
<jsp:setProperty name="user" property="userGender" />
<jsp:setProperty name="user" property="userEmail" />
<html>
<head>
    <title>JSP 게시판 웹 사이트</title>
</head>
<body>
    <%
        PrintWriter script = response.getWriter();
        script.println("<script>");
        if (user.getUserId() == null || user.getUserPassword() == null || user.getUserName() == null
            || user.getUserGender() == null || user.getUserEmail() == null) {
            script.println("alert('입력 되지 않은 항목이 있습니다..')");
            script.println("history.back()");
        }
        else {

            UserDAO userDAO = new UserDAO();
            int result = userDAO.join(user);
            if (result == -1) {
                script.println("alert('이미 존재하는 아이디입니다.')");
                script.println("history.back()");
            }
            else {
                session.setAttribute("userId", user.getUserId());
                script.println("location.href = 'main.jsp'");
            }
        }
        script.println("</script>");
    %>
</body>
</html>
