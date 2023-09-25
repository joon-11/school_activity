<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "db_connect.jsp" %>
<% 
	String sql = "select * from member_tbl_02 where custno=" + request.getParameter("custno");
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
		<h2>쇼핑몰 회원관리</h2>
		
			<table border="1">
			
			<%if(rs.next()){ %>
				<tr>
					<th>회원번호(자동발생)</th>
					<td><%=rs.getString("custno") %> </td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><%=rs.getString("custname") %></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><%=rs.getString("phone") %></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><%=rs.getString("address") %></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><%=rs.getString("joindate") %></td>
				</tr>
				<tr>
					<th>고객등급</th>
					<td><%=rs.getString("grade") %></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><%=rs.getString("city") %></td>
				</tr>
				<tr>
					<td colspan = "2" align="center">
						<input type = "button" value = "취소 후 다시조회" onclick = "location.href= 'inquiry.jsp'">
						<input type = "button" value = "회원목록으로" onclick = "location.href= 'member_list.jsp'">
					</td>
				</tr>
				<%}else{ %>
					<tr>
						<th>검색한 번호가 없습니다.</th>
					</tr>
					<tr>
					<td colspan = "2" align="center">
						<input type = "button" value = "취소 후 다시조회" onclick = "location.href= 'inquiry.jsp'">
						<input type = "button" value = "회원목록으로" onclick = "location.href= 'member_list.jsp'">
					</td>
				</tr>
				<%} %>
			</table>

		
	</section>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>