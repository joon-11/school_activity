<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "db_connect.jsp" %>
<% 
	String sql = "select custno, custname, phone, address, to_char(joindate,'yyyy-mm-dd')joindate, decode(grade, 'A', 'VIP', 'B', '일반', 'C', '직원')grade, city from member_tbl_02 order by custno";
	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰회원관리</title>
	<link rel="stylesheet" type="text/css" href="./css/style.css">
	<script type="text/javascript">
	function checkDel(custno) {
		msg = "삭제하시겠습니까?";
		if(confirm(msg) != 0 ){
			alert("삭제하겠습니까?");			
			location.href = "delete.jsp?custno="+custno;	
		}else{
			alert("삭제가 취소되었습니다");
			return ;
		}
	}
</script>
</head>
<body>
	<jsp:include page="layout/header.jsp"></jsp:include>
	<jsp:include page="layout/nav.jsp"></jsp:include>
	<section id = "section">
		<h2>회원목록조회/수정</h2>
			<table border="1">
				<tr>
					<th>회원번호(자동발생)</th>
					<th>회원성명</th>
					<th>회원전화</th>
					<th>회원주소</th>
					<th>가입일자</th>
					<th>고객등급</th>
					<th>도시코드</th>
					<th>수정 및 삭제</th>
				</tr>
				<%
				while(rs.next()){
				%>
				<tr>
					<th><a href = 'update.jsp?custno=<%=rs.getString("custno")%>' > <%=rs.getString("custno") %></a></th>
					<th><%=rs.getString("custname") %></th>
					<th><%=rs.getString("phone") %></th>
					<th><%=rs.getString("address") %></th>
					<th><%=rs.getString("joindate") %></th>
					<th><%=rs.getString("grade") %></th>
					<th><%=rs.getString("city") %></th>
					<td colspan = "2" align="center">
						<input type = "button" value = "수정" onclick = "document.location.href= 'update.jsp?custno=<%=rs.getString("custno")%>'">
						<input type = "button" value = "삭제" onclick = checkDel(<%=rs.getString("custno") %>)>
						<input type = "button" value = "조회" onclick = "location.href= 'inquiry.jsp'">
					</td>
				</tr>
				
				 <%} %>

			</table>		
	</section>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>