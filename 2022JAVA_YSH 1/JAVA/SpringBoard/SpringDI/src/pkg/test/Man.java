package pkg.test;

import org.springframework.stereotype.Component;

@Component
public class Man extends Char{
	public Man() {}
	public Man(String name) {
		super(name);
	}

	@Override
	public void showGender() {
		System.out.println("최밥창문은 남자입니다.");
	}
	
}
