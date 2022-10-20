package Service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import Bean.Rootr;
import Bean.User;
import Dao.UserDao;

@Component
public class UserService {
	UserDao userDao;

	public UserDao getUserDao() {
		return userDao;
	}
	@Resource
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	public List login(User user){
		return userDao.login(user);
	}
	public int insert(User user){
		return userDao.insert(user);
	}
	public List information(int id) {
		return userDao.information(id);
	}
	public int update(User user) {
		return userDao.update(user);
	}
	public List rootLogin(User user) {
		return userDao.rootLogin(user);
	}
	public List findRoot(int id) {
		return userDao.findRoot(id);
	}
	public int findName(User user) {
		return userDao.findName(user);
	}
	public List Rank() {
		return userDao.Rank();
	}


}
