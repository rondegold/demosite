function WeatherWidget(){
	
	var rdx = new rdXMLHttpRequest();
	var parDiv;

	this.loadWidget = function(parentDiv, rqurl){
		  parDiv = parentDiv;
		  rdx.makeRequest("GET", rqurl, rdxCallback);
	  }
	  
	function rdxCallback(xmHttplReq){

		  var jasonObj = JSON.parse(xmHttplReq.responseText);
		  var city = jasonObj.query.results.channel.location.city;
		  var region = jasonObj.query.results.channel.location.region;
		  var xstr = jasonObj.query.results.channel.item.description;
		  var xstrImgTag = xstr.match(/<img.*gif.*>/)[0];
		  var imgText = jasonObj.query.results.channel.item.condition.text;
		  var temp = jasonObj.query.results.channel.item.condition.temp;
		  var day1 = jasonObj.query.results.channel.item.forecast[1];
		  var day2 = jasonObj.query.results.channel.item.forecast[2];
		  var day3 = jasonObj.query.results.channel.item.forecast[3];
		  var day4 = jasonObj.query.results.channel.item.forecast[4];
		  var day5 = jasonObj.query.results.channel.item.forecast[5];

		  var htmlStr = '<div class="weather-widget-class">'+
			  '<div class="city-region">'+city+','+region+'</div>'+
			  '<div><div class="temp-degree-num">'+temp+'<span class="sup-script-degrees">'+'o'+'</span>'+'</div>'+'<div class="temp-img-plus-capt"><div>'+xstrImgTag+'</div>'+'<div class="img-capt">'+imgText+'</div></div>'+'</div>'+
			  '<div class="five-day-cont"><ul>'+			
			  '<li>'+day1.day+'<br/>'+day1.high+'<span class="sup-script-degrees">o</span>'+'/'+day1.low+'<span class="sup-script-degrees">o</span>'+'</li>'+
			  '<li>'+day2.day+'<br/>'+day2.high+'<span class="sup-script-degrees">o</span>'+'/'+day2.low+'<span class="sup-script-degrees">o</span>'+'</li>'+
			  '<li>'+day3.day+'<br/>'+day3.high+'<span class="sup-script-degrees">o</span>'+'/'+day3.low+'<span class="sup-script-degrees">o</span>'+'</li>'+
			  '<li>'+day4.day+'<br/>'+day4.high+'<span class="sup-script-degrees">o</span>'+'/'+day4.low+'<span class="sup-script-degrees">o</span>'+'</li>'+
			  '<li>'+day5.day+'<br/>'+day5.high+'<span class="sup-script-degrees">o</span>'+'/'+day5.low+'<span class="sup-script-degrees">o</span>'+'</li>'+			
			  '</ul></div></div>';
		  
		  var ele =  document.createElement("div");
		  ele.innerHTML = htmlStr;
		  //document.getElementById(parDiv).innerHTML = htmlStr;
		 // document.getElementById(parDiv).appendChild(htmlStr);
		  document.getElementById(parDiv).appendChild(ele);

	  }
}