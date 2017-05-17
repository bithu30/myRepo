import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class JdbcDemo {

    public static void main(String[] args) throws Exception {
	Class.forName("com.facebook.presto.jdbc.PrestoDriver");

	//String url = "jdbc:presto://localhost:8181";
	//String url = "jdbc:presto://localhost:8181/tpch";
	String url = "jdbc:presto://localhost:8181/tpch/sf1";

        Connection connection = DriverManager.getConnection(url, "hive", "");
        Statement statement = connection.createStatement();
        ResultSet rs = statement.executeQuery("select * from tpch.tiny.region");

        while (rs.next()) {
            System.out.print(rs.getInt(1) + ", " + rs.getString(2) + ", " + rs.getString(3));
            System.out.println();
        }
        rs.close();

        statement.close();
        connection.close();
    }
}
