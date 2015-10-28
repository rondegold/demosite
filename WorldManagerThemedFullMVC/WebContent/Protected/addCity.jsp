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
		$('#addCityLink').addClass("active");
	});
  </script>
</head>
<body>
<c:import url="../navbarhead.jsp" />
	<c:import url="${initParam.baseURL}/header.jsp" />
	<c:import url="../navbarhorizontal.jsp" />
		<c:import url="${initParam.baseURL}/navbar.jsp" />
		<div class="content">
		
			<c:choose>
				<c:when test="${sessionScope.countryCodes eq null}">
					<jsp:forward page="../getcountrycodes.do" />
				</c:when>
				<c:otherwise>
					<div class="pagecaption"><c:out value="Welcome ${sessionScope.authorized_user.userId}. Add a city to database. (TEST: choose USA in dropdown. Also info does not have to be accurate)" /></div>
				</c:otherwise>
			</c:choose> 
			<form action="${initParam.baseURL}/Protected/addnewcity.do" method="post">
				<table border=1 style="width:550px;"> 
					<tr>
						<td>ID</td>
						<td>
							<span>Assigned when added</span>
						</td>
					</tr>
					<tr>
						<td>NAME</td>
						<td>
							<input type="text" name="cityName" style="width:100%;" />
						</td>
					</tr>
					<tr>
						<td>COUNTRY_CODE</td>
						<td>	
							<select name="cityCountryCode" style="width:100%;">
								<option selected>--- Choose One ---</option>
								<c:forEach var="cCode" items="${sessionScope.countryCodes}">
									<option>${cCode}</option>
								</c:forEach>
							</select>
						</td>	
					</tr>
					<tr>
						<td>DISTRICT</td>
						<td><input name="cityDistrict" type="text" style="width:100%;"/>
					</tr>
					<tr>
						<td>POPULATION</td>
						<td><input name="cityPopulation" type="text" style="width:100%;" /></td>
					</tr>
					<tr>
						<td colspan="2" align="right">
							<input type="submit" name="addcity" value="Add City" style="width:200px;"/>
						</td>
					</tr>
				</table>
			</form>
		</div>
		
	<c:import url="${initParam.baseURL}/footer.jsp">
		<c:param name="copyrightYear" value="${initParam.copyright}" />
		<c:param name="websiteLink" value="${initParam.weblink}" />
	</c:import>

</body>
</html>

	

	
	
	
				
	
				