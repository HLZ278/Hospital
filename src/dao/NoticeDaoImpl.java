package dao;

import entity.Hospital;
import entity.Notice;
import utils.DBUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NoticeDaoImpl implements NoticeDAO {
    @Override
    public List<Notice> queryAll() {
        ArrayList<Notice> list = new ArrayList<>();
        //DBUtils封装了数据库的连接
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;
        try {
            String sql = "SELECT * FROM notice";
            pstatement = conn.prepareStatement(sql);
            resultSet = pstatement.executeQuery();
            while (resultSet.next()) {
                Notice notice = new Notice();
                notice.setNoticeID(resultSet.getInt("noticeID"));
                notice.setTitle(resultSet.getString("title"));
                notice.setContent(resultSet.getString("content"));
                notice.setCreateTime(resultSet.getTimestamp("createTime"));
                list.add(notice);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            //关闭数据库连接，同时先要关闭结果集和PreparedStatement
            DBUtils.Close(resultSet, pstatement, conn);
        }
        return list;
    }

    public List<Notice> queryByName(String noticeTitle) {
        ArrayList<Notice> list = new ArrayList<>();
        //DBUtils封装了数据库的连接
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;
        try {
            String sql = "SELECT * FROM notice where title like ?";
            pstatement = conn.prepareStatement(sql);
            pstatement.setString(1,"%"+noticeTitle+"%");
            resultSet = pstatement.executeQuery();
            while (resultSet.next()) {
                Notice notice = new Notice();
                notice.setNoticeID(resultSet.getInt("noticeID"));
                notice.setTitle(resultSet.getString("title"));
                notice.setContent(resultSet.getString("content"));
                notice.setCreateTime(resultSet.getTimestamp("createTime"));
                list.add(notice);
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
    public void insertNotice(Notice notice) {
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        try {
            String sql = "insert into notice(title, content, createTime) value(?,?,?)";
            pstatement = conn.prepareStatement(sql);
            pstatement.setString(1, notice.getTitle());
            pstatement.setString(2, notice.getContent());
            pstatement.setTimestamp(3, notice.getCreateTime());
            pstatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtils.Close(null, pstatement, conn);
        }
    }

    @Override
    public void updateNotice(Notice notice) {
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        try {
            String sql;
            sql = "update notice set title=?,content=? where noticeID=?";
            pstatement = conn.prepareStatement(sql);
            pstatement.setString(1, notice.getTitle());
            pstatement.setString(2, notice.getContent());
            pstatement.setInt(3, notice.getNoticeID());
            pstatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            //关闭数据库连接，同时先要关闭结果集和PreparedStatement
            DBUtils.Close(null, pstatement, conn);
        }
    }

    @Override
    public void deleteNotice(int noticeID) {
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        try {
            String sql = "delete from notice where noticeID=?";
            pstatement = conn.prepareStatement(sql);
            pstatement.setInt(1, noticeID);
            pstatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtils.Close(null, pstatement, conn);
        }
    }
}
