package service;


import entity.Hospital;
import entity.User;

import java.util.List;

//业务层接口
public interface UserService {
	//1.用户登录
	public User login(String userName);
	//2.登陆时查找用户
	public String findUser(String userName);
	public List<User> queryUser(String userName,int page);
	public List<User> queryHospitalUser(String userName, int page);
	public int addUser(User user, int userType);
	public int deleteUser(int userID);

    int queryUserIDByHospitalID(int hospitalID);

    int updateUser(User user);

}
