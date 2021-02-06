package service;

import entity.Doctor;
import entity.Notice;

import java.util.List;

public interface NoticeService {
    public List<Notice> queryAll();

    List<Notice> queryByName(String noticeTitle);

    void insertNotice(Notice notice);

    void updateNotice(Notice notice);

    void deleteNotice(int noticeID);

}
