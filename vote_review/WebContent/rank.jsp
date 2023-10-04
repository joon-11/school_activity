<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "layout/db_connect.jsp" %>
    <% 
	String sql = "select a.m_no 후보번호, a.m_name 성명, count(b.m_no) 총투표건수 from tbl_member_202005 a, tbl_vote_202005 b where a.m_no = b.m_no and b.v_confirm = 'Y' group by a.m_no, a.m_name order by 총투표건수 desc";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역구의원투표</title>
	<link rel="stylesheet" type="text/css" href="css/style.css?ver9">
</head>
<body>
	<jsp:include page="./layout/header.jsp"></jsp:include>
	<jsp:include page="./layout/nav.jsp"></jsp:include>
	<h2>후보조회</h2>
	<table border="1" style="text-align: center;">
		<tr>
			<td>후보번호</td>
			<td>성명</td>
			<td>총투표건수</td>
		</tr>
		<%while(rs.next()){ %>
		<tr>
			<td><%=rs.getString("후보번호") %></td>
			<td><%=rs.getString("성명") %></td>
			<td><%=rs.getString("총투표건수") %></td>
		</tr>
		<%} %>
	</table>
	<jsp:include page="./layout/footer.jsp"></jsp:include>
</body>
</html>