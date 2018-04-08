package controller;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;






import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import model.BoardDataBean;
import model.MemberDataBean;

import org.apache.catalina.connector.Request;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.sun.org.apache.bcel.internal.generic.LNEG;

import dao.MybatisBoardDBBean;
import dao.MybatisMemberDBBean;

@Controller
public class BoardController {
	ModelAndView mv = new ModelAndView();
	String boardid = "1";
	String remoteId = "";
	int pageNum = 1;

	@Autowired
	MybatisBoardDBBean dbPro;
	
	@Autowired
	MybatisMemberDBBean memberPro;

	@ModelAttribute
	public void addAttributes(HttpServletRequest request) {
		try {

			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO: handle exception
			e1.printStackTrace();
		}
		HttpSession session = request.getSession();
		remoteId = request.getRemoteAddr();
		String reqboardid = request.getParameter("boardid");
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch (Exception e) {
			pageNum = 1;
		}
		if (reqboardid != null)
			session.setAttribute("boardid", reqboardid);

		if (session.getAttribute("boardid") == null)
			boardid = "1";
		else
			boardid = (String) session.getAttribute("boardid");
		System.out.println(boardid);
	}

	@RequestMapping(value = "list")
	public ModelAndView list() throws Exception {

		int pageSize = 10;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		List articleList = null;
		count = dbPro.getArticleCount(boardid);
		if (count > 0) {
			articleList = dbPro.getArticles(startRow, endRow, boardid);
		}
		number = count - (currentPage - 1) * pageSize;
		// ==================================page
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
		// ============================
		mv.addObject("count", count);
		mv.addObject("currentPage", currentPage);
		mv.addObject("pageSize", pageSize);
		mv.addObject("number", number);
		mv.addObject("articleList", articleList);
		mv.setViewName("board/list");
		return mv;
	}
	
	

	@RequestMapping(value = "list2")
	public ModelAndView list2() throws Exception {

		int pageSize = 10;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

		int currentPage = pageNum;
		int startRow = (currentPage - 1) * pageSize + 1;
		int endRow = currentPage * pageSize;
		int count = 0;
		int number = 0;
		List articleList = null;
		count = dbPro.getArticleCount(boardid);
		if (count > 0) {
			articleList = dbPro.getArticles(startRow, endRow, boardid);
		}
		number = count - (currentPage - 1) * pageSize;
		// ==================================page
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
		// ============================
		mv.addObject("count", count);
		mv.addObject("currentPage", currentPage);
		mv.addObject("pageSize", pageSize);
		mv.addObject("number", number);
		mv.addObject("articleList", articleList);
		mv.setViewName("board/list2");
		return mv;
	}

	@RequestMapping(value = "writeForm")
	public ModelAndView writeUploadForm(BoardDataBean article) {

		System.out.println(article.getType());
		mv.addObject("num", article.getNum());
		mv.addObject("ref", article.getRef());
		mv.addObject("re_step", article.getRe_step());
		mv.addObject("re_level", article.getRe_level());
		mv.addObject("type", article.getType());
		mv.addObject("cases", article.getCases());
		mv.addObject("pageNum", pageNum);
		mv.setViewName("board/writeUploadForm");
		return mv;
	}
	
	@RequestMapping(value = "goList")
	public ModelAndView goList() {

		mv.setViewName("board/list");
		return mv;
	}

	@RequestMapping(value = "writeUploadPro")
	public ModelAndView writeUploadPro(MultipartHttpServletRequest multipart,
			BoardDataBean article) throws Exception {
		MultipartFile multi = multipart.getFile("uploadfile");
		String filename = multi.getOriginalFilename();
		if (filename != null && !filename.equals("")) {
			String uploadPath = multipart.getRealPath("/") + "/fileSave";
			System.out.println(uploadPath);
			FileCopyUtils.copy(multi.getInputStream(), new FileOutputStream(
					uploadPath + "/" + multi.getOriginalFilename()));
			article.setFilename(filename);
			article.setFilesize((int) multi.getSize());
		} else {
			article.setFilename("");
			article.setFilesize(0);
		}

		article.setIp(remoteId);
		article.setBoardid(boardid);
		System.out.println(article);
		dbPro.insertArticle(article);
		mv.clear();
		mv.addObject("pageNum", pageNum);
		return list();
	}

	@RequestMapping(value = "content")
	public ModelAndView content(int num) throws Exception {

		BoardDataBean article = dbPro.getArticle(num);
		mv.clear();

		mv.addObject("pageNum", pageNum);
		mv.addObject("article", article);
		mv.setViewName("/board/content");
		return mv;
	}

	@RequestMapping(value = "updateForm")
	public ModelAndView updateForm(int num) throws Exception {
		BoardDataBean article = dbPro.getArticle(num);
		mv.clear();
		mv.addObject("num", num);
		mv.addObject("pageNum", pageNum);
		mv.addObject("article", article);
		mv.setViewName("/board/updateForm");
		return mv;
	}

	@RequestMapping(value = "updatePro")
	public ModelAndView updatePro(BoardDataBean article) throws Exception {
		article.setBoardid(boardid);
		int check = dbPro.updateArticle(article);

		mv.clear();
		mv.addObject("pageNum", pageNum);
		mv.addObject("check", check);
		mv.setViewName("/board/updatePro");
		return mv;
	}

	@RequestMapping(value = "deleteForm")
	public ModelAndView deleteForm(int num) throws Exception {
		BoardDataBean article = dbPro.getArticle(num);
		mv.clear();
		mv.addObject("num", num);
		mv.addObject("pageNum", pageNum);
		mv.setViewName("/board/deleteForm");
		return mv;
	}

	@RequestMapping(value = "deletePro")
	public ModelAndView deletePro(int num, String passwd) throws Exception {
		int check = dbPro.deleteArticle(num, passwd);
		mv.clear();
		mv.addObject("pageNum", pageNum);
		mv.addObject("check", check);
		mv.setViewName("/board/deletePro");
		return mv;
	}

	@RequestMapping(value = "movieChartAnalysisWithThreePortal")
	public ModelAndView movieChartAnalysisWithThreePortal(int num, String passwd)
			throws Exception {
		int check = dbPro.deleteArticle(num, passwd);
		mv.clear();
		mv.addObject("pageNum", pageNum);
		mv.addObject("check", check);
		mv.setViewName("/board/movieChartAnalysisWithThreePortal");
		return mv;
	}
	@RequestMapping(value = "main")
	public ModelAndView main(String name) throws IOException {
		String url = "";
		int count = 0;
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		 HttpSession session = request.getSession();
		ServletContext context = session.getServletContext();
		mv.clear();
			
		mv.addObject("str1", context.getAttribute("str1"));
		mv.addObject("str2", context.getAttribute("str2"));
		mv.addObject("str3", context.getAttribute("str3"));
		mv.setViewName("/main/main");
		return mv;
	}
	@RequestMapping(value = "crollingLoad")
	public ModelAndView crollingLoad(String name) throws IOException {
		String url = "";
		int count = 0;
		HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
		 HttpSession session = request.getSession();
		ServletContext context = session.getServletContext();
		
		String[] cgv_po = { "", "", "", "", "", "", "", "", "", "" };
		String[] naver_po = { "", "", "", "", "", "", "", "", "", "" };

		String[] cgv_re = { "", "", "", "", "", "", "", "", "", "" };
		String[] daum_re = { "", "", "", "", "", "", "", "", "", "" };
		String[] nate_re = { "", "", "", "", "", "", "", "", "", "" };
		String[] naver_re = { "", "", "", "", "", "", "", "", "", "" };

		String[] cgv_star = { "", "", "", "", "", "", "", "", "", "" };
		String[] nate_star = { "", "", "", "", "", "", "", "", "", "" };
		String[] naver_star = { "", "", "", "", "", "", "", "", "", "" };
		HashMap<String, Integer> map1 = new HashMap<String, Integer>();
		HashMap<String, Integer> map2 = new HashMap<String, Integer>();
		HashMap<String, Integer> map11 = new HashMap<String, Integer>();
		HashMap<String, Integer> map22 = new HashMap<String, Integer>();
		HashMap<String, Integer> map33 = new HashMap<String, Integer>();
		HashMap<String, Integer> map44 = new HashMap<String, Integer>();

		HashMap<String, Integer> map111 = new HashMap<String, Integer>();
		HashMap<String, Integer> map222 = new HashMap<String, Integer>();
		HashMap<String, Integer> map333 = new HashMap<String, Integer>();

		HashMap<String, Integer> result = new HashMap<String, Integer>();
		HashMap<String, Integer> result1 = new HashMap<String, Integer>();
		HashMap<String, Integer> result2 = new HashMap<String, Integer>();
		HashMap<String, Integer> temp = new HashMap<String, Integer>();

		String line2 = "";

		Elements media11;
		Document doc;
		String templine;
		int idx, idx2;
		int reverse = 10;
		// naver 박스오피스

		// cgv 인기차트
		count = 0;

		url = "http://www.cgv.co.kr/movies/?lt=1&ot=1";
		doc = Jsoup.connect(url).get();

		media11 = doc.select(".title");

		for (Element src : media11) {

			templine = src.toString();
			idx = templine.indexOf("\">");
			idx2 = templine.indexOf("strong>");
			cgv_po[count] = templine.substring(idx + 2, idx2 - 2).trim();

			map1.put(cgv_po[count], reverse);
			if (count == 9) {
				break;
			}
			count++;
			reverse--;

		}
		// 네이버 인기차트
		count = 0;
		reverse = 10;
		url = "http://movie.naver.com/movie/sdb/rank/rmovie.nhn";
		doc = Jsoup.connect(url).get();
	 media11 = doc.select(".list_ranking"); 
		media11 = doc.select("div[class=tit3]>a");

		for (Element src : media11) {

			templine = src.toString();
			idx = templine.indexOf("\">");
			idx2 = templine.indexOf("a>");
			naver_po[count] = templine.substring(idx + 2, idx2 - 2).trim();
			map2.put(naver_po[count], reverse);
			if (count == 9) {
				break;
			}
			count++;
			reverse--;
		}
		/******************** 예매순 cgv daum nate naver **********************************************/
		// cgv 예매순
		count = 0;

		url = "http://www.cgv.co.kr/movies/?lt=1&ot=1";
		doc = Jsoup.connect(url).get();

		media11 = doc.select(".title");
		reverse = 10;
		for (Element src : media11) {

			templine = src.toString();
			idx = templine.indexOf("\">");
			idx2 = templine.indexOf("strong>");
			cgv_re[count] = templine.substring(idx + 2, idx2 - 2).trim();
			map11.put(cgv_re[count], reverse);
			if (count == 9) {
				break;
			}
			count++;
			reverse--;
		}
		// daum 예매순
		count = 0;

		url = "http://ticket2.movie.daum.net/Movie/MovieRankList.aspx";
		doc = Jsoup.connect(url).get();

		media11 = doc.select(".link_g");
		reverse = 10;
		for (Element src : media11) {

			templine = src.toString();
			idx = templine.indexOf("\">");
			idx2 = templine.indexOf("a>");
			daum_re[count] = templine.substring(idx + 2, idx2 - 2).trim();
			map22.put(daum_re[count], reverse);
			if (count == 9) {
				break;
			}
			count++;
			reverse--;
		}
		// 네이트 예매순
		count = 0;

		url = "http://movie.nate.com/movie_new/movie_chart_reserve.asp";
		doc = Jsoup.connect(url).get();

		media11 = doc.select("p[class=mtx1 pl7]>a");
		reverse = 10;
		for (Element src : media11) {

			templine = src.toString();
			idx = templine.indexOf("\">");
			idx2 = templine.indexOf("a>");
			nate_re[count] = templine.substring(idx + 2, idx2 - 2).trim();
			map33.put(nate_re[count], reverse);
			if (count == 9) {
				break;
			}
			count++;
			reverse--;
		}
		// 네이버 예매순
		count = 0;

		url = "http://movie.naver.com/movie/sdb/rank/rreserve.nhn";
		doc = Jsoup.connect(url).get();

		media11 = doc.select("div[class=tit4]>a");
		reverse = 10;

		for (Element src : media11) {

			templine = src.toString();
			idx = templine.indexOf("\">");
			idx2 = templine.indexOf("a>");
			naver_re[count] = templine.substring(idx + 2, idx2 - 2).trim();
			map44.put(naver_re[count], reverse);
			if (count == 9) {
				break;
			}
			count++;
			reverse--;

		}
		/******************** 평점순 cgv nate naver **********************************************/
		// cgv 평점순
		count = 0;

		url = "http://www.cgv.co.kr/movies/?lt=1&ot=2";
		doc = Jsoup.connect(url).get();

		media11 = doc.select(".title");
		reverse = 10;

		for (Element src : media11) {

			templine = src.toString();
			idx = templine.indexOf("\">");
			idx2 = templine.indexOf("strong>");
			cgv_star[count] = templine.substring(idx + 2, idx2 - 2).trim();
			map111.put(cgv_star[count], reverse);
			if (count == 9) {
				break;
			}
			count++;
			reverse--;

		}
		// nate 평점순
		count = 0;

		url = "http://movie.nate.com/movie_new/movie_chart_point.asp";
		doc = Jsoup.connect(url).get();
		  media11 = doc.select(".list_ranking"); 
		media11 = doc.select("p[class=mtx1 pl7]>a");
		reverse = 10;

		for (Element src : media11) {

			templine = src.toString();
			idx = templine.indexOf("\">");
			idx2 = templine.indexOf("a>");
			nate_star[count] = templine.substring(idx + 2, idx2 - 2).trim();
			map222.put(nate_star[count], reverse);
			if (count == 9) {
				break;
			}
			count++;
			reverse--;

		}
		// naver 평점순
		count = 0;

		url = "http://movie.naver.com/movie/sdb/rank/rmovie.nhn?sel=cur&date=20171122";
		doc = Jsoup.connect(url).get();

		media11 = doc.select("div[class=tit5]>a");
		reverse = 10;

		for (Element src : media11) {

			templine = src.toString();
			idx = templine.indexOf("\">");
			idx2 = templine.indexOf("a>");
			naver_star[count] = templine.substring(idx + 2, idx2 - 2).trim();
			map333.put(naver_star[count], reverse);

			if (count == 9) {
				break;
			}
			count++;
			reverse--;

		}
		
		System.out.println("----cgv    네이버----");
		ArrayList<Map.Entry<String, Integer>> al ;
		LinkedHashMap<String, Integer> sortedMap ;
		Set<Entry<String, Integer>> set1;
		Iterator<Entry<String, Integer>> it1;
		Set<Entry<String, Integer>> set2 ;
		Iterator<Entry<String, Integer>> it2;
		Set<Entry<String, Integer>> set3 ;
		Iterator<Entry<String, Integer>> it3;
		Set<Entry<String, Integer>> set4 ;
		Iterator<Entry<String, Integer>> it4;
		Set<Entry<String, Integer>> resultSet ;
		Iterator<Entry<String, Integer>> resultIt;
		Set<Entry<String, Integer>> sortedSet;
		Iterator<Entry<String, Integer>> sortedIt;
		int limit=0;
		set1 = map1.entrySet();
		it1 = set1.iterator();
		while (it1.hasNext()) {
			Map.Entry<String, Integer> e = (Map.Entry<String, Integer>) it1.next();
			Set<Entry<String, Integer>> sett = map2.entrySet();
			Iterator<Entry<String, Integer>> itt = sett.iterator();
			while (itt.hasNext()) {
				Map.Entry<String, Integer> ee = (Map.Entry<String, Integer>) itt
						.next();
				if (e.getKey().equals(ee.getKey())) {
					result.put(e.getKey(), e.getValue() + ee.getValue());
					break;
				}
			}
		}
		set1 = map1.entrySet();
		it1 = set1.iterator();
		while (it1.hasNext()) {
			Map.Entry<String, Integer> e = (Map.Entry<String, Integer>) it1
					.next();
			if (result.containsKey(e.getKey())) {
			} else {
				result.put(e.getKey(), e.getValue());
			}
		}
		
		set2= map2.entrySet();
		it2 = set2.iterator();
		while (it2.hasNext()) {
			Map.Entry<String, Integer> e = (Map.Entry<String, Integer>) it2.next();
			if (result.containsKey(e.getKey())) {
			} else {
				result.put(e.getKey(), e.getValue());
			}
		}
		
		resultSet= result.entrySet();
		resultIt = resultSet.iterator();
		
		al= new ArrayList<Map.Entry<String, Integer>>();
		sortedMap= new LinkedHashMap();
 
		while (resultIt.hasNext()) {
			Map.Entry<String, Integer> e = (Map.Entry<String, Integer>) resultIt
					.next();
			al.add(e);
		}
 
		while (true) {
			int max = 0;
			int maxIndex = 0;
			for (int i = 0; i < al.size(); i++) {
				if (al.get(i).getValue() > max) {
					max = al.get(i).getValue();
					maxIndex = i;
				}
			}
			sortedMap.put(al.get(maxIndex).getKey(), al.get(maxIndex)
					.getValue());
			al.remove(maxIndex);
			if (al.size() == 0 || al.get(0).getKey() == null) {
				break;
			}
		}
 
		
		sortedSet = sortedMap.entrySet();
		sortedIt = sortedSet.iterator();
		System.out.println("sorted result");
		String[] resultStr={"","","","","","","","","",""};
		while (sortedIt.hasNext()) {
			Map.Entry<String, Integer> e = (Map.Entry<String, Integer>) sortedIt
					.next();
			System.out.println("이름 : " + e.getKey() + ", 점수 : "
					+ e.getValue());
			resultStr[limit]=e.getKey();
			limit++;
			if(limit==10){
				break;
			}
		}
		
		/**********************/
		System.out.println("-----cgv다음네이트네이버-----");
		
		set1 = map11.entrySet();
		it1 = set1.iterator();
		while (it1.hasNext()) {
			Map.Entry<String, Integer> e = (Map.Entry<String, Integer>) it1.next();
			Set<Entry<String, Integer>> sett = map22.entrySet();
			Iterator<Entry<String, Integer>> itt = sett.iterator();
			while (itt.hasNext()) {
				Map.Entry<String, Integer> ee = (Map.Entry<String, Integer>) itt
						.next();
				if (e.getKey().equals(ee.getKey())) {
					result1.put(e.getKey(), e.getValue() + ee.getValue());
					break;
				}
			}
		}
		set1 = map11.entrySet();
		it1 = set1.iterator();
		while (it1.hasNext()) {
			Map.Entry<String, Integer> e = (Map.Entry<String, Integer>) it1
					.next();
			if (result1.containsKey(e.getKey())) {
			} else {
				result1.put(e.getKey(), e.getValue());
			}
		}
		
		set2= map22.entrySet();
		it2 = set2.iterator();
		while (it2.hasNext()) {
			Map.Entry<String, Integer> e = (Map.Entry<String, Integer>) it2.next();
			if (result1.containsKey(e.getKey())) {
			} else {
				result1.put(e.getKey(), e.getValue());
			}
		}
		
		set3 = map33.entrySet();
		it3 = set3.iterator();
		while (it3.hasNext()) {
			Map.Entry<String, Integer> e = (Map.Entry<String, Integer>) it3.next();
			Set<Entry<String, Integer>> sett = map44.entrySet();
			Iterator<Entry<String, Integer>> itt = sett.iterator();
			while (itt.hasNext()) {
				Map.Entry<String, Integer> ee = (Map.Entry<String, Integer>) itt
						.next();
				if (e.getKey().equals(ee.getKey())) {
					result2.put(e.getKey(), e.getValue() + ee.getValue());
					break;
				}
			}
		}
		set3 = map33.entrySet();
		it3 = set3.iterator();
		while (it3.hasNext()) {
			Map.Entry<String, Integer> e = (Map.Entry<String, Integer>) it3
					.next();
			if (result2.containsKey(e.getKey())) {
			} else {
				result2.put(e.getKey(), e.getValue());
			}
		}
		
		set4= map44.entrySet();
		it4 = set4.iterator();
		while (it4.hasNext()) {
			Map.Entry<String, Integer> e = (Map.Entry<String, Integer>) it4.next();
			if (result2.containsKey(e.getKey())) {
			} else {
				result2.put(e.getKey(), e.getValue());
			}
		}
		
		set1 = result1.entrySet();
		it1 = set1.iterator();
		while (it1.hasNext()) {
			Map.Entry<String, Integer> e = (Map.Entry<String, Integer>) it1.next();
			Set<Entry<String, Integer>> sett = result2.entrySet();
			Iterator<Entry<String, Integer>> itt = sett.iterator();
			while (itt.hasNext()) {
				Map.Entry<String, Integer> ee = (Map.Entry<String, Integer>) itt
						.next();
				if (e.getKey().equals(ee.getKey())) {
					result.put(e.getKey(), e.getValue() + ee.getValue());
					break;
				}
			}
		}
		set1 = result1.entrySet();
		it1 = set1.iterator();
		while (it1.hasNext()) {
			Map.Entry<String, Integer> e = (Map.Entry<String, Integer>) it1
					.next();
			if (result.containsKey(e.getKey())) {
			} else {
				result.put(e.getKey(), e.getValue());
			}
		}
		
		set2= result2.entrySet();
		it2 = set2.iterator();
		while (it2.hasNext()) {
			Map.Entry<String, Integer> e = (Map.Entry<String, Integer>) it2.next();
			if (result.containsKey(e.getKey())) {
			} else {
				result.put(e.getKey(), e.getValue());
			}
		}
		
		resultSet= result.entrySet();
		resultIt = resultSet.iterator();
		
		al= new ArrayList<Map.Entry<String, Integer>>();
		sortedMap= new LinkedHashMap();
 
		while (resultIt.hasNext()) {
			Map.Entry<String, Integer> e = (Map.Entry<String, Integer>) resultIt
					.next();
			al.add(e);
		}
 
		while (true) {
			int max = 0;
			int maxIndex = 0;
			for (int i = 0; i < al.size(); i++) {
				if (al.get(i).getValue() > max) {
					max = al.get(i).getValue();
					maxIndex = i;
				}
			}
			sortedMap.put(al.get(maxIndex).getKey(), al.get(maxIndex)
					.getValue());
			al.remove(maxIndex);
			if (al.size() == 0 || al.get(0).getKey() == null) {
				break;
			}
		}
 
		
		sortedSet = sortedMap.entrySet();
		sortedIt = sortedSet.iterator();
		System.out.println("sorted result");
		limit=0;
		String[] resultStr2={"","","","","","","","","",""};
		while (sortedIt.hasNext()) {
			Map.Entry<String, Integer> e = (Map.Entry<String, Integer>) sortedIt
					.next();
			System.out.println("이름 : " + e.getKey() + ", 점수 : "
					+ e.getValue());
			resultStr2[limit]=e.getKey();
			limit++;
			if(limit==10){
				break;
			}
		}
		
		System.out.println("-----cgv네이트네이버-----");
		
		
		set1 = map111.entrySet();
		it1 = set1.iterator();
		while (it1.hasNext()) {
			Map.Entry<String, Integer> e = (Map.Entry<String, Integer>) it1.next();
			Set<Entry<String, Integer>> sett = map222.entrySet();
			Iterator<Entry<String, Integer>> itt = sett.iterator();
			while (itt.hasNext()) {
				Map.Entry<String, Integer> ee = (Map.Entry<String, Integer>) itt
						.next();
				if (e.getKey().equals(ee.getKey())) {
					temp.put(e.getKey(), e.getValue() + ee.getValue());
					break;
				}
			}
		}
		set1 = map111.entrySet();
		it1 = set1.iterator();
		while (it1.hasNext()) {
			Map.Entry<String, Integer> e = (Map.Entry<String, Integer>) it1
					.next();
			if (temp.containsKey(e.getKey())) {
			} else {
				temp.put(e.getKey(), e.getValue());
			}
		}
		
		set2= map222.entrySet();
		it2 = set2.iterator();
		while (it2.hasNext()) {
			Map.Entry<String, Integer> e = (Map.Entry<String, Integer>) it2.next();
			if (temp.containsKey(e.getKey())) {
			} else {
				temp.put(e.getKey(), e.getValue());
			}
		}
		//cgv 네이트 -> temp temp랑 map333(네이버) 합체
		set1 = temp.entrySet();
		it1 = set1.iterator();
		while (it1.hasNext()) {
			Map.Entry<String, Integer> e = (Map.Entry<String, Integer>) it1.next();
			Set<Entry<String, Integer>> sett = map333.entrySet();
			Iterator<Entry<String, Integer>> itt = sett.iterator();
			while (itt.hasNext()) {
				Map.Entry<String, Integer> ee = (Map.Entry<String, Integer>) itt
						.next();
				if (e.getKey().equals(ee.getKey())) {
					result.put(e.getKey(), e.getValue() + ee.getValue());
					break;
				}
			}
		}
		set1 = temp.entrySet();
		it1 = set1.iterator();
		while (it1.hasNext()) {
			Map.Entry<String, Integer> e = (Map.Entry<String, Integer>) it1
					.next();
			if (result.containsKey(e.getKey())) {
			} else {
				result.put(e.getKey(), e.getValue());
			}
		}
		
		set2= map333.entrySet();
		it2 = set2.iterator();
		while (it2.hasNext()) {
			Map.Entry<String, Integer> e = (Map.Entry<String, Integer>) it2.next();
			if (result.containsKey(e.getKey())) {
			} else {
				result.put(e.getKey(), e.getValue());
			}
		}
		
		resultSet= result.entrySet();
		resultIt = resultSet.iterator();
		
		al= new ArrayList<Map.Entry<String, Integer>>();
		sortedMap= new LinkedHashMap();

		while (resultIt.hasNext()) {
			Map.Entry<String, Integer> e = (Map.Entry<String, Integer>) resultIt
					.next();
			al.add(e);
		}

		while (true) {
			int max = 0;
			int maxIndex = 0;
			for (int i = 0; i < al.size(); i++) {
				if (al.get(i).getValue() > max) {
					max = al.get(i).getValue();
					maxIndex = i;
				}
			}
			sortedMap.put(al.get(maxIndex).getKey(), al.get(maxIndex)
					.getValue());
			al.remove(maxIndex);
			if (al.size() == 0 || al.get(0).getKey() == null) {
				break;
			}
		}

		
		sortedSet = sortedMap.entrySet();
		sortedIt = sortedSet.iterator();
		System.out.println("sorted result");
		limit=0;
		String[] resultStr3={"","","","","","","","","",""};
		while (sortedIt.hasNext()) {
			Map.Entry<String, Integer> e = (Map.Entry<String, Integer>) sortedIt.next();
			System.out.println("이름 : " + e.getKey() + ", 점수 : "
					+ e.getValue());
			resultStr3[limit]=e.getKey();
			limit++;
			if(limit==10){
				break;
			}
		}
		
		/*확인 출력*/
		System.out.println("-----인기순-----");
		for(int i=0;i<10;i++){
			System.out.println((i+1)+"위:"+resultStr[i]);
		}
		System.out.println("-----예매순-----");
		for(int i=0;i<10;i++){
			System.out.println((i+1)+"위:"+resultStr2[i]);
		}
		System.out.println("-----평점순-----");
		for(int i=0;i<10;i++){
			System.out.println((i+1)+"위:"+resultStr3[i]);
		}
		
		mv.clear();
		context.setAttribute("str1", resultStr);
		context.setAttribute("str2", resultStr2);
		context.setAttribute("str3", resultStr3);
		
		mv.addObject("str1", resultStr);
		mv.addObject("str2", resultStr2);
		mv.addObject("str3", resultStr3);
		mv.setViewName("/main/main");
		return mv;
	}
	@RequestMapping(value = "customer")
	public ModelAndView customer(String name) throws IOException {
		mv.clear();
		
		mv.setViewName("/board/customer");
		return mv;
	}
	
	@RequestMapping(value = "email")
	public ModelAndView email(MemberDataBean member, HttpServletRequest request) throws Exception {
		
		request.setCharacterEncoding("UTF-8");
		String id = (String) request.getSession().getAttribute("memId");

		member = memberPro.getArticle(id);
		System.out.println(member);
	
		mv.clear();
	
		mv.addObject("name", member.getName());
		mv.addObject("mobile", member.getMobile());
		mv.addObject("email", member.getEmail());
		mv.addObject("member", member);
		
		
		mv.setViewName("/board/email");
		return mv;
	}
	
	
}