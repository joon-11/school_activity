<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/db_connect.jsp" %>
<%@ page import="java.sql.*" %>
<%
try {
	request.setCharacterEncoding("UTF-8");
    String sql = "INSERT INTO tbl_class_202201 VALUES (?, ?, ?, ?, ?)";
    PreparedStatement pstmt = conn.prepareStatement(sql);

    pstmt.setString(1, request.getParameter("resist_month"));
    pstmt.setString(2, request.getParameter("c_no"));
    pstmt.setString(3, request.getParameter("class_area"));
    pstmt.setString(4, request.getParameter("tuition"));
    pstmt.setString(5, request.getParameter("teacher_code"));

    pstmt.executeUpdate();
} catch (Exception e) {
    e.printStackTrace();
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골프연습장 회원관리 프로그램</title>
</head>
<body>
	<jsp:forward page="b.jsp"></jsp:forward>
</body>
</html>