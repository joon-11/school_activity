<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "db_connect.jsp" %>
<% 
	request.setCharacterEncoding("UTF-8");

	String sql = "update member_tbl_02 set custname = ?, phone = ?, address = ?, joindate = ?, grade = ?, city = ? where custno= " + request.getParameter("custno");
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1,request.getParameter("custname"));
	pstmt.setString(2,request.getParameter("phone"));
	pstmt.setString(3,request.getParameter("address"));
	pstmt.setString(4,request.getParameter("joindate"));
	pstmt.setString(5,request.getParameter("grade"));
	pstmt.setString(6,request.getParameter("city"));
	
	pstmt.executeUpdate();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰회원관리</title>
	<link rel="stylesheet" type="text/css" href="./css/style.css">

</head>
<body>
	<jsp:forward page="member_list.jsp"></jsp:forward>
</body>
</html>