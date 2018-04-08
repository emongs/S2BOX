package dao;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jdk.nashorn.internal.runtime.Context.ThrowErrorManager;

import org.apache.ibatis.session.SqlSession;

public class MybatisWishListDBBean extends MybatisConnector {

	private final String namespace = "ldg.wish_list";
	private static MybatisWishListDBBean instance = new MybatisWishListDBBean();
	SqlSession sqlSession;

	public static MybatisWishListDBBean getInstance() {
		return instance;
	}

	public void insert_WishList(String id, String movie_name) throws Throwable {

		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("movie_name", movie_name);

		try {
			int result = sqlSession.insert(namespace + ".insert_WishList", map);
			System.out.println("insert ok : " + result);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}

	public int check_WishList(String id, String movie_name) throws Throwable {

		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("movie_name", movie_name);
		int result = 0 ;

		try {
			result = sqlSession.selectOne(namespace + ".check_WishList", map);
			System.out.println("select ok : " + result);
			
		} finally {
			sqlSession.close();
		}
		
		return result;
	}
	
	public void delete_WishList(String id, String movie_name) throws Throwable {

		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("movie_name", movie_name);

		try {
			int result = sqlSession.delete(namespace + ".delete_WishList", map);
			System.out.println("delete ok : " + result);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}
	
	public List getMovieNames(String id) throws Throwable {
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("id", id);
		System.out.println("MybatisWish~~ id : "+ id);
		System.out.println(map);
		List<String> movieNameList = null;
		try {
			movieNameList = sqlSession.selectList(namespace+".getMovieNames",map);
		} finally {
			sqlSession.close();
		}
		return movieNameList;
	}

}
