<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctp" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>memberIdFind.jsp</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<script>
		'use strict';
		
		function idCheck() {
			let name = $("#name").val();
			let email = $("#email").val();
			
			$.ajax({
				type : "post",
				url : "${ctp}/member/memberIdFind",
				data : {name : name, email : email},
				success : function(res) {
					$("#demo").html(res);
				},
				error : function() {
					alert("전송오류!")
				}
			});
		}
	</script>
</head>
<body>
<jsp:include page="/WEB-INF/views/include/nav.jsp" />
<jsp:include page="/WEB-INF/views/include/slide2.jsp" />
<p><br/></p>
<div class="container">
	<h2>아이디 찾기</h2>
	<p>성명과 이메일을 정확하게 입력해주세요.</p>
	<form method="post">
		<table class="table table-bordered">
			<tr>
				<th>성명</th>
				<td><input type="text" name="name" id="name" class="form-control" required autofocus/></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" name="email" id="email" class="form-control"  required/></td>
			</tr>
			<tr>
				<td colspan="2" class="text-center" >
					<input type="button" onclick="idCheck()"  value="아이디 찾기" class="btn btn-success"/>
				</td>
			</tr>
		</table>
	</form>
	<div id="demo"></div>
</div>
<p><br/></p>
<jsp:include page="/WEB-INF/views/include/footer.jsp" />
</body>
</html>