package dao;

import entity.Patient;
import entity.User;
import utils.DBUtils;
import utils.UserType;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PatientDAOImpl implements PatientDao {

	@Override
	public List<Patient> queryPatient(int userID) {
		ArrayList<Patient> list = new ArrayList<>();
		//DBUtils封装了数据库的连接
		Connection conn = DBUtils.getCon();
		PreparedStatement pstatement = null;
		ResultSet resultSet = null;
		try {
			String sql = "SELECT * FROM patient WHERE userID=?";
			pstatement = conn.prepareStatement(sql);
			pstatement.setInt(1, userID);
			resultSet = pstatement.executeQuery();
			while (resultSet.next()) {
				Patient patient = new Patient();
				patient.setPatientID(resultSet.getInt("patientID"));
				patient.setUserID(resultSet.getInt("userID"));
				patient.setPatientName(resultSet.getString("patientName"));
				patient.setIdCardType(resultSet.getInt("idCardType"));
				patient.setIdCardNum(resultSet.getString("idCardNum"));
				patient.setGender(resultSet.getInt("gender"));
				patient.setBirthday(resultSet.getDate("birthday"));
				patient.setTel(resultSet.getString("tel"));
				patient.setMariStatus(resultSet.getInt("mariStatus"));
				patient.setAddress(resultSet.getString("address"));
				patient.setObjective(resultSet.getInt("objective"));
				patient.setLinkName(resultSet.getString("linkName"));
				patient.setLinkidCardType(resultSet.getInt("linkidCardType"));
				patient.setLinkidCardNum(resultSet.getString("linkidCardNum"));
				patient.setLinkTel(resultSet.getString("linkTel"));
				patient.setAge(resultSet.getInt("age"));
				list.add(patient);
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
	public Patient queryPatientByPatientID(int patientID) {
		//DBUtils封装了数据库的连接
		Connection conn = DBUtils.getCon();
		PreparedStatement pstatement = null;
		ResultSet resultSet = null;
		Patient patient = null;
		try {
			String sql = "SELECT * FROM patient WHERE patientID=?";
			pstatement = conn.prepareStatement(sql);
			pstatement.setInt(1, patientID);
			resultSet = pstatement.executeQuery();
			if (resultSet.next()) {
				patient = new Patient();
				patient.setPatientID(resultSet.getInt("patientID"));
				patient.setUserID(resultSet.getInt("userID"));
				patient.setPatientName(resultSet.getString("patientName"));
				patient.setIdCardType(resultSet.getInt("idCardType"));
				patient.setIdCardNum(resultSet.getString("idCardNum"));
				patient.setGender(resultSet.getInt("gender"));
				patient.setBirthday(resultSet.getDate("birthday"));
				patient.setTel(resultSet.getString("tel"));
				patient.setMariStatus(resultSet.getInt("mariStatus"));
				patient.setAddress(resultSet.getString("address"));
				patient.setObjective(resultSet.getInt("objective"));
				patient.setLinkName(resultSet.getString("linkName"));
				patient.setLinkidCardType(resultSet.getInt("linkidCardType"));
				patient.setLinkidCardNum(resultSet.getString("linkidCardNum"));
				patient.setLinkTel(resultSet.getString("linkTel"));
				patient.setAge(resultSet.getInt("age"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			//关闭数据库连接，同时先要关闭结果集和PreparedStatement
			DBUtils.Close(resultSet, pstatement, conn);
		}
		return patient;
	}

	@Override
	public void updatepatient(Patient patient) {
		Connection conn = DBUtils.getCon();
		PreparedStatement pstatement = null;
		try {
			String sql;
			sql = "update patient set userID=?,patientName=?, idCardType=?, idCardNum=?, gender=?, birthday=?, tel=?, mariStatus=?, address=?, objective=?, linkName=?, linkidCardType=?, linkidCardNum=?, linkTel=?, age=? where patientID=?";
			pstatement = conn.prepareStatement(sql);
			pstatement.setInt(1, patient.getUserID());
			pstatement.setString(2, patient.getPatientName());
			pstatement.setInt(3, patient.getIdCardType());
			pstatement.setString(4, patient.getIdCardNum());
			pstatement.setInt(5, patient.getGender());
			pstatement.setDate(6, patient.getBirthday());
			pstatement.setString(7, patient.getTel());
			pstatement.setInt(8, patient.getMariStatus());
			pstatement.setString(9, patient.getAddress());
			pstatement.setInt(10, patient.getObjective());
			pstatement.setString(11, patient.getLinkName());
			pstatement.setInt(12, patient.getLinkidCardType());
			pstatement.setString(13, patient.getLinkidCardNum());
			pstatement.setString(14, patient.getLinkTel());
			pstatement.setInt(15, patient.getAge());
			pstatement.setInt(16, patient.getPatientID());
			pstatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			//关闭数据库连接，同时先要关闭结果集和PreparedStatement
			DBUtils.Close(null, pstatement, conn);
		}
	}

	@Override
	public void insertPatient(Patient patient) {
		Connection conn = DBUtils.getCon();
		PreparedStatement pstatement = null;
		try {
			String sql;
			sql = "insert into patient(userID, patientName, idCardType, idCardNum, gender, birthday, tel, mariStatus, address, objective, linkName, linkidCardType, linkidCardNum, linkTel,times, age) value(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			pstatement = conn.prepareStatement(sql);
			pstatement.setInt(1, patient.getUserID());
			pstatement.setString(2, patient.getPatientName());
			pstatement.setInt(3, patient.getIdCardType());
			pstatement.setString(4, patient.getIdCardNum());
			pstatement.setInt(5, patient.getGender());
			pstatement.setDate(6, patient.getBirthday());
			pstatement.setString(7, patient.getTel());
			pstatement.setInt(8, patient.getMariStatus());
			pstatement.setString(9, patient.getAddress());
			pstatement.setInt(10, patient.getObjective());
			pstatement.setString(11, patient.getLinkName());
			pstatement.setInt(12, patient.getLinkidCardType());
			pstatement.setString(13, patient.getLinkidCardNum());
			pstatement.setString(14, patient.getLinkTel());
			pstatement.setInt(15, 0);
			pstatement.setInt(16, patient.getAge());
			pstatement.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			//关闭数据库连接，同时先要关闭结果集和PreparedStatement
			DBUtils.Close(null, pstatement, conn);
		}
	}

	@Override
	public void deletePatient(int patientID) {
		Connection conn = DBUtils.getCon();
		PreparedStatement pstatement = null;
		try {
			String sql = "delete from patient where patientID=?";
			pstatement = conn.prepareStatement(sql);
			pstatement.setInt(1, patientID);
			pstatement.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			//关闭数据库连接，同时先要关闭结果集和PreparedStatement
			DBUtils.Close(null, pstatement, conn);
		}
	}
}
