<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="layout/db_connect.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>골프연습장 회원관리 프로그램</title>
<link rel="stylesheet" type="text/css" href="./css/style.css?ver1.0">
<script type="text/javascript">
    function checkValue() {
        var cv = document.data;

        if (!cv.resist_month.value) {
            alert("수강월이 입력되지 않았습니다!");
            cv.resist_month.focus();
            return false;
        }
        
        if (!cv.c_name.value) {
            alert("회원명이 입력되지 않았습니다!");
            cv.c_name.focus();
            return false;
        }

        if (!cv.class_area.value) {
            alert("강의장소가 입력되지 않았습니다!");
            cv.class_area.focus();
            return false;
        }

        if (!cv.class_name.value) {
            alert("강의명이 입력되지 않았습니다!");
            cv.class_name.focus();
            return false;
        }

        alert("test!");
        
    }

    function autoNo() {
        var cv = document.data;
        var c_name = cv.c_name;

        if (c_name.value === "10001") {
            cv.c_no.value = "10001";
        } else if (c_name.value === "10002") {
            cv.c_no.value = "10002";
        } else if (c_name.value === "10003") {
            cv.c_no.value = "10003";
        } else if (c_name.value === "20001") {
            cv.c_no.value = "20001";
        } else if (c_name.value === "20002") {
            cv.c_no.value = "20002";
        } else {
            cv.c_no.value = "";
        }
    }

    function cal_price() {
        var cv = document.data;
        var price = 0;
        
        if (cv.class_name.value === "100") {
            price = 100000;
        } else if (cv.class_name.value === "200") {
            price = 200000;
        } else if (cv.class_name.value === "300") {
            price = 300000;
        } else if (cv.class_name.value === "400") {
            price = 400000;
        }
        
        if (parseInt(cv.c_no.value) >= 20000) {
            price *= 0.5; 
        }

        var tuition_input = document.querySelector('input[name="tuition"]');
        tuition_input.value = price;
    }




    function rewrite() {
        alert("정보를 지우고 처음부터 다시 입력합니다!");
        location.href = "b.jsp";
    }
    
</script>
</head>
<body>
    <footer>
        <jsp:include page="layout/header.jsp"></jsp:include>
    </footer>
    <nav>
        <jsp:include page="layout/nav.jsp"></jsp:include>
    </nav>
    <main class="section">
        <h2 id="title"><b>수강신청</b></h2>
        <form name="data" method="post" action="b_p.jsp" onsubmit="return checkValue()">
            <table class="table_line" border="1">
                <tr>
                    <th>수강월</th>
                    <td><input type="text" name="resist_month" autofocus>2022년03월 예)202203</td>
                </tr>
                <tr>
                    <th>회원명</th>
                    <td>
                        <select name="c_name" style="float: left;" onchange="autoNo()">
                            <option value="">회원명</option>
                            <option value="10001">홍길동</option>
                            <option value="10002">장발장</option>
                            <option value="10003">임꺽정</option>
                            <option value="20001">성춘향</option>
                            <option value="20002">이몽룡</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>회원번호</th>
                    <td style="text-align: left;"><input type="text" name="c_no" size="" readonly></td>
                </tr>
                <tr>
                    <th>강의장소</th>
                    <td style="text-align: left;"><input type="text" name="class_area"></td>
                </tr>
                <tr>
                    <th>강의명</th>
                    <td>
                        <select name="class_name" style="float: left;" onchange="cal_price()">
                            <option value="">강의신청</option>
                            <option value="100">초급반</option>
                            <option value="200">중급반</option>
                            <option value="300">고급반</option>
                            <option value="400">심화반</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>수강료</th>
                    <td style="text-align: left;"><input type="text" name="tuition" size="" readonly>원</td>
                </tr>
                <tr>
                    <td colspan="3" align="center">
                        <input type="submit" value="수강신청">
                        <input type="button" value="다시쓰기" onclick="rewrite()">
                        <input type="button" value="강사조회" onclick="location.href='a.jsp'">
                    </td>
                </tr>
            </table>
        </form>
    </main>
    <footer>
        <jsp:include page="layout/footer.jsp"></jsp:include>
    </footer>
</body>
</html>