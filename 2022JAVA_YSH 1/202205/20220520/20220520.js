this.dataFunc = function(){
	var strJson = "";
	strJson += "{";
	for(var i=0;this.vars.length;i++){
		strJson += "\""+this.vars[i]+"\"";
		strJson += ":";
		strJson += "\""+this.params[i]+"\"";
		
		if(i != vars.length-1){
			strJson += ",";
		}
		
	}
	strJson += "}";
	
	alert(strJson);
	
	var obj = JSON.parse(strJson);
	this.data = obj;
	//return obj;
};