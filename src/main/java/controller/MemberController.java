package controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import dao.MybatisMemberDBBean;
import model.MemberDataBean;
import model.MovieFinderAccessDataBean;

@Controller
public class MemberController {

	ModelAndView mv = new ModelAndView();
	int pageNum = 1;

	@Autowired
	MybatisMemberDBBean dbPro;
	

	@RequestMapping(value = "inputForm")
	public ModelAndView inputForm() throws Exception {

		mv.clear();
		mv.setViewName("member/inputForm");

		return mv;
	}

	@RequestMapping(value = "confirmId")
	public ModelAndView confirmId(String id) throws Exception {
		int check = dbPro.confirmId(id);

		mv.clear();
		mv.addObject("check", check);
		mv.addObject("id", id);

		mv.setViewName("local/confirmId");
		return mv;
	}

	@RequestMapping(value = "inputPro")
	public ModelAndView inputPro( HttpServletRequest request,MultipartHttpServletRequest multipart, MemberDataBean member) throws Exception {

		 MultipartFile multi= multipart.getFile("uploadfile");
		   String filename=multi.getOriginalFilename();
		   if(filename !=null && !filename.equals("")) {
			   String uploadPath=multipart.getRealPath("/view/"+"fileSave");
			   System.out.println(uploadPath);
			   FileCopyUtils.copy(multi.getInputStream(),
					   new FileOutputStream(uploadPath+"/"+
			   multi.getOriginalFilename()));
		   }
		   else {
			   filename = "";
		   }
		System.out.println(filename);
		member.setFilename(filename);
		System.out.println("dd" + member);
		dbPro.insertMember(member);
		mv.clear();
		mv.setViewName("member/inputPro");
		return mv;
	}

	@RequestMapping(value = "loginForm")
	public ModelAndView loginForm() throws Exception {

		mv.clear();
		mv.setViewName("member/loginForm");
		return mv;
	}

	@RequestMapping(value = "loginPro")
	public ModelAndView loginPro(String id, String passwd,
			HttpServletRequest request) throws Exception {
		int check = dbPro.userCheck(id, passwd);
		System.out.println("**********memberController loginPro");
		System.out.println("loginPro check : " + check);
		
		mv.clear();
		if (check == 1) {
			request.getSession().setAttribute("memId", id);
		}
		mv.addObject("check", check);
		mv.setViewName("member/loginPro");

		System.out.println("check : " + check);
		return mv;

	}

	@RequestMapping(value = "logoutPro")
	public ModelAndView logoutPro(HttpServletRequest request) throws Exception {

		mv.clear();
		request.getSession().invalidate();

		mv.setViewName("main/main");
		return mv;
	}

	@RequestMapping(value = "passwordForm")
	public ModelAndView passwordForm() throws Exception {

		mv.clear();
		mv.setViewName("member/passwordForm");
		return mv;
	}

	@RequestMapping(value = "password")
	public ModelAndView password(String id, String name, String birth) throws Exception {

		String xxx = dbPro.Password(id, name, birth);
		System.out.println(xxx);

		mv.clear();
		mv.addObject("xxx", xxx);
		mv.addObject("id", id);
		mv.setViewName("member/password");
		return mv;
	}

	@RequestMapping(value = "idForm")
	public ModelAndView idForm() throws Exception {

		mv.clear();
		mv.setViewName("member/idForm");
		return mv;
	}

	@RequestMapping(value = "id")
	public ModelAndView id(String name, MemberDataBean member) throws Exception {

		String yyy = dbPro.Id(name, member); 
		System.out.println(yyy);

		mv.clear();

		mv.addObject("yyy", yyy);
		mv.setViewName("member/id");
		return mv;
	}

	@RequestMapping(value = "myPage")
	public ModelAndView myPage(HttpServletRequest request, MemberDataBean member) throws Exception {
	
		
		request.setCharacterEncoding("UTF-8");
		String id = (String) request.getSession().getAttribute("memId");

		member = dbPro.getArticle(id);
		
		mv.clear();
		mv.addObject("memId", id);
		mv.addObject("name", member.getName());
		mv.addObject("nickname", member.getNickname());
		mv.addObject("filename", member.getFilename());
		mv.addObject("member", member);
		mv.setViewName("member/myPage");
		return mv;
	}

	@RequestMapping(value = "updateForm1")
	public ModelAndView updateForm1(String passwd, HttpServletRequest request)
			throws Exception {

		String memId = (String) request.getSession().getAttribute("memId");

		System.out.println("memId : " + memId);
		mv.clear();
		mv.setViewName("member/updateForm1");
		return mv;
	}

	@RequestMapping(value = "checkPro")
	public ModelAndView checkPro(String passwd, HttpServletRequest request)
			throws Exception {

		String memId = (String) request.getSession().getAttribute("memId");
		System.out.println("memId : " + memId);
		System.out.println("�Է���  passwd : " + passwd);

		int check = dbPro.userCheck(memId, passwd);
		System.out.println("check : " + check);

		mv.clear();
		mv.addObject("passwd", passwd);
		mv.addObject("check", check);
		mv.setViewName("member/checkPro");
		return mv;
	}

	@RequestMapping(value = "modifyForm")
	public ModelAndView modifyForm(MemberDataBean member,
			HttpServletRequest request) throws Exception {

		request.setCharacterEncoding("UTF-8");
		String id = (String) request.getSession().getAttribute("memId");

		member = dbPro.getArticle(id);
		System.out.println(member);
		mv.clear();
		mv.addObject("memId", id);
		mv.addObject("passwd", member.getPasswd());
		mv.addObject("name", member.getName());
		mv.addObject("email", member.getEmail());
		mv.addObject("birth", member.getBirth());
		mv.addObject("mobile", member.getMobile());
		mv.setViewName("member/modifyForm");
		return mv;

	}

	@RequestMapping(value = "ModifyPro")
	public ModelAndView ModifyPro(MemberDataBean member,
			HttpServletRequest request) throws Exception {

		request.setCharacterEncoding("UTF-8");
		String id = (String) request.getSession().getAttribute("memId");
		System.out.println("id : " + id);
		member.setId(id);

		int check = dbPro.updateArticle(member);
		System.out.println(check);
		request.setAttribute("check", check);

		mv.clear();
		mv.addObject("passwd", member.getPasswd());
		mv.addObject("email", member.getEmail());
		mv.addObject("birth", member.getBirth());
		mv.addObject("mobile", member.getMobile());
		mv.setViewName("member/ModifyPro");
		return mv;
	}

	@RequestMapping(value = "deleteForm")
	public ModelAndView deleteForm(HttpServletRequest request) throws Exception {
		
		String memId = (String) request.getSession().getAttribute("memId");
		System.out.println("memId : " + memId);
		mv.clear();
		mv.setViewName("member/deleteForm");
		return mv;
	}
	

	@RequestMapping(value = "deletePro")
	public ModelAndView deletePro(String passwd, HttpServletRequest request) throws Exception {
		
		String id = (String) request.getSession().getAttribute("memId");
		
		System.out.println(id);
		System.out.println(passwd);
		
		int check = dbPro.deleteArticle(id, passwd);
		
		if(check==1) {
			request.getSession().invalidate();
		}
		
		mv.clear();
		mv.addObject("check", check);
		mv.setViewName("member/deletePro");
		return mv;
	}
	
	@RequestMapping(value = "Myinfo")
	public ModelAndView Myinfo(MemberDataBean member, HttpServletRequest request) throws Exception { 
		
		request.setCharacterEncoding("UTF-8");
		String id = (String) request.getSession().getAttribute("memId");

		member = dbPro.getArticle(id);
		System.out.println(member);
		System.out.println(member.getName());
		System.out.println(member.getFilename());
		mv.clear();
		mv.addObject("memId", id);
		mv.addObject("name", member.getName());
		mv.addObject("nickname", member.getNickname());
		mv.addObject("filename", member.getFilename());
		mv.addObject("member", member);
		
		mv.setViewName("member/Myinfo");
		return mv;
		 
		
	}
	
	@RequestMapping(value = "ModifyPro2")
	public ModelAndView ModifyPro2(MemberDataBean member, HttpServletRequest request) throws Exception {

		
		request.setCharacterEncoding("UTF-8");
		String id = (String) request.getSession().getAttribute("memId");
		member.setId(id);
		
		System.out.println(member);
		int check = dbPro.updateArticle1(member);
		System.out.println(check);
		request.setAttribute("check", check);
		
		mv.clear();
		mv.addObject("nickname", member.getNickname());
		mv.setViewName("member/ModifyPro2");
		return mv;
		                    
	}
	
	@RequestMapping(value = "myWishListPage")
	public ModelAndView myWishListPage(HttpServletRequest request) {
		
		String id = (String) request.getSession().getAttribute("memId");
		
		List li = new ArrayList(); 
		li = dbPro.wishListInfo(id);
		System.out.println(li);
		int size = li.size();
		
		mv.clear();
		mv.addObject("wishList", li);
		mv.addObject("size",size);
		mv.setViewName("member/myWishListPage");
		
		return mv;
	}
	
	  
	      
}
