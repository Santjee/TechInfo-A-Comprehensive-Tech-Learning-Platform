package comm.tech.info.helper;
import  java.sql.*;
public class ConnectionProvider 
{
	private static Connection con;
	public static Connection getConnection() {
		try 
		{
			if(con==null) {
				//Driver class load
				
				Class.forName("com.mysql.jdbc.Driver");
				
				//creatre a connection
				
				con=DriverManager.
						getConnection("jdbc:mysql://localhost:3306/TechInfo", "root", "santjee@123");
				
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return con;
	}
}
