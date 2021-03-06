/*
 * 		최초작성 20220520
*		작성자	유승화
*		설명
*		수정내역
*		------------------------------------
*		
*		------------------------------------
 */

var getAjaxObj = function(url, type, async, dataType, success, error, vars, params){
		this.url = url;
		this.data = null;
		this.type = type;
		this.async = async;
		this.dataType = dataType;
		this.success = success;
		this.error = error;
		this.vars = vars;
		this.params = params;
		this.dataFunc = function(){
			var strJson = "";
			strJson += "{";
			for(var i=0;vars.length;i++){
				strJson += "\""+this.vars[i]+"\"";
				strJson += ":";
				strJson += "\""+this.params[i]+"\"";
				
				if(i != vars.length-1){
					strJson += ",";
				}
				
			}
			strJson += "}";
			
			var obj = JSON.parse(strJson);
			this.data = obj;
		};
		this.ajaxExec = function(){
			$.ajax({
				url : this.url,
				data : this.data,
				type : this.type,
				async : this.async,
				dataType : this.dataType,
				success : function(data , textStatus , jqXHR){
					this.success(data);
				},
				error : function(jqXHR, textStatus, errorThrown){
					this.error;
				}
			});
		};
	}
	

var objectSubmit = function(formID, formAction, formMethod, hiddenNames, hiddenVals){
		this.formID = formID;
		this.formAction = formAction;
		this.formMethod = formMethod;
		this.hiddenNames = hiddenNames;
		this.hiddenVals = hiddenVals;
		
		this.aSubmit = function(){
			var strHidden = "<form action='"+this.formAction+"' method='"+this.formMethod+"' id='"+this.formID+"'>";
			for(var i=0;i<hiddenNames.length;i++){
				strHidden += "<div>";
				strHidden += "<input type='hidden' name='"+this.hiddenNames[i]+"' value='"+this.hiddenVals[i]+"'/>"
				strHidden += "</div>";
			}
			strHidden += "</form>";
			document.getElementById(this.formID).innerHTML += strHidden;
			document.getElementById(this.formID).submit();
		}
		
		this.formSubmit = function(){
			var strHidden = "";
			for(var i=0;i<hiddenNames.length;i++){
				strHidden += "<div>";
				strHidden += "<input type='hidden' name='"+this.hiddenNames[i]+"' value='"+this.hiddenVals[i]+"'/>"
				strHidden += "</div>";
			}
			
			document.getElementById(this.formID).innerHTML += strHidden;
			document.getElementById(this.formID).submit();
		}
	}