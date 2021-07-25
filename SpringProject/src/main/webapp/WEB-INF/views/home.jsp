<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" pageEncoding="UTF-8"%>
<%
	/* 메인에 보여질 내용(home.jsp로 데이터 넘겨줌) */
%>
<html>
<head>
<title>Home</title>
</head>
<body>

	<jsp:forward page="main.jsp" />

</body>
</html>
