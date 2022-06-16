<%@ page import="pkg.test.board.DTO.BoardDTO" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: sniperditto
  Date: 2022/06/14
  Time: 3:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>게시판</title>
</head>
<body>
<%
    List<BoardDTO> boardList = (List<BoardDTO>) request.getAttribute("boardList");
%>


</body>
</html>
