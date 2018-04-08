package dao;

import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import model.MovieDataBeanUsingAPI;

public class MybatisMovieDBBean extends MybatisConnector {
	// /////////
	// 이름 안들어왔을때 실행하는 부분
	// ///////
	private final String namespace = "ldg.movie";
	private static MybatisMovieDBBean instance = new MybatisMovieDBBean();
	SqlSession sqlSession;

	public static MybatisMovieDBBean getInstance() {
		return instance;
	}

	public static void main(String[] args) throws Exception {
//		MybatisMovieDBBean md = new MybatisMovieDBBean();
//		String[] genre = { "범죄" };
//		String[] nation = { "한국" };
//		String[] grade = { "15세이상관람가" };
//		md.search_movieNmWithMovie("꾼", genre, grade, nation, "", "");
	}

	public List search_movieNmWithAllNoName(String[] genreArr,
			String[] gradeArr, String[] nationArr, String startPrdtParam,
			String endPrdtParam) throws Exception {
		// 이름안
		sqlSession = sqlSession();
		String[] nations = nationArr;
		String[] grade = gradeArr;
		String[] genre = genreArr;
		String startPrdt = "";
		String endPrdt = "";

		if (startPrdtParam.equals("")) {
			startPrdt = "1960";
		} else {
			startPrdt = startPrdtParam;
		}

		if (endPrdtParam.equals("")) {
			endPrdt = "2020";
		} else {
			endPrdt = endPrdtParam;
		}

		System.out
				.println("search_movieNmWithAllNoName nationArr genreArr gradeArr startPrdtParam endPrdtParam : "
						+ Arrays.toString(nations)
						+ ", "
						+ Arrays.toString(genre)
						+ ", "
						+ Arrays.toString(grade)
						+ ", "
						+ startPrdt
						+ ", "
						+ endPrdt);

		HashMap map = new HashMap();
		map.put("nations", nations);
		map.put("grade", grade);
		map.put("genre", genre);
		map.put("startPrdt", startPrdt);
		map.put("endPrdt", endPrdt);

		try {

			List allList = sqlSession.selectList(namespace
					+ ".search_movieNmWithAllNoName", map);

			System.out.println("zxcvzcxv allList size : " + allList.size());

			return allList;
		} finally {
			sqlSession.close();
		}
	}

	public List search_movieNmWithMovie(String movieNmParam, String[] genreArr,
			String[] gradeArr, String[] nationArr, String startPrdtParam,
			String endPrdtParam) throws Exception {
		// 이름안
		sqlSession = sqlSession();
		String movieNm = movieNmParam;
		String[] nations = nationArr;
		String[] grade = gradeArr;
		String[] genre = genreArr;
		String startPrdt = "";
		String endPrdt = "";

		if (startPrdtParam.equals("")) {
			startPrdt = "1960";
		} else {
			startPrdt = startPrdtParam;
		}

		if (endPrdtParam.equals("")) {
			endPrdt = "2020";
		} else {
			endPrdt = endPrdtParam;
		}

		System.out
				.println("search_movieNmWithMovie movieNm nationArr genreArr gradeArr startPrdtParam endPrdtParam : "
						+ movieNm
						+ Arrays.toString(nations)
						+ ", "
						+ Arrays.toString(genre)
						+ ", "
						+ Arrays.toString(grade)
						+ ", "
						+ startPrdt
						+ ", "
						+ endPrdt);

		HashMap map = new HashMap();
		map.put("movieNm", movieNm);
		map.put("nations", nations);
		map.put("grade", grade);
		map.put("genre", genre);
		map.put("startPrdt", startPrdt);
		map.put("endPrdt", endPrdt);

		try {
			System.out.println("sss");
			List allList = sqlSession.selectList(namespace
					+ ".search_movieNmWithMovie", map);
			System.out.println(allList);
			return allList;
		} finally {
			sqlSession.close();
		}
	}

	public List search_movieNmWithDirector(String directorsParam,
			String[] genreArr, String[] gradeArr, String[] nationArr,
			String startPrdtParam, String endPrdtParam) throws Exception {
		// 이름안
		sqlSession = sqlSession();
		String directors = directorsParam;
		String[] nations = nationArr;
		String[] grade = gradeArr;
		String[] genre = genreArr;
		String startPrdt = "";
		String endPrdt = "";

		if (startPrdtParam.equals("")) {
			startPrdt = "1960";
		} else {
			startPrdt = startPrdtParam;
		}

		if (endPrdtParam.equals("")) {
			endPrdt = "2020";
		} else {
			endPrdt = endPrdtParam;
		}

		System.out
				.println("search_movieNmWithDirector directors nationArr genreArr gradeArr startPrdtParam endPrdtParam : "
						+ directors
						+ Arrays.toString(nations)
						+ ", "
						+ Arrays.toString(genre)
						+ ", "
						+ Arrays.toString(grade)
						+ ", "
						+ startPrdt
						+ ", "
						+ endPrdt);

		HashMap map = new HashMap();
		map.put("directors", directors);
		map.put("nations", nations);
		map.put("grade", grade);
		map.put("genre", genre);
		map.put("startPrdt", startPrdt);
		map.put("endPrdt", endPrdt);

		try {

			List allList = sqlSession.selectList(namespace
					+ ".search_movieNmWithDirector", map);

			System.out.println("zxcvzcxv allList size : " + allList.size());

			return allList;
		} finally {
			sqlSession.close();
		}
	}
}
