function getXMLHttpRequest(){
	
	if(window.ActiveXObject){
		
		try {
			
			return new ActiveXObject("Msxml2.XMLHTTP");
			
		} catch (e) {
			
			try {
			
				return new ActiveXObject("Microsoft.XMLHTTP");
				
			} catch (e) {
				return null;
			}
			
		}
		
	}else if(window.XMLHttpRequest){
		
		return new XMLHttpRequest();
		
	}else{
		return null;
	}
	
}

//Ajax 요청,처리
var httpRequest = null;

function sendRequest(url,params,callback,method){
	
	httpRequest = getXMLHttpRequest();
	
	//method 처리
	var httpMethod = method ? method : "GET";
	
	if(httpMethod!="GET" && httpMethod!="POST"){
		
		httpMethod = "GET";
		
	}

	//Params처리
	var httpParams = (params==null || params=="")?null:params;
	
	//url처리
	var httpUrl = url;
	
	if(httpMethod=="GET" && httpParams!=null){
		
		httpUrl += "?" + httpParams;
		
	}
	
	httpRequest.open(httpMethod,httpUrl,true);
	httpRequest.setRequestHeader("Content-type","application/x-www-form-urlencoded");
	httpRequest.onreadystatechange = callback;
	httpRequest.send(httpMethod=="POST"?httpParams:null);
	
}