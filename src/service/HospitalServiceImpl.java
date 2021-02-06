package service;

import dao.HospitalDAO;
import dao.HospitalDaoImpl;
import dao.UserDAO;
import dao.UserDAOImpl;
import entity.Hospital;
import entity.User;

import java.util.List;

public class HospitalServiceImpl implements HospitalService{
    @Override
    public List<Hospital> queryHospital(String hospitalName, int page) {
        HospitalDAO dao = new HospitalDaoImpl();
        if (hospitalName!=null&&hospitalName.trim()!=""){
            return dao.queryHospitalByName(hospitalName);
        }else {
            return dao.queryHospital(page);
        }
    }
    @Override
    public String queryHospitalName(int hospitalID) {
        HospitalDAO dao = new HospitalDaoImpl();
        return dao.queryHospitalName(hospitalID);
    }
    @Override
    public int insertHospital(Hospital hospital) {
        HospitalDAO dao = new HospitalDaoImpl();
        return dao.insertHospital(hospital);
    }

    @Override
    public void deleteHospital(int hospitalID) {
        HospitalDAO dao = new HospitalDaoImpl();
        dao.deleteHospital(hospitalID);
    }

    @Override
    public Hospital queryHospitalByID(int hospitalID) {
        HospitalDAO dao = new HospitalDaoImpl();
        return dao.queryHospitalByID(hospitalID);
    }

    @Override
    public int countHospital() {
        HospitalDAO dao = new HospitalDaoImpl();
        return dao.countHospital();
    }

    @Override
    public void updateHospital(Hospital hospital) {
        HospitalDAO dao = new HospitalDaoImpl();
        dao.updateHospital(hospital);
    }

    @Override
    public List<Hospital> queryHospitalByName(String hospitalName) {
        HospitalDAO dao = new HospitalDaoImpl();
        return dao.queryHospitalByName(hospitalName);
    }

    @Override
    public List<Hospital> queryHospitalByLevelAndArea(String level, String area) {
        HospitalDAO dao = new HospitalDaoImpl();
        if (level.equals("全部")){
            if (area.equals("全部")){
                return dao.queryHospital(0);
            }else {
                return dao.queryHospitalByArea(area);
            }
        }else {
            if (area.equals("全部")){
                return dao.queryHospitalByLevel(level);
            }else {
                return dao.queryHospitalByLevelAndArea(level, area);
            }
        }
    }
}
