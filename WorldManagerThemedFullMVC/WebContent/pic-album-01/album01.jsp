<!DOCTYPE html>
<html><head><title>AngularJS Picture Album</title>
<script src= "http://ajax.googleapis.com/ajax/libs/angularjs/1.3.14/angular.min.js"></script>
<script type="text/javascript" src="../js/jquery-1.10.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/album01.css">
<link rel="stylesheet" type="text/css" href="../css/menubar.css">

<script>
	$().ready(function() {
		var $scrollingDiv = $("#thumb-container");
 
		$(window).scroll(function(){			
			$scrollingDiv
				.stop()
				.animate({"marginTop": ($(window).scrollTop() + 5) + "px"}, 1000 );			
		});
	});
</script>

</head> 
<body style="background-image: url('images/bkground01.jpg');background-size: 100%;">

<div class="fixed-nav">
		<ul style="list-style-type:none; padding:0px; margin:0px 0px 0px 0px;">
			<li id="homeLink"><a href="../index.jsp">Home</a></li>
			<li id="loginLink"><a href="../travel02.jsp">Demo-3</a></li>
			<li id="listCitiesLink"><a href="../travel01.jsp">Demo-2</a></li>
			<li id="travelink01"><a href="../video-app01/video-app01.html">DEMO-1</a></li>
			<li id="listCountriesLink"><a href="http://www.econgaline.com/portfolio/portfoliosite.html" target="_blank">Portfolio</a></li>			
		</ul>
</div>

<div ng-app="albumApp" ng-controller="albumCtrl">

<div id="content">

  <div id="picture-container">
    <div ng-repeat="picItem in thumbArray" class="picture-item" ng-attr-id="{{ 'picture-item-' + $index }}" >       
       <div class="picture-capt"><a name={{thumbArray[$index].anc}}><div class="push"></div>{{thumbArray[$index].capt}}</a></div>
       <img ng-src="{{thumbArray[$index].imag}}" class="picture-img"/>
       <div class='picture-descript'>{{thumbArray[$index].descript}}</div>        
    </div>
  </div>

  <div id="thumb-container">
    <div ng-repeat="thumbItem in thumbArray" class="thumb-item" ng-attr-id="{{ 'thumb-item-' + $index }}" ng-click="thumbClicked($event)" >       
       <!-- <div class="thumb-capt">{{thumbArray[$index].capt}}</div> -->
       <a href={{thumbArray[$index].ancn}}><img ng-src="{{thumbArray[$index].imag}}" class="thumb-img" /></a>
       <!-- <div class='thumb-descript'>{{thumbArray[$index].descript}}</div> -->
               
    </div>
  </div> 

</div>

</div>





<script>
var app = angular.module('albumApp', []);

app.controller('albumCtrl', function($scope) {

$scope.thumbArray = [
{imag:"images/nature04.jpg", thumb:"images/thumb-nature04.jpg", anc:"anneF", ancn:"#anneF", capt:"Anne Frank", descript:"The best remedy for those who are afraid, lonely or unhappy is to go outside, somewhere where they can be quite alone with the heavens, nature and God -- Anne Frank"},
{imag:"images/nature02.jpg", thumb:"images/thumb-nature02.jpg", anc:"maryO", ancn:"#maryO", capt:"Mary Oliver", descript:"Meanwhile the sun and the clear pebbles of the rain are moving across the landscapes, over the prairies and the deep trees,the mountains and the rivers. -- Mary Oliver"},
{imag:"images/nature03.jpg", thumb:"images/thumb-nature03.jpg", anc:"sylviaP", ancn:"#sylviaP", capt:"Sylvia Plath, The Bell Jar", descript:"I felt my lungs inflate with the onrush of scenery-air, mountains, trees, people. I thought, This is what it is to be happy. -- Sylvia Plath, The Bell Jar"},
{imag:"images/nature01.jpg", thumb:"images/thumb-nature01.jpg", anc:"rachelC", ancn:"#rachelC", capt:"Rachel Carson, Silent Spring", descript:"There is something infinitely healing in the repeated refrains of nature -- the assurance that dawn comes after night -- Rachel Carson, Silent Spring"},
{imag:"images/nature05.jpg", thumb:"images/thumb-nature05.jpg", anc:"ebW", ancn:"#ebW", capt:"E.B. White", descript:"I would feel more optimistic about a bright future for man if he spent less time proving that he can outwit Nature and more time tasting her sweetness and respecting her seniority -- E.B. White"},
{imag:"images/nature06.jpg", thumb:"images/thumb-nature06.jpg", anc:"georgeB", ancn:"#georgeB", capt:"George Gordon Byron", descript:"There is society, where none intrudes, By the deep sea, and music in its roar: I love not man the less, but Nature more -- George Gordon Byron"},
{imag:"images/nature07.jpg", thumb:"images/thumb-nature07.jpg", anc:"percyS", ancn:"#percyS", capt:"Percy Bysshe Shelley", descript:"The sunlight claps the earth, and the moonbeams kiss the sea: what are all these kissings worth, if thou kiss not me? -- Percy Bysshe Shelley"},
{imag:"images/nature08.jpg", thumb:"images/thumb-nature08.jpg", anc:"williamS", ancn:"#williamS", capt:"Willam Shakespeare", descript:"I like this place and could willingly waste my time in it.  --  Willam Shakespeare"}
]

$scope.dontShowPic = false;

    $scope.thumbClicked = function($evt) {
       var i;
       var thumbArray = document.getElementsByClassName("thumb-item");
       /*
       var pictureArray = document.getElementsByClassName("picture-item");
       
       for(i=0; i<pictureArray.length; i++){
    	   pictureArray[i].style.display = 'none';
       }
       */
       for(i=0; i<thumbArray.length; i++){
    	   console.log(thumbArray[i].id);
    	   thumbArray[i].style.borderStyle = "none";
    	   if(thumbArray[i].id === $evt.currentTarget.id){
    		   $evt.currentTarget.style.borderStyle = "solid";
    		   $evt.currentTarget.style.borderColor = "yellow";
    	   }
       }


    };
    


});

</script>

</body>
</html>
