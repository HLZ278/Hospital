package dao;

import entity.Hospital;
import entity.User;
import utils.DBUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class HospitalDaoImpl implements HospitalDAO {
    @Override
    public List<Hospital> queryHospital(int page) {
        ArrayList<Hospital> list = new ArrayList<>();
        //DBUtils封装了数据库的连接
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;
        try {
            String sql = "SELECT * FROM hospital ORDER BY hospitalID LIMIT "+(page)*14+", 14";
            pstatement = conn.prepareStatement(sql);
            resultSet = pstatement.executeQuery();
            while (resultSet.next()) {
                Hospital hospital = new Hospital();
                hospital.setHospitalID(resultSet.getInt("hospitalID"));
                hospital.setHospitalName(resultSet.getString("hospitalName"));
                hospital.setGrade(resultSet.getString("grade"));
                hospital.setArea(resultSet.getString("area"));
                hospital.setAddress(resultSet.getString("address"));
                hospital.setIcon(resultSet.getString("icon"));
                hospital.setReleaseTime(resultSet.getTime("releaseTime"));
                hospital.setStopTime(resultSet.getTime("stopTime"));
                hospital.setRule(resultSet.getString("rule"));
                hospital.setDetails(resultSet.getString("details"));
                hospital.setNotice(resultSet.getString("notice"));
                list.add(hospital);
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
    public int insertHospital(Hospital hospital) {
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        int result = 0;
        try {
            String sql = "insert into hospital(hospitalName, grade, area, address, releaseTime, stopTime) value(?,?,?,?,?,?)";
            pstatement = conn.prepareStatement(sql);
            pstatement.setString(1, hospital.getHospitalName());
            pstatement.setString(2, hospital.getGrade());
            pstatement.setString(3, hospital.getArea());
            pstatement.setString(4, hospital.getAddress());
            pstatement.setTime(5, hospital.getReleaseTime());
            pstatement.setTime(6, hospital.getStopTime());
            result = pstatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtils.Close(null, pstatement, conn);
        }
        return result;
    }

    @Override
    public int countHospital() {
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;
        int result = 0;
        try {
            String sql = "select count(*) from hospital";
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
    public void deleteHospital(int hospitalID) {
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        try {
            String sql = "delete from hospital where hospitalID=?";
            pstatement = conn.prepareStatement(sql);
            pstatement.setInt(1, hospitalID);
            pstatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            DBUtils.Close(null, pstatement, conn);
        }
    }

    @Override
    public List<Hospital> queryHospitalByName(String hospitalName) {
        ArrayList<Hospital> list = new ArrayList<>();
        //DBUtils封装了数据库的连接
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;
        try {
            String sql = "SELECT * FROM hospital WHERE hospitalName like ?  ORDER BY hospitalID";
            pstatement = conn.prepareStatement(sql);
            pstatement.setString(1, "%"+hospitalName+"%");
            resultSet = pstatement.executeQuery();
            while (resultSet.next()) {
                Hospital hospital = new Hospital();
                hospital.setHospitalID(resultSet.getInt("hospitalID"));
                hospital.setHospitalName(resultSet.getString("hospitalName"));
                hospital.setGrade(resultSet.getString("grade"));
                hospital.setArea(resultSet.getString("area"));
                hospital.setAddress(resultSet.getString("address"));
                hospital.setIcon(resultSet.getString("icon"));
                hospital.setReleaseTime(resultSet.getTime("releaseTime"));
                hospital.setStopTime(resultSet.getTime("stopTime"));
                hospital.setRule(resultSet.getString("rule"));
                hospital.setDetails(resultSet.getString("details"));
                hospital.setNotice(resultSet.getString("notice"));
                list.add(hospital);
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
    public void updateHospital(Hospital hospital) {
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        try {
            String sql;
            sql = "update hospital set hospitalName=?,grade=?, area=?, address=?, releaseTime=?, stopTime=? where hospitalID=?";
            pstatement = conn.prepareStatement(sql);
            pstatement.setString(1, hospital.getHospitalName());
            pstatement.setString(2, hospital.getGrade());
            pstatement.setString(3, hospital.getArea());
            pstatement.setString(4, hospital.getAddress());
            pstatement.setTime(5, hospital.getReleaseTime());
            pstatement.setTime(6, hospital.getStopTime());
            pstatement.setInt(7, hospital.getHospitalID());
            pstatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            //关闭数据库连接，同时先要关闭结果集和PreparedStatement
            DBUtils.Close(null, pstatement, conn);
        }
    }
    @Override
    public void updateHospitalMessage(Hospital hospital) {
        System.out.println("ssss"+hospital);
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        try {
            String sql;
            sql = "update hospital set hospitalName=?,grade=?, area=?, address=?, releaseTime=?, stopTime=?, icon=?, rule=?, details=?, notice=? where hospitalID=?";
            pstatement = conn.prepareStatement(sql);
            pstatement.setString(1, hospital.getHospitalName());
            pstatement.setString(2, hospital.getGrade());
            pstatement.setString(3, hospital.getArea());
            pstatement.setString(4, hospital.getAddress());
            pstatement.setTime(5, hospital.getReleaseTime());
            pstatement.setTime(6, hospital.getStopTime());
            pstatement.setString(7, hospital.getIcon());
            pstatement.setString(8, hospital.getRule());
            pstatement.setString(9, hospital.getDetails());
            pstatement.setString(10, hospital.getNotice());
            pstatement.setInt(11, hospital.getHospitalID());
            pstatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            //关闭数据库连接，同时先要关闭结果集和PreparedStatement
            DBUtils.Close(null, pstatement, conn);
        }
    }

    @Override
    public Hospital queryHospitalByID(int hospitalID) {
            //DBUtils封装了数据库的连接
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;
        Hospital hospital = new Hospital();
        try {
                String sql = "SELECT * FROM hospital where hospitalID=?";
                pstatement = conn.prepareStatement(sql);
                pstatement.setInt(1, hospitalID);
                resultSet = pstatement.executeQuery();
                if (resultSet.next()) {
                    hospital.setHospitalID(resultSet.getInt("hospitalID"));
                    hospital.setHospitalName(resultSet.getString("hospitalName"));
                    hospital.setGrade(resultSet.getString("grade"));
                    hospital.setArea(resultSet.getString("area"));
                    hospital.setAddress(resultSet.getString("address"));
                    hospital.setIcon(resultSet.getString("icon"));
                    hospital.setReleaseTime(resultSet.getTime("releaseTime"));
                    hospital.setStopTime(resultSet.getTime("stopTime"));
                    hospital.setRule(resultSet.getString("rule"));
                    hospital.setDetails(resultSet.getString("details"));
                    hospital.setNotice(resultSet.getString("notice"));
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }finally {
                //关闭数据库连接，同时先要关闭结果集和PreparedStatement
                DBUtils.Close(resultSet, pstatement, conn);
            }
            return hospital;
    }

    @Override
    public List<Hospital> queryHospitalByArea(String area) {
        ArrayList<Hospital> list = new ArrayList<>();
        //DBUtils封装了数据库的连接
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;
        try {
            String sql = "SELECT * FROM hospital WHERE area=? ORDER BY hospitalID LIMIT 0, 14";
            pstatement = conn.prepareStatement(sql);
            pstatement.setString(1, area);
            resultSet = pstatement.executeQuery();
            while (resultSet.next()) {
                Hospital hospital = new Hospital();
                hospital.setHospitalID(resultSet.getInt("hospitalID"));
                hospital.setHospitalName(resultSet.getString("hospitalName"));
                hospital.setGrade(resultSet.getString("grade"));
                hospital.setArea(resultSet.getString("area"));
                hospital.setAddress(resultSet.getString("address"));
                hospital.setIcon(resultSet.getString("icon"));
                hospital.setReleaseTime(resultSet.getTime("releaseTime"));
                hospital.setStopTime(resultSet.getTime("stopTime"));
                hospital.setRule(resultSet.getString("rule"));
                hospital.setDetails(resultSet.getString("details"));
                hospital.setNotice(resultSet.getString("notice"));
                list.add(hospital);
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
    public List<Hospital> queryHospitalByArea(String area, int page) {
        ArrayList<Hospital> list = new ArrayList<>();
        //DBUtils封装了数据库的连接
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;
        try {
            String sql = "SELECT * FROM hospital WHERE area=? ORDER BY hospitalID LIMIT "+(page)*14+", 14";
            pstatement = conn.prepareStatement(sql);
            pstatement.setString(1, area);
            resultSet = pstatement.executeQuery();
            while (resultSet.next()) {
                Hospital hospital = new Hospital();
                hospital.setHospitalID(resultSet.getInt("hospitalID"));
                hospital.setHospitalName(resultSet.getString("hospitalName"));
                hospital.setGrade(resultSet.getString("grade"));
                hospital.setArea(resultSet.getString("area"));
                hospital.setAddress(resultSet.getString("address"));
                hospital.setIcon(resultSet.getString("icon"));
                hospital.setReleaseTime(resultSet.getTime("releaseTime"));
                hospital.setStopTime(resultSet.getTime("stopTime"));
                hospital.setRule(resultSet.getString("rule"));
                hospital.setDetails(resultSet.getString("details"));
                hospital.setNotice(resultSet.getString("notice"));
                list.add(hospital);
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
    public List<Hospital> queryHospitalByLevel(String level) {
        ArrayList<Hospital> list = new ArrayList<>();
        //DBUtils封装了数据库的连接
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;
        try {
            String sql = "SELECT * FROM hospital WHERE grade=? ORDER BY hospitalID LIMIT 0, 14";
            pstatement = conn.prepareStatement(sql);
            pstatement.setString(1, level);
            resultSet = pstatement.executeQuery();
            while (resultSet.next()) {
                Hospital hospital = new Hospital();
                hospital.setHospitalID(resultSet.getInt("hospitalID"));
                hospital.setHospitalName(resultSet.getString("hospitalName"));
                hospital.setGrade(resultSet.getString("grade"));
                hospital.setArea(resultSet.getString("area"));
                hospital.setAddress(resultSet.getString("address"));
                hospital.setIcon(resultSet.getString("icon"));
                hospital.setReleaseTime(resultSet.getTime("releaseTime"));
                hospital.setStopTime(resultSet.getTime("stopTime"));
                hospital.setRule(resultSet.getString("rule"));
                hospital.setDetails(resultSet.getString("details"));
                hospital.setNotice(resultSet.getString("notice"));
                list.add(hospital);
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
    public List<Hospital> queryHospitalByLevel(String level, int page) {
        ArrayList<Hospital> list = new ArrayList<>();
        //DBUtils封装了数据库的连接
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;
        try {
            String sql = "SELECT * FROM hospital WHERE grade=? ORDER BY hospitalID LIMIT "+(page)*14+", 14";
            pstatement = conn.prepareStatement(sql);
            pstatement.setString(1, level);
            resultSet = pstatement.executeQuery();
            while (resultSet.next()) {
                Hospital hospital = new Hospital();
                hospital.setHospitalID(resultSet.getInt("hospitalID"));
                hospital.setHospitalName(resultSet.getString("hospitalName"));
                hospital.setGrade(resultSet.getString("grade"));
                hospital.setArea(resultSet.getString("area"));
                hospital.setAddress(resultSet.getString("address"));
                hospital.setIcon(resultSet.getString("icon"));
                hospital.setReleaseTime(resultSet.getTime("releaseTime"));
                hospital.setStopTime(resultSet.getTime("stopTime"));
                hospital.setRule(resultSet.getString("rule"));
                hospital.setDetails(resultSet.getString("details"));
                hospital.setNotice(resultSet.getString("notice"));
                list.add(hospital);
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
    public List<Hospital> queryHospitalByLevelAndArea(String level, String area) {
        ArrayList<Hospital> list = new ArrayList<>();
        //DBUtils封装了数据库的连接
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;
        try {
            String sql = "SELECT * FROM hospital WHERE grade=? and area=? ORDER BY hospitalID LIMIT 0, 14";
            pstatement = conn.prepareStatement(sql);
            pstatement.setString(1, level);
            pstatement.setString(2, area);
            resultSet = pstatement.executeQuery();
            while (resultSet.next()) {
                Hospital hospital = new Hospital();
                hospital.setHospitalID(resultSet.getInt("hospitalID"));
                hospital.setHospitalName(resultSet.getString("hospitalName"));
                hospital.setGrade(resultSet.getString("grade"));
                hospital.setArea(resultSet.getString("area"));
                hospital.setAddress(resultSet.getString("address"));
                hospital.setIcon(resultSet.getString("icon"));
                hospital.setReleaseTime(resultSet.getTime("releaseTime"));
                hospital.setStopTime(resultSet.getTime("stopTime"));
                hospital.setRule(resultSet.getString("rule"));
                hospital.setDetails(resultSet.getString("details"));
                hospital.setNotice(resultSet.getString("notice"));
                list.add(hospital);
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
    public List<Hospital> queryHospitalByLevelAndArea(String level, String area, int page) {
        ArrayList<Hospital> list = new ArrayList<>();
        //DBUtils封装了数据库的连接
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;
        try {
            String sql = "SELECT * FROM hospital WHERE grade=? and area=? and  ORDER BY hospitalID LIMIT "+(page)*14+", 14";
            pstatement = conn.prepareStatement(sql);
            pstatement.setString(1, level);
            pstatement.setString(1, area);
            resultSet = pstatement.executeQuery();
            while (resultSet.next()) {
                Hospital hospital = new Hospital();
                hospital.setHospitalID(resultSet.getInt("hospitalID"));
                hospital.setHospitalName(resultSet.getString("hospitalName"));
                hospital.setGrade(resultSet.getString("grade"));
                hospital.setArea(resultSet.getString("area"));
                hospital.setAddress(resultSet.getString("address"));
                hospital.setIcon(resultSet.getString("icon"));
                hospital.setReleaseTime(resultSet.getTime("releaseTime"));
                hospital.setStopTime(resultSet.getTime("stopTime"));
                hospital.setRule(resultSet.getString("rule"));
                hospital.setDetails(resultSet.getString("details"));
                hospital.setNotice(resultSet.getString("notice"));
                list.add(hospital);
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
    public String queryHospitalName(int hospitalID) {
        Connection conn = DBUtils.getCon();
        PreparedStatement pstatement = null;
        ResultSet resultSet = null;
        try {
            String sql = "select hospitalName from hospital where hospitalID =?";
            pstatement = conn.prepareStatement(sql);
            pstatement.setInt(1, hospitalID);
            resultSet = pstatement.executeQuery();
            if (resultSet.next()) {
                return resultSet.getString(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            //关闭数据库连接，同时先要关闭结果集和PreparedStatement
            DBUtils.Close(resultSet, pstatement, conn);
        }
        return "暂无";
    }
}
