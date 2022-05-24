package pkg.ditto.DB;

import org.springframework.stereotype.Component;

@Component
public class MSSqlDBConn implements DBConn{

	@Override
	public String getConnection() {
		System.out.println("MS SQL");
		return "MS SQL";
	}

}
