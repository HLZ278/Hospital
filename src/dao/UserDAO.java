package dao;
import entity.User;

import java.util.List;

public interface UserDAO {
	public User login(String userName);
	public String findUser(String userName);
	public List<User> queryUser(int page);
	public List<User> queryHospitalUser(int page);
	public String queryHospitalName(User user);
}
