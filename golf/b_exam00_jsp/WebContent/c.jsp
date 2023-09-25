<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../layout/db_connect.jsp" %>

<%
	String sql = "select substr(resist_month,1,4)||'년'|| substr(resist_month,5,2)||'월' resist_month, a.c_no,  c_name,class_name, class_area,'￦ '||TO_CHAR(tuition, 'FM999,999,999,999') tuition, grade from tbl_class_202201 a, tbl_member_202201 b, tbl_teacher_202201 c where a.c_no = b.c_no and a.teacher_code = c.teacher_code";
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
    	<h2 style="text-align: center; padding: 20px;">회원정보조회</h2>
    		<table border="1" style="text-align: center;">
    			<tr>
    				<th>강사코드</th>
    				<th>회원번호</th>
    				<th>회원명</th>
    				<th>강의명</th>
    				<th>강의장소</th>
    				<th>수강료</th>
    				<th>등급</th>
    			</tr>
    			<%while(rs.next()){ %>
    			<tr>
    				<td><%=rs.getString("resist_month") %></td>
    				<td><%=rs.getString("c_no") %></td>
    				<td><%=rs.getString("c_name") %></td>
    				<td><%=rs.getString("class_area") %></td>
    				<td><%=rs.getString("class_name") %></td>
    				<td><%=rs.getString("tuition") %></td>
    				<td><%=rs.getString("grade") %></td>
    			</tr>	
    			<%} %>
    		</table>

    <footer>
        <jsp:include page="layout/footer.jsp"></jsp:include>
    </footer>
</body>
</html>