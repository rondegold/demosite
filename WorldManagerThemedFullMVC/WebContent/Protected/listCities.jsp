<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="com.worldmanager.dbmodels.*
    		, com.worldmanager.dbhelpers.*
    		, com.worldmanager.models.*
    		, java.sql.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to the World Manager</title>
  <title>Welcome to the World Manager</title>
  <link rel="stylesheet" type="text/css" href="../css/menubar.css">
  <link rel="stylesheet" type="text/css" href="../css/menubartop.css">
  <link rel="stylesheet" type="text/css" href="../css/menubarhead.css"> 
  <link rel="stylesheet" type="text/css" href="../css/sitestyle.css"> 
  <link rel="stylesheet" type="text/css" href="../css/ui-darkness/jquery-ui-1.10.3.custom.min.css">
  <script type="text/javascript" src="../js/jquery-1.10.2.min.js"></script>
  <script type="text/javascript" src="../js/jquery-ui-1.10.3.custom.min.js" ></script>
  <script type="text/javascript">
	  $(function(){
			$('.addHover').hover(function(){
				$(this).addClass('ui-state-hover');}, 
				function(){
					$(this).removeClass('ui-state-hover');
			});
			
			$('.li[class|="active"]').removeClass("active");
			$('#listCitiesLink').addClass("active");
		});
  </script>
</head>
<body>
<c:import url="../navbarhead.jsp" />
	<c:import url="../header.jsp" />
	<c:import url="../navbarhorizontal.jsp" />
		<c:import url="../navbar.jsp" />
		<div class="content">
			<c:choose>
				<c:when test="${sessionScope.cityData eq null}">
					<jsp:forward page="../getcitydata.do" />
				</c:when>
				<c:otherwise>
					<div class="pagecaption"><c:out value="Welcome Back ${sessionScope.authorized_user.userId}. Here are the cities from our database:" /></div>
				</c:otherwise>
			</c:choose> 
			<table> 
				<tr>
					<td>ID</td>
					<td>NAME</td>
					<td>COUNTRY_CODE</td>
					<td>DISTRICT</td>
					<td>POPULATION</td>
				</tr>
				<c:forEach var="city" items="${sessionScope.cityData}">
					<tr>
						<td>${city.id}</td>
						<td>${city.name}</td>
						<td>${city.countryCode}</td>
						<td>${city.district}</td>
						<td>${city.population}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
			
	<c:import url="../footer.jsp">
		<c:param name="copyrightYear" value="${initParam.copyright}" />
		<c:param name="websiteLink" value="${initParam.weblink}" />
	</c:import>

</body>
</html>

	
	