package pkg.ditto.DB;

import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

@Component
@Qualifier("dbConn")
public interface DBConn {
	public String getConnection();
}
