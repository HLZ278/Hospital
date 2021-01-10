package service;

import dao.UserDAO;
import dao.UserDAOImpl;
import entity.Hospital;
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
	public List<User> queryUser(String userName, int page) {
		UserDAO dao = new UserDAOImpl();
		//当userName有值说明是搜索
		if (userName!=null&&userName.trim()!=""){
			return dao.findUserByName(userName, 1);
		}else {
			return dao.queryUser(page);
		}
	}

	@Override
	public List<User> queryHospitalUser(String userName, int page) {
		UserDAO dao = new UserDAOImpl();
		//当userName有值说明是搜索
		if (userName!=null&&userName.trim()!=""){
			return dao.findUserByName(userName, 2);
		}else {
			return dao.queryHospitalUser(page);
		}
	}
	@Override
	public String queryHospitalName(User user) {
		UserDAO dao = new UserDAOImpl();
		return dao.queryHospitalName(user);
	}
	@Override
	public int addUser(User user) {
		UserDAO dao = new UserDAOImpl();
		return dao.addUser(user);
	}

	@Override
	public int deleteUser(int userID) {
		UserDAO dao = new UserDAOImpl();
		return dao.deleteUser(userID);
	}

	@Override
	public List<Hospital> queryHospital(int page) {
		UserDAO dao = new UserDAOImpl();
		return dao.queryHospital(page);
	}
}