package dao;
import entity.Hospital;
import entity.User;

import java.util.List;

public interface UserDAO {
	public User login(String userName);
	public String findUser(String userName);
	public List<User> findUserByName(String userName, int userType);
	public List<User> queryUser(int page);
	public List<User> queryHospitalUser(int page);
	public List<Hospital> queryHospital(int page);
	public String queryHospitalName(User user);
	public int addUser(User user);
	public int deleteUser(int userID);
}
