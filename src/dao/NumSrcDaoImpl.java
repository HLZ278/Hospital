package dao;

import entity.Doctor;
import entity.NumSrc;
import utils.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NumSrcDaoImpl implements NumSrcDao{

    @Override
    public List<NumSrc> queryNumSrc(int doctorID) {
        ArrayList<NumSrc> list = new ArrayList<>();
        //DBUtils封装了数据库的连接
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;
        try {
            String sql = "SELECT * FROM signalsrc WHERE doctorID=? and contractTime between CAST(DATE_FORMAT(NOW(), '%Y-%m-%d')  AS DATETIME ) and CAST( CONCAT(DATE_FORMAT(NOW(), '%Y'),DATE_FORMAT(DATE_ADD(CURRENT_DATE(),INTERVAL 3 DAY),'-%m-%d')) AS DATETIME )";
            pstatement = conn.prepareStatement(sql);
            pstatement.setInt(1, doctorID);
            resultSet = pstatement.executeQuery();
            while (resultSet.next()) {
                NumSrc numSrc = new NumSrc();
                numSrc.setSignalSrcID(resultSet.getInt("signalSrcID"));
                numSrc.setDoctorID(resultSet.getInt("doctorID"));
                numSrc.setContractTime(resultSet.getDate("contractTime"));
                numSrc.setRemain(resultSet.getInt("remain"));
                numSrc.setTotal(resultSet.getInt("total"));
                System.out.println(numSrc);
                list.add(numSrc);
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
    public void insertOrUpdateNumSrc(List<NumSrc> numSrcList) {
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        try {
            String sql;
            sql = "INSERT INTO signalsrc(doctorID,contractTime,remain,total) VALUE(?,?,?,?) ON DUPLICATE KEY UPDATE doctorID=?,contractTime=?";
            pstatement = conn.prepareStatement(sql);
            for (NumSrc numSrc:
                 numSrcList) {
                System.out.println(numSrc);
                if (numSrc.getTotal()!=0){
                    pstatement.setInt(1, numSrc.getDoctorID());
                    pstatement.setDate(2, numSrc.getContractTime());
                    pstatement.setInt(3, numSrc.getRemain());
                    pstatement.setInt(4, numSrc.getTotal());
                    pstatement.setInt(5, numSrc.getDoctorID());
                    pstatement.setDate(6, numSrc.getContractTime());
                    pstatement.executeUpdate();
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            //关闭数据库连接，同时先要关闭结果集和PreparedStatement
            DBUtils.Close(null, pstatement, conn);
        }
    }
}
