package pkg.ditto.DB;

public class MySqlDBConn implements DBConn{

	@Override
	public String getConnection() {
		System.out.println("MySQL");
		return "MySQL";
	}

}
