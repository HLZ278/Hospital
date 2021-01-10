package dao;

import entity.Hospital;
import entity.User;
import utils.DBUtils;

import java.sql.*;
import java.text.SimpleDateFormat;
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

	@Override
	public List<User> findUserByName(String userName, int userType) {
		ArrayList<User> list = new ArrayList<>();
		//DBUtils封装了数据库的连接
		Connection conn = DBUtils.getCon();
		PreparedStatement pstatement = null;
		ResultSet resultSet = null;
		try {
			String sql = "SELECT * FROM user WHERE userName like ? and userType =?";
			pstatement = conn.prepareStatement(sql);
			pstatement.setString(1, "%"+userName+"%");
			pstatement.setInt(2, userType);
			resultSet = pstatement.executeQuery();
			while (resultSet.next()) {
				User user = new User();
				user.setUserID(resultSet.getInt("userID"));
				user.setUserName(resultSet.getString("userName"));
				user.setUserPwd(resultSet.getString("userPwd"));
				user.setUserTel(resultSet.getString("userTel"));
				user.setRegisteDate(resultSet.getDate("registeDate"));
				user.setRealName(resultSet.getString("realName"));
				user.setIdCardType(resultSet.getInt("idCardType"));
				user.setIdCardNum(resultSet.getString("idCardNum"));
				user.setHospitalID(resultSet.getInt("hospitalID"));
				list.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			//关闭数据库连接，同时先要关闭结果集和PreparedStatement
			DBUtils.Close(resultSet, pstatement, conn);
		}
		return list;
	}

	@Override
	public List<User> queryUser(int page) {
		ArrayList<User> list = new ArrayList<>();
		//DBUtils封装了数据库的连接
		Connection conn = DBUtils.getCon();
		PreparedStatement pstatement = null;
		ResultSet resultSet = null;
		try {
			String sql = "SELECT * FROM user WHERE userType=1 ORDER BY userID LIMIT "+(page)*15+", 15";
			pstatement = conn.prepareStatement(sql);
			resultSet = pstatement.executeQuery();
			while (resultSet.next()) {
				User user = new User();
				user.setUserID(resultSet.getInt("userID"));
				user.setUserName(resultSet.getString("userName"));
				user.setUserPwd(resultSet.getString("userPwd"));
				user.setUserTel(resultSet.getString("userTel"));
				user.setRegisteDate(resultSet.getDate("registeDate"));
				user.setRealName(resultSet.getString("realName"));
				user.setIdCardType(resultSet.getInt("idCardType"));
				user.setIdCardNum(resultSet.getString("idCardNum"));
				list.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			//关闭数据库连接，同时先要关闭结果集和PreparedStatement
			DBUtils.Close(resultSet, pstatement, conn);
		}
		return list;
	}

	@Override
	public List<User> queryHospitalUser(int page) {
		ArrayList<User> list = new ArrayList<>();
		//DBUtils封装了数据库的连接
		Connection conn = DBUtils.getCon();
		PreparedStatement pstatement = null;
		ResultSet resultSet = null;
		try {
			String sql = "SELECT * FROM user WHERE userType=2 ORDER BY userID LIMIT "+(page)*15+", 15";
			pstatement = conn.prepareStatement(sql);
			resultSet = pstatement.executeQuery();
			while (resultSet.next()) {
				User user = new User();
				user.setUserID(resultSet.getInt("userID"));
				user.setUserName(resultSet.getString("userName"));
				user.setUserPwd(resultSet.getString("userPwd"));
				user.setUserTel(resultSet.getString("userTel"));
				user.setRegisteDate(resultSet.getDate("registeDate"));
				user.setRealName(resultSet.getString("realName"));
				user.setIdCardType(resultSet.getInt("idCardType"));
				user.setIdCardNum(resultSet.getString("idCardNum"));
				user.setHospitalID(resultSet.getInt("hospitalID"));
				list.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			//关闭数据库连接，同时先要关闭结果集和PreparedStatement
			DBUtils.Close(resultSet, pstatement, conn);
		}
		return list;
	}

	@Override
	public List<Hospital> queryHospital(int page) {
		ArrayList<Hospital> list = new ArrayList<>();
		//DBUtils封装了数据库的连接
		Connection conn = DBUtils.getCon();
		PreparedStatement pstatement = null;
		ResultSet resultSet = null;
		try {
			String sql = "SELECT * FROM hospital WHERE ORDER BY hospitalID LIMIT "+(page)*15+", 15";
			pstatement = conn.prepareStatement(sql);
			resultSet = pstatement.executeQuery();
			while (resultSet.next()) {
				Hospital hospital = new Hospital();
				hospital.setHospitalID(resultSet.getInt("hospitalID"));
				hospital.setName(resultSet.getString("name"));
				hospital.setGrade(resultSet.getString("grade"));
				hospital.setArea(resultSet.getString("area"));
				hospital.setAddress(resultSet.getString("address"));
				hospital.setIcon(resultSet.getString("icon"));
				hospital.setRelease(resultSet.getTime("release"));
				hospital.setStop(resultSet.getTime("stop"));
				hospital.setRule(resultSet.getString("rule"));
				hospital.setDetails(resultSet.getString("details"));
				hospital.setNotice(resultSet.getString("notice"));
				list.add(hospital);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			//关闭数据库连接，同时先要关闭结果集和PreparedStatement
			DBUtils.Close(resultSet, pstatement, conn);
		}
		return list;
	}

	@Override
	public String queryHospitalName(User user) {
		Connection conn = DBUtils.getCon();
		PreparedStatement pstatement = null;
		ResultSet resultSet = null;
		try {
			String sql = "select name from hospital where hospitalID =?";
			pstatement = conn.prepareStatement(sql);
			pstatement.setInt(1, user.getHospitalID());
			resultSet = pstatement.executeQuery();
			if (resultSet.next()) {
				return resultSet.getString(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			//关闭数据库连接，同时先要关闭结果集和PreparedStatement
			DBUtils.Close(resultSet, pstatement, conn);
		}
		return "暂无";
	}

	@Override
	public int addUser(User user) {
		Connection conn = DBUtils.getCon();
		PreparedStatement pstatement = null;
		int result = 0;
		try {
			String sql = "insert into user(userName,userPwd, userTel, registeDate, realName, idCardType, idCardNum, userType) value(?,?,?,?,?,?,?,?)";
			pstatement = conn.prepareStatement(sql);
			pstatement.setString(1, user.getUserName());
			pstatement.setString(2, user.getUserPwd());
			pstatement.setString(3, user.getUserTel());
			pstatement.setDate(4, new Date(new java.util.Date().getTime()));
			pstatement.setString(5, user.getRealName());
			pstatement.setInt(6, user.getIdCardType());
			pstatement.setString(7, user.getIdCardNum());
			pstatement.setInt(8, user.getUserType());
			result = pstatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			//关闭数据库连接，同时先要关闭结果集和PreparedStatement
			DBUtils.Close(null, pstatement, conn);
		}
		return result;
	}

	@Override
	public int deleteUser(int userID) {
		Connection conn = DBUtils.getCon();
		PreparedStatement pstatement = null;
		int result = 0;
		try {
			String sql = "delete from user where userID=?";
			pstatement = conn.prepareStatement(sql);
			pstatement.setInt(1, userID);
			result = pstatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			//关闭数据库连接，同时先要关闭结果集和PreparedStatement
			DBUtils.Close(null, pstatement, conn);
		}
		return result;
	}


}
