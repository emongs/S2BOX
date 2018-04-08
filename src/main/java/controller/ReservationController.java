package controller;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.BoardDataBean;
import model.S2boxDataBean;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.sun.org.apache.bcel.internal.generic.LNEG;

import dao.MybatisBoardDBBean;
import dao.MybatisReservationDBBean;

@Controller
public class ReservationController {
	ModelAndView mv=new ModelAndView();
	String boardid ="1";
	String remoteId = "";
	int pageNum = 1;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); 
	java.util.Date day = new java.util.Date();
	String today =sdf.format(day);
	@Autowired
	MybatisReservationDBBean dbPro;


	@ModelAttribute 
	public void addAttributes(HttpServletRequest request){
		try {

			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO: handle exception
			e1.printStackTrace();
		}
		HttpSession session = request.getSession();
		remoteId=request.getRemoteAddr();
		String reqboardid = request.getParameter("boardid");
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch (Exception e) {
			pageNum=1;
		}
		if(reqboardid != null) session.setAttribute("boardid",reqboardid);

		if(session.getAttribute("boardid")==null) boardid="1";
		else boardid=(String) session.getAttribute("boardid");
		System.out.println("boardid:"+boardid);
	}


	@RequestMapping(value="currentList")
	public ModelAndView currentList() throws Exception{
		List articleList = dbPro.movieDivList();
		List articleList2 = dbPro.theaterDivList();
		List articleList3 = dbPro.dateDivList();

		int sunum=0;
		int kknum=0;
		int icnum=0;
		int kwnum=0;
		int cnum=0;
		int dknum=0;
		int bsnum=0;
		int knum=0;
		int jnum=0;



		mv.clear();
		mv.addObject("articleList", articleList);		//moviediv
		mv.addObject("articleList2", articleList2);		//localidv
		mv.addObject("articleList3", articleList3);		//datediv
		mv.addObject("month",today.substring(5, 7)); 	//어찌됐든 이번 달 정보만 보여줄 것이므로 이번 달 반환

		mv.addObject("sunum",sunum);
		mv.addObject("kknum",kknum);
		mv.addObject("icnum",icnum);
		mv.addObject("kwnum",kwnum);
		mv.addObject("cnum",cnum);
		mv.addObject("dknum",dknum);
		mv.addObject("bsnum",bsnum);
		mv.addObject("knum",knum);
		mv.addObject("jnum",jnum);
		System.out.println(articleList3.size());
		mv.setViewName("reservation/movie");
		return mv;
	}

	@RequestMapping(value = "clickMovieName")
	public ModelAndView clickMovieName(String movieName) throws Exception {
		System.out.println("movieName:"+movieName);
		List articleList2 = dbPro.localListByMovie(movieName);		//localidv
		//		List articleList3 = dbPro.dateListByMovie(movieName);
		mv.clear();
		mv.addObject("articleList2", articleList2);		//localidv
		//		mv.addObject("articleList3", articleList3);		//datediv
		//		mv.addObject("month",today.substring(5, 7)); 	//어찌됐든 이번 달 정보만 보여줄 것이므로 이번 달 반환
		int sunum=0;
		int kknum=0;
		int icnum=0;
		int kwnum=0;
		int cnum=0;
		int dknum=0;
		int bsnum=0;
		int knum=0;
		int jnum=0;
		mv.addObject("sunum",sunum);
		mv.addObject("kknum",kknum);
		mv.addObject("icnum",icnum);
		mv.addObject("kwnum",kwnum);
		mv.addObject("cnum",cnum);
		mv.addObject("dknum",dknum);
		mv.addObject("bsnum",bsnum);
		mv.addObject("knum",knum);
		mv.addObject("jnum",jnum);

		System.out.println(articleList2);
		mv.setViewName("/ajax/aaa");


		return mv;
	}

	@RequestMapping(value = "clickMovieName2")
	public ModelAndView clickMovieName2(String movieName) throws Exception {

		List articleList3 = dbPro.dateListByMovie(movieName);
		mv.clear();

		mv.addObject("articleList3", articleList3);		//datediv
		mv.addObject("month",today.substring(5, 7)); 	//어찌됐든 이번 달 정보만 보여줄 것이므로 이번 달 반환

		mv.setViewName("/ajax/bbb");
		System.out.println("2:"+articleList3.size());
		return mv;
	}
	@RequestMapping(value = "clickTheaterName")
	public ModelAndView clickTheaterName(String theaterName,String movieName) throws Exception {
		System.out.println("controller:"+theaterName+movieName);
		List articleList3 = dbPro.dateListByTheater(theaterName,movieName);
		mv.clear();

		mv.addObject("articleList3", articleList3);		//datediv
		mv.addObject("month",today.substring(5, 7)); 	//어찌됐든 이번 달 정보만 보여줄 것이므로 이번 달 반환

		mv.setViewName("/ajax/bbb");
		System.out.println("3:"+articleList3.size());
		return mv;
	}
	@RequestMapping(value = "clickTheaterNameLevel1")
	public ModelAndView clickTheaterNameLevel1(String theaterName) throws Exception {

		List articleList = dbPro.movieListByTheater(theaterName);

		mv.clear();
		mv.addObject("articleList", articleList);		//moviediv
		mv.setViewName("/ajax/ccc");
		System.out.println("4:"+articleList.size());
		return mv;
	}
	@RequestMapping(value = "clickTheaterNameLevel1Date")
	public ModelAndView clickTheaterNameLevel1Date(String theater_name) throws Exception {

		List articleList3 = dbPro.dateListByTheater1(theater_name);
		mv.clear();
		mv.addObject("articleList3", articleList3);		//datediv
		mv.addObject("month",today.substring(5, 7)); 	//어찌됐든 이번 달 정보만 보여줄 것이므로 이번 달 반환

		mv.setViewName("/ajax/bbb");
		System.out.println("5:"+articleList3.size());
		return mv;
	}
	@RequestMapping(value = "clickDateLevel3")
	public ModelAndView clickDateLevel3(String theaterName,String movieName,String screen_date) throws Exception {

		List timeTableList = dbPro.clickDateLevel3(theaterName,movieName,screen_date);
		List screenCodeList = dbPro.loadScreenCode();
		List distinctScreenList= dbPro.forSortTimeDiv(theaterName,movieName,screen_date);
		//return 요소 : special, screen_code,start hour,start min,end hour,end min,
		mv.clear();
		mv.addObject("timeTableList", timeTableList);//timediv
		mv.addObject("screenCodeList", screenCodeList);//timediv
		mv.addObject("distinctScreenList", distinctScreenList);//timediv

		mv.setViewName("/ajax/ddd");
		System.out.println("6:"+timeTableList.size());
		System.out.println("6:"+screenCodeList.size());
		System.out.println("6:"+distinctScreenList.size());
		return mv;
	}
	@RequestMapping(value = "movieDivByDateAndTheater")
	public ModelAndView movieDivByDateAndTheater(String theaterName,String screen_date) throws Exception {
		List articleList = dbPro.movieDivByDateAndTheater(theaterName,screen_date);

		//return 요소 : special, screen_code,start hour,start min,end hour,end min,
		mv.clear();
		mv.addObject("articleList", articleList);//moviediv		
		mv.setViewName("/ajax/ccc");	
		System.out.println("7:"+articleList.size());
		return mv;
	}
	@RequestMapping(value = "loadMovieBydate")
	public ModelAndView loadMovieBydate(String screen_date) throws Exception {
		List articleList = dbPro.loadMovieBydate(screen_date);

		//return 요소 : special, screen_code,start hour,start min,end hour,end min,
		mv.clear();
		mv.addObject("articleList", articleList);//moviediv		
		mv.setViewName("/ajax/ccc");	
		System.out.println("8:"+articleList.size());
		return mv;
	}
	@RequestMapping(value = "loadLocalBydate")
	public ModelAndView loadLocalBydate(String screen_date) throws Exception {
		System.out.println("movieName:"+screen_date);
		List articleList2 = dbPro.loadLocalBydate(screen_date);		//localidv

		mv.clear();
		mv.addObject("articleList2", articleList2);		//localidv

		int sunum=0;
		int kknum=0;
		int icnum=0;
		int kwnum=0;
		int cnum=0;
		int dknum=0;
		int bsnum=0;
		int knum=0;
		int jnum=0;
		mv.addObject("sunum",sunum);
		mv.addObject("kknum",kknum);
		mv.addObject("icnum",icnum);
		mv.addObject("kwnum",kwnum);
		mv.addObject("cnum",cnum);
		mv.addObject("dknum",dknum);
		mv.addObject("bsnum",bsnum);
		mv.addObject("knum",knum);
		mv.addObject("jnum",jnum);

		System.out.println(articleList2);
		mv.setViewName("/ajax/aaa");


		return mv;
	}
	@RequestMapping(value = "theaterByDateAndMovie")
	public ModelAndView theaterByDateAndMovie(String movieName,String screen_date) throws Exception {
		System.out.println("movieName:"+movieName+screen_date);

		List articleList2 = dbPro.theaterByDateAndMovie(movieName,screen_date);		//localidv

		mv.clear();
		mv.addObject("articleList2", articleList2);		//localidv

		int sunum=0;
		int kknum=0;
		int icnum=0;
		int kwnum=0;
		int cnum=0;
		int dknum=0;
		int bsnum=0;
		int knum=0;
		int jnum=0;
		mv.addObject("sunum",sunum);
		mv.addObject("kknum",kknum);
		mv.addObject("icnum",icnum);
		mv.addObject("kwnum",kwnum);
		mv.addObject("cnum",cnum);
		mv.addObject("dknum",dknum);
		mv.addObject("bsnum",bsnum);
		mv.addObject("knum",knum);
		mv.addObject("jnum",jnum);

		System.out.println(articleList2);
		mv.setViewName("/ajax/aaa");


		return mv;
	}
	@RequestMapping(value = "goSheetSelect")
	public ModelAndView goSheetSelect(HttpServletRequest request) throws Exception {
		System.out.println("in goSheetSelect");
		String movie_name=request.getParameter("SelectedMovie");
		String theater_name=request.getParameter("SelectedTheater");
		String screen_date="2017-12-"+request.getParameter("SelectedDate");
		String startTime=request.getParameter("SelectedTable");//10:00
		String endTime=request.getParameter("SelectedTable2");//10:00
		String screen_code=request.getParameter("SelectedScreen");
		System.out.println("movie_name:"+movie_name);
		System.out.println("theater_name:"+theater_name);
		System.out.println("screen_date:"+screen_date);
		System.out.println("startTime:"+startTime);
		System.out.println("screen_code:"+screen_code);
		String[] start=startTime.split(":");//[0]은 hour [1]은 min
		String start_hour=start[0];
		String start_min=start[1];
		List sheetInfoList = dbPro.getSheetID(movie_name,theater_name,screen_date,startTime,screen_code);//sheetid, reserved, 
		String sheetStyle =dbPro.getScreenStyle(screen_code); //스크린코드로 스타일코드 찾아서 스타일코드로 스타일 네임 반환해오기
		List screenCodeList = dbPro.loadScreenCode();
		System.out.println("sheetStyle:"+sheetStyle);
		mv.clear();

		mv.addObject("movie_name",movie_name);
		mv.addObject("theater_name",theater_name);
		mv.addObject("screen_date",screen_date);
		mv.addObject("startTime",startTime);
		mv.addObject("endTime",endTime);
		mv.addObject("screen_code",screen_code);
		mv.addObject("sheetInfoList",sheetInfoList);//List
		mv.addObject("sheetStyle",sheetStyle);//String
		mv.addObject("screenCodeList",screenCodeList);	//List
		mv.setViewName("/reservation/sheetSelect");
		return mv;
	}
	@RequestMapping(value = "loadSheetStyle")
	public ModelAndView loadSheetStyle(String sheetStyle,String reserved) throws Exception {
		System.out.println("in loadSheetStyle");
		String fileName=sheetStyle;//style_name
		String res=reserved;
		mv.clear();
		mv.addObject("reserved", res);		//datediv

		mv.setViewName("/ajax/"+fileName);
		return mv;
	}
}