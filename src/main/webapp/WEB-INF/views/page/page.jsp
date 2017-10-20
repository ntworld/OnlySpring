<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../sessionChk.jsp"%>
<%@ include file="../include.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Page</title>
<script type="text/javascript">
$(document).ready(function() {
    $('#pageCreate').on('click', pageover);
});

function pageover() {
	if(${page.pid } > 0){
		alert("페이지는 한개만 설정 가능");
	}
}
</script>
</head>
<body class="pageLayout">
	<div id="header"><jsp:include page="../header.jsp"></jsp:include></div>
	<div class="header_hidden"></div>
	<div id="pageContainer">
		<div id="menubar">
			<div id="menubar_left">
				<a>전체 페이지</a> <a>좋아하는 페이지</a>
			</div>
			<div id="menubar_right">
				<a href="${path}/pagemain/${page.pid}">회원님의 페이지</a> <a
					href="${path}/pageCreate" id="pageCreate">페이지 만들기</a>
			</div>
		</div>
		<div id="mainContainer">
		</div>
	</div>
</body>
</html>