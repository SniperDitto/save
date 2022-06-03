package pkg.test;

import org.springframework.stereotype.Component;

public abstract class Char {
	private String name;
	public Char() {
	}
	public Char(String name) {
		this.name = name;
	}
	public abstract void showGender();
}
