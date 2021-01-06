package service;

import dao.UserDAO;
import dao.UserDAOImpl;
import entity.User;

public class UserServiceImpl implements UserService {
	@Override
	public User login(String userName) {
		UserDAO dao = new UserDAOImpl();
		User user = dao.login(userName);
		return user;
	}

}