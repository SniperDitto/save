package pkg.ditto.DB;

import org.springframework.stereotype.Component;

@Component("dbConn")
public class OracleDBConn implements DBConn{

	@Override
	public String getConnection() {
		System.out.println("Oracle");
		return "Oracle";
	}

}
