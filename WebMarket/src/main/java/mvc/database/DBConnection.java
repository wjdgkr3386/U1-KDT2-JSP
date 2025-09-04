package mvc.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
	
	public static Connection getConnection() 
			throws SQLException, ClassNotFoundException{
		//DB연결객체 선언
		Connection conn=null;
//		db연결정보
		String url = "jdbc:mysql://localhost:3306/webmarketdb";
		String user="root";
		String password="1234";
		// 드라이버 로딩
		Class.forName("com.mysql.cj.jdbc.Driver");
		//db연결객체 얻기
		conn = DriverManager.getConnection(url,user,password);
		//db연결 객체 리턴
		return conn;
	}
}
