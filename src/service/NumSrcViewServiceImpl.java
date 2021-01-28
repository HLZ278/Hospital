package service;

import dao.NumSrcDaoImpl;
import dao.NumSrcViewDaoImpl;
import entity.NumSrc;
import entity.NumSrcView;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

public class NumSrcViewServiceImpl implements NumSrcViewService {

    @Override
    public List<NumSrcView> queryNumSrc(int departmentID) {
        NumSrcViewDaoImpl numSrcViewDao = new NumSrcViewDaoImpl();
        return numSrcViewDao.queryNumSrcView(departmentID);
    }
}
