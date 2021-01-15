package dao;

import entity.Department;
import utils.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DepartmentDaoImpl implements DepartmentDao {
    @Override
    public List<Department> queryDepartment(int hospitalID, int page) {
        ArrayList<Department> list = new ArrayList<>();
        //DBUtils封装了数据库的连接
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;
        try {
            String sql = "SELECT * FROM department WHERE hospitalID=? ORDER BY departmentType LIMIT "+(page)*15+", 15";
            pstatement = conn.prepareStatement(sql);
            pstatement.setInt(1, hospitalID);
            resultSet = pstatement.executeQuery();
            while (resultSet.next()) {
                Department department = new Department();
                department.setDepartmentID(resultSet.getInt("departmentID"));
                department.setHospitalID(resultSet.getInt("hospitalID"));
                department.setDepartmentType(resultSet.getString("departmentType"));
                department.setDepartmentName(resultSet.getString("departmentName"));
                department.setPosition(resultSet.getString("position"));
                department.setWorkTime(resultSet.getTime("workTime"));
                department.setCloseTime(resultSet.getTime("closeTime"));
                list.add(department);
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
    public void insertDepartment(Department department) {
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        try {
            String sql = "insert into department(hospitalID, departmentType, departmentName, position, workTime, closeTime) value(?,?,?,?,?,?)";
            pstatement = conn.prepareStatement(sql);
            pstatement.setInt(1, department.getHospitalID());
            pstatement.setString(2, department.getDepartmentType());
            pstatement.setString(3, department.getDepartmentName());
            pstatement.setString(4, department.getPosition());
            pstatement.setTime(5, department.getWorkTime());
            pstatement.setTime(6, department.getCloseTime());
            pstatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtils.Close(null, pstatement, conn);
        }
    }

    @Override
    public List<Department> queryDepartment(int hospitalID, int page, String departmentName) {
        ArrayList<Department> list = new ArrayList<>();
        //DBUtils封装了数据库的连接
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;
        try {
            String sql = "SELECT * FROM department WHERE hospitalID=? and departmentName like ? ORDER BY departmentType LIMIT "+(page)*15+", 15";
            pstatement = conn.prepareStatement(sql);
            pstatement.setInt(1, hospitalID);
            pstatement.setString(2, "%"+departmentName+"%");
            resultSet = pstatement.executeQuery();
            while (resultSet.next()) {
                Department department = new Department();
                department.setDepartmentID(resultSet.getInt("departmentID"));
                department.setHospitalID(resultSet.getInt("hospitalID"));
                department.setDepartmentType(resultSet.getString("departmentType"));
                department.setDepartmentName(resultSet.getString("departmentName"));
                department.setPosition(resultSet.getString("position"));
                department.setWorkTime(resultSet.getTime("workTime"));
                department.setCloseTime(resultSet.getTime("closeTime"));
                list.add(department);
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
    public void deleteDepartment(int departmentID) {
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        try {
            String sql = "delete from department where departmentID=?";
            pstatement = conn.prepareStatement(sql);
            pstatement.setInt(1, departmentID);
            pstatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtils.Close(null, pstatement, conn);
        }
    }

    @Override
    public void updateDepartment(Department department) {
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        try {
            String sql;
            sql = "update department set departmentType=?,departmentName=?, position=?, workTime=?, closeTime=? where departmentID=?";
            pstatement = conn.prepareStatement(sql);
            pstatement.setString(1, department.getDepartmentType());
            pstatement.setString(2, department.getDepartmentName());
            pstatement.setString(3, department.getPosition());
            pstatement.setTime(4, department.getWorkTime());
            pstatement.setTime(5, department.getCloseTime());
            pstatement.setInt(6, department.getDepartmentID());
            pstatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            //关闭数据库连接，同时先要关闭结果集和PreparedStatement
            DBUtils.Close(null, pstatement, conn);
        }
    }

    @Override
    public Department queryDepartmentByID(int departmentID) {
        ArrayList<Department> list = new ArrayList<>();
        //DBUtils封装了数据库的连接
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;
        Department department = null;
        try {
            String sql = "SELECT * FROM department WHERE departmentID=?";
            pstatement = conn.prepareStatement(sql);
            pstatement.setInt(1, departmentID);
            resultSet = pstatement.executeQuery();
            if (resultSet.next()) {
                department = new Department();
                department.setDepartmentID(resultSet.getInt("departmentID"));
                department.setHospitalID(resultSet.getInt("hospitalID"));
                department.setDepartmentType(resultSet.getString("departmentType"));
                department.setDepartmentName(resultSet.getString("departmentName"));
                department.setPosition(resultSet.getString("position"));
                department.setWorkTime(resultSet.getTime("workTime"));
                department.setCloseTime(resultSet.getTime("closeTime"));
                list.add(department);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            //关闭数据库连接，同时先要关闭结果集和PreparedStatement
            DBUtils.Close(resultSet, pstatement, conn);
        }
        return department;
    }
}
