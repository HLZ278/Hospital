package service;

import dao.DoctorDao;
import dao.DoctorDaoImpl;
import dao.NumSrcDaoImpl;
import entity.Doctor;
import entity.NumSrc;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

public class NumSrcServiceImpl implements NumSrcService {

    @Override
    public List<NumSrc> queryNumSrc(int doctorID) {
        NumSrcDaoImpl numSrcDao = new NumSrcDaoImpl();
        return numSrcDao.queryNumSrc(doctorID);
    }

    @Override
    public void insertOrUpdateNumSrc(List<NumSrc> numSrcList) {
        NumSrcDaoImpl numSrcDao = new NumSrcDaoImpl();
        java.text.SimpleDateFormat formater = new java.text.SimpleDateFormat("MM月dd日");
        java.util.Date date = new java.util.Date();
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(calendar.DATE,1);
        java.util.Date tomorrowTime = calendar.getTime();
        calendar.add(calendar.DATE,1);
        java.util.Date bigTomorrowTime = calendar.getTime();
        numSrcList.get(0).setContractTime(new Date(date.getTime()));
        numSrcList.get(1).setContractTime(new Date(tomorrowTime.getTime()));
        numSrcList.get(2).setContractTime(new Date(bigTomorrowTime.getTime()));
        numSrcDao.insertOrUpdateNumSrc(numSrcList);
    }
}
