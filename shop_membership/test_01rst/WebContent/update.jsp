<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "db_connect.jsp" %>
<% 
String sql = "select custno, custname, phone, address, to_char(joindate,'yyyy-mm-dd')joindate,grade, city from member_tbl_02 "
        + "where custno = " + request.getParameter("custno");

	PreparedStatement pstmt = conn.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	rs.next();
	
	
	
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
		<h2>쇼핑몰 회원관리</h2>
		<form name = "data" method = "post" action="update_p.jsp" onsubmit = "return checkDel()">
			<table border="1">
				<tr>
					<th>회원번호(자동발생)</th>
					<td><input type = "text" name = "custno" value = <%= rs.getString("custno") %> readonly="readonly"></td>
				</tr>
				<tr>
					<th>회원성명</th>
					<td><input type = "text" name = "custname" value = <%= rs.getString("custname") %>></td>
				</tr>
				<tr>
					<th>회원전화</th>
					<td><input type = "text" name = "phone" value = <%= rs.getString("phone") %>></td>
				</tr>
				<tr>
					<th>회원주소</th>
					<td><input type = "text" name = "address" value = <%= rs.getString("address") %>></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><input type = "text" name = "joindate" value = <%= rs.getString("joindate") %>></td>
				</tr>
				<tr>
					<th>고객등급</th>
					<td><input type = "text" name = "grade" value = <%= rs.getString("grade") %>></td>
				</tr>
				<tr>
					<th>도시코드</th>
					<td><input type = "text" name = "city" value = <%= rs.getString("city") %>></td>
				</tr>
				<tr>
					<td colspan = "2" align="center">
						<input type = "submit" value = "수정" onclick = "document.location.href= 'update.jsp?custno=<%=rs.getString("custno")%>'">
						<input type = "button" value = "조회" onclick ="location.href= 'member_list.jsp'">
						<input type = "button" value = "삭제" onclick = checkDel(<%=rs.getString("custno") %>)>
					</td>
				</tr>
			</table>
		</form>
		
	</section>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>