<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "db_connect.jsp" %>
<% 
	request.setCharacterEncoding("UTF-8");

	String sql = "delete from member_tbl_02 where custno = ?";
	
	PreparedStatement pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1,request.getParameter("custno"));
	
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