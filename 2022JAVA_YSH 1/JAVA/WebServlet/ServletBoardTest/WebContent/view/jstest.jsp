<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<script>
	var student = new Object();
	student.name = "홍길동";
	student.age = 24;
	student.gender = "M";
	student.output = function(){
		var strOutput = "이름 : "+ this.name + "\n나이 : " + this.age + "\n성별 : " + this.gender;
		return strOutput;
	}
	
	alert(student.output());
	
	var showStudents = function(){
	
		var students = [];
		
		students[0] = new Object();
		students[0].name = "a";
		students[0].age = 22;
		students[0].gender = "M";
		students[0].output = function(){
			var strOutput = "이름 : "+ this.name + "\n나이 : " + this.age + "\n성별 : " + this.gender;
			return strOutput;
		}
		
		students[1] = new Object();
		students[1].name = "b";
		students[1].age = 21;
		students[1].gender = "F";
		students[1].output = function(){
			var strOutput = "이름 : "+ this.name + "\n나이 : " + this.age + "\n성별 : " + this.gender;
			return strOutput;
		}
		
		var getHTML = function(){
			var strHTML = "";
			for(var i;i<students.length;i++){
				strHTML += "이름 : "+ students[i].name;
				strHTML += "\n나이 : "+ students[i].age;
				strHTML += "\n성별 : "+ students[i].gender + "\n";
			}
			return strHTML;
		}
		
	}
	
	
	
	
	var student2 = function(name, age, gender){
		this.name = name;
		this.age = age;
		this.gender = gender;
		this.output = function(){
			var strOutput = "이름 : "+ this.name + "\n나이 : " + this.age + "\n성별 : " + this.gender;
			return strOutput;
		}
	}
	
	var student3 = {
		name : "홍",
		age : 24,
		gender : "M",
		output : function(){
			var strOutput = "이름 : "+ this.name + "\n나이 : " + this.age + "\n성별 : " + this.gender;
			return strOutput;
		}
	}
	
</script>

</body>
</html>