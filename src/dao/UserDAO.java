package dao;
import entity.User;
public interface UserDAO {
	public User login(String userName);
	public String findUser(String userName);
}
