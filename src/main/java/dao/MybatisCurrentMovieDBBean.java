package dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

public class MybatisCurrentMovieDBBean extends MybatisConnector{

	private final String namespace = "ldg.currentMovie";
	private static MybatisCurrentMovieDBBean instance = new MybatisCurrentMovieDBBean();
	SqlSession sqlSession;

	public static MybatisCurrentMovieDBBean getInstance() {
		return instance;
	}
	
	public int getLikeCount(String movie_name) throws Exception {
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		System.out.println("MybatisCurrentMovieDBBean param movie_name : " + movie_name );
		map.put("movie_name", movie_name);
		System.out.println(map);
		int res = -1;
		try {
			res = sqlSession.selectOne(namespace+".getLikeCount",map);
			System.out.println("res : " + res);
			return res;
		} finally {
			sqlSession.close();
		}
	
	}
	
	public void increase_like(String movie_name) throws Exception {
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("movie_name",movie_name);
		System.out.println(map);
		System.out.println("mybatisCurrentMovie increase_like");
		try {
			int res = sqlSession.update(namespace+".increase_like",map);
			System.out.println("update ok? : " + res);
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}
	
	public void decrease_like(String movie_name) throws Exception {
		sqlSession = sqlSession();
		HashMap map = new HashMap();
		map.put("movie_name",movie_name);
		System.out.println(map);
		System.out.println("mybatisCurrentMovie decrease_like");
		try {
			int res = sqlSession.update(namespace+".decrease_like",map);
			System.out.println("update ok? : " + res);
		} finally { 
			sqlSession.commit();
			sqlSession.close();
		}
	}
}
