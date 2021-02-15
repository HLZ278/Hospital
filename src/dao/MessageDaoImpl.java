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

    @Override
    public void deleteMessage(int messageID) {
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        try {
            String sql = "delete from message where messageID=?";
            pstatement = conn.prepareStatement(sql);
            pstatement.setInt(1, messageID);
            pstatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtils.Close(null, pstatement, conn);
        }
    }

    @Override
    public int countMessage(int userID) {
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;
        int result = 0;
        try {
            String sql = "select count(*) from message where userID=?";
            pstatement = conn.prepareStatement(sql);
            pstatement.setInt(1, userID);
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

    @Override
    public int countAllMessage() {
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;
        int result = 0;
        try {
            String sql = "select count(*) from message";
            pstatement = conn.prepareStatement(sql);
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

    @Override
    public void insertNotice(Message message) {
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        try {
            String sql = "insert into message(title, content, createTime, userID) value(?,?,?,?)";
            pstatement = conn.prepareStatement(sql);
            pstatement.setString(1, message.getTitle());
            pstatement.setString(2, message.getContent());
            pstatement.setDate(3, message.getCreateTime());
            pstatement.setInt(4, message.getUserID());
            pstatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtils.Close(null, pstatement, conn);
        }
    }
}
