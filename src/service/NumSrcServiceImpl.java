package service;

import dao.DoctorDao;
import dao.DoctorDaoImpl;
import dao.NumSrcDaoImpl;
import entity.Doctor;
import entity.NumSrc;

import java.util.List;

public class NumSrcServiceImpl implements NumSrcService {

    @Override
    public List<NumSrc> queryNumSrc(int doctorID) {
        NumSrcDaoImpl numSrcDao = new NumSrcDaoImpl();
        return numSrcDao.queryNumSrc(doctorID);
    }
}
