/**
 * 
 */
function PicModuleStandard(sentFrom, idPrefix, XMLPath, mTagName, mArticleNumber) {
	
//alert("FUNCTION CALLED");
//test to see if the xml is already loaded from previous call do makePics function if it is.
try{
var mdataTagsAmount = picXmlDoc.getElementsByTagName("mdata").length;

if(mdataTagsAmount > 0){
	makePics(sentFrom, idPrefix, picXmlDoc, mTagName, mArticleNumber);
	return;
}
}catch(e){

}

//if the xml isn't loaded get it and send to the makePicXmlDoc function

  var xmlhttp = new XMLHttpRequest();
  var obj = this;
  xmlhttp.onreadystatechange = function() {
	  
    if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {

    	makePicXmlDoc(sentFrom, idPrefix, xmlhttp, mTagName, mArticleNumber);
    	
    }
  }
  xmlhttp.open("GET", XMLPath, true);
  xmlhttp.send();
  
  //alert("FUNCTION CALLED");




var makePicXmlDoc=function(sentFrom, idPrefix, xmHttplReq, mTagName, mArticleNumber) {
		
  picXmlDoc = xmHttplReq.responseXML;  
  
/* 
  test1 =   picXmlDoc.getElementsByTagName("mdata").length;
  test2 =   picXmlDoc.getElementsByTagName("mdata")[2].getAttribute("tag");
  test3 = picXmlDoc.getElementsByTagName("mdata")[1].getElementsByTagName("marticle").length;
  test4 = picXmlDoc.getElementsByTagName("mdata")[1].getElementsByTagName("marticle")[2].getAttribute("mcaption");
  test5 = picXmlDoc.getElementsByTagName("mdata")[1].getElementsByTagName("marticle")[2].getAttribute("mimg");
  test6 = picXmlDoc.getElementsByTagName("mdata")[1].getElementsByTagName("marticle")[2].childNodes[0].nodeValue;
*/

  makePics(sentFrom, idPrefix, picXmlDoc, mTagName, mArticleNumber);
  
};




var makePics=function(sentFrom, idPrefix, xml, mTagName, mArticleNumber) {
	
	//document.write(mArticleNumber);
	
	
	  if(mTagName == undefined && mArticleNumber ==undefined){
		  
		  getAllArticles(sentFrom, idPrefix, xml);
		  return;
	  }
	  	  
	  if(mTagName != undefined && mArticleNumber == undefined){
		  //document.write("TAG XML AND SECTION NAME SENT");
		  getArticlesFromTagStack(sentFrom, idPrefix, xml, mTagName);
	  }
	  
	  if(mTagName != undefined && mArticleNumber != undefined){
		  //document.write("TAG XML SECTION NAME AND ARTICLE NUMBER SENT");
		  getOneArticleFromTagStack(sentFrom, idPrefix, xml, mTagName, mArticleNumber);
	  }
	  
};




var getOneArticleFromTagStack=function(sentFrom, idPrefix, picxmldoc, mTagName, mArticleNumber)  {
	
};



var getArticlesFromTagStack=function(sentFrom, idPrefix, picxmldoc, mTagName){
	//document.write("I AM HERE getArticlesFromTagStack");
	
	var mdataTags, i;
	picHTML = "";
	mdataTags = picXmlDoc.getElementsByTagName("mdata");
	  for (i = 0; i < mdataTags.length; i++) {
		  if(mdataTags[i].getAttribute("tag") == mTagName){ //xxx
			  var j, marticleTags, mcaptionAttr, mimgAttr,containerId, bottomTx,bottomTxId,mcaptionId,mimageId, idprefx;
			  marticleTags = mdataTags[i].getElementsByTagName("marticle");//xx
			  console.log("article LENTH "+marticleTags.length);//LOG
			  for (j = 0; j < marticleTags.length; j++) {
				  console.log("article "+j);//LOG
				  mcaptionAttr = marticleTags[j].getAttribute("mcaption");//xx
				  mimgAttr = marticleTags[j].getAttribute("mimg");
				  bottomTx = marticleTags[j].childNodes[0].nodeValue;
				  idprefx = idPrefix+j;
				  containerId = idprefx+"_mpiccontainer";
				  mcaptionId = idprefx+"_mcaption";
				  mimageId = idprefx+"_mimage";
				  bottomTxId = idprefx+"_mbottomtext";
				  picHTML += "<div class='mpiccontainer' id='"+containerId+"'><div class='mcaption' id='"+mcaptionId+"'>";
				  picHTML += mcaptionAttr+"</div>"+"<img class='mimage' id='"+mimageId+"' src='"+mimgAttr+"' />";
				  picHTML += "<div class='mbottomtext' id='"+bottomTxId+"'>"+bottomTx+"</div></div>";
				  
			  }	
			  document.getElementById(idPrefix).innerHTML = picHTML;
			  //callback function in place where this class was instantiated to show this class setup complete.
			  sentFrom[idPrefix+"Function"]();
           break;

		  }

	  }
	  
};



var getAllArticles=function(idPrefix, picxmldoc){
	
};

}