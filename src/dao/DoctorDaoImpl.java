package dao;

import entity.Department;
import entity.Doctor;
import utils.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DoctorDaoImpl implements DoctorDao{
    @Override
    public List<Doctor> queryDoctor(int departmentID, int page, String doctorName) {
        ArrayList<Doctor> list = new ArrayList<>();
        //DBUtils封装了数据库的连接
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;
        try {
            String sql = "SELECT * FROM doctor WHERE departmentID=? and doctorName like ? ORDER BY doctorID LIMIT "+(page)*15+", 15";
            pstatement = conn.prepareStatement(sql);
            pstatement.setInt(1, departmentID);
            pstatement.setString(2, "%"+doctorName+"%");
            resultSet = pstatement.executeQuery();
            while (resultSet.next()) {
                Doctor doctor = new Doctor();
                doctor.setDoctorID(resultSet.getInt("doctorID"));
                doctor.setDoctorName(resultSet.getString("doctorName"));
                doctor.setDepartmentID(resultSet.getInt("departmentID"));
                doctor.setJob(resultSet.getString("job"));
                doctor.setGender(resultSet.getInt("gender"));
                doctor.setAge(resultSet.getInt("age"));
                doctor.setExpertise(resultSet.getString("expertise"));
                doctor.setCost(resultSet.getInt("cost"));
                list.add(doctor);
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
    public List<Doctor> queryDoctor(int departmentID, int page) {
        ArrayList<Doctor> list = new ArrayList<>();
        //DBUtils封装了数据库的连接
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;
        try {
            String sql = "SELECT * FROM doctor WHERE departmentID=? ORDER BY doctorID LIMIT "+(page)*15+", 15";
            pstatement = conn.prepareStatement(sql);
            pstatement.setInt(1, departmentID);
            resultSet = pstatement.executeQuery();
            while (resultSet.next()) {
                Doctor doctor = new Doctor();
                doctor.setDoctorID(resultSet.getInt("doctorID"));
                doctor.setDoctorName(resultSet.getString("doctorName"));
                doctor.setDepartmentID(resultSet.getInt("departmentID"));
                doctor.setJob(resultSet.getString("job"));
                doctor.setGender(resultSet.getInt("gender"));
                doctor.setAge(resultSet.getInt("age"));
                doctor.setExpertise(resultSet.getString("expertise"));
                doctor.setCost(resultSet.getInt("cost"));
                list.add(doctor);
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
    public void insertDoctor(Doctor doctor) {
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        try {
            String sql = "insert into doctor(doctorName, departmentID, job, gender, age, expertise,cost) value(?,?,?,?,?,?,?)";
            pstatement = conn.prepareStatement(sql);
            pstatement.setString(1, doctor.getDoctorName());
            pstatement.setInt(2, doctor.getDepartmentID());
            pstatement.setString(3, doctor.getJob());
            pstatement.setInt(4, doctor.getGender());
            pstatement.setInt(5, doctor.getAge());
            pstatement.setString(6, doctor.getExpertise());
            pstatement.setFloat(7, doctor.getCost());
            pstatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtils.Close(null, pstatement, conn);
        }
    }

    @Override
    public void deleteDoctor(int doctorID) {
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        try {
            String sql = "delete from doctor where doctorID=?";
            pstatement = conn.prepareStatement(sql);
            pstatement.setInt(1, doctorID);
            pstatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtils.Close(null, pstatement, conn);
        }
    }

    @Override
    public void updateDoctor(Doctor doctor) {
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        try {
            String sql;
            sql = "update doctor set doctorName=?,departmentID=?, job=?, gender=?, age=?, expertise=?, cost=? where doctorID=?";
            pstatement = conn.prepareStatement(sql);
            pstatement.setString(1, doctor.getDoctorName());
            pstatement.setInt(2, doctor.getDepartmentID());
            pstatement.setString(3, doctor.getJob());
            pstatement.setInt(4, doctor.getGender());
            pstatement.setInt(5, doctor.getAge());
            pstatement.setString(6, doctor.getExpertise());
            pstatement.setFloat(7, doctor.getCost());
            pstatement.setInt(8, doctor.getDoctorID());
            pstatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            //关闭数据库连接，同时先要关闭结果集和PreparedStatement
            DBUtils.Close(null, pstatement, conn);
        }
    }

    @Override
    public Doctor queryDoctor(int doctorID) {
        //DBUtils封装了数据库的连接
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;
        Doctor doctor = null;
        try {
            String sql = "SELECT * FROM doctor WHERE doctorID=?";
            pstatement = conn.prepareStatement(sql);
            pstatement.setInt(1, doctorID);
            resultSet = pstatement.executeQuery();
            if (resultSet.next()) {
                doctor = new Doctor();
                doctor.setDoctorID(resultSet.getInt("doctorID"));
                doctor.setDoctorName(resultSet.getString("doctorName"));
                doctor.setDepartmentID(resultSet.getInt("departmentID"));
                doctor.setJob(resultSet.getString("job"));
                doctor.setGender(resultSet.getInt("gender"));
                doctor.setAge(resultSet.getInt("age"));
                doctor.setExpertise(resultSet.getString("expertise"));
                doctor.setCost(resultSet.getInt("cost"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            //关闭数据库连接，同时先要关闭结果集和PreparedStatement
            DBUtils.Close(resultSet, pstatement, conn);
        }
        return doctor;
    }
}
