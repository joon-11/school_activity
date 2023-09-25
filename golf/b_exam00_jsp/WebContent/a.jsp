<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/db_connect.jsp" %>

<%
	String sql = "select teacher_code 강사코드, teacher_name 강사명, class_name 강의명, to_char(class_price, 'l999,999,999') 수강료, to_char(substr(teach_resist_date,1,4)||'년'|| substr(teach_resist_date,5,2) || '월' || substr(teach_resist_date,7,2) ||'일')강사자격취득일 from TBL_TEACHER_202201";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./css/style.css?ver2.0">
</head>
<body>
    <footer>
        <jsp:include page="layout/header.jsp"></jsp:include>
    </footer>
    <nav>
        <jsp:include page="layout/nav.jsp"></jsp:include>
    </nav>
    	<h2 style="text-align: center; padding: 20px;">강사조회</h2>
    		<table border="1" style="text-align: center;">
    			<tr>
    				<th>강사코드</th>
    				<th>강사명</th>
    				<th>강의명</th>
    				<th>수강료</th>
    				<th>강사자격취득일</th>
    			</tr>
    			<%while(rs.next()){ %>
    			<tr>
    				<td><%=rs.getString("강사코드") %></td>
    				<td><%=rs.getString("강사명") %></td>
    				<td><%=rs.getString("강의명") %></td>
    				<td><%=rs.getString("수강료") %></td>
    				<td><%=rs.getString("강사자격취득일") %></td>
    			</tr>	
    			<%} %>
    		</table>

    <footer>
        <jsp:include page="layout/footer.jsp"></jsp:include>
    </footer>
</body>
</html>