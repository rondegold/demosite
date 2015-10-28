<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <meta property="og:image" content="http://sofistitech.com/WorldManagerThemedFullMVC/images/meta_og_img01.jpg" />
  <title>World JavaEE7 Sample</title>
  <link rel="stylesheet" type="text/css" href="css/menubar.css">
  <link rel="stylesheet" type="text/css" href="css/menubartop.css">
  <link rel="stylesheet" type="text/css" href="css/menubarhead.css"> 
  <link rel="stylesheet" type="text/css" href="css/sitestyle.css"> 
  <link rel="stylesheet" type="text/css" href="css/ui-darkness/jquery-ui-1.10.3.custom.min.css">
  
  
  <link rel="stylesheet" type="text/css" href="css/picmodule.css" >
  <script type="text/javascript" src="js/picmodule01.js"></script>

  
  
  
  <script type="text/javascript" src="js/jquery-1.10.2.min.js"></script>
  <script type="text/javascript" src="js/jquery-ui-1.10.3.custom.min.js" ></script>
  <script type="text/javascript">
/*
  $(function(){
		$('.addHover').hover(function(){
			$(this).addClass('ui-state-hover');}, 
			function(){
				$(this).removeClass('ui-state-hover');
		});
		
		$('.li[class|="active"]').removeClass("active");
		$('#homeLink').addClass("active");
	});
  
  */
  window.onload = function(){
	 // document.getElementById("imageLoader").innerHTML = loadPicModule("mytravel", "module.xml", "home");
	 loadPicModule("mytravel", "module.xml", "caribbean");
	  //alert(hs);
  }
  </script>
</head>
<body>
<c:import url="navbarhead.jsp" />
	<c:import url="header.jsp" />
	<c:import url="navbarhorizontal.jsp" />
<c:import url="navbar.jsp" />

	    
		
		<div class="content">
		
			<h1 class="altheader">|</h1> 
			<div class="homecaption">A demo by Ronald DeSilva showing skills in JEE best practices for JAVA SERVLETS, JSP, 
JSTL, EL, FILTERS, SESSIONS, COOKIES, WEB SECURITY,
TOMCAT, MYSQL DATABASE, SQL, HTML5, CSS, JQUERY, MVC-PATTERN. <br/>Click on the side menu to see tables filled with data using the above techniques.</div>
			<c:if test="${sessionScope.authorized_user ne null}">
				<!-- <h3><c:out value="${sessionScope.authorized_user.userId}" /></h3> -->
			</c:if>
			 
		<!-- <c:if test="${sessionScope.authorized_user eq null}">
				<c:out value="Returning users login" />
						<a href="login.jsp">here</a>
			</c:if> -->
			 
			<div id="mytravel">		
            <!-- images loaded dynamically here 'mytravel' is the first argument of loadPicModule("mytravel", "module.xml", "home")-->
            <!-- 'mytravel1', 'mytravel2', 'mytravel3' etc can also be used for the div id for the container of the 'image-cards'-->
                        
           </div>
           
           
		</div>
			
	<c:import url="footer.jsp">
		<c:param name="copyrightYear" value="${initParam.copyright}" />
		<c:param name="websiteLink" value="${initParam.weblink}" />
	</c:import>

</body>
</html>