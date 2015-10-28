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
  <script type="text/javascript" src="module_html_injections.js"></script>

  
  
  
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
	//load pic module
	  var pcm = new PicModuleStandard(this, "firstdemo", "module.xml", "world01");
  }
  
//call back function ([ group id+Function ] that is second argument + 'Function' appended) from module indicates cards are loaded. We can now target any card with JS.
  function firstdemoFunction(){
	//alert("CALL BACK CALLED");
	 // Individual card elements can be targeted by using their id, gotten by appending the group id (second argument) plus the card order number plus the targeted element class name.	 
	  document.getElementById("firstdemo0_mbottomtext").innerHTML = trav1_htmStr0;
	  
	  document.getElementById("firstdemo1_mbottomtext").innerHTML = trav1_htmStr1;
	  
	  document.getElementById("firstdemo2_mbottomtext").innerHTML = trav1_htmStr2;
  }
  
  //LIST OF ELEMENTS CLASS NAMES
  // using these will affect all pic modules. Good for styling all pic modules all at once (theme).
  // mpiccontainer -- full background of pic module
  // mcaption ------- first set of text, usually used as short 
  // mimage  -------- pic module image
  // mbottomtext ---- second set of text usually used as description
  
  </script>
</head>
<body>
<c:import url="navbarhead.jsp" />
	<c:import url="header.jsp" />
	<c:import url="navbarhorizontal.jsp" />
    <c:import url="navbar.jsp" />

	    
		
		<div class="content">
		
			<h1 class="altheader">|</h1> 
			<div class="homecaption"><span class="site-color-green-hilight">Created (coded - no framework) a JAVASCRIPT and XML IMAGE-TEXT-MODULE (seen below and elsewhere on site)</span>
			<ul>
               <li>Modules are very easy to add to web page, with very little code, even by a non-programmer</li>
               <li>Modules can be added to web page singularly or in a group</li>
               <li>Modules can be dynamically removed and added to web page without reloading page</li>
               <li>Modules can contain any size images and any amount of text, and styled with CSS for a fully customized look</li>
               <li>Styles can be added to individual Modules or a group of Modules</li>
               <li>Other HTML elements like links and lists can be added to module making it very versatile</li>
            </ul>  
            </div>
			<c:if test="${sessionScope.authorized_user ne null}">
				<!-- <h3><c:out value="${sessionScope.authorized_user.userId}" /></h3> -->
			</c:if>
			 
		<!-- <c:if test="${sessionScope.authorized_user eq null}">
				<c:out value="Returning users login" />
						<a href="login.jsp">here</a>
			</c:if> -->
			 
			<div id="firstdemo" class="module-container">		
            <!-- images loaded dynamically here 'firstdemo' (id) - is the second argument of PicModuleStandard(this, "firstdemo", "module.xml", "world01")-->
            <!-- individual cards can be targeted with their ids 'firstdemo1', 'firstdemo2', 'firstdemo3' etc. Cards are also automatically loaded into the div with id "firstdemo"  (or what ever string you use for second argument--> 
            <!-- "world01" in this case is the value of the tag attribute in the XML nodes subset to be targeted and is the last argument-->
                        
           </div>
           
           
		</div>
			
	<c:import url="footer.jsp">
		<c:param name="copyrightYear" value="${initParam.copyright}" />
		<c:param name="websiteLink" value="${initParam.weblink}" />
	</c:import>

</body>
</html>