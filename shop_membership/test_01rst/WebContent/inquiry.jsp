<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file = "db_connect.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쇼핑몰회원관리</title>
	<link rel="stylesheet" type="text/css" href="./css/style.css">
	<script type="text/javascript">
	function checkValue() {
		var cv = document.data
		if(!cv.custno.value){
			alert("회원번호를 입력하세요");
			return false;
		}
	}
	</script>
</head>
<body>
	<jsp:include page="layout/header.jsp"></jsp:include>
	<jsp:include page="layout/nav.jsp"></jsp:include>
	<section id = "section">
		<h2>회원정보조회</h2>
		<form name = "data" method = "post" action="inquiry_p.jsp" onsubmit="return checkValue()" >
			<table border="1">
				<tr>
					<th>회원번호</th>
					<td><input type = "text" name = "custno" ></td>
				</tr>
				<tr>
					<td colspan = "2" align="center">
						<input type = "submit" value = "검색">
						<input type = "button" value = "취소" onclick = "location.href= 'inquiry.jsp'">
					</td>
				</tr>
			</table>
		</form>
		
	</section>
	<jsp:include page="layout/footer.jsp"></jsp:include>
</body>
</html>