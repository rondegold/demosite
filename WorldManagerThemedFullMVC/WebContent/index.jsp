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

  $(function(){
		$('.addHover').hover(function(){
			$(this).addClass('ui-state-hover');}, 
			function(){
				$(this).removeClass('ui-state-hover');
		});
		
		$('.li[class|="active"]').removeClass("active");
		$('#homeLink').addClass("active");
	});
  
  
  window.onload = function(){
	  //load pic module
	  var pcm = new PicModuleStandard(this, "mytravel", "module.xml", "home");
  }
  
//call back function ([ tag+Function ] that is second argument + 'Function' appended) from module indicates cards are loaded. We can now target any card with JS.
  function mytravelFunction(){
	 //alert("CALL BACK CALLED"); 
  }
  </script>
</head>
<body>
<div  class="fullbodycontainer"> 
<div class="allnavs">
    <c:import url="navbarhead.jsp" />
	<c:import url="header.jsp" />
	<c:import url="navbarhorizontal.jsp" />
    <c:import url="navbar.jsp" />
</div>
		

		<div class="content">
		
<h1 class="altheader">|</h1>
			<div class="homecaption">Demo by Ronald DeSilva- This site Implement skills in best practices for HTML5, JAVASCRIPT, JEE7, JAVA SERVLETS, JSP, 
JSTL, EL, FILTERS, SESSIONS, COOKIES, WEB SECURITY, TOMCAT, MYSQL DATABASE, SQL, XML, CSS, JQUERY, MVC-PATTERN. <br/><span class="site-color-green-hilight">Click on 'View Cities' to see tables with data from MYSQL database using JEE7, or DEMO-1-2 for JavaScript HTML5 demo.</span>
           </div>
			
			<!-- <c:if test="${sessionScope.authorized_user ne null}"> -->
				<!-- <h3><c:out value="${sessionScope.authorized_user.userId}" /></h3> -->
			<!-- </c:if> -->
			 
		<!-- <c:if test="${sessionScope.authorized_user eq null}"> -->
			<!-- <c:out value="Returning users login" /> -->
						<!-- <a href="login.jsp">here</a> -->
			<!-- </c:if> -->
			 
			<div id="mytravel" class="module-container">		
            <!-- images loaded dynamically here 'mytravel' (id) - is the second argument of PicModuleStandard(this, "mytravel", "module.xml", "home")-->
            <!-- individual cards can be targeted with their ids 'mytravel1', 'mytravel2', 'mytravel3' etc. Cards are also automatically loaded into the div with id "mytravel"  (or what ever string you use for second argument--> 
            <!-- "home" in this case is  the value of the tag attribute in the XML nodes subset to be targeted and is the last argument -->           
           </div>
		</div>
			
	<c:import url="footer.jsp">
		<c:param name="copyrightYear" value="${initParam.copyright}" />
		<c:param name="websiteLink" value="${initParam.weblink}" />
	</c:import>
	
</div>
</body>
</html>
