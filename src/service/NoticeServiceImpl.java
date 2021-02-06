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

    @Override
    public List<Notice> queryByName(String noticeTitle) {
        NoticeDaoImpl noticeDao = new NoticeDaoImpl();
        return noticeDao.queryByName(noticeTitle);
    }

    @Override
    public void insertNotice(Notice notice) {
        NoticeDaoImpl noticeDao = new NoticeDaoImpl();
        noticeDao.insertNotice(notice);
    }

    @Override
    public void updateNotice(Notice notice) {
        NoticeDaoImpl noticeDao = new NoticeDaoImpl();
        noticeDao.updateNotice(notice);
    }

    @Override
    public void deleteNotice(int noticeID) {
        NoticeDaoImpl noticeDao = new NoticeDaoImpl();
        noticeDao.deleteNotice(noticeID);
    }
}
