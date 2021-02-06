package dao;
import entity.Message;
import entity.Notice;

import java.util.List;

public interface MessageDAO {
	public List<Message> queryAll();
}
