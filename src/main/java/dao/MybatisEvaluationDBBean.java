package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import model.EvaluationDataBean;


public class MybatisEvaluationDBBean extends MybatisConnector {
	private final String namespace = "ldg.evaluation";
	private static MybatisEvaluationDBBean instance = new MybatisEvaluationDBBean();

	SqlSession sqlSession;

	public static MybatisEvaluationDBBean getInstance() {
		return instance;
	}

	public void insertEvaluation(EvaluationDataBean article) throws Exception {
		sqlSession = sqlSession();
		System.out.println("****insertEvalution");

		HashMap map = new HashMap();
		try {
			sqlSession.insert(namespace + ".insertEvaluation", article);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}

	public List listEvaluation(String movie_nameParam) throws Exception {
		sqlSession = sqlSession();
		String movie_name = "";
		if(movie_nameParam != null || movie_nameParam != "") {
			movie_name = movie_nameParam;
		}
		System.out.println("mybatis listEval's movie_name : " + movie_name);
		System.out.println("**** listEvaluation");
		System.out.println("0");
		HashMap map = new HashMap();
		System.out.println("1");
		map.put("movie_name", movie_name);
		System.out.println("2");
		List li = null;
		System.out.println("3");
		try {
			System.out.println("4");
			return sqlSession.selectList(namespace + ".listEvaluation", map);
		} finally {
			System.out.println("6");
			System.out.println("7");
			sqlSession.close();
		}

	}

	public void updateLikeup(int eval_id) throws Exception {

		sqlSession = sqlSession();
		EvaluationDataBean article = null;

		HashMap map = new HashMap();
		map.put("eval_id", eval_id);
		try {
			sqlSession.update(namespace + ".updateLikeup", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}

	public void updateLikedown(int eval_id) throws Exception {

		sqlSession = sqlSession();
		EvaluationDataBean article = null;

		HashMap map = new HashMap();
		map.put("eval_id", eval_id);
		try {
			sqlSession.update(namespace + ".updateLikedown", map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.commit();
			sqlSession.close();
		}
	}

	public List sortingFavor(String movie_nameParam) throws Exception {

		sqlSession = sqlSession();
		System.out.println("**** sortingFavor");
		String movie_name = "";
		if(movie_nameParam != null || movie_nameParam != "") {
			movie_name = movie_nameParam;
		}
		
		HashMap map = new HashMap();
		map.put("movie_name",movie_name);
		List li = null;
		try {
			li = sqlSession.selectList(namespace + ".sortingFavor",map);
		} finally {
			sqlSession.close();
		}
		return li;
	}
	public List sortingWorstStar(String movie_nameParam) throws Exception {

		sqlSession = sqlSession();
		System.out.println("**** sortingWorstStar");
		String movie_name = "";
		if(movie_nameParam != null || movie_nameParam != "") {
			movie_name = movie_nameParam;
		}
		HashMap map = new HashMap();
		map.put("movie_name", movie_name);
		List li = null;
		try {
			li = sqlSession.selectList(namespace + ".sortingWorstStar",map);
		} finally {
			sqlSession.close();
		}
		return li;
	}
	
	public List sortingBestStar(String movie_nameParam) throws Exception {

		sqlSession = sqlSession();
		System.out.println("**** sortingBestStar");
		String movie_name = "";
		if(movie_nameParam != null || movie_nameParam != "") {
			movie_name = movie_nameParam;
		}
		
		HashMap map = new HashMap();
		map.put("movie_name", movie_name);
		List li = null;
		try {
			li = sqlSession.selectList(namespace + ".sortingBestStar",map);
		} finally {
			sqlSession.close();
		}
		return li;
	}

	public int totalPeople(String movie_nameParam) throws Exception {

		sqlSession = sqlSession();
		System.out.println("**** totalPeople");
		String movie_name = "";
		if(movie_nameParam != null || movie_nameParam != "") {
			movie_name = movie_nameParam;
		}
		HashMap map = new HashMap();
		map.put("movie_name", movie_name);
		try {
			return sqlSession.selectOne(namespace + ".totalPeople",map);
		} finally {
			sqlSession.close();
		}
	}
	
	public double avrEval(String movie_nameParam) throws Exception {
		sqlSession = sqlSession();
		System.out.println("**** avrEval");
		String movie_name = "";
		if(movie_nameParam != null || movie_nameParam != "") {
			movie_name = movie_nameParam;
		}
		System.out.println("param : " +  movie_name);
		HashMap map = new HashMap();
		map.put("movie_name", movie_name);
		System.out.println(map);
		double avr = 0;
		try {
			avr = sqlSession.selectOne(namespace + ".avrEval", map);
			System.out.println("mybatisEval avr : " + avr);
		} finally {
			sqlSession.close();
		}
		return avr;
	}

}
