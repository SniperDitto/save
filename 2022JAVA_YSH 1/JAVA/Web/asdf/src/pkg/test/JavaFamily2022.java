package pkg.JAVA2022;

class Teacher{
	public teach(Student[] s){
		System.out.println("스승의 가르침");
	}
}

class Student{
	public thankyou(){
		System.out.println("감사합니다!");
	}
}

public class JavaFamily2022 {
	public static void main(String[] args) {
		Teacher 완 = new Teacher("완짱");
		Student[] javaStudents = ["강동근 외 23명"];
		
		완.teach(javaStudents);
		javaStudents.thankyou();
		
	}
}
