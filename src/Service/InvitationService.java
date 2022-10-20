package Service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import Bean.Invitation;
import Dao.InvitationDao;

@Component
public class InvitationService {
	InvitationDao invitationDao;

	public InvitationDao getInvitationDao() {
		return invitationDao;
	}
	@Resource
	public void setInvitationDao(InvitationDao invitationDao) {
		this.invitationDao = invitationDao;
	}
	public int release(Invitation invitation) {
		return invitationDao.release(invitation);
	}
	public List look(int id) {
		return invitationDao.look(id);
	}
	public int deletePost(int id) {
		return invitationDao.deletePost(id);
	}
	public int updatePost(Invitation invitation) {
		return invitationDao.updatePost(invitation);
	}
	public List findPost(int id) {
		return invitationDao.findPost(id);
	}
	public List findAll() {
		return invitationDao.findAll();
	}
	public List lookOne(int id) {
		return invitationDao.lookOne(id);
	}
	public int refreshPoint(int i, int j) {
		return invitationDao.refreshPoint(i,j);
	}
	public int selectUseIdFromId(int id) {
		return invitationDao.selectUseIdFromId(id);
	}

	
}
