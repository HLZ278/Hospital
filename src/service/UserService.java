package service;


import entity.User;
//业务层接口
public interface UserService {
	//1.用户登录
	public User login(String userName);
}
