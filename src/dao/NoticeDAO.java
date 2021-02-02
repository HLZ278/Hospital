package dao;
import entity.Hospital;
import entity.Notice;

import java.util.List;

public interface NoticeDAO {
	public List<Notice> queryAll();
}
