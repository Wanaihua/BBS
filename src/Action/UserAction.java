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
import Bean.Rootr;
import Bean.User;
import Service.InvitationService;
import Service.UserService;



@Controller
public class UserAction {
	 UserService userService;
	 InvitationService invitationService;

	public UserService getUserService() {
		return userService;
	}
	@Resource
	public void setUserService(UserService userService) {
		this.userService = userService;
	}
	
	public InvitationService getInvitationService() {
		return invitationService;
	}
	@Resource
	public void setInvitationService(InvitationService invitationService) {
		this.invitationService = invitationService;
	}
	
	//登录
	@RequestMapping("login.do")
	public String login(@Valid@ModelAttribute("command") User user,BindingResult bindingResult,HttpSession session,HttpServletRequest request){
		if(bindingResult.hasErrors()){
			return "login";
		}
		List l=userService.login(user);
		List all=invitationService.findAll();
		if(l.size()>0){
			request.setAttribute("user", l);
			session.setAttribute("l", all);
			request.setAttribute("pages", 1);
			return "index";
		}else{
			request.setAttribute("no", "no");
			return "login";
		}
	}
	
	//管理员登录
	@RequestMapping("rootlogin.do")
	public String rootLogin(@Valid@ModelAttribute("command") User user,BindingResult bindingResult,HttpSession session,HttpServletRequest request){
		if(bindingResult.hasErrors()){
			return "login";
		}
		List l=userService.rootLogin(user);
		List all=invitationService.findAll();
		if(l.size()>0){
			request.setAttribute("root", l);
			session.setAttribute("l", all);
			request.setAttribute("pages", 1);
			return "index";
		}else{
			request.setAttribute("rootno", "no");
			return "login";
		}
	}
		
	//刷新
	@RequestMapping("refresh.do")
	public String refresh(HttpSession session,HttpServletRequest request){
		List l=null,all=null;
		all=invitationService.findAll();
		if(request.getParameter("id")!=null){
			int id=Integer.parseInt(request.getParameter("id"));
			if(id==0) {
				session.setAttribute("l", all);
				return "index";
			}
			l=userService.information(id);
		}
		int page=Integer.parseInt(request.getParameter("pages"));
		if(l!=null){
			request.setAttribute("user", l);
			request.setAttribute("pages", page);
			session.setAttribute("l", all);
			return "index";
		}else{
			request.setAttribute("pages", page);
			session.setAttribute("l", all);
			return "index";
		}
	}
	
	@RequestMapping("rootRefresh.do")
	public String rootRefresh(HttpSession session,HttpServletRequest request){
		int id=Integer.parseInt(request.getParameter("id"));
		int page=Integer.parseInt(request.getParameter("pages"));
		List l=userService.findRoot(id);
		List all=invitationService.findAll();
		if(l.size()>0){
			request.setAttribute("root", l);
			request.setAttribute("pages", page);
			session.setAttribute("l", all);
			return "index";
		}else{
			return "login";
		}
	}
	
	@RequestMapping("findall.do")
	public String findall(HttpSession session,HttpServletRequest request){
		List all=invitationService.findAll();
		if(all.size()>0){
			session.setAttribute("l", all);
			request.setAttribute("pages", 1);
			return "index";
		}else{
			return "login";
		}
	}
	
	
	
	//注册
	@RequestMapping("insert.do")
	public String register(@Valid@ModelAttribute("command") User user,BindingResult bindingResult,HttpServletRequest request){
		if(bindingResult.hasErrors()){
			return "register";
		}
		int y=userService.findName(user);
		if(y==1){
			request.setAttribute("have", y);
			return "register";
		}
		int n=userService.insert(user);
		if(n>0){
			return "login";
		}else{
			return "fail";
		}
	}
	//个人信息
	@RequestMapping("information.do")
	public String information(HttpServletRequest request,HttpSession session){
		Integer id=0;
		if(request.getParameter("id")!=null){
			id=Integer.parseInt(request.getParameter("id"));
		}else{
			id=Integer.parseInt(request.getAttribute("id").toString());
		}
		List l=userService.information(id);
		if(l.size()>0){
			session.setAttribute("user", l);
			return "information";
		}else{
			return "index";
		}
	}
	//修改
	@RequestMapping("update.do")
	public String update( User user,HttpServletRequest request,HttpSession session){
		int n=userService.update(user);
		if(n>0){
			request.setAttribute("id", user.getUserId());
			information(request, session);
			request.setAttribute("id",  user.getUserId());
			return "information";
		}else{
			return "fail";
		}
	}
	
	//积分排行榜
	@RequestMapping("Rank.do")
	public String Rank(HttpServletRequest request,HttpSession session){
		List l=userService.Rank();
		session.setAttribute("l", l);
		if(request.getParameter("id")!=null){
			int id=Integer.parseInt(request.getParameter("id"));
			request.setAttribute("id", id);
		}
		return "Rank";
	}
}
