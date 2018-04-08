package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.ModelAndView;

import dao.MybatisMemberDBBean;

@Controller
public class EventController {
	
	ModelAndView mv = new ModelAndView();
	
	@Autowired
	MybatisMemberDBBean dbPro;
	
	@RequestMapping(value = "combo")
	public ModelAndView combo() {

		mv.clear();
		mv.setViewName("mypage/combo");
		return mv;

	}
	
	@RequestMapping(value = "popcorn")
	public ModelAndView popcorn() {

		mv.clear();
		mv.setViewName("mypage/popcorn");
		return mv;

	}
	
	@RequestMapping(value = "beverage")
	public ModelAndView beverage() {

		mv.clear();
		mv.setViewName("mypage/beverage");
		return mv;

	}
	
	@RequestMapping(value = "snack")
	public ModelAndView snack() {

		mv.clear();
		mv.setViewName("mypage/snack");
		return mv;

	}
	
	@RequestMapping(value = "gotheater")
	public ModelAndView gotheater() {
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String memberID=(String)session.getAttribute("memId");
		String favorite_theater=dbPro.getFavoriteList("memberID");
		List theaterList = dbPro.getTheaterList();
		String[] str = new String[3];
		String res="";
		mv.clear();
		if(favorite_theater!=null){
			str=favorite_theater.split(",");
			for(String s : str){
				if(s==""||s==null){
					res+="-,";
				}else{
					s+=",";
					res+=s;
				}
			}
		}else{
			res="-,-,-,";
		}
		String[] result=res.split(",");
		System.out.println("res:"+res);
		mv.addObject("favorite_theater1",result[0]);
		mv.addObject("favorite_theater2",result[1]);
		mv.addObject("favorite_theater3",result[2]);
		mv.addObject("memberID",memberID);
		mv.addObject("theaterList",theaterList);
		mv.setViewName("menu/gotheater");
		return mv;

	}

	@RequestMapping(value = "gangdong")
	public ModelAndView gangdong() {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String memberID=(String)session.getAttribute("memId");
		String favorite_theater=dbPro.getFavoriteList("memberID");
		List theaterList = dbPro.getTheaterList();
		String[] str = new String[3];
		String res="";
		mv.clear();
		if(favorite_theater!=null){
			str=favorite_theater.split(",");
			for(String s : str){
				if(s==""||s==null){
					res+="-,";
				}else{
					s+=",";
					res+=s;
				}
			}
		}else{
			res="-,-,-,";
		}
		String[] result=res.split(",");
		System.out.println("res:"+res);
		mv.addObject("favorite_theater1",result[0]);
		mv.addObject("favorite_theater2",result[1]);
		mv.addObject("favorite_theater3",result[2]);
		mv.addObject("memberID",memberID);
		mv.addObject("theaterList",theaterList);
		mv.setViewName("menu/gangdong");
		return mv;

	}

	@RequestMapping(value = "gangbyn")
	public ModelAndView gangbyn() {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String memberID=(String)session.getAttribute("memId");
		String favorite_theater=dbPro.getFavoriteList("memberID");
		List theaterList = dbPro.getTheaterList();
		String[] str = new String[3];
		String res="";
		mv.clear();
		if(favorite_theater!=null){
			str=favorite_theater.split(",");
			for(String s : str){
				if(s==""||s==null){
					res+="-,";
				}else{
					s+=",";
					res+=s;
				}
			}
		}else{
			res="-,-,-,";
		}
		String[] result=res.split(",");
		System.out.println("res:"+res);
		mv.addObject("favorite_theater1",result[0]);
		mv.addObject("favorite_theater2",result[1]);
		mv.addObject("favorite_theater3",result[2]);
		mv.addObject("memberID",memberID);
		mv.addObject("theaterList",theaterList);
		mv.setViewName("menu/gangbyn");
		return mv;

	}

	@RequestMapping(value = "guro")
	public ModelAndView guro() {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String memberID=(String)session.getAttribute("memId");
		String favorite_theater=dbPro.getFavoriteList("memberID");
		List theaterList = dbPro.getTheaterList();
		String[] str = new String[3];
		String res="";
		mv.clear();
		if(favorite_theater!=null){
			str=favorite_theater.split(",");
			for(String s : str){
				if(s==""||s==null){
					res+="-,";
				}else{
					s+=",";
					res+=s;
				}
			}
		}else{
			res="-,-,-,";
		}
		String[] result=res.split(",");
		System.out.println("res:"+res);
		mv.addObject("favorite_theater1",result[0]);
		mv.addObject("favorite_theater2",result[1]);
		mv.addObject("favorite_theater3",result[2]);
		mv.addObject("memberID",memberID);
		mv.addObject("theaterList",theaterList);
		mv.setViewName("menu/guro");
		return mv;

	}

	@RequestMapping(value = "mungdong")
	public ModelAndView mungdong() {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String memberID=(String)session.getAttribute("memId");
		String favorite_theater=dbPro.getFavoriteList("memberID");
		List theaterList = dbPro.getTheaterList();
		String[] str = new String[3];
		String res="";
		mv.clear();
		if(favorite_theater!=null){
			str=favorite_theater.split(",");
			for(String s : str){
				if(s==""||s==null){
					res+="-,";
				}else{
					s+=",";
					res+=s;
				}
			}
		}else{
			res="-,-,-,";
		}
		String[] result=res.split(",");
		System.out.println("res:"+res);
		mv.addObject("favorite_theater1",result[0]);
		mv.addObject("favorite_theater2",result[1]);
		mv.addObject("favorite_theater3",result[2]);
		mv.addObject("memberID",memberID);
		mv.addObject("theaterList",theaterList);
		mv.setViewName("menu/mungdong");
		return mv;

	}

	@RequestMapping(value = "mokdong")
	public ModelAndView mokdong() {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String memberID=(String)session.getAttribute("memId");
		String favorite_theater=dbPro.getFavoriteList("memberID");
		List theaterList = dbPro.getTheaterList();
		String[] str = new String[3];
		String res="";
		mv.clear();
		if(favorite_theater!=null){
			str=favorite_theater.split(",");
			for(String s : str){
				if(s==""||s==null){
					res+="-,";
				}else{
					s+=",";
					res+=s;
				}
			}
		}else{
			res="-,-,-,";
		}
		String[] result=res.split(",");
		System.out.println("res:"+res);
		mv.addObject("favorite_theater1",result[0]);
		mv.addObject("favorite_theater2",result[1]);
		mv.addObject("favorite_theater3",result[2]);
		mv.addObject("memberID",memberID);
		mv.addObject("theaterList",theaterList);
		mv.setViewName("menu/mokdong");
		return mv;

	}

	@RequestMapping(value = "mia")
	public ModelAndView mia() {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String memberID=(String)session.getAttribute("memId");
		String favorite_theater=dbPro.getFavoriteList("memberID");
		List theaterList = dbPro.getTheaterList();
		String[] str = new String[3];
		String res="";
		mv.clear();
		if(favorite_theater!=null){
			str=favorite_theater.split(",");
			for(String s : str){
				if(s==""||s==null){
					res+="-,";
				}else{
					s+=",";
					res+=s;
				}
			}
		}else{
			res="-,-,-,";
		}
		String[] result=res.split(",");
		System.out.println("res:"+res);
		mv.addObject("favorite_theater1",result[0]);
		mv.addObject("favorite_theater2",result[1]);
		mv.addObject("favorite_theater3",result[2]);
		mv.addObject("memberID",memberID);
		mv.addObject("theaterList",theaterList);
		mv.setViewName("menu/mia");
		return mv;

	}

	@RequestMapping(value = "bulgang")
	public ModelAndView bulgang() {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String memberID=(String)session.getAttribute("memId");
		String favorite_theater=dbPro.getFavoriteList("memberID");
		List theaterList = dbPro.getTheaterList();
		String[] str = new String[3];
		String res="";
		mv.clear();
		if(favorite_theater!=null){
			str=favorite_theater.split(",");
			for(String s : str){
				if(s==""||s==null){
					res+="-,";
				}else{
					s+=",";
					res+=s;
				}
			}
		}else{
			res="-,-,-,";
		}
		String[] result=res.split(",");
		System.out.println("res:"+res);
		mv.addObject("favorite_theater1",result[0]);
		mv.addObject("favorite_theater2",result[1]);
		mv.addObject("favorite_theater3",result[2]);
		mv.addObject("memberID",memberID);
		mv.addObject("theaterList",theaterList);
		mv.setViewName("menu/bulgang");
		return mv;

	}

	@RequestMapping(value = "sangam")
	public ModelAndView sangam() {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String memberID=(String)session.getAttribute("memId");
		String favorite_theater=dbPro.getFavoriteList("memberID");
		List theaterList = dbPro.getTheaterList();
		String[] str = new String[3];
		String res="";
		mv.clear();
		if(favorite_theater!=null){
			str=favorite_theater.split(",");
			for(String s : str){
				if(s==""||s==null){
					res+="-,";
				}else{
					s+=",";
					res+=s;
				}
			}
		}else{
			res="-,-,-,";
		}
		String[] result=res.split(",");
		System.out.println("res:"+res);
		mv.addObject("favorite_theater1",result[0]);
		mv.addObject("favorite_theater2",result[1]);
		mv.addObject("favorite_theater3",result[2]);
		mv.addObject("memberID",memberID);
		mv.addObject("theaterList",theaterList);
		mv.setViewName("menu/sangam");
		return mv;

	}

	@RequestMapping(value = "sincheon")
	public ModelAndView sincheon() {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String memberID=(String)session.getAttribute("memId");
		String favorite_theater=dbPro.getFavoriteList("memberID");
		List theaterList = dbPro.getTheaterList();
		String[] str = new String[3];
		String res="";
		mv.clear();
		if(favorite_theater!=null){
			str=favorite_theater.split(",");
			for(String s : str){
				if(s==""||s==null){
					res+="-,";
				}else{
					s+=",";
					res+=s;
				}
			}
		}else{
			res="-,-,-,";
		}
		String[] result=res.split(",");
		System.out.println("res:"+res);
		mv.addObject("favorite_theater1",result[0]);
		mv.addObject("favorite_theater2",result[1]);
		mv.addObject("favorite_theater3",result[2]);
		mv.addObject("memberID",memberID);
		mv.addObject("theaterList",theaterList);
		mv.setViewName("menu/sincheon");
		return mv;

	}
	@RequestMapping(value = "apgujeong")
	public ModelAndView apgujeong() {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String memberID=(String)session.getAttribute("memId");
		String favorite_theater=dbPro.getFavoriteList("memberID");
		List theaterList = dbPro.getTheaterList();
		String[] str = new String[3];
		String res="";
		mv.clear();
		if(favorite_theater!=null){
			str=favorite_theater.split(",");
			for(String s : str){
				if(s==""||s==null){
					res+="-,";
				}else{
					s+=",";
					res+=s;
				}
			}
		}else{
			res="-,-,-,";
		}
		String[] result=res.split(",");
		System.out.println("res:"+res);
		mv.addObject("favorite_theater1",result[0]);
		mv.addObject("favorite_theater2",result[1]);
		mv.addObject("favorite_theater3",result[2]);
		mv.addObject("memberID",memberID);
		mv.addObject("theaterList",theaterList);mv.clear();
		mv.setViewName("menu/apgujeong");
		return mv;

	}

	@RequestMapping(value = "Yeouido")
	public ModelAndView Yeouido() {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String memberID=(String)session.getAttribute("memId");
		String favorite_theater=dbPro.getFavoriteList("memberID");
		List theaterList = dbPro.getTheaterList();
		String[] str = new String[3];
		String res="";
		mv.clear();
		if(favorite_theater!=null){
			str=favorite_theater.split(",");
			for(String s : str){
				if(s==""||s==null){
					res+="-,";
				}else{
					s+=",";
					res+=s;
				}
			}
		}else{
			res="-,-,-,";
		}
		String[] result=res.split(",");
		System.out.println("res:"+res);
		mv.addObject("favorite_theater1",result[0]);
		mv.addObject("favorite_theater2",result[1]);
		mv.addObject("favorite_theater3",result[2]);
		mv.addObject("memberID",memberID);
		mv.addObject("theaterList",theaterList);
		mv.setViewName("menu/Yeouido");
		return mv;

	}

	@RequestMapping(value = "yongdengpo")
	public ModelAndView yongdengpo() {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String memberID=(String)session.getAttribute("memId");
		String favorite_theater=dbPro.getFavoriteList("memberID");
		List theaterList = dbPro.getTheaterList();
		String[] str = new String[3];
		String res="";
		mv.clear();
		if(favorite_theater!=null){
			str=favorite_theater.split(",");
			for(String s : str){
				if(s==""||s==null){
					res+="-,";
				}else{
					s+=",";
					res+=s;
				}
			}
		}else{
			res="-,-,-,";
		}
		String[] result=res.split(",");
		System.out.println("res:"+res);
		mv.addObject("favorite_theater1",result[0]);
		mv.addObject("favorite_theater2",result[1]);
		mv.addObject("favorite_theater3",result[2]);
		mv.addObject("memberID",memberID);
		mv.addObject("theaterList",theaterList);
		mv.setViewName("menu/yongdengpo");
		return mv;

	}

	@RequestMapping(value = "wangsipri")
	public ModelAndView wangsipri() {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String memberID=(String)session.getAttribute("memId");
		String favorite_theater=dbPro.getFavoriteList("memberID");
		List theaterList = dbPro.getTheaterList();
		String[] str = new String[3];
		String res="";
		mv.clear();
		if(favorite_theater!=null){
			str=favorite_theater.split(",");
			for(String s : str){
				if(s==""||s==null){
					res+="-,";
				}else{
					s+=",";
					res+=s;
				}
			}
		}else{
			res="-,-,-,";
		}
		String[] result=res.split(",");
		System.out.println("res:"+res);
		mv.addObject("favorite_theater1",result[0]);
		mv.addObject("favorite_theater2",result[1]);
		mv.addObject("favorite_theater3",result[2]);
		mv.addObject("memberID",memberID);
		mv.addObject("theaterList",theaterList);
		mv.setViewName("menu/wangsipri");
		return mv;

	}

	@RequestMapping(value = "yongsan")
	public ModelAndView yongsan() {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String memberID=(String)session.getAttribute("memId");
		String favorite_theater=dbPro.getFavoriteList("memberID");
		List theaterList = dbPro.getTheaterList();
		String[] str = new String[3];
		String res="";
		mv.clear();
		if(favorite_theater!=null){
			str=favorite_theater.split(",");
			for(String s : str){
				if(s==""||s==null){
					res+="-,";
				}else{
					s+=",";
					res+=s;
				}
			}
		}else{
			res="-,-,-,";
		}
		String[] result=res.split(",");
		System.out.println("res:"+res);
		mv.addObject("favorite_theater1",result[0]);
		mv.addObject("favorite_theater2",result[1]);
		mv.addObject("favorite_theater3",result[2]);
		mv.addObject("memberID",memberID);
		mv.addObject("theaterList",theaterList);
		mv.setViewName("menu/yongsan");
		return mv;

	}

	@RequestMapping(value = "chengdam")
	public ModelAndView chengdam() {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String memberID=(String)session.getAttribute("memId");
		String favorite_theater=dbPro.getFavoriteList("memberID");
		List theaterList = dbPro.getTheaterList();
		String[] str = new String[3];
		String res="";
		mv.clear();
		if(favorite_theater!=null){
			str=favorite_theater.split(",");
			for(String s : str){
				if(s==""||s==null){
					res+="-,";
				}else{
					s+=",";
					res+=s;
				}
			}
		}else{
			res="-,-,-,";
		}
		String[] result=res.split(",");
		System.out.println("res:"+res);
		mv.addObject("favorite_theater1",result[0]);
		mv.addObject("favorite_theater2",result[1]);
		mv.addObject("favorite_theater3",result[2]);
		mv.addObject("memberID",memberID);
		mv.addObject("theaterList",theaterList);
		mv.setViewName("menu/chengdam");
		return mv;

	}

	@RequestMapping(value = "chenho")
	public ModelAndView chenho() {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String memberID=(String)session.getAttribute("memId");
		String favorite_theater=dbPro.getFavoriteList("memberID");
		List theaterList = dbPro.getTheaterList();
		String[] str = new String[3];
		String res="";
		mv.clear();
		if(favorite_theater!=null){
			str=favorite_theater.split(",");
			for(String s : str){
				if(s==""||s==null){
					res+="-,";
				}else{
					s+=",";
					res+=s;
				}
			}
		}else{
			res="-,-,-,";
		}
		String[] result=res.split(",");
		System.out.println("res:"+res);
		mv.addObject("favorite_theater1",result[0]);
		mv.addObject("favorite_theater2",result[1]);
		mv.addObject("favorite_theater3",result[2]);
		mv.addObject("memberID",memberID);
		mv.addObject("theaterList",theaterList);
		mv.setViewName("menu/chenho");
		return mv;

	}

	@RequestMapping(value = "hongdae")
	public ModelAndView hongdae() {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String memberID=(String)session.getAttribute("memId");
		String favorite_theater=dbPro.getFavoriteList("memberID");
		List theaterList = dbPro.getTheaterList();
		String[] str = new String[3];
		String res="";
		mv.clear();
		if(favorite_theater!=null){
			str=favorite_theater.split(",");
			for(String s : str){
				if(s==""||s==null){
					res+="-,";
				}else{
					s+=",";
					res+=s;
				}
			}
		}else{
			res="-,-,-,";
		}
		String[] result=res.split(",");
		System.out.println("res:"+res);
		mv.addObject("favorite_theater1",result[0]);
		mv.addObject("favorite_theater2",result[1]);
		mv.addObject("favorite_theater3",result[2]);
		mv.addObject("memberID",memberID);
		mv.addObject("theaterList",theaterList);
		mv.setViewName("menu/hongdae");
		return mv;

	}

	@RequestMapping(value = "gimpo")
	public ModelAndView gimpo() {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String memberID=(String)session.getAttribute("memId");
		String favorite_theater=dbPro.getFavoriteList("memberID");
		List theaterList = dbPro.getTheaterList();
		String[] str = new String[3];
		String res="";
		mv.clear();
		if(favorite_theater!=null){
			str=favorite_theater.split(",");
			for(String s : str){
				if(s==""||s==null){
					res+="-,";
				}else{
					s+=",";
					res+=s;
				}
			}
		}else{
			res="-,-,-,";
		}
		String[] result=res.split(",");
		System.out.println("res:"+res);
		mv.addObject("favorite_theater1",result[0]);
		mv.addObject("favorite_theater2",result[1]);
		mv.addObject("favorite_theater3",result[2]);
		mv.addObject("memberID",memberID);
		mv.addObject("theaterList",theaterList);
		mv.setViewName("menu/gimpo");
		return mv;

	}

	@RequestMapping(value = "dongsuwon")
	public ModelAndView dongsuwon() {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String memberID=(String)session.getAttribute("memId");
		String favorite_theater=dbPro.getFavoriteList("memberID");
		List theaterList = dbPro.getTheaterList();
		String[] str = new String[3];
		String res="";
		mv.clear();
		if(favorite_theater!=null){
			str=favorite_theater.split(",");
			for(String s : str){
				if(s==""||s==null){
					res+="-,";
				}else{
					s+=",";
					res+=s;
				}
			}
		}else{
			res="-,-,-,";
		}
		String[] result=res.split(",");
		System.out.println("res:"+res);
		mv.addObject("favorite_theater1",result[0]);
		mv.addObject("favorite_theater2",result[1]);
		mv.addObject("favorite_theater3",result[2]);
		mv.addObject("memberID",memberID);
		mv.addObject("theaterList",theaterList);
		mv.setViewName("menu/dongsuwon");
		return mv;

	}

	@RequestMapping(value = "buksuwon")
	public ModelAndView buksuwon() {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String memberID=(String)session.getAttribute("memId");
		String favorite_theater=dbPro.getFavoriteList("memberID");
		List theaterList = dbPro.getTheaterList();
		String[] str = new String[3];
		String res="";
		mv.clear();
		if(favorite_theater!=null){
			str=favorite_theater.split(",");
			for(String s : str){
				if(s==""||s==null){
					res+="-,";
				}else{
					s+=",";
					res+=s;
				}
			}
		}else{
			res="-,-,-,";
		}
		String[] result=res.split(",");
		System.out.println("res:"+res);
		mv.addObject("favorite_theater1",result[0]);
		mv.addObject("favorite_theater2",result[1]);
		mv.addObject("favorite_theater3",result[2]);
		mv.addObject("memberID",memberID);
		mv.addObject("theaterList",theaterList);
		mv.setViewName("menu/buksuwon");
		return mv;

	}

	@RequestMapping(value = "suwon")
	public ModelAndView suwon() {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String memberID=(String)session.getAttribute("memId");
		String favorite_theater=dbPro.getFavoriteList("memberID");
		List theaterList = dbPro.getTheaterList();
		String[] str = new String[3];
		String res="";
		mv.clear();
		if(favorite_theater!=null){
			str=favorite_theater.split(",");
			for(String s : str){
				if(s==""||s==null){
					res+="-,";
				}else{
					s+=",";
					res+=s;
				}
			}
		}else{
			res="-,-,-,";
		}
		String[] result=res.split(",");
		System.out.println("res:"+res);
		mv.addObject("favorite_theater1",result[0]);
		mv.addObject("favorite_theater2",result[1]);
		mv.addObject("favorite_theater3",result[2]);
		mv.addObject("memberID",memberID);
		mv.addObject("theaterList",theaterList);
		mv.setViewName("menu/suwon");
		return mv;

	}

	@RequestMapping(value = "siheng")
	public ModelAndView siheng() {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String memberID=(String)session.getAttribute("memId");
		String favorite_theater=dbPro.getFavoriteList("memberID");
		List theaterList = dbPro.getTheaterList();
		String[] str = new String[3];
		String res="";
		mv.clear();
		if(favorite_theater!=null){
			str=favorite_theater.split(",");
			for(String s : str){
				if(s==""||s==null){
					res+="-,";
				}else{
					s+=",";
					res+=s;
				}
			}
		}else{
			res="-,-,-,";
		}
		String[] result=res.split(",");
		System.out.println("res:"+res);
		mv.addObject("favorite_theater1",result[0]);
		mv.addObject("favorite_theater2",result[1]);
		mv.addObject("favorite_theater3",result[2]);
		mv.addObject("memberID",memberID);
		mv.addObject("theaterList",theaterList);
		mv.setViewName("menu/siheng");
		return mv;

	}

	@RequestMapping(value = "ansan")
	public ModelAndView ansan() {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String memberID=(String)session.getAttribute("memId");
		String favorite_theater=dbPro.getFavoriteList("memberID");
		List theaterList = dbPro.getTheaterList();
		String[] str = new String[3];
		String res="";
		mv.clear();
		if(favorite_theater!=null){
			str=favorite_theater.split(",");
			for(String s : str){
				if(s==""||s==null){
					res+="-,";
				}else{
					s+=",";
					res+=s;
				}
			}
		}else{
			res="-,-,-,";
		}
		String[] result=res.split(",");
		System.out.println("res:"+res);
		mv.addObject("favorite_theater1",result[0]);
		mv.addObject("favorite_theater2",result[1]);
		mv.addObject("favorite_theater3",result[2]);
		mv.addObject("memberID",memberID);
		mv.addObject("theaterList",theaterList);
		mv.setViewName("menu/ansan");
		return mv;

	}

	@RequestMapping(value = "uijeongbu")
	public ModelAndView uijeongbu() {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String memberID=(String)session.getAttribute("memId");
		String favorite_theater=dbPro.getFavoriteList("memberID");
		List theaterList = dbPro.getTheaterList();
		String[] str = new String[3];
		String res="";
		mv.clear();
		if(favorite_theater!=null){
			str=favorite_theater.split(",");
			for(String s : str){
				if(s==""||s==null){
					res+="-,";
				}else{
					s+=",";
					res+=s;
				}
			}
		}else{
			res="-,-,-,";
		}
		String[] result=res.split(",");
		System.out.println("res:"+res);
		mv.addObject("favorite_theater1",result[0]);
		mv.addObject("favorite_theater2",result[1]);
		mv.addObject("favorite_theater3",result[2]);
		mv.addObject("memberID",memberID);
		mv.addObject("theaterList",theaterList);
		mv.setViewName("menu/uijeongbu");
		return mv;

	}

	@RequestMapping(value = "ilsan")
	public ModelAndView ilsan() {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String memberID=(String)session.getAttribute("memId");
		String favorite_theater=dbPro.getFavoriteList("memberID");
		List theaterList = dbPro.getTheaterList();
		String[] str = new String[3];
		String res="";
		mv.clear();
		if(favorite_theater!=null){
			str=favorite_theater.split(",");
			for(String s : str){
				if(s==""||s==null){
					res+="-,";
				}else{
					s+=",";
					res+=s;
				}
			}
		}else{
			res="-,-,-,";
		}
		String[] result=res.split(",");
		System.out.println("res:"+res);
		mv.addObject("favorite_theater1",result[0]);
		mv.addObject("favorite_theater2",result[1]);
		mv.addObject("favorite_theater3",result[2]);
		mv.addObject("memberID",memberID);
		mv.addObject("theaterList",theaterList);
		mv.setViewName("menu/ilsan");
		return mv;

	}

	@RequestMapping(value = "pangu")
	public ModelAndView pangu() {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String memberID=(String)session.getAttribute("memId");
		String favorite_theater=dbPro.getFavoriteList("memberID");
		List theaterList = dbPro.getTheaterList();
		String[] str = new String[3];
		String res="";
		mv.clear();
		if(favorite_theater!=null){
			str=favorite_theater.split(",");
			for(String s : str){
				if(s==""||s==null){
					res+="-,";
				}else{
					s+=",";
					res+=s;
				}
			}
		}else{
			res="-,-,-,";
		}
		String[] result=res.split(",");
		System.out.println("res:"+res);
		mv.addObject("favorite_theater1",result[0]);
		mv.addObject("favorite_theater2",result[1]);
		mv.addObject("favorite_theater3",result[2]);
		mv.addObject("memberID",memberID);
		mv.addObject("theaterList",theaterList);
		mv.setViewName("menu/pangu");
		return mv;

	}

	@RequestMapping(value = "pyngtac")
	public ModelAndView pyngtac() {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String memberID=(String)session.getAttribute("memId");
		String favorite_theater=dbPro.getFavoriteList("memberID");
		List theaterList = dbPro.getTheaterList();
		String[] str = new String[3];
		String res="";
		mv.clear();
		if(favorite_theater!=null){
			str=favorite_theater.split(",");
			for(String s : str){
				if(s==""||s==null){
					res+="-,";
				}else{
					s+=",";
					res+=s;
				}
			}
		}else{
			res="-,-,-,";
		}
		String[] result=res.split(",");
		System.out.println("res:"+res);
		mv.addObject("favorite_theater1",result[0]);
		mv.addObject("favorite_theater2",result[1]);
		mv.addObject("favorite_theater3",result[2]);
		mv.addObject("memberID",memberID);
		mv.addObject("theaterList",theaterList);
		mv.setViewName("menu/pyngtac");
		return mv;

	}

	@RequestMapping(value = "bupyong")
	public ModelAndView bupyong() {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String memberID=(String)session.getAttribute("memId");
		String favorite_theater=dbPro.getFavoriteList("memberID");
		List theaterList = dbPro.getTheaterList();
		String[] str = new String[3];
		String res="";
		mv.clear();
		if(favorite_theater!=null){
			str=favorite_theater.split(",");
			for(String s : str){
				if(s==""||s==null){
					res+="-,";
				}else{
					s+=",";
					res+=s;
				}
			}
		}else{
			res="-,-,-,";
		}
		String[] result=res.split(",");
		System.out.println("res:"+res);
		mv.addObject("favorite_theater1",result[0]);
		mv.addObject("favorite_theater2",result[1]);
		mv.addObject("favorite_theater3",result[2]);
		mv.addObject("memberID",memberID);
		mv.addObject("theaterList",theaterList);
		mv.setViewName("menu/bupyong");
		return mv;

	}

	@RequestMapping(value = "incheon")
	public ModelAndView incheon() {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String memberID=(String)session.getAttribute("memId");
		String favorite_theater=dbPro.getFavoriteList("memberID");
		List theaterList = dbPro.getTheaterList();
		String[] str = new String[3];
		String res="";
		mv.clear();
		if(favorite_theater!=null){
			str=favorite_theater.split(",");
			for(String s : str){
				if(s==""||s==null){
					res+="-,";
				}else{
					s+=",";
					res+=s;
				}
			}
		}else{
			res="-,-,-,";
		}
		String[] result=res.split(",");
		System.out.println("res:"+res);
		mv.addObject("favorite_theater1",result[0]);
		mv.addObject("favorite_theater2",result[1]);
		mv.addObject("favorite_theater3",result[2]);
		mv.addObject("memberID",memberID);
		mv.addObject("theaterList",theaterList);
		mv.setViewName("menu/incheon");
		return mv;

	}

	@RequestMapping(value = "juan")
	public ModelAndView juan() {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String memberID=(String)session.getAttribute("memId");
		String favorite_theater=dbPro.getFavoriteList("memberID");
		List theaterList = dbPro.getTheaterList();
		String[] str = new String[3];
		String res="";
		mv.clear();
		if(favorite_theater!=null){
			str=favorite_theater.split(",");
			for(String s : str){
				if(s==""||s==null){
					res+="-,";
				}else{
					s+=",";
					res+=s;
				}
			}
		}else{
			res="-,-,-,";
		}
		String[] result=res.split(",");
		System.out.println("res:"+res);
		mv.addObject("favorite_theater1",result[0]);
		mv.addObject("favorite_theater2",result[1]);
		mv.addObject("favorite_theater3",result[2]);
		mv.addObject("memberID",memberID);
		mv.addObject("theaterList",theaterList);
		mv.setViewName("menu/juan");
		return mv;

	}

	@RequestMapping(value = "chenan")
	public ModelAndView chenan() {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String memberID=(String)session.getAttribute("memId");
		String favorite_theater=dbPro.getFavoriteList("memberID");
		List theaterList = dbPro.getTheaterList();
		String[] str = new String[3];
		String res="";
		mv.clear();
		if(favorite_theater!=null){
			str=favorite_theater.split(",");
			for(String s : str){
				if(s==""||s==null){
					res+="-,";
				}else{
					s+=",";
					res+=s;
				}
			}
		}else{
			res="-,-,-,";
		}
		String[] result=res.split(",");
		System.out.println("res:"+res);
		mv.addObject("favorite_theater1",result[0]);
		mv.addObject("favorite_theater2",result[1]);
		mv.addObject("favorite_theater3",result[2]);
		mv.addObject("memberID",memberID);
		mv.addObject("theaterList",theaterList);
		mv.setViewName("menu/chenan");
		return mv;

	}

	@RequestMapping(value = "chenanpenta")
	public ModelAndView chenanpenta() {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String memberID=(String)session.getAttribute("memId");
		String favorite_theater=dbPro.getFavoriteList("memberID");
		List theaterList = dbPro.getTheaterList();
		String[] str = new String[3];
		String res="";
		mv.clear();
		if(favorite_theater!=null){
			str=favorite_theater.split(",");
			for(String s : str){
				if(s==""||s==null){
					res+="-,";
				}else{
					s+=",";
					res+=s;
				}
			}
		}else{
			res="-,-,-,";
		}
		String[] result=res.split(",");
		System.out.println("res:"+res);
		mv.addObject("favorite_theater1",result[0]);
		mv.addObject("favorite_theater2",result[1]);
		mv.addObject("favorite_theater3",result[2]);
		mv.addObject("memberID",memberID);
		mv.addObject("theaterList",theaterList);
		mv.setViewName("menu/chenanpenta");
		return mv;

	}

	@RequestMapping(value = "chengju")
	public ModelAndView chengju() {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String memberID=(String)session.getAttribute("memId");
		String favorite_theater=dbPro.getFavoriteList("memberID");
		List theaterList = dbPro.getTheaterList();
		String[] str = new String[3];
		String res="";
		mv.clear();
		if(favorite_theater!=null){
			str=favorite_theater.split(",");
			for(String s : str){
				if(s==""||s==null){
					res+="-,";
				}else{
					s+=",";
					res+=s;
				}
			}
		}else{
			res="-,-,-,";
		}
		String[] result=res.split(",");
		System.out.println("res:"+res);
		mv.addObject("favorite_theater1",result[0]);
		mv.addObject("favorite_theater2",result[1]);
		mv.addObject("favorite_theater3",result[2]);
		mv.addObject("memberID",memberID);
		mv.addObject("theaterList",theaterList);
		mv.setViewName("menu/chengju");
		return mv;

	}

	@RequestMapping(value = "sumeon")
	public ModelAndView sumeon() {

		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		HttpSession session = request.getSession();
		String memberID=(String)session.getAttribute("memId");
		String favorite_theater=dbPro.getFavoriteList("memberID");
		List theaterList = dbPro.getTheaterList();
		String[] str = new String[3];
		String res="";
		mv.clear();
		if(favorite_theater!=null){
			str=favorite_theater.split(",");
			for(String s : str){
				if(s==""||s==null){
					res+="-,";
				}else{
					s+=",";
					res+=s;
				}
			}
		}else{
			res="-,-,-,";
		}
		String[] result=res.split(",");
		System.out.println("res:"+res);
		mv.addObject("favorite_theater1",result[0]);
		mv.addObject("favorite_theater2",result[1]);
		mv.addObject("favorite_theater3",result[2]);
		mv.addObject("memberID",memberID);
		mv.addObject("theaterList",theaterList);
		mv.setViewName("menu/sumeon");
		return mv;

	}

}
