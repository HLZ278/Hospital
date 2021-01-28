package dao;

import entity.NumSrc;
import entity.NumSrcView;
import utils.DBUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NumSrcViewDaoImpl implements NumSrcViewDao{
    @Override
    public List<NumSrcView> queryNumSrcView(int departmentID) {
        ArrayList<NumSrcView> list = new ArrayList<>();
        //DBUtils封装了数据库的连接
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;
        try {
            String sql = "SELECT * FROM numsrcview WHERE departmentID=? and contractTime between CAST(DATE_FORMAT(NOW(), '%Y-%m-%d')  AS DATETIME ) and CAST( CONCAT(DATE_FORMAT(NOW(), '%Y'),DATE_FORMAT(DATE_ADD(CURRENT_DATE(),INTERVAL 2 DAY),'-%m-%d')) AS DATETIME )";
            pstatement = conn.prepareStatement(sql);
            pstatement.setInt(1, departmentID);
            resultSet = pstatement.executeQuery();
            while (resultSet.next()) {
                NumSrcView numSrcView = new NumSrcView();
                numSrcView.setDepartmentID(resultSet.getInt("departmentID"));
                numSrcView.setDoctorID(resultSet.getInt("doctorID"));
                numSrcView.setDoctorName(resultSet.getString("doctorName"));
                numSrcView.setJob(resultSet.getString("job"));
                numSrcView.setGender(resultSet.getInt("gender"));
                numSrcView.setAge(resultSet.getInt("age"));
                numSrcView.setExpertise(resultSet.getString("expertise"));
                numSrcView.setCost(resultSet.getInt("cost"));
                numSrcView.setTotal(resultSet.getInt("total"));
                numSrcView.setRemain(resultSet.getInt("remain"));
                numSrcView.setContractTime(resultSet.getDate("contractTime"));
                numSrcView.setSignalSrcID(resultSet.getInt("signalSrcID"));
                numSrcView.setWorkTime(resultSet.getTime("workTime"));
                numSrcView.setCloseTime(resultSet.getTime("closeTime"));
                numSrcView.setPosition(resultSet.getString("position"));
                numSrcView.setDepartmentName(resultSet.getString("departmentName"));
                numSrcView.setDepartmentType(resultSet.getString("departmentType"));
                list.add(numSrcView);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            //关闭数据库连接，同时先要关闭结果集和PreparedStatement
            DBUtils.Close(resultSet, pstatement, conn);
        }
        return list;
    }
}
