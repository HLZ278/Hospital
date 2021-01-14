package dao;
import entity.Hospital;
import entity.User;
import utils.UserType;

import java.util.List;

public interface UserDAO {
	public User login(String userName);
	public String findUser(String userName);
	public List<User> findUserByName(String userName, int userType);
	public List<User> queryUser(int page);
	public List<User> queryHospitalUser(int page);
	public int addUser(User user, int userType);
	public int deleteUser(int userID);

    int queryUserIDByHospitalID(int hospitalID);
}
