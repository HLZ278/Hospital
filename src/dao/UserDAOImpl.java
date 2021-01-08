package dao;

import entity.User;
import utils.DBUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAOImpl implements UserDAO {
	@Override
	public User login(String userName) {
		//DBUtils封装了数据库的连接
		Connection conn = DBUtils.getCon();
		PreparedStatement pstatement = null;
		ResultSet resultSet = null;
		User user = null;
		try {
			String sql = "select * from user where userName =?";
			pstatement = conn.prepareStatement(sql);
			pstatement.setString(1, userName);
			resultSet = pstatement.executeQuery();
			if (resultSet.next()) {
				user = new User();
				user.setUserID(resultSet.getInt("userID"));
				user.setUserName(resultSet.getString("userName"));
				user.setUserPwd(resultSet.getString("userPwd"));
				user.setUserTel(resultSet.getString("userTel"));
				user.setRegisteDate(resultSet.getDate("registeDate"));
				user.setRealName(resultSet.getString("realName"));
				user.setIdCardType(resultSet.getInt("idCardType"));
				user.setIdCardNum(resultSet.getString("idCardNum"));
				user.setUserType(resultSet.getInt("userType"));
				user.setHospitalID(resultSet.getInt("hospitalID"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			//关闭数据库连接，同时先要关闭结果集和PreparedStatement
			DBUtils.Close(resultSet, pstatement, conn);
		}
		return user;
	}

	@Override
	public String findUser(String userName) {
		Connection conn = DBUtils.getCon();
		PreparedStatement pstatement = null;
		ResultSet resultSet = null;
		try {
			String sql = "select * from user where userName =?";
			pstatement = conn.prepareStatement(sql);
			pstatement.setString(1, userName);
			resultSet = pstatement.executeQuery();
			if (resultSet.next()) {
				return "true";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			//关闭数据库连接，同时先要关闭结果集和PreparedStatement
			DBUtils.Close(resultSet, pstatement, conn);
		}
		return "false";
	}

}
