package dao;

import entity.Message;
import entity.Notice;
import utils.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MessageDaoImpl implements MessageDao {
    @Override
    public List<Message> queryAll(int page) {
        ArrayList<Message> list = new ArrayList<>();
        //DBUtils封装了数据库的连接
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;
        try {
            String sql = "SELECT * FROM message  LIMIT "+(page)*14+", 14";
            pstatement = conn.prepareStatement(sql);
            resultSet = pstatement.executeQuery();
            while (resultSet.next()) {
                Message message = new Message();
                message.setMessageID(resultSet.getInt("messageID"));
                message.setContent(resultSet.getString("content"));
                message.setCreateTime(resultSet.getDate("createTime"));
                message.setTitle(resultSet.getString("title"));
                message.setUserID(resultSet.getInt("userID"));
                list.add(message);
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
    public List<Message> queryAllByUserID(int userID, int page) {
        ArrayList<Message> list = new ArrayList<>();
        //DBUtils封装了数据库的连接
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;
        try {
            String sql = "SELECT * FROM message where userID=? LIMIT "+(page)*14+", 14";
            pstatement = conn.prepareStatement(sql);
            pstatement.setInt(1, userID);
            resultSet = pstatement.executeQuery();
            while (resultSet.next()) {
                Message message = new Message();
                message.setMessageID(resultSet.getInt("messageID"));
                message.setContent(resultSet.getString("content"));
                message.setCreateTime(resultSet.getDate("createTime"));
                message.setTitle(resultSet.getString("title"));
                message.setUserID(resultSet.getInt("userID"));
                list.add(message);
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
