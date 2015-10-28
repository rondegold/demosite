<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
		$('#listCountriesLink').addClass("active");
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
				<c:when test="${sessionScope.countryData eq null}">
					<jsp:forward page="../getcountrydata.do" />
				</c:when>
				<c:otherwise>
					<div class="pagecaption"><c:out value="Welcome Back ${sessionScope.authorized_user.userId}. Here are the countries from our database:" /></div>
				</c:otherwise>
			</c:choose> 
			<table> 
				<tr>
					<td><b>Code</b></td>
					<td><b>Name</b></td>
					<td><b>Continent</b></td>
					<td><b>Region</b></td>
					<td><b>Population</b></td>
					<td><b>Head_Of_State</b></td>
				</tr>
				
				<c:forEach var="country" items="${sessionScope.countryData}">
					<tr>
						<td>${country.code}</td>
						<td>${country.name}</td>
						<td>${country.continent}</td>
						<td>${country.region}</td>
						<td>${country.population}</td>
						<td>${country.headOfState}</td>
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
