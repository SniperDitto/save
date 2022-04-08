
public class Carpet implements IFly{
	
	private String carpetName;
	
	public Carpet(String carpetName) {
		this.carpetName = carpetName;
	}

	@Override
	public void fly() {
		System.out.println("날으는양탄자~");
	}
	
	
	
}
