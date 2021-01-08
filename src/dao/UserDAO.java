package dao;
import entity.User;

import java.util.List;

public interface UserDAO {
	public User login(String userName);
	public String findUser(String userName);
	public List<User> queryUser(int page);
}
