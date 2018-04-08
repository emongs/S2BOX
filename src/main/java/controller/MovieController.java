package controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/*import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;*/










import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.sist.msk.Action;

import api.MovieFinderAPI;
import dao.MybatisCurrentMovieDBBean;
import dao.MybatisMovieDBBean;
import dao.MybatisWishListDBBean;
import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;
import model.MovieDataBeanUsingAPI;
import model.MovieFinderAccessDataBean;

@Controller
public class MovieController{

	ModelAndView mv = new ModelAndView();
	MovieFinderAPI t = new MovieFinderAPI();
	
	@Autowired
	MybatisMovieDBBean md = new MybatisMovieDBBean();
	
	@Autowired
	MybatisCurrentMovieDBBean current = new MybatisCurrentMovieDBBean();
	
	@Autowired
	MybatisWishListDBBean wishList = new MybatisWishListDBBean();
	
	
	@RequestMapping(value="movieChart")
	public ModelAndView movieChart(HttpServletRequest request) throws Throwable {
		List movieNameCheckWithId = null;
		String id = (String) request.getSession().getAttribute("memId");
		System.out.println("MovieController movieFinder id : " + id);
		mv.clear();
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
			
		
			mv.addObject("size",size);
			mv.addObject("movieNameCheckWithId",movieNameCheckWithId);
			mv.addObject("likeCount",likeCount);
			mv.addObject("movieChart",movieChart);
			
		
		
		mv.setViewName("movie/movieChart");
		return mv;
	}
	
	
	@RequestMapping(value="movieFinder")
	public ModelAndView movieFinder(HttpServletRequest request) throws Throwable {
		String name = request.getParameter("name");
		String[] genre = request.getParameterValues("genre");
		String[] nation = request.getParameterValues("nation");
		String[] grade = request.getParameterValues("grade");
		String startYear = request.getParameter("startYear");
		String endYear = request.getParameter("endYear");
		List movieNameCheckWithId = null;
		String id = (String) request.getSession().getAttribute("memId");
		System.out.println("MovieController movieFinder id : " + id);
		mv.clear();
		if(id!=null) {
			movieNameCheckWithId = wishList.getMovieNames(id);
			//해당하는 아이디와 위시리스트에 저장되어있는 아이디의 영화 이름을 저장.
			System.out.println("ㅁㅁ" + movieNameCheckWithId);
			mv.addObject("id", id);
		}
		ArrayList<String> movieNm = new ArrayList<String>();
		ArrayList<Integer> likeCount = new ArrayList();
		
		
		if (name == null && genre == null && nation == null 
				&& grade == null && startYear == null && endYear == null) {
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
			
		
			mv.addObject("size",size);
			mv.addObject("movieNameCheckWithId",movieNameCheckWithId);
			mv.addObject("likeCount",likeCount);
			mv.addObject("movieChart",movieChart);
			
		}
		
		mv.setViewName("movie/movieFinder");
		return mv;
	}

	@RequestMapping(value="movieNameToDetail")
	public ModelAndView movieNameToDetail(HttpServletRequest request) throws Throwable {
		String movieNm = request.getParameter("movieNm");
		String[] genre = request.getParameterValues("genre");
		String[] nation = request.getParameterValues("nation");
		String[] grade = request.getParameterValues("grade");
		HashMap<String, ArrayList<String>> map = t.searchMovie_MovieNmAndDirectorNm(movieNm, "1", genre, nation, "","");
		ArrayList<String> getMovieCd = map.get("movieCd");
		String movieCd = getMovieCd.get(0);
		HashMap<String, ArrayList<String>> movieInfoMap = t.movieDetail(movieCd);

		mv.clear();
		mv.addObject("movieInfoMap", movieInfoMap);
		mv.addObject("movieCd", movieCd);
		mv.setViewName("movie/movieDetail");
		
		return mv;
	}

	@RequestMapping(value="movieFinderRes")
	public ModelAndView movieFinderRes(HttpServletRequest request) throws Throwable {

		/*
		 * findType => 1 : 영화이름, 2 : 주연배우, 3 : 감독명
		 */

		String name = request.getParameter("name");
		String findType = request.getParameter("findType");
		String[] genre = request.getParameterValues("genre");
		String[] nation = request.getParameterValues("nation");
		String[] grade = request.getParameterValues("grade");
		String startYear = request.getParameter("startYear");
		String endYear = request.getParameter("endYear");

		for (int i = 0; i < genre.length; i++) {
			System.out.println(genre[i]);
		}
		System.out.println(endYear);

		if (startYear.equals(""))
			startYear = "1960";

		if (endYear.equals(""))
			endYear = "2020";

		if (name == null || name.equals("")) {
			System.out.println("요기냐");
			List li = md.search_movieNmWithAllNoName(genre, grade, nation, startYear, endYear);
			System.out.println("li크기: " + li.size());
			int size = li.size();
			
			mv.clear();
			mv.addObject("li", li);
			mv.addObject("size", size);
			mv.addObject("name", name);
			mv.addObject("genre", genre);
			mv.addObject("grade", grade);
			mv.addObject("nation", nation);
			mv.addObject("findType", findType);
			mv.addObject("startYear", startYear);
			mv.addObject("endYear", endYear);
			mv.setViewName("movie/noName");
			
			return mv;
		}

		if (findType.equals("1") || findType.equals("3")) {
			String movieNm = "";
			String directors = "";
			List li = null;
			if (findType.equals("1")) {
				movieNm = name;
				li = md.search_movieNmWithMovie(movieNm, genre, grade, nation, startYear, endYear);

			}

			if (findType.equals("3")) {
				directors = name;
				li = md.search_movieNmWithDirector(directors, genre, grade, nation, startYear, endYear);
			}
			// HashMap<String, ArrayList<String>> map =
			// t.searchMovie_MovieNmAndDirectorNm(name, findType, genre, nation,
			// startYear, endYear);

			// ArrayList<String> getSize = map.get("movieCd");
			int size = li.size();
			
			mv.clear();
			mv.addObject("li", li);
			mv.addObject("size", size);
			mv.addObject("name", name);
			mv.addObject("genre", genre);
			mv.addObject("grade", grade);
			mv.addObject("nation", nation);
			mv.addObject("findType", findType);
			mv.addObject("startYear", startYear);
			mv.addObject("endYear", endYear);
			mv.setViewName("movie/searchMovie_MD");

			return mv;
		} else {

			ArrayList<String> actorNmToCd = t.searchMovie_ActorNmToActorCd(name);
			HashMap<String, ArrayList<String>> actorCdToMovieCdMap = t.searchMovie_ActorCdToMovie(actorNmToCd, genre,
					nation, grade, startYear, endYear);

			ArrayList<String> getSize = actorCdToMovieCdMap.get("movieCd");
			int size = getSize.size();
			
			mv.clear();
			mv.addObject("map", actorCdToMovieCdMap);
			mv.addObject("size", size);
			mv.addObject("name", name);
			mv.addObject("genre", genre);
			mv.addObject("grade", grade);
			mv.addObject("nation", nation);
			mv.addObject("findType", findType);
			mv.addObject("startYear", startYear);
			mv.addObject("endYear", endYear);
			mv.setViewName("movie/searchMovie_Actor");
			
			return mv;

		}

	}
	
	@RequestMapping(value="movieDetail")
	public ModelAndView movieDetail(String movieCd) throws Throwable {


		HashMap<String, ArrayList<String>> movieInfoMap = t.movieDetail(movieCd);

		
		mv.clear();
		mv.addObject("movieInfoMap", movieInfoMap);
		mv.addObject("movieCd", movieCd);
		mv.setViewName("movie/movieDetail");

		return mv;
	}

	@RequestMapping(value="movieMatchPeople")
	public ModelAndView movieMatchPeople(String peopleNm, String movieCd) throws Throwable {

		// type value = actor or director
		// the logic is separated by this type.

		ArrayList<String> peopleCdList = t.peopleNameToPeopleCd(peopleNm);
		// ArrayList<String> movieInfo = t.searchPeopleDetail(peopleCdList); //
		// 사람코드, 영화코드, 영화이름

		HashMap<String, ArrayList<String>> map = t.movieMatchPeople(peopleCdList, movieCd);

		mv.clear();
		mv.addObject("map", map);
		mv.setViewName("movie/movieMatchPeople");
		
		return mv;
	}
	
	@RequestMapping(value="movieTrailer")
	public ModelAndView movieTrailer() throws Throwable {


		mv.clear();
		mv.setViewName("movie/trailer");
		
		return mv;
	}

}
