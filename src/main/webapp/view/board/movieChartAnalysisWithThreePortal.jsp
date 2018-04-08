<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.LinkedHashMap"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Comparator"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Map.Entry"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="org.jsoup.nodes.Document"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<%
	String url = "";
	int count = 0;
 
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
	//naver 박스오피스
	try {
		// cgv 인기차트
		count = 0;
 
		url = "http://www.cgv.co.kr/movies/?lt=1&ot=1";
		doc = Jsoup.connect(url).get();
 
		media11 = doc.select(".title");
 
		for (Element src : media11) {
 
			templine = src.toString();
			idx = templine.indexOf("\">");
			idx2 = templine.indexOf("strong>");
			cgv_po[count] = templine.substring(idx + 2, idx2 - 2)
					.trim();
 
			map1.put(cgv_po[count], reverse);
			if (count == 9) {
				break;
			}
			count++;
			reverse--;
 
		}
		//네이버 인기차트
		count = 0;
		reverse = 10;
		url = "http://movie.naver.com/movie/sdb/rank/rmovie.nhn";
		doc = Jsoup.connect(url).get();
		/* Elements media11 = doc.select(".list_ranking"); */
		media11 = doc.select("div[class=tit3]>a");
 
		for (Element src : media11) {
 
			templine = src.toString();
			idx = templine.indexOf("\">");
			idx2 = templine.indexOf("a>");
			naver_po[count] = templine.substring(idx + 2, idx2 - 2)
					.trim();
			map2.put(naver_po[count], reverse);
			if (count == 9) {
				break;
			}
			count++;
			reverse--;
		}
		/********************예매순 cgv daum nate naver **********************************************/
		//cgv 예매순
		count = 0;
 
		url = "http://www.cgv.co.kr/movies/?lt=1&ot=1";
		doc = Jsoup.connect(url).get();
 
		media11 = doc.select(".title");
		reverse=10;
		for (Element src : media11) {
 
			templine = src.toString();
			idx = templine.indexOf("\">");
			idx2 = templine.indexOf("strong>");
			cgv_re[count] = templine.substring(idx + 2, idx2 - 2)
					.trim();
			map11.put(cgv_re[count], reverse);
			if (count == 9) {
				break;
			}
			count++;
			reverse--;
		}
		//daum 예매순
		count = 0;
 
		url = "http://ticket2.movie.daum.net/Movie/MovieRankList.aspx";
		doc = Jsoup.connect(url).get();
 
		media11 = doc.select(".link_g");
		reverse=10;
		for (Element src : media11) {
 
			templine = src.toString();
			idx = templine.indexOf("\">");
			idx2 = templine.indexOf("a>");
			daum_re[count] = templine.substring(idx + 2, idx2 - 2)
					.trim();
			map22.put(daum_re[count], reverse);
			if (count == 9) {
				break;
			}
			count++;
			reverse--;
		}
		//네이트 예매순
		count = 0;
 
		url = "http://movie.nate.com/movie_new/movie_chart_reserve.asp";
		doc = Jsoup.connect(url).get();
 
		media11 = doc.select("p[class=mtx1 pl7]>a");
		reverse=10;
		for (Element src : media11) {
 
			templine = src.toString();
			idx = templine.indexOf("\">");
			idx2 = templine.indexOf("a>");
			nate_re[count] = templine.substring(idx + 2, idx2 - 2)
					.trim();
			map33.put(nate_re[count], reverse);
			if (count == 9) {
				break;
			}
			count++;
		reverse--;
		}
		//네이버 예매순
		count = 0;
 
		url = "http://movie.naver.com/movie/sdb/rank/rreserve.nhn";
		doc = Jsoup.connect(url).get();
 
		media11 = doc.select("div[class=tit4]>a");
		reverse=10;
 
		for (Element src : media11) {
 
			templine = src.toString();
			idx = templine.indexOf("\">");
			idx2 = templine.indexOf("a>");
			naver_re[count] = templine.substring(idx + 2, idx2 - 2)
					.trim();
			map44.put(naver_re[count], reverse);
			if (count == 9) {
				break;
			}
			count++;
			reverse--;
			
 
		}
		/********************평점순 cgv nate naver **********************************************/
		//cgv  평점순
		count = 0;
 
		url = "http://www.cgv.co.kr/movies/?lt=1&ot=2";
		doc = Jsoup.connect(url).get();
 
		media11 = doc.select(".title");
		reverse=10;
 
		for (Element src : media11) {
 
			templine = src.toString();
			idx = templine.indexOf("\">");
			idx2 = templine.indexOf("strong>");
			cgv_star[count] = templine.substring(idx + 2, idx2 - 2)
					.trim();
			map111.put(cgv_star[count], reverse);
			if (count == 9) {
				break;
			}
			count++;
			reverse--;
			
 
		}
		//nate 평점순
		count = 0;
 
		url = "http://movie.nate.com/movie_new/movie_chart_point.asp";
		doc = Jsoup.connect(url).get();
		/* Elements media11 = doc.select(".list_ranking"); */
		media11 = doc.select("p[class=mtx1 pl7]>a");
		reverse=10;
 
		for (Element src : media11) {
 
			templine = src.toString();
			idx = templine.indexOf("\">");
			idx2 = templine.indexOf("a>");
			nate_star[count] = templine.substring(idx + 2, idx2 - 2)
					.trim();
			map222.put(nate_star[count], reverse);
			if (count == 9) {
				break;
			}
			count++;
			reverse--;
 
		}
		//naver 평점순
		count = 0;
 
		url = "http://movie.naver.com/movie/sdb/rank/rmovie.nhn?sel=cur&date=20171122";
		doc = Jsoup.connect(url).get();
 
		media11 = doc.select("div[class=tit5]>a");
		reverse=10;
 
		for (Element src : media11) {
 
			templine = src.toString();
			idx = templine.indexOf("\">");
			idx2 = templine.indexOf("a>");
			naver_star[count] = templine.substring(idx + 2, idx2 - 2)
					.trim();
			map333.put(naver_star[count], reverse);
 
			if (count == 9) {
				break;
			}
			count++;
			reverse--;
			
 
		}
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
%>
 
<body>
	<div class="box">
		-----cgv 네이버
		<%
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
	%>
		-----cgv 다음 네이트 네이버
		<%
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
		
		
		
		%>
		-----cgv 네이트 네이버
		<%
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
		%>
		<%request.setAttribute("str1",resultStr);%>
		<%request.setAttribute("str2",resultStr2);%>
		<%request.setAttribute("str3",resultStr3);%>
	</div>
 	
 	<table>
 		
 		<tr>
 			<td>1번기준</td>
 			<td>2번기준</td>
 			<td>3번기준</td>
 		</tr>
 		
 		<tr>
	 		<td>
	 	 	<c:forEach var ="item1" items="${str1}">
	 	 		${item1}
	 	 		<br>
	 		</c:forEach>
	 		</td>	
	 		
	 		<td>
	 	 	<c:forEach var ="item2" items="${str2}">
	 	 		${item2}
	 	 		<br>
	 		</c:forEach>
	 		</td>	
	 		
	 		<td>
	 	 	<c:forEach var ="item3" items="${str3}">
	 	 		${item3}
	 	 		<br>
	 		</c:forEach>
	 		</td>	
 		</tr>
 		
 		
 	
 	
 	</table>
</body>
</html>
