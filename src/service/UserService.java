package service;


import entity.User;

public interface UserService {
	//1.用户登录
	public User login(String userName);
}
