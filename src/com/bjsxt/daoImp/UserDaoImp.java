package com.bjsxt.daoImp;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.bjsxt.dao.UserDao;
import com.bjsxt.domain.User;

public class UserDaoImp implements UserDao {

	@Override
	public User getUserInfo(String name) {
		User user=null;
		try {
			Class.forName("oracle.jdbc.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcldb","scott","tiger");
			String sql="select * from heroUser where usname=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				user=new User();
				user.setUid(rs.getInt("USID"));
				user.setUname(rs.getString("USNAME"));
				user.setPrice(rs.getInt("USPRICE"));
				user.setLoc(rs.getString("USLOC"));
				user.setDesc(rs.getString("USDES"));
			}
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return user;
	}

}
