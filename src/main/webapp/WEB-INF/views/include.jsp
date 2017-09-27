<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="${path}/css/signUpFull.css" rel="stylesheet">
<link href="${path}/css/signUpMobile.css" rel="stylesheet">
<link href="${path}/css/timelineFull.css" rel="stylesheet">
<link href="${path}/css/timelineTablet.css" rel="stylesheet">
<link href="${path}/css/timelineMobile.css" rel="stylesheet">
<link href="${path}/css/search.css" rel="stylesheet">
<link href="${path}/css/searchMobile.css" rel="stylesheet">
<link href="${path}/css/header.css" rel="stylesheet">

<style type="text/css">
span.err {
	color: red
}
</style>
<script src="${path}/js/jquery.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="${path}/js/timeline.js"></script>
<script src="${path}/js/timeline_infinitescroll.js"></script>
<script src="${path}/js/signUp.js"></script>
<script src="${path}/js/search.js"></script>
<script src="${path}/js/changeProfile.js"></script>
<script type="text/javascript">
	console.log("header included");
</script>
