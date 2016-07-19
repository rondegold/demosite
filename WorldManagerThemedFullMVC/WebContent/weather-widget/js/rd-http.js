/*
 * Stand alone XMLHttpRequest loader with "you supply" dynamic callback.
 */
function rdXMLHttpRequest(){
	console.log("A new rdXMLHttpRequest was created");
	this.makeRequest = function (type, path, callback){
	   var xmlhttp;
	   if(window.XMLHttpRequest){
	     xmlhttp = new XMLHttpRequest();
	   }else{
		   if(window.ActiveXObject){
			   try{
				   xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			   }
			   catch(e){}
		   }
	   }
	     xmlhttp.onreadystatechange = function() {
		   if (xmlhttp.readyState >= 400) {

		       console.log("AN ERROR OCCURRED");
		       return;
		    	
		   }
		  
	       if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
	    	
	    	   callback(xmlhttp);	    	
	       }
	     }
	     xmlhttp.open(type, path, true);
	     xmlhttp.send()
  }
}

