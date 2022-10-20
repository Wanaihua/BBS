package Dao;

import java.util.List;

import mapper.InvitationMapper;
import mapper.UserMapper;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Component;

import Bean.Invitation;
import MybatisUtils.MybatisUtils;

@Component
public class InvitationDao {

	public int release(Invitation invitation) {
		SqlSession sqlSession=MybatisUtils.getSqlSession();
		InvitationMapper im=sqlSession.getMapper(InvitationMapper.class);
		int n=im.release(invitation);
		sqlSession.commit();
		sqlSession.close();
		return n;
	}

	public List look(int id) {
		SqlSession sqlSession=MybatisUtils.getSqlSession();
		InvitationMapper im=sqlSession.getMapper(InvitationMapper.class);
		List l=im.look(id);
		sqlSession.close();
		return l;
	}

	public int deletePost(int id) {
		SqlSession sqlSession=MybatisUtils.getSqlSession();
		InvitationMapper im=sqlSession.getMapper(InvitationMapper.class);
		int n=im.deletePost(id);
		sqlSession.commit();
		sqlSession.close();
		return n;
	}

	public int updatePost(Invitation invitation) {
		SqlSession sqlSession=MybatisUtils.getSqlSession();
		InvitationMapper im=sqlSession.getMapper(InvitationMapper.class);
		int l=im.updatePost(invitation);
		sqlSession.commit();
		sqlSession.close();
		return l;
	}

	public List findPost(int id) {
		SqlSession sqlSession=MybatisUtils.getSqlSession();
		InvitationMapper im=sqlSession.getMapper(InvitationMapper.class);
		List l=im.findPost(id);
		sqlSession.close();
		return l;
	}
	

	public List findAll() {
		SqlSession sqlSession=MybatisUtils.getSqlSession();
		InvitationMapper im=sqlSession.getMapper(InvitationMapper.class);
		List l=im.findAll();
		sqlSession.close();
		return l;
	}

	public List lookOne(int id) {
		SqlSession sqlSession=MybatisUtils.getSqlSession();
		InvitationMapper im=sqlSession.getMapper(InvitationMapper.class);
		List l=im.lookOne(id);
		sqlSession.close();
		return l;
	}

	public int refreshPoint(int i, int j) {
		SqlSession sqlSession=MybatisUtils.getSqlSession();
		InvitationMapper im=sqlSession.getMapper(InvitationMapper.class);
		int n=im.refreshPoint(i,j);
		sqlSession.commit();
		sqlSession.close();
		return n;
	}

	public int selectUseIdFromId(int id) {
		SqlSession sqlSession=MybatisUtils.getSqlSession();
		InvitationMapper im=sqlSession.getMapper(InvitationMapper.class);
		int userId=im.selectUseIdFromId(id);
		sqlSession.close();
		return userId;
	}


}
