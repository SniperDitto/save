
public class TestClass {
	public float divide(float a, float b) {
		float result=0;
		
		try {
			result = a/b;
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			System.out.println("집에 갑시다.");
		}
		
		return result;
		
	}
}
