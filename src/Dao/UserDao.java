package Dao;

import java.util.List;

import mapper.UserMapper;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import Bean.Rootr;
import Bean.User;
import MybatisUtils.MybatisUtils;

@Component
public class UserDao {
	
	public int insert(User user){
		SqlSession sqlSession=MybatisUtils.getSqlSession();
		UserMapper um=sqlSession.getMapper(UserMapper.class);
		int n=um.insert(user);
		sqlSession.commit();
		sqlSession.close();
		return n;
	}

	public List login(User user) {
		SqlSession sqlSession=MybatisUtils.getSqlSession();
		UserMapper um=sqlSession.getMapper(UserMapper.class);
		List n=um.login(user);
		sqlSession.close();
		return n;
	}

	public List information(Integer id) {
		SqlSession sqlSession=MybatisUtils.getSqlSession();
		UserMapper um=sqlSession.getMapper(UserMapper.class);
		List n=um.information(id);
		sqlSession.close();
		return n;
	}

	public int update(User user) {
		SqlSession sqlSession=MybatisUtils.getSqlSession();
		UserMapper um=sqlSession.getMapper(UserMapper.class);
		int n=um.update(user);
		sqlSession.commit();
		sqlSession.close();
		return n;
	}

	public List rootLogin(User user) {
		SqlSession sqlSession=MybatisUtils.getSqlSession();
		UserMapper um=sqlSession.getMapper(UserMapper.class);
		List n=um.rootLogin(user);
		sqlSession.close();
		return n;
	}

	public List findRoot(int id) {
		SqlSession sqlSession=MybatisUtils.getSqlSession();
		UserMapper um=sqlSession.getMapper(UserMapper.class);
		List n=um.findRoot(id);
		sqlSession.close();
		return n;
	}

	public int findName(User user) {
		SqlSession sqlSession=MybatisUtils.getSqlSession();
		UserMapper um=sqlSession.getMapper(UserMapper.class);
		List n=um.findName(user);
		sqlSession.close();
		if(n.size()>0){
			return 1;
		}
		return 0;
	}

	public List Rank() {
		SqlSession sqlSession=MybatisUtils.getSqlSession();
		UserMapper um=sqlSession.getMapper(UserMapper.class);
		List n=um.Rank();
		sqlSession.close();
		return n;
	}




}
