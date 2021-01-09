package service;

import dao.UserDAO;
import dao.UserDAOImpl;
import entity.User;

import java.util.List;

//业务层
public class UserServiceImpl implements UserService {
	@Override
	public User login(String userName) {
		//业务层进行一些处理后调用dao层操作获取数据库数据
		UserDAO dao = new UserDAOImpl();
		User user = dao.login(userName);
		return user;
	}

	@Override
	public String findUser(String userName) {
		UserDAO dao = new UserDAOImpl();
		return dao.findUser(userName);
	}

	@Override
	public List<User> queryUser(int page) {
		UserDAO dao = new UserDAOImpl();
		return dao.queryUser(page);
	}

	@Override
	public List<User> queryHospitalUser(int page) {
		UserDAO dao = new UserDAOImpl();
		return dao.queryHospitalUser(page);
	}
	@Override
	public String queryHospitalName(User user) {
		UserDAO dao = new UserDAOImpl();
		return dao.queryHospitalName(user);
	}

}