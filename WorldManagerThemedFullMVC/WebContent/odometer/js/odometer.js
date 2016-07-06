/**
 * 
 */

function Odometer(odoImgUrl, odoDigitHeight, odoDigitWidth, numOfHorizontalDigits, container_div){
	
	var dimgLoaded = 0;
	
	var cont_div = document.getElementById(container_div);
	
	var parent_canvas = document.createElement("canvas");
    var parent_ctx = parent_canvas.getContext("2d");
    
    var i,j;
    
    // create data storage for the possible y values (populated below) and images used.
    var itemsArray = [];
    for(i=0; i<numOfHorizontalDigits; i++){
    	var obj = new Object();
    	obj.imgObj = {};
    	obj.y_valuesArray = [];
    	itemsArray[i] = obj;
    }
    
	//var itemsArray = [{imgObj:{}, y_valuesArray:[]}, {imgObj:{}, y_valuesArray:[]}, {imgObj:{}, y_valuesArray:[]}, {imgObj:{}, y_valuesArray:[]}, {imgObj:{}, y_valuesArray:[]}, {imgObj:{}, y_valuesArray:[]}];
	
	
    parent_canvas.width = odoDigitWidth * itemsArray.length;
    parent_canvas.height = odoDigitHeight;
	
	var odoDigit = 0;
	
	// set the possible y values in y_valuesArray:[] Array
    for(i=0; i<11; i++){
    	for(j=0; j<itemsArray.length; j++){
    		itemsArray[j].y_valuesArray.push(odoDigit);
    		console.log(odoDigit);
    	}

    	odoDigit -= odoDigitHeight;
	}
    
    
    // draw the odometer Images to the canvas at their correct positions
    var xpos = 0;
    for(i=0; i<itemsArray.length; i++){
    	var img = new Image();
    	img.src = odoImgUrl;
    	itemsArray[i].imgObj = img;
    	itemsArray[i].imgObj.addEventListener("load", (function(){
        	parent_ctx.drawImage(itemsArray[i].imgObj,xpos,0);
        	dimgLoaded += 1;
        	console.log("IMAGES LOADED = "+dimgLoaded);
        	if(dimgLoaded == numOfHorizontalDigits){
        		//testFunction();
        	}
        })(), false);
    	
    	xpos += odoDigitWidth;
    	
    	
    	
    }
    
 
    cont_div.appendChild(parent_canvas);
    setTimeout(testFunction, 5000)
    
    
    function testFunction(){
    	console.log("PICTURES DONE LOADING");
    	tweenFunction(itemsArray[0].imgObj)
    }
    
    function tweenFunction(digitImg){
    	console.log("IN TWEEN FUNCTION");
    	/*
    	var tween = TweenMax.to(digitImg, 2, {
    		 y: 150,
    		 opacity:.5,
    		 delay: 2,
    		 onComplete: tweenEnd,
    		 //onCompleteParams: [element, 'param2']
    		});
    	*/
    	TweenMax.to(digitImg, 2, {left:"54px", backgroundColor:"black", borderBottomColor:"#90e500", color:"white"});
    }
    
    
    
    var tweenEnd = function(){
    	console.log("TWEEN DONE");
    }

    
    
}






