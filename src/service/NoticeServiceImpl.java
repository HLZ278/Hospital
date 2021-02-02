package service;

import dao.DoctorDao;
import dao.DoctorDaoImpl;
import dao.NoticeDaoImpl;
import entity.Doctor;
import entity.Notice;

import java.util.List;

public class NoticeServiceImpl implements NoticeService {
    @Override
    public List<Notice> queryAll() {
        NoticeDaoImpl noticeDao = new NoticeDaoImpl();
        return noticeDao.queryAll();
    }
}
