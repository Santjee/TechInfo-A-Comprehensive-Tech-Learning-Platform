package comm.tech.info.dao;

import comm.tech.info.entities.User;
import java.sql.*;
public class UserDao {
	private Connection con;

	public UserDao(Connection con) {
		this.con = con;
	}
	
	//method to insert user to data base
	
	public boolean saveUser(User user) {
		
		boolean f=false; 
		try {
			//user --> databases
			String query="insert into user(name,email,password,gender) values(?,?,?,?)";
			PreparedStatement pstmt=this.con.prepareStatement(query);
			pstmt.setString(1,user.getName());
			pstmt.setString(2,user.getEmail());
			pstmt.setString(3, user.getPassword());
			pstmt.setString(4, user.getGender());
			
			pstmt.executeUpdate();
			f=true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	//get user by useremail and userpassword:
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;

        try {

            String query = "select * from user where email =? and password=?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setString(1, email);
            pstmt.setString(2, password);

            ResultSet set = pstmt.executeQuery();

            if (set.next()) {
                user = new User();

//             data from db
                String name = set.getString("name");
//             set to user object
                user.setName(name);

                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));

            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }

    public boolean updateUser(User user) {
        boolean f = false;
        try {
            String query = "UPDATE user SET name=?, email=?, password=?, gender=?, profile=? WHERE id=?";
            PreparedStatement p = con.prepareStatement(query);
            p.setString(1, user.getName());
            p.setString(2, user.getEmail());
            p.setString(3, user.getPassword());
            p.setString(4, user.getGender());
            p.setString(5, user.getProfile());  // Fixed index
            p.setInt(6, user.getId());  // Fixed index

            int rowsUpdated = p.executeUpdate();
            if (rowsUpdated > 0) {
                f = true;
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return f;
    }

    public User getUserByUserId(int userId) {
        User user = null;
        try {
            String q = "select * from user where id=?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, userId);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                user = new User();

//             data from db
                String name = set.getString("name");
//             set to user object
                user.setName(name);

                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
        
    }
	
}
