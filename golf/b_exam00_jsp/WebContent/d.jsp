<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/db_connect.jsp" %>

<%
	String sql = "select a.teacher_code teacher_code, class_name, teacher_name, '￦ '||TO_CHAR(sum(tuition),'FM999,999,999,999') tuition from tbl_teacher_202201 a, tbl_class_202201 b where a.teacher_code = b.teacher_code group by a.teacher_code, class_name, teacher_name order by a.teacher_code";
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
    	<h2 style="text-align: center; padding: 20px;">강의매출현황</h2>
    		<table border="1" style="text-align: center;">
    			<tr>
    				<th>강사코드</th>
    				<th>강의명</th>
    				<th>강사명</th>
    				<th>총매출</th>
    			</tr>
    			<%while(rs.next()){ %>
    			<tr>
    				<td><%=rs.getString("teacher_code") %></td>
    				<td><%=rs.getString("class_name") %></td>
    				<td><%=rs.getString("teacher_name") %></td>
    				<td><%=rs.getString("tuition") %></td>
    			</tr>	
    			<%} %>
    		</table>

    <footer>
        <jsp:include page="layout/footer.jsp"></jsp:include>
    </footer>
</body>
</html>