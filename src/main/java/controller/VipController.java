package controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.VipDataBean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dao.MybatisBoardDBBean;
import dao.MybatisVipDBBean;

@Controller
public class VipController {
	ModelAndView mv = new ModelAndView();
	 int pageNum = 1;
	  @Autowired
	   MybatisVipDBBean dbPro;
	    @ModelAttribute 
	   public void addAttributes(HttpServletRequest request){
		   @SuppressWarnings("unused")
		ModelAndView mv  =new ModelAndView();
	      try {
	         request.setCharacterEncoding("UTF-8");
	      } catch (UnsupportedEncodingException e1) {
	         // TODO: handle exception
	         e1.printStackTrace();
	      }
	      try {
	    	  pageNum = Integer.parseInt(request.getParameter("pageNum"));
	      } catch (Exception e) {
	         pageNum=1;
	      }
	     
	   }
	   @RequestMapping(value="vip_FAQ")
	   public ModelAndView list() throws Exception{
	      int pageSize = 10;
	      System.out.println("pageNum:"+pageNum);
	      ModelAndView mv=new ModelAndView();
	      int currentPage =pageNum;
	      int startRow = (currentPage - 1) * pageSize + 1;
	      int endRow = currentPage * pageSize;
	      int count = 0;
	      int number = 0;
	      List articleList = null;
	      count = dbPro.getArticleCount();
	      System.out.println("count:"+count);
	      System.out.println("currentPage-1:"+(currentPage-1));
	      System.out.println("pageSize:"+pageSize);
	      System.out.println("startRow:"+startRow);
	      System.out.println("endRow:"+endRow);
	     
	      if (count > 0) {
	         articleList = dbPro.getArticles(startRow, endRow);
	      }
	      number = count - (currentPage - 1) * pageSize;
	      System.out.println("number:"+number);
	      //==================================page   
	      int bottomLine = 3;

	      int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
			int startPage = 1 + (currentPage - 1) / bottomLine * bottomLine;
			int endPage = startPage + bottomLine - 1;
			if (endPage > pageCount)
				endPage = pageCount;

	      mv.clear();

	      mv.addObject("startPage", startPage);
	      mv.addObject("endPage", endPage);
	      mv.addObject("pageCount", pageCount);
	      mv.addObject("bottomLine", bottomLine);
	      //============================      
	      mv.addObject("count", count);
	      mv.addObject("currentPage", currentPage);
	      mv.addObject("pageSize", pageSize);
	      mv.addObject("number", number);
	      mv.addObject("articleList", articleList);
	      mv.setViewName("vip/vip_FAQ");
	      return mv;
	   }
	   
	 /*  @RequestMapping(value = "searchVIP") 
		public ModelAndView searchVIP(HttpServletRequest request) {
			
		   String serachValue = request.getParameter("searchValue");
		   
		   mv.clear();
			
			
		}*/
	   @RequestMapping(value = "vip_lounge")
		public ModelAndView vip_lounge(String name) throws IOException {
			mv.clear();
			
			mv.setViewName("/vip/vip_lounge");
			return mv;
		}
	   
}