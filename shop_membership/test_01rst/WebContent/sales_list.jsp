<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "db_connect.jsp" %>
<% 
	String sql = "select a.custno 회원번호,a.custname 회원성명,decode(grade,'A','VIP','B','일반','C','직원') 고객등급,sum(price) 매출 from member_tbl_02 a, money_tbl_02 b where a.custno = b.custno group by a.custname, grade, a.custno order by 매출";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰회원관리</title>
	<link rel="stylesheet" type="text/css" href="./css/style.css">
</head>
<body>
	<jsp:include page="layout/header.jsp"></jsp:include>
	<jsp:include page="layout/nav.jsp"></jsp:include>
	<section id = "section">
		<h2>회원매출조회</h2>
			<table border="1">
				<tr>
					<th>회원번호</th>
					<th>회원성명</th>
					<th>고객등급</th>
					<th>매출</th>
				</tr>
				<%
				while(rs.next()){
				%>
				<tr>
					<th> <%=rs.getString("회원번호") %></th>
					<th><%=rs.getString("회원성명") %></th>
					<th><%=rs.getString("고객등급") %></th>
					<th><%=rs.getString("매출") %></th>
				</tr>
				
				 <%} %>

			</table>		
	</section>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>