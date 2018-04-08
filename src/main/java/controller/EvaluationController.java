package controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import api.MovieFinderAPI;
import dao.MybatisCurrentMovieDBBean;
import dao.MybatisEvaluationDBBean;
import dao.MybatisWishListDBBean;
import model.EvaluationDataBean;

@Controller
public class EvaluationController {

	ModelAndView mv = new ModelAndView();
	MovieFinderAPI t = new MovieFinderAPI();

	@Autowired
	MybatisEvaluationDBBean dbPro;
	
	
	@Autowired
	MybatisCurrentMovieDBBean current = new MybatisCurrentMovieDBBean();
	
	@Autowired
	MybatisWishListDBBean wishList = new MybatisWishListDBBean();
	
	

	@RequestMapping(value = "Evaluation_form")
	public ModelAndView Evaluation_form(HttpServletRequest request) throws Throwable {
		
		List movieNameCheckWithId = null;
		String id = (String) request.getSession().getAttribute("memId");
		
		List articleList = null;
		if(id!=null) {
			movieNameCheckWithId = wishList.getMovieNames(id);
			//해당하는 아이디와 위시리스트에 저장되어있는 아이디의 영화 이름을 저장.
			System.out.println("ㅁㅁ" + movieNameCheckWithId);
			mv.addObject("id", id);
		}
		ArrayList<String> movieNm = new ArrayList<String>();
		ArrayList<Integer> likeCount = new ArrayList();
		
	
		HashMap<String, ArrayList<String>> movieChart = t.movieChart();
		movieNm = movieChart.get("movieNm"); 
		// 무비차트api의 차트 중 영화이름만 호출해서 따로 저장
		
		for(int i = 0 ; i < movieNm.size() ; i++) {
			String key = movieNm.get(i);
			int value = current.getLikeCount(movieNm.get(i));
			// current_movie테이블에서 영화 이름으로 좋아요 개수를 불러옴
			likeCount.add(value);
			// 그 값을 likecount에 저장
		}
		int size = movieChart.get("movieCd").size();
		
		System.out.println();
		
		String movie_name = request.getParameter("movie_name");
		// flag = 1 호감 / 2 최신 / 3 평점 높은거 / 4 평점 낮은거
		int flag = 0;
		if (request.getParameter("flag") != null) {
			flag = Integer.parseInt(request.getParameter("flag"));
		}

		System.out.println("flag : " + flag);
		
		switch (flag) {
		case 1:
			articleList = dbPro.sortingFavor(movie_name);
			break;
		case 2:
			articleList = dbPro.listEvaluation(movie_name);
			break;
		case 3:
			articleList = dbPro.sortingBestStar(movie_name);
			break;
		case 4:
			articleList = dbPro.sortingWorstStar(movie_name);
			break;

		default:
			articleList = dbPro.listEvaluation(movie_name);
			break;
		}

		int people = dbPro.totalPeople(movie_name);
		double avr = dbPro.avrEval(movie_name);
		double avreval = Double.parseDouble(String.format("%.2f", avr));

		mv.addObject("size", size);
		mv.addObject("movieChart", movieChart);
		mv.addObject("movieNameCheckWithId",movieNameCheckWithId);
		mv.addObject("likeCount",likeCount);
		
		mv.addObject("movie_name", movie_name);
		mv.addObject("people", people);
		mv.addObject("avreval", avreval);
		mv.addObject("articleList", articleList);
		mv.setViewName("evaluation/Evaluation_form");

		return mv;
	}

	@RequestMapping(value = "DivAjax")
	public ModelAndView DivAjax(HttpServletRequest request) throws Throwable {

		String movie_name = request.getParameter("movie_name");
		System.out.println("movie_namesdfsdf: " + movie_name);
		System.out.println("movie_name=" + movie_name);
		if (movie_name == null) {
			System.out.println("a");
			movie_name = "1111";
			System.out.println("b");
		}
		List articleList = null;

		// flag = 1 호감 / 2 최신 / 3 평점 높은거 / 4 평점 낮은거
		int flag = 0;
		if (request.getParameter("flag") != null) {
			flag = Integer.parseInt(request.getParameter("flag"));
		}

		System.out.println("flag : " + flag);
		
		switch (flag) {
		case 1:
			articleList = dbPro.sortingFavor(movie_name);
			break;
		case 2:
			articleList = dbPro.listEvaluation(movie_name);
			break;
		case 3:
			articleList = dbPro.sortingBestStar(movie_name);
			break;
		case 4:
			articleList = dbPro.sortingWorstStar(movie_name);
			break;

		default:
			articleList = dbPro.listEvaluation(movie_name);
			break;
		}
		
		System.out.println(articleList);

		int people = dbPro.totalPeople(movie_name);
		double avr = dbPro.avrEval(movie_name);
		System.out.println("people:" + people + ",avr=" + avr);
		double avreval = Double.parseDouble(String.format("%.2f", avr));
		mv.clear();
		mv.addObject("people", people);
		mv.addObject("movie_name", movie_name);
		mv.addObject("avreval", avreval);
		mv.addObject("articleList", articleList);
		mv.setViewName("ajax/evalDraw1");
		return mv;

	}

	@RequestMapping(value = "Evaluation_Pro")
	public ModelAndView Evaluation_Pro(HttpServletRequest request) throws Throwable {

		System.out.println("Evaluation_Pro------");
		request.setCharacterEncoding("UTF-8");

		int likeup = 0;
		if (request.getParameter("likeup") != null)
			likeup = Integer.parseInt(request.getParameter("likeup"));

		int likedown = 0;
		if (request.getParameter("likedown") != null)
			likeup = Integer.parseInt(request.getParameter("likedown"));
		System.out.println("asdf : " + request.getParameter("content"));

		EvaluationDataBean article = new EvaluationDataBean();
		article.setContent(request.getParameter("content"));
		article.setStar(Double.parseDouble(request.getParameter("star")));
		article.setId(request.getParameter("id"));
		article.setLikeup(likeup);
		article.setLikedown(likedown);
		System.out.println(article);

		dbPro.insertEvaluation(article);

		mv.clear();
		mv.setViewName("evaluation/Evaluation_Pro");

		return mv;
	}

	@RequestMapping(value = "LikeUp")
	public ModelAndView LikeUp(HttpServletRequest request) throws Throwable {

		String movie_name = request.getParameter("movie_name");
		int eval_id = Integer.parseInt(request.getParameter("eval_id"));
		System.out.println("eval_id : " + eval_id);
		dbPro.updateLikeup(eval_id);
		List article1 = dbPro.listEvaluation(movie_name);
		
		mv.clear();
		mv.addObject("article1", article1);
		mv.setViewName("evaluation/empty");
		return mv;

	}

	@RequestMapping(value = "LikeDown")
	public ModelAndView LikeDown(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		String movie_name = request.getParameter("movie_name");
		int eval_id = Integer.parseInt(request.getParameter("eval_id"));
		dbPro.updateLikedown(eval_id);
		
		List article1 = dbPro.listEvaluation(movie_name);
		mv.clear();
		mv.addObject("article1", article1);
		mv.setViewName("evaluation/empty");
		return mv;
	}

	@RequestMapping(value = "SortingEval_Favor")
	public ModelAndView SortingEval_Favor(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		System.out.println("param flag : " + request.getParameter("flag"));
		String movie_name = request.getParameter("movie_name");
		int flag = 0;
		if(request.getParameter("flag")==null) {
			flag = 0 ;
		} 
		
		flag = Integer.parseInt(request.getParameter("flag"));
		List articleList = dbPro.sortingFavor(movie_name);

		int people = dbPro.totalPeople(movie_name);
		double avreval = dbPro.avrEval(movie_name);
		
		mv.clear();
		mv.addObject("people", people);
		mv.addObject("flag", flag);
		mv.addObject("avreval", avreval);
		mv.addObject("movie_name", movie_name);
		mv.addObject("articleList", articleList);
		mv.setViewName("evaluation/empty");
		return mv;

	}

	@RequestMapping(value = "SortingEval_BestStar")
	public ModelAndView SortingEval_BestStar(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		System.out.println("param flag : " + request.getParameter("flag"));
		String movie_name = request.getParameter("movie_name");
		List articleList = dbPro.sortingBestStar(movie_name);
		int flag = 0;
		if(request.getParameter("flag")==null) {
			flag = 0 ;
		} 
		
		flag = Integer.parseInt(request.getParameter("flag"));

		int people = dbPro.totalPeople(movie_name);
		double avreval = dbPro.avrEval(movie_name);
		request.setAttribute("people", people);
		request.setAttribute("avreval", avreval);
		request.setAttribute("movie_name", movie_name);
		request.setAttribute("articleList", articleList);
		
		mv.clear();
		mv.addObject("people", people);
		mv.addObject("flag", flag);
		mv.addObject("avreval", avreval);
		mv.addObject("movie_name", movie_name);
		mv.addObject("articleList", articleList);
		mv.setViewName("evaluation/empty");
		return mv;
		
	}

	@RequestMapping(value = "SortingEval_WorstStar")
	public ModelAndView SortingEval_WorstStar(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String movie_name = request.getParameter("movie_name");
		System.out.println("param flag : " + request.getParameter("flag"));
		
		int flag = 0;
		if(request.getParameter("flag")==null) {
			flag = 0 ;
		} 
		
		flag = Integer.parseInt(request.getParameter("flag"));
		
		dbPro.sortingWorstStar(movie_name);
		List articleList = dbPro.listEvaluation(movie_name);

		int people = dbPro.totalPeople(movie_name);
		double avreval = dbPro.avrEval(movie_name);
		System.out.println("avreval : " + avreval);
		
		mv.clear();
		mv.addObject("people", people);
		mv.addObject("flag", flag);
		mv.addObject("avreval", avreval);
		mv.addObject("movie_name", movie_name);
		mv.addObject("articleList", articleList);
		mv.setViewName("evaluation/empty");
		return mv;

	}

	@RequestMapping(value = "eachEvaluation")
	public ModelAndView eachEvaluation(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String movie_name = request.getParameter("movie_name");
		int flag = 0;
		if(request.getParameter("flag")==null) {
			flag = 0 ;
		} 

		System.out.println("영화이름 : " + movie_name);
		List articleList = dbPro.listEvaluation(movie_name);

		int people = dbPro.totalPeople(movie_name);
		double avr = dbPro.avrEval(movie_name);
		double avreval = Double.parseDouble(String.format("%.2f", avr));
		System.out.println("avreval : " + avreval);

		mv.clear();
		mv.addObject("people", people);
		mv.addObject("flag", flag);
		mv.addObject("avreval", avreval);
		mv.addObject("articleList", articleList);
		mv.setViewName("evaluation/eachEvaluation");
		return mv;

	}
}
