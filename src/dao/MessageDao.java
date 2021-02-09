package dao;
import entity.Doctor;
import entity.Message;

import java.util.List;

public interface MessageDao {
	public List<Message> queryAll(int page);

	List<Message> queryAllByUserID(int userID, int page);
}
