
public class Engine {
	
	private String engineName;
	public Engine(String engineName) {
		this.engineName = engineName;
	}
	
	public String getEngineName() {
		return this.engineName;
	}

	public void explosion() {
		System.out.println("엔진 폭발");
	}
	
}
