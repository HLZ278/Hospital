package dao;
import entity.Hospital;
import entity.Notice;

import java.util.List;

public interface NoticeDAO {
	public List<Notice> queryAll();
	public List<Notice> queryByName(String noticeTitle);

    void insertNotice(Notice notice);

	void updateNotice(Notice notice);

    void deleteNotice(int noticeID);
}
