/**
 * 
 */

function Odometer(odoImgUrl, odoDigitHeight, odoDigitWidth, numOfHorizontalDigits, container_div){
	
	this.animate = function(num){
		console.log("I AM IN TEST");
		setNumber(num);
	}
	
	var dimgLoaded = 0;
	var numArray = [];// elements set by setNumber(num) function.
	var firstTweenArray = [3,3,4,5,7,9];
	
	var cont_div = document.getElementById(container_div);
	
	var parent_canvas = document.createElement("div");
	parent_canvas.style.height = odoDigitHeight+"px";
	parent_canvas.style.padding = "0px";
	parent_canvas.style.border = "0px";
	parent_canvas.style.overflowY = "hidden";
    //var parent_ctx = parent_canvas.getContext("2d");
    
    var i,j;
    
    // create data storage for the possible y values (populated below) and images used.
    var itemsArray = [];
    for(i=0; i<numOfHorizontalDigits; i++){
    	var obj = new Object();
    	obj.imgObj = {};
    	obj.y_valuesArray = [];
    	itemsArray[i] = obj;
    }
    
	// the data array looks like this - var itemsArray = [{imgObj:{}, y_valuesArray:[]}, {imgObj:{}, y_valuesArray:[]}, {imgObj:{}];
	
	
	var odoDigit = 0;
	
	// set the possible y values in y_valuesArray:[] Array
    for(i=0; i<11; i++){
    	for(j=0; j<itemsArray.length; j++){
    		itemsArray[j].y_valuesArray.push(odoDigit+"px");
    		console.log(itemsArray[j].y_valuesArray[i]);
    	}

    	odoDigit -= odoDigitHeight;
	}
    
    
    // draw the odometer Images to the div at their correct positions
    var xpos = 0;
    for(i=0; i<itemsArray.length; i++){
    	var img = document.createElement("img");
    	img.style.position = "relative";
    	img.style.padding = "0px";
    	img.style.border = "0px";
    	img.style.margin = "0px";
    	//img.style.left = xpos+"px";
    	itemsArray[i].imgObj = img;
    	parent_canvas.appendChild(img);
    	   	
    	itemsArray[i].imgObj.addEventListener("load", loadedFunction, false);
    	
    	img.src = odoImgUrl;
    	xpos += odoDigitWidth;
    	
    	
    	
    }
    
 
    cont_div.appendChild(parent_canvas);
    //setTimeout(testFunction, 5000)
    
    
    function loadedFunction(){
    	//tweenFunction(itemsArray[0].imgObj)
    	dimgLoaded += 1;
    	if(dimgLoaded == numOfHorizontalDigits){// all images loaded.
    		console.log("PICTURES DONE LOADING");
    		//dimgLoaded = 0;
    		gotoTrueZero();
    		setNumber(235789);
    		


    	}
    }
    

    
    
    
    
    
    function setNumber(num){
    	console.log("I AM IN SET NUMBER");
    	// turn number into an array of numbers
    	var numTx = num.toString();
    	var numTxArr = numTx.split("");
    	var i;
    	for(i=0; i<numTxArr.length; i++){
    		numArray[i] = parseInt(numTxArr[i]);
    	}
    	// first tween all images to zero positions (tweenEnd will start a new tween to their final position.
    	//for(i=0; i<itemsArray.length; i++){
    		//tweenFunction(itemsArray[i].imgObj, "-500px", tweenEnd);
    	//}
    	//gotoTrueZero();
    	gotoZero();
    	
    	for(i=0; i<itemsArray.length; i++){
    		var numValue = numArray[i];
    		var tweenNum = itemsArray[i].y_valuesArray[numValue];
    		console.log("OBJ NUM ARRAY VALUE = "+itemsArray[i].y_valuesArray[numValue]);
    		var tweenNumFmt = tweenNum;
    		tweenFunction(itemsArray[i].imgObj, tweenNum, i, 1.5, firstTweenEnd);
    		//var tween2 = TweenMax.to(itemsArray[i].imgObj, 2, {top:tweenNum, onComplete: tweenEnd2});
    	}
    	

    }
    
    
    
    function tweenFunction(digitImg, tweenToNumber, eleNum, speed, completeFunction){
    	//digitImg.style.WebkitFilter= "blur(5px)";//add back for blur
    	var tween = TweenMax.to(digitImg, speed, {top:tweenToNumber, onComplete: completeFunction, ease: Power0.easeNone, onCompleteParams: [digitImg, eleNum]});
    	
    }
    
    
var firstTweenEnd = function(element, eleNum){
	//element.style.WebkitFilter= "blur(0px)";//add back for blur
    	//console.log("eleNum = "+eleNum);
    	//var numValue = numArray[eleNum];
		//var tweenNum = itemsArray[eleNum].y_valuesArray[numValue];
    	//tweenFunction(element, "-500", eleNum, 2, secondTweenEnd);
    	//secondTweenEnd(element, eleNum);
    }
    
    
    var secondTweenEnd = function(element, eleNum){    	
    	gotoTrueZero();
    	var numValue = numArray[eleNum];
		var tweenNum = itemsArray[eleNum].y_valuesArray[numValue];
    	tweenFunction(element, tweenNum, eleNum, 2, thirdTweenEnd);
    }
    
    
    
    
    
    var thirdTweenEnd = function(element, eleNum){
    	//gotoTrueZero();
    }
    
    var fourthTweenEnd = function(){
    	console.log("DO NOTHING");
    }
    
    
    function gotoZero(){
    	var i;
    	for(i=0; i<itemsArray.length; i++){
        		itemsArray[i].imgObj.style.top = "0px";
    	}   	
    }
    
    
    
    function gotoTrueZero(){
    	var i;
    	for(i=0; i<itemsArray.length; i++){
    		//console.log("itemsArray[i].imgObj.style.top = "+itemsArray[i].imgObj.style.top);
    		if(itemsArray[i].imgObj.style.top === "-500px"){
    			console.log("itemsArray = "+i+" is at -500");
        		itemsArray[i].imgObj.style.top = "0px"
        	}
    	}
    	
    }

    
    
}

