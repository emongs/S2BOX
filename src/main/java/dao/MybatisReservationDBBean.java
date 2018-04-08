package dao;

import java.util.HashMap;
import java.util.List;



import model.CurrentMovieDataBean;

import org.apache.ibatis.session.SqlSession;

public class MybatisReservationDBBean extends  MybatisConnector{
	private final String namespace = "ldg.reserve";
	private static MybatisReservationDBBean instance 
	= new MybatisReservationDBBean();
	SqlSession sqlSession;
	public static MybatisReservationDBBean getInstance() {
		System.out.println("MybatisReservationDBBean");
		return instance;}

	/////////////////////////////////////////////////////////
	public int getArticleCount(String boardid) 
			throws Exception {
		sqlSession = sqlSession();
		System.out.println("getArticleCount:"+boardid);
		try {
			HashMap map = new HashMap();
			map.put("boardid", boardid);
			System.out.println("����>?");
			return sqlSession.selectOne(namespace + ".getArticleCount", map);
		} finally {
			sqlSession.close();
		}
	}

	public List movieDivList() throws Exception {
		sqlSession = sqlSession();
		System.out.println("RDBBEAN movieDivList");

		try {
			return sqlSession.selectList(namespace + ".movieDivList");
		} finally {
			sqlSession.close();
		}
	}
	
	public List theaterDivList() throws Exception {
		sqlSession = sqlSession();
		System.out.println("RDBBEAN theaterDivList");
		try {
			return sqlSession.selectList(namespace + ".theaterDivList");
		} finally {
			sqlSession.close();
		}
	}
	public List dateDivList() throws Exception {
		sqlSession = sqlSession();
		System.out.println("RDBBEAN dateDivList");
		try {
			return sqlSession.selectList(namespace + ".dateDivList");
		} finally {
			sqlSession.close();
		}
	}
	public List localListByMovie(String movie_name) throws Exception {
		sqlSession = sqlSession();
		System.out.println("RDBBEAN localListByMovie,param:"+ movie_name);
		HashMap map = new HashMap();
		map.put("movie_name", movie_name);
		try {
			return sqlSession.selectList(namespace + ".localListByMovie",map);
		} finally {
			sqlSession.close();
		}
	}
	public List dateListByMovie(String movie_name) throws Exception {
		sqlSession = sqlSession();
		System.out.println("RDBBEAN dateListByMovie");
		HashMap map = new HashMap();
		map.put("movie_name", movie_name);
		try {
			return sqlSession.selectList(namespace + ".dateListByMovie",map);
		} finally {
			sqlSession.close();
		}
	}
	public List movieListByTheater(String theater_name) throws Exception {
		sqlSession = sqlSession();
		System.out.println("RDBBEAN movieListByTheater:"+theater_name);
		HashMap map = new HashMap();
		map.put("theater_name", theater_name);
		try {
			return sqlSession.selectList(namespace + ".movieListByTheater",map);
		} finally {
			sqlSession.close();
		}
	}
	public List dateListByTheater1(String theater_name) throws Exception {
		sqlSession = sqlSession();
		System.out.println("RDBBEAN dateListByTheater1");
		HashMap map = new HashMap();
		map.put("theater_name", theater_name);
		try {
			return sqlSession.selectList(namespace + ".dateListByTheater1",map);
		} finally {
			sqlSession.close();
		}
	}

	public List dateListByTheater(String theater_name,String movie_name) throws Exception {
		sqlSession = sqlSession();
		System.out.println("RDBBEAN dateListByMovie");
		HashMap map = new HashMap();
		System.out.println("dbbean:"+theater_name+movie_name);
		map.put("theater_name", theater_name);
		map.put("movie_name", movie_name);
		try {
			return sqlSession.selectList(namespace + ".dateListByTheater",map);
		} finally {
			sqlSession.close();
		}
	}
	public List loadScreenCode() throws Exception {
		sqlSession = sqlSession();
		System.out.println("RDBBEAN loadScreenCode");

		try {
			return sqlSession.selectList(namespace + ".loadScreenCode");
		} finally {
			sqlSession.close();
		}
	}
	public List clickDateLevel3(String theater_name,String movie_name,String screen_date) throws Exception {
		sqlSession = sqlSession();
		System.out.println("RDBBEAN dateListByMovie");
		HashMap map = new HashMap();
		System.out.println("dbbean:"+theater_name+movie_name+screen_date);
		map.put("theater_name", theater_name);
		map.put("movie_name", movie_name);
		map.put("screen_date", screen_date);
		try {
			return sqlSession.selectList(namespace + ".clickDateLevel3",map);
		} finally {
			sqlSession.close();
		}
	}
	public List forSortTimeDiv(String theater_name,String movie_name,String screen_date) throws Exception {
		sqlSession = sqlSession();
		System.out.println("RDBBEAN forSortTimeDiv");
		HashMap map = new HashMap();
		System.out.println("dbbean:"+theater_name+movie_name+screen_date);
		map.put("theater_name", theater_name);
		map.put("movie_name", movie_name);
		map.put("screen_date", screen_date);
		try {
			return sqlSession.selectList(namespace + ".forSortTimeDiv",map);
		} finally {
			sqlSession.close();
		}
	}
	public List movieDivByDateAndTheater(String theater_name,String screen_date) throws Exception {
		sqlSession = sqlSession();
		System.out.println("RDBBEAN movieDivByDateAndTheater");
		HashMap map = new HashMap();
		System.out.println("dbbean:"+theater_name+screen_date);
		map.put("theater_name", theater_name);
		map.put("screen_date", screen_date);
		try {
			return sqlSession.selectList(namespace + ".movieDivByDateAndTheater",map);
		} finally {
			sqlSession.close();
		}
	}
	public List loadMovieBydate(String screen_date) throws Exception {
		sqlSession = sqlSession();
		System.out.println("RDBBEAN loadMovieBydate");
		HashMap map = new HashMap();
		System.out.println("dbbean:"+screen_date);
		map.put("screen_date", screen_date);
		try {
			return sqlSession.selectList(namespace + ".loadMovieBydate",map);
		} finally {
			sqlSession.close();
		}
	}
	public List loadLocalBydate(String screen_date) throws Exception {
		sqlSession = sqlSession();
		System.out.println("RDBBEAN loadLocalBydate");
		HashMap map = new HashMap();
		System.out.println("dbbean:"+screen_date);
		map.put("screen_date", screen_date);
		try {
			return sqlSession.selectList(namespace + ".loadLocalBydate",map);
		} finally {
			sqlSession.close();
		}
	}
	public List theaterByDateAndMovie(String movieName,String screen_date) throws Exception {
		sqlSession = sqlSession();
		System.out.println("RDBBEAN theaterByDateAndMovie");
		HashMap map = new HashMap();
		System.out.println("dbbean:"+movieName+screen_date);
		map.put("movieName", movieName);
		map.put("screen_date", screen_date);
		try {
			return sqlSession.selectList(namespace + ".theaterByDateAndMovie",map);
		} finally {
			sqlSession.close();
		}
	}
	public List getSheetID(String movie_name,String theater_name,String screen_date,String startTime,String screen_code) throws Exception {
		sqlSession = sqlSession();
		System.out.println("RDBBEAN getSheetID");
		String start_hour="";
		String start_min="";
		String[] start=startTime.split(":");
		start_hour=start[0];
		start_min=start[1];
		
		HashMap map = new HashMap();
		map.put("movie_name", movie_name);
		map.put("theater_name", theater_name);
		map.put("screen_date", screen_date);
		map.put("start_hour", start_hour);
		map.put("start_min", start_min);
		map.put("screen_code", screen_code);
		try {
			return sqlSession.selectList(namespace + ".getSheetID",map);
		} finally {
			sqlSession.close();
		}
	}
	public String getScreenStyle(String screen_code) throws Exception {
		System.out.println("RDBBEAN getScreenStyle");
	      sqlSession = sqlSession();
	      
	      HashMap map = new HashMap();
	      map.put("screen_code", screen_code);
	      
	      String style_name = "";
	      
	      try {
	    	  style_name = (String) sqlSession.selectOne(namespace + ".getScreenStyle",map);
	      } finally {
	            sqlSession.close();
	      }
	      return style_name;
	}
	
	
	public CurrentMovieDataBean getArticle(int num) throws Exception {
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("num", num);
		CurrentMovieDataBean article = new CurrentMovieDataBean();
		try {int result = sqlSession
				.update(namespace + ".update_readcount", map);
		article = (CurrentMovieDataBean) sqlSession.selectOne(namespace
				+ ".getArticle", map);
		} finally {
			sqlSession.commit();
			sqlSession.close();
			return article;		
		}	
	}
	
	

	/*
	public void insertArticle(CurrentDataBean article) 
			throws Exception {
		sqlSession = sqlSession();
		int num = article.getNum();
		int ref = article.getRef();
		int re_step = article.getRe_step();
		int re_level = article.getRe_level();
		try {HashMap map = new HashMap();
		int number 
		= sqlSession.selectOne(namespace + ".insertArticle_new");
		if (number != 0)	number = number + 1;
		else	number = 1;
		if (num != 0) {	map.put("ref", ref);
		map.put("re_step", re_step);
		sqlSession.update(namespace + ".insertArticle_update", map);
		sqlSession.commit();
		re_step = re_step + 1;
		re_level = re_level + 1;
		} else {ref = number;	re_step = 0;re_level = 0;}
		article.setNum(number);
		article.setRef(ref);
		article.setRe_step(re_step);
		article.setRe_level(re_level);
		System.out.println("insert:" + article);
		int result 
		= sqlSession.insert(namespace + ".insertArticle_insert",
				article);
		System.out.println("insert  0k:" + result);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();		}	}




	public int updateArticle(CurrentDataBean article) 
			throws Exception {
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("num", article.getNum());
		int x = -1;
		try {
			String dbpasswd = (String) sqlSession.selectOne(namespace
					+ ".update_passwd", map);
			if (dbpasswd.equals(article.getPasswd())) {
				x = sqlSession.update(namespace + ".update_update", article);
			}} finally {
				sqlSession.commit();
				sqlSession.close();
			}		return x;	}	



	public int deleteArticle(int num, String passwd) 
			throws Exception {
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("num", num);
		int x = -1;
		try {
			String dbpasswd = (String) sqlSession.selectOne(namespace
					+ ".update_passwd", map);
			if (dbpasswd.equals(passwd)) {
				x = sqlSession.delete(namespace + ".delete", map);
			}		} finally {
				sqlSession.commit();
				sqlSession.close();
			}		return x;	}
	 */

}
