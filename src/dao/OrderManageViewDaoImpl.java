package dao;
import entity.NumSrc;
import entity.Order;
import entity.OrderManageView;
import entity.Patient;
import utils.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderManageViewDaoImpl implements OrderManageViewDao{

	@Override
	public List<OrderManageView> queryByUserID(int userID) {
		ArrayList<OrderManageView> list = new ArrayList<>();
		//DBUtils封装了数据库的连接
		Connection conn = DBUtils.getCon();
		PreparedStatement pstatement = null;
		ResultSet resultSet = null;
		try {
			String sql = "SELECT * FROM orderManageView WHERE userID=?";
			pstatement = conn.prepareStatement(sql);
			pstatement.setInt(1, userID);
			resultSet = pstatement.executeQuery();
			while (resultSet.next()) {
				OrderManageView orderManageView = new OrderManageView();
				orderManageView.setPatientName(resultSet.getString("patientName"));
				orderManageView.setUserID(resultSet.getInt("userID"));
				orderManageView.setOrderStatus(resultSet.getInt("orderStatus"));
				orderManageView.setContractTime(resultSet.getDate("contractTime"));
				orderManageView.setDoctorName(resultSet.getString("doctorName"));
				orderManageView.setDepartmentName(resultSet.getString("departmentName"));
				orderManageView.setWorkTime(resultSet.getTime("workTime"));
				orderManageView.setCloseTime(resultSet.getTime("closeTime"));
				orderManageView.setHospitalName(resultSet.getString("hospitalName"));
				orderManageView.setOrderID(resultSet.getInt("orderID"));
				orderManageView.setSignalSrcID(resultSet.getInt("signalSrcID"));
				orderManageView.setHospitalID(resultSet.getInt("hospitalID"));
				orderManageView.setPatientID(resultSet.getInt("patientID"));

				list.add(orderManageView);
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
	public List<OrderManageView> queryByUserID(int userID, int status) {
		ArrayList<OrderManageView> list = new ArrayList<>();
		//DBUtils封装了数据库的连接
		Connection conn = DBUtils.getCon();
		PreparedStatement pstatement = null;
		ResultSet resultSet = null;
		try {
			String sql = "SELECT * FROM orderManageView WHERE userID=? and orderStatus=?";
			pstatement = conn.prepareStatement(sql);
			pstatement.setInt(1, userID);
			pstatement.setInt(2, status);
			resultSet = pstatement.executeQuery();
			while (resultSet.next()) {
				OrderManageView orderManageView = new OrderManageView();
				orderManageView.setPatientName(resultSet.getString("patientName"));
				orderManageView.setUserID(resultSet.getInt("userID"));
				orderManageView.setOrderStatus(resultSet.getInt("orderStatus"));
				orderManageView.setContractTime(resultSet.getDate("contractTime"));
				orderManageView.setDoctorName(resultSet.getString("doctorName"));
				orderManageView.setDepartmentName(resultSet.getString("departmentName"));
				orderManageView.setWorkTime(resultSet.getTime("workTime"));
				orderManageView.setCloseTime(resultSet.getTime("closeTime"));
				orderManageView.setHospitalName(resultSet.getString("hospitalName"));
				orderManageView.setOrderID(resultSet.getInt("orderID"));
				orderManageView.setSignalSrcID(resultSet.getInt("signalSrcID"));
				orderManageView.setHospitalID(resultSet.getInt("hospitalID"));
				orderManageView.setPatientID(resultSet.getInt("patientID"));

				list.add(orderManageView);
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
	public List<OrderManageView> queryByHopitalID(int hopitalID, String page) {
		int pag = Integer.parseInt(page);
		ArrayList<OrderManageView> list = new ArrayList<>();
		Connection conn = DBUtils.getCon();
		PreparedStatement pstatement = null;
		ResultSet resultSet = null;
		try {
			String sql = "SELECT * FROM orderManageView WHERE hospitalID=? and orderStatus=1 ORDER BY orderID LIMIT "+(pag)*14+", 14";
			pstatement = conn.prepareStatement(sql);
			pstatement.setInt(1, hopitalID);
			resultSet = pstatement.executeQuery();
			while (resultSet.next()) {
				OrderManageView orderManageView = new OrderManageView();
				orderManageView.setPatientName(resultSet.getString("patientName"));
				orderManageView.setUserID(resultSet.getInt("userID"));
				orderManageView.setOrderStatus(resultSet.getInt("orderStatus"));
				orderManageView.setContractTime(resultSet.getDate("contractTime"));
				orderManageView.setDoctorName(resultSet.getString("doctorName"));
				orderManageView.setDepartmentName(resultSet.getString("departmentName"));
				orderManageView.setWorkTime(resultSet.getTime("workTime"));
				orderManageView.setCloseTime(resultSet.getTime("closeTime"));
				orderManageView.setHospitalName(resultSet.getString("hospitalName"));
				orderManageView.setOrderID(resultSet.getInt("orderID"));
				orderManageView.setSignalSrcID(resultSet.getInt("signalSrcID"));
				orderManageView.setHospitalID(resultSet.getInt("hospitalID"));
				orderManageView.setPatientID(resultSet.getInt("patientID"));

				list.add(orderManageView);
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
	public List<OrderManageView> queryByHopitalID(int hopitalID, int status) {
		ArrayList<OrderManageView> list = new ArrayList<>();
		Connection conn = DBUtils.getCon();
		PreparedStatement pstatement = null;
		ResultSet resultSet = null;
		try {
			String sql = "SELECT * FROM orderManageView WHERE hopitalID=? and orderStatus=?";
			pstatement = conn.prepareStatement(sql);
			pstatement.setInt(1, hopitalID);
			pstatement.setInt(2, status);
			resultSet = pstatement.executeQuery();
			while (resultSet.next()) {
				OrderManageView orderManageView = new OrderManageView();
				orderManageView.setPatientName(resultSet.getString("patientName"));
				orderManageView.setUserID(resultSet.getInt("userID"));
				orderManageView.setOrderStatus(resultSet.getInt("orderStatus"));
				orderManageView.setContractTime(resultSet.getDate("contractTime"));
				orderManageView.setDoctorName(resultSet.getString("doctorName"));
				orderManageView.setDepartmentName(resultSet.getString("departmentName"));
				orderManageView.setWorkTime(resultSet.getTime("workTime"));
				orderManageView.setCloseTime(resultSet.getTime("closeTime"));
				orderManageView.setHospitalName(resultSet.getString("hospitalName"));
				orderManageView.setOrderID(resultSet.getInt("orderID"));
				orderManageView.setSignalSrcID(resultSet.getInt("signalSrcID"));
				orderManageView.setHospitalID(resultSet.getInt("hospitalID"));
				orderManageView.setPatientID(resultSet.getInt("patientID"));

				list.add(orderManageView);
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
	public List<OrderManageView> queryByOrderID(int orderID) {
		ArrayList<OrderManageView> list = new ArrayList<>();
		Connection conn = DBUtils.getCon();
		PreparedStatement pstatement = null;
		ResultSet resultSet = null;
		try {
			String sql = "SELECT * FROM orderManageView WHERE orderID=?";
			pstatement = conn.prepareStatement(sql);
			pstatement.setInt(1, orderID);
			resultSet = pstatement.executeQuery();
			while (resultSet.next()) {
				OrderManageView orderManageView = new OrderManageView();
				orderManageView.setPatientName(resultSet.getString("patientName"));
				orderManageView.setUserID(resultSet.getInt("userID"));
				orderManageView.setOrderStatus(resultSet.getInt("orderStatus"));
				orderManageView.setContractTime(resultSet.getDate("contractTime"));
				orderManageView.setDoctorName(resultSet.getString("doctorName"));
				orderManageView.setDepartmentName(resultSet.getString("departmentName"));
				orderManageView.setWorkTime(resultSet.getTime("workTime"));
				orderManageView.setCloseTime(resultSet.getTime("closeTime"));
				orderManageView.setHospitalName(resultSet.getString("hospitalName"));
				orderManageView.setOrderID(resultSet.getInt("orderID"));
				orderManageView.setSignalSrcID(resultSet.getInt("signalSrcID"));
				orderManageView.setHospitalID(resultSet.getInt("hospitalID"));
				orderManageView.setPatientID(resultSet.getInt("patientID"));

				list.add(orderManageView);
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
	public int countDepartment(int hospitalID) {
		Connection conn = DBUtils.getCon();
		PreparedStatement pstatement = null;
		ResultSet resultSet = null;
		int result = 0;
		try {
			String sql = "select count(*) from orderManageView WHERE hospitalID=?";
			pstatement = conn.prepareStatement(sql);
			pstatement.setInt(1, hospitalID);
			resultSet = pstatement.executeQuery();
			if (resultSet.next()){
				result=resultSet.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			//关闭数据库连接，同时先要关闭结果集和PreparedStatement
			DBUtils.Close(resultSet, pstatement, conn);
		}
		return result;
	}


}
