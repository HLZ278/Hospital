package dao;

import entity.NumSrc;
import entity.Order;
import utils.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDaoImpl implements OrderDao{

    @Override
    public void insert(Order order) {
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        try {
            String sql = "INSERT INTO `order`(signalSrcID,patientID,orderStatus,contractTime) VALUE(?,?,1,?)";
            pstatement = conn.prepareStatement(sql);
            pstatement.setInt(1, order.getSignalSrcID());
            pstatement.setInt(2, order.getPatientID());
            pstatement.setTimestamp(3, order.getContractTime());
            pstatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            //关闭数据库连接，同时先要关闭结果集和PreparedStatement
            DBUtils.Close(null, pstatement, conn);
        }
    }

    @Override
    public void cancle(int orderID) {
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        try {
            String sql = "update `order` set orderStatus=3 where orderID=?";
            pstatement = conn.prepareStatement(sql);
            pstatement.setInt(1, orderID);
            pstatement.execute();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            //关闭数据库连接，同时先要关闭结果集和PreparedStatement
            DBUtils.Close(null, pstatement, conn);
        }
    }
}
