package dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.VipDataBean;

import org.apache.ibatis.session.SqlSession;

public class MybatisVipDBBean extends  MybatisConnector{
	private final String namespace = "ldg.vip";
	private static MybatisVipDBBean instance 
	= new MybatisVipDBBean();
	SqlSession sqlSession;
	public static MybatisVipDBBean getInstance() {
		System.out.println("MybatisVipDBBean");
		return instance;}
	public int getArticleCount() {
		// TODO Auto-generated method stub
		sqlSession = sqlSession();

		try {

			System.out.println(sqlSession.selectOne(namespace + ".getArticleCount"));
			return sqlSession.selectOne(namespace + ".getArticleCount");

		} finally {
			sqlSession.close();
		}
	}
	public List getArticles(int startRow, int endRow) {
		// TODO Auto-generated method stub
		sqlSession = sqlSession();
		System.out.println("getArticles===old");
		HashMap map = new HashMap();
		map.put("start", startRow);
		map.put("end", endRow);

		try {
			return sqlSession.selectList(namespace + ".getArticles", map);
		} finally {
			sqlSession.close();
		}
	}
	

}
