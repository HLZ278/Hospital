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
	public String queryHospitalName(User user);
	public int addUser(User user);
	public int deleteUser(int userID);
	public List<Hospital> queryHospital(int page);
}
