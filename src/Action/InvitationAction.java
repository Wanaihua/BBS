package Action;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import Bean.Invitation;
import Bean.User;
import Dao.UserDao;
import Service.InvitationService;
import Service.UserService;
@Controller
public class InvitationAction {
	InvitationService invitationService;
	UserService userService;

	public InvitationService getInvitationService() {
		return invitationService;
	}
	@Resource
	public void setInvitationService(InvitationService invitationService) {
		this.invitationService = invitationService;
	}
	
	public UserService getUserService() {
		return userService;
	}
	@Resource
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	//发表帖子
	@RequestMapping("release.do")
	public String release(@Valid@ModelAttribute("command") Invitation invitation,BindingResult bindingResult,HttpServletRequest request){
		if(bindingResult.hasErrors()){
			request.setAttribute("id", invitation.getUserId());
			request.setAttribute("null","null" );
			return "release";
		}
		List<User> l=userService.information(invitation.getUserId());
		User user=l.get(0);
		int point=user.getUserPoints();
		int m=invitationService.refreshPoint(point+3,user.getUserId());
		invitation.setAuthor(user.getUserName());
		int n=invitationService.release(invitation);
		
		if(n>0){
			if(user.getUserId()==1){
				request.setAttribute("root", 1);
			}
			request.setAttribute("id", invitation.getUserId());
			return "release";
		}else{
			return "fail";
		}
	}
	
	//管理帖子
	@RequestMapping("look.do")
	public String look(HttpSession session,HttpServletRequest request){
		int id=Integer.parseInt(request.getParameter("id"));
		List l=invitationService.look(id);
		if(request.getParameter("root")!=null){
			request.setAttribute("root", 1);
		}
		if(l.size()>0){
			session.setAttribute("l", l);
			return "myself";
		}else if(l.size()==0){
			request.setAttribute("id", id);
			return "myself";
		}else{
			
			return "login";
		}
	}
	
	//删除帖子
	@RequestMapping("deletePost.do")
	public String deletePost(HttpSession session,HttpServletRequest request){
		int id=Integer.parseInt(request.getParameter("id"));
		int userId=Integer.parseInt(request.getParameter("userId"));
		List<User> li=userService.information(userId);
		User user=li.get(0);
		int point=user.getUserPoints();
		int m=invitationService.refreshPoint(point-3,user.getUserId());
		int n=invitationService.deletePost(id);
		if(n>0){
			List l=invitationService.look(userId);
			if(l.size()>0){
				session.setAttribute("l", l);				
			}else if(l.size()==0){
				request.setAttribute("id", userId);
			}
			if(userId==1){
				request.setAttribute("root", userId);
			}
			request.setAttribute("yes", 1);
			return "myself";
		}else{
			return "login";
		}
	}
	
	//管理员删除帖子
	@RequestMapping("RootDeletePost.do")
	public String RootDeletePost(HttpSession session,HttpServletRequest request){
		int id=Integer.parseInt(request.getParameter("id"));
		int pages=Integer.parseInt(request.getParameter("pages"));
		int useId=invitationService.selectUseIdFromId(id);
		List<User> li=userService.information(useId);
		User user=li.get(0);
		int point=user.getUserPoints();
		int m=invitationService.refreshPoint(point-3,useId);
		int n=invitationService.deletePost(id);
		if(n>0){
			request.setAttribute("pages", pages);
			List l=userService.findRoot(1);
			List all=invitationService.findAll();
			request.setAttribute("root", l);
			session.setAttribute("l", all);
			return "index";
		}else{
			return "login";
		}
	}
	
	//查看帖子
	@RequestMapping("findPost.do")
	public String findPost(HttpSession session,HttpServletRequest request){
		boolean k=true;
		int id=0,useId=0;
		if(request.getParameter("id")==null){
			id=Integer.parseInt(request.getAttribute("id").toString());
		}else{
			id=Integer.parseInt(request.getParameter("id"));
		}
		if(request.getParameter("useId")==null){
			useId=Integer.parseInt(request.getAttribute("useId").toString());
		}else{
			useId=Integer.parseInt(request.getParameter("useId"));
		}
		List l=invitationService.findPost(id);
		if(request.getParameter("pages")!=null){
			request.setAttribute("pages", request.getParameter("pages"));
		}else if(request.getAttribute("pages")!=null){
			request.setAttribute("pages", request.getAttribute("pages").toString());
		}
		if(l.size()>0){
			Invitation invitation=(Invitation)l.get(0);
			String s=invitation.getMatter();
			s = s.replaceAll("(\r|\n|\r\n|\n\r)", " ");
			s = s.replaceAll("\"","\\\\"+"\"");
			s = s.replaceAll("\'","\\\\"+"\'");
			session.setAttribute("matter", s);
			session.setAttribute("l", l);
			request.setAttribute("useId", useId);
			return "updatePost";
		}else{
			return "login";
		}
	}
	
	//修改帖子
	@RequestMapping("updatePost.do")
	public String updatePost(@Valid@ModelAttribute("command")Invitation invitation,HttpSession session,HttpServletRequest request){
		int l=invitationService.updatePost(invitation);
		if(l>0){
			request.setAttribute("id", invitation.getPostId());
			request.setAttribute("useId", invitation.getUserId());
			if(request.getParameter("pages")!=null){
				int pages=Integer.parseInt(request.getParameter("pages"));
				request.setAttribute("pages", pages);
			}
			findPost(session, request);
			request.setAttribute("yes", 1);
			return "updatePost";
		}else{
			return "login";
		}
	}
	
	//查看单个帖子
	@RequestMapping("lookOne.do")
	public String lookOne(Invitation invitation,HttpSession session,HttpServletRequest request){
		int x=Integer.parseInt(request.getParameter("x"));
		int pages=Integer.parseInt(request.getParameter("pages"));
		int id=Integer.parseInt(request.getParameter("id"));
		if(x>0){
			List l=invitationService.lookOne(x-1);
			session.setAttribute("l", l);
			session.setAttribute("pages", pages);
			request.setAttribute("id", id);
			return "look";
		}else{
			return "fail";
		}
		
	}
}
