<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "layout/db_connect.jsp" %>
    <% 
    request.setCharacterEncoding("UTF-8");
	String sql = "insert into tbl_vote_202005 values(?, ?,?,?,?,?)";
	PreparedStatement pstmt = conn.prepareStatement(sql);

	pstmt.setString(1, request.getParameter("v_jumin"));
	pstmt.setString(2, request.getParameter("v_name"));
	pstmt.setString(3, request.getParameter("m_no"));
	pstmt.setString(4, request.getParameter("v_time"));
	pstmt.setString(5, request.getParameter("v_area"));
	pstmt.setString(6, request.getParameter("v_confirm"));
	
	pstmt.executeUpdate();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역구의원투표</title>
	<link rel="stylesheet" type="text/css" href="css/style.css?ver3">
</head>
<body>
	<jsp:forward page="vote.jsp"></jsp:forward>
</body>
</html>