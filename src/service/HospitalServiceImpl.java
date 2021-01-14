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
    public void updateHospital(Hospital hospital) {
        HospitalDAO dao = new HospitalDaoImpl();
        dao.updateHospital(hospital);
    }
}
