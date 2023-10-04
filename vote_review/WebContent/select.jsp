<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="layout/db_connect.jsp"%>
<% 
	String sql = "select m_no, m_name, decode(a.p_code,'P1','A정당','P2','B정당','P3','C정당','P4','D정당','P5','E정당', a.p_code)p_code, decode(p_school, 1, '고졸', 2, '학사', 3, '석사') 학력, to_char(substr(m_jumin, 1,6)||'-'||substr(m_jumin, 7,7))주민번호, m_city, to_char(b.p_tel1||'-'||b.p_tel2||'-'||b.p_tel3)전화번호 from tbl_member_202005 a, tbl_party_202005 b where a.p_code = b.p_code";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역구의원투표</title>
<link rel="stylesheet" type="text/css" href="css/style.css?ver13">
</head>
<body>
	<jsp:include page="./layout/header.jsp"></jsp:include>
	<jsp:include page="./layout/nav.jsp"></jsp:include>
	<h2>후보조회</h2>
	<table border="1" style="text-align: center;">
		<tr>
			<td>후보번호</td>
			<td>성명</td>
			<td>소속정당</td>

			<td>학력</td>
			<td>주민번호</td>
			<td>지역구</td>
			<td>대표전화</td>
		</tr>
		<%while(rs.next()){ %>
		<tr>
			<td><%=rs.getString("m_no") %></td>
			<td><%=rs.getString("m_name") %></td>
			<td><%=rs.getString("p_code") %></td>
			<td><%=rs.getString("학력") %></td>
			<td><%=rs.getString("주민번호") %></td>
			<td><%=rs.getString("m_city") %></td>
			<td><%=rs.getString("전화번호") %></td>
		</tr>
		<%} %>
	</table>
	<jsp:include page="./layout/footer.jsp"></jsp:include>
</body>
</html>