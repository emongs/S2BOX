package api;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;
import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;

public class MovieFinderAPI {

	private static String key = "38e898b06cb3206147d1ac2b5b20daa7";
	private static KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);

	public static void main(String[] args) throws OpenAPIFault, Exception {
		movieChart();
	}

	public static HashMap<String, ArrayList<String>> searchMovie_MovieNmAndDirectorNm(String name, String findType,
			String[] genreArr, String[] nationArr, String startYear, String endYear) throws OpenAPIFault, Exception {
		// 영화이름과 감독이름으로 영화 정보를 찾는다. (api 사용)
		// 
		
		System.out.println("=========searchMovie_MovieNmAndDirectorNm use getPeopleList");
		/*
		 * not choose genre and nation parameter name : director name or movie
		 * name findType : checking name that is a directorNm or movieNm
		 * findType : 1 => movieNm, 3 => directorNm
		 */

		
		
		String curPage = "1";
		String itemPerPage = "100";
		String movieNm = "";
		String directorNm = "";
		String openStartDt = "";
		String openEndDt = "";
		String prdtStartYear = startYear; //제작시작 년도
		String prdtEndYear = endYear; //제작끝 년도
		String repNationCd = "";
		String[] movieTypeCd = null;
		
		

		HashMap<String, ArrayList<String>> movieListMap = new HashMap();
		ArrayList<String> movieNmArr = new ArrayList();
		ArrayList<String> movieCdArr = new ArrayList();
		ArrayList<String> openDtArr = new ArrayList();
		
		
		ArrayList<String> movieCdAnd = new ArrayList<String>();
		ArrayList<String> movieNmAnd = new ArrayList<String>();
		ArrayList<String> openDtAnd = new ArrayList<String>();

		SimpleDateFormat dateFmt = new SimpleDateFormat("yyyy년 MM월 dd일");

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyyMMdd");

		if (findType.equals("1")) {
			movieNm = name;
		} else if (findType.equals("3")) {
			directorNm = name;
		}

		String showMovieList = service.getMovieList(true, curPage, itemPerPage, movieNm, directorNm, openStartDt,
				openEndDt, prdtStartYear, prdtEndYear, repNationCd, movieTypeCd);

		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> showMovieListResult = mapper.readValue(showMovieList, HashMap.class);
		System.out.println("===showMovieListResult : " + showMovieListResult);
		Object movieInfoResultObj = showMovieListResult.get("movieListResult");
		System.out.println(movieInfoResultObj);

		String movieInfoResultObj_StrToJsonFormat = mapper.writeValueAsString(movieInfoResultObj); // kkk는
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonMovieListResult = (JSONObject) jsonParser.parse(movieInfoResultObj_StrToJsonFormat);
		JSONArray movieList = (JSONArray) jsonMovieListResult.get("movieList");

		System.out.println("aaa : "  + movieList);
		for (int i = 0; i < movieList.size(); i++) {
			JSONObject obj = (JSONObject) movieList.get(i);
			//System.out.println("obj : " + obj);
			if (((String) obj.get("movieNmEn")).equals("Package Screening")) {
				continue;
			}
			
			String openDateStr = null;
			int year = 0;
			if (obj.get("openDt").equals("")) {
				openDateStr = "";
			} else {
				String from = (String) (obj.get("openDt"));
				Date to = transFormat.parse(from);
				openDateStr = dateFmt.format(to);
				//System.out.println("date : " + openDateStr);
			}
			
			if(nationArr == null && genreArr == null) {
				/*System.out.println("여기 안감?");
				System.out.println("name : " + (String) obj.get("movieNm"));
				System.out.println("code : " + (String) obj.get("movieCd"));
				System.out.println("date : " + openDateStr);*/
				movieNmArr.add((String) obj.get("movieNm"));
				movieCdArr.add((String) obj.get("movieCd"));
				openDtArr.add(openDateStr);
			}
			

			if (genreArr != null) {
				for (int k = 0; k < genreArr.length; k++) {
					
					//System.out.println("넘어온장르 : " + genreArr[k]);
					if (((String) obj.get("genreAlt")).contains(genreArr[k])) {
						
						System.out.println("장르 : " + obj.get("genreAlt"));
						
						
						movieNmArr.add((String) obj.get("movieNm"));
						movieCdArr.add((String) obj.get("movieCd"));
						openDtArr.add(openDateStr);
						break;
					}
				}
			}
			
			if (nationArr != null) {
				for (int k = 0; k < nationArr.length; k++) {
					if (((String) obj.get("nationAlt")).equals(nationArr[k])) {

						if(movieNmArr.contains((String) obj.get("movieNm"))) {
							break;
						} else {
							movieNmArr.add((String) obj.get("movieNm"));
							movieCdArr.add((String) obj.get("movieCd"));
							openDtArr.add(openDateStr);
						}
					}
				}
			}
		}

		movieListMap.put("movieNm", movieNmArr);
		movieListMap.put("movieCd", movieCdArr);
		movieListMap.put("openDt", openDtArr);
		System.out.println("size : " + movieListMap.get("movieNm").size());

		for(int i = 0 ; i < movieListMap.get("movieNm").size() ; i++) {
			System.out.println(movieListMap.get("movieNm").get(i));
		}
		return movieListMap;
	}

	public static ArrayList<String> searchMovie_ActorNmToActorCd(String peopleName) throws OpenAPIFault, Exception {
		//배우 이름으로 검색시 이름을 배우코드로 변환시켜줌. 영화코드도 같이 출력
		//
		
		System.out.println("=========searchMovie_ActorNm use getPeopleList");
		String curPage = "1";
		String itemPerPage = "100";
		String peopleNm = peopleName;
		String filmoNames = "";

		ArrayList<String> peopleCdListRes = new ArrayList();

		String searchPeopleResponse = service.getPeopleList(true, curPage, itemPerPage, peopleNm, filmoNames);
		// System.out.println("===searchPeopleResponse : " +
		// searchPeopleResponse);

		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> peopleInfo = mapper.readValue(searchPeopleResponse, HashMap.class);
		// 그 결과를 HashMap에 저장

		Object peopleListResult = peopleInfo.get("peopleListResult");
		// 키값이 poepleListResult인 객체를 따로 저장
		String peopleListResult_StrToJsonFormat = mapper.writeValueAsString(peopleListResult); // kkk는
																								// PeopleListResult를
																								// json형식으로
																								// 담아놓은
																								// String
		// System.out.println("peopleListResult_StrToJsonFormat : " +
		// peopleListResult_StrToJsonFormat);

		JSONParser jsonParser = new JSONParser();
		JSONObject jsonPeopleListResult = (JSONObject) jsonParser.parse(peopleListResult_StrToJsonFormat);
		// json 형식으로 담아놓은 String을 다시 Json형식으로 parsing

		// json형식에서 원하는배열을 추출 (peopleList)
		JSONArray peopleList = (JSONArray) jsonPeopleListResult.get("peopleList");

		// ***********************************************
		// peopleCdList.get("repRoleNm") => "배우"
		// ***********************************************
		for (int i = 0; i < peopleList.size(); i++) {
			JSONObject peopleCdList = (JSONObject) peopleList.get(i);
			
			if(((String)peopleCdList.get("repRoleNm")).equals("배우")) {
				// peopleList에서 나온 각각의 object를 담는 JSONObject를 추출
				peopleCdListRes.add((String) peopleCdList.get("peopleCd"));
			}
		}

		return peopleCdListRes;

	}

	public static HashMap<String, ArrayList<String>> searchMovie_ActorCdToMovie(
			ArrayList<String> peopleCdList, String[] genreArrParam,
			String[] nationArrParam, String[] gradeArrParam, String startYear,
			String endYear) throws OpenAPIFault, Exception {

		// 배우코드로 배우가 참여한 영화 검색.

		HashMap<String, ArrayList<String>> resMap = new HashMap<String, ArrayList<String>>();

		ArrayList<String> movieCd = new ArrayList<String>();
		ArrayList<String> movieNm = new ArrayList<String>();
		ArrayList<String> openDtArr = new ArrayList<String>();
		ArrayList<String> gradeArr = new ArrayList<String>();
		ArrayList<String> prdtYear = new ArrayList<String>(); // 제작년도만 나온거

		SimpleDateFormat dateFmt = new SimpleDateFormat("yyyy년 MM월 dd일");

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyyMMdd");

		System.out.println("제작시작 : " + startYear);
		System.out.println("제작끝 : " + endYear);

		String[] genreArr = genreArrParam; // 파라미터
		String[] gradeParam = gradeArrParam; // 파라미터
		String[] nationArr = nationArrParam; // 파라미터
		System.out
				.println("=========searchMovie_ActorCdToMovie use getPeopleInfo");
		// 검색한 사람의 영화코드, 영화이름, peopleCd 전달해줌.

		ArrayList<String> resList = new ArrayList<String>();

		ArrayList<String> movieCdFilterStartYear = new ArrayList<String>();
		ArrayList<String> movieNmFilterStartYear = new ArrayList<String>();
		ArrayList<String> openDtFilterStartYear = new ArrayList<String>();
		ArrayList<String> prdtFilterStartYear = new ArrayList<String>();
		ArrayList<String> gradeFilterStartYear = new ArrayList<String>();

		ArrayList<String> movieCdFilterEndYear = new ArrayList<String>();
		ArrayList<String> movieNmFilterEndYear = new ArrayList<String>();
		ArrayList<String> openDtFilterEndYear = new ArrayList<String>();
		ArrayList<String> prdtFilterEndYear = new ArrayList<String>();
		ArrayList<String> gradeFilterEndYear = new ArrayList<String>();

		ArrayList<String> movieCdFilterYear = new ArrayList<String>(); // 사잇값의
																		// 유무
																		// ex)
																		// 2009년~2012년사이
		ArrayList<String> movieNmFilterYear = new ArrayList<String>(); // 사잇값의
																		// 유무
		ArrayList<String> openDtFilterYear = new ArrayList<String>(); // 사잇값의 유무
		ArrayList<String> prdtFilterYear = new ArrayList<String>(); // 사잇값의 유무
		ArrayList<String> gradeFilterYear = new ArrayList<String>(); // 사잇값의 유무

		ArrayList<String> movieCdFilterGenre = new ArrayList<String>();
		ArrayList<String> movieNmFilterGenre = new ArrayList<String>();
		ArrayList<String> openDtFilterGenre = new ArrayList<String>();
		ArrayList<String> prdtFilterGenre = new ArrayList<String>();
		ArrayList<String> gradeFilterGenre = new ArrayList<String>();

		ArrayList<String> movieCdFilterNation = new ArrayList<String>();
		ArrayList<String> movieNmFilterNation = new ArrayList<String>();
		ArrayList<String> openDtFilterNation = new ArrayList<String>();
		ArrayList<String> prdtFilterNation = new ArrayList<String>();
		ArrayList<String> gradeFilterNation = new ArrayList<String>();

		ArrayList<String> movieCdFilterGrade = new ArrayList<String>();
		ArrayList<String> movieNmFilterGrade = new ArrayList<String>();
		ArrayList<String> openDtFilterGrade = new ArrayList<String>();
		ArrayList<String> prdtFilterGrade = new ArrayList<String>();
		ArrayList<String> gradeFilterGrade = new ArrayList<String>();

		System.out.println("peopleCdList (동명이인이 몇명일까? 배우 : "
				+ peopleCdList.size());

		for (int i = 0; i < peopleCdList.size(); i++) {

			String peopleInfoResponse = service.getPeopleInfo(true,
					peopleCdList.get(i));
			ObjectMapper mapper = new ObjectMapper();
			HashMap<String, Object> peopleDetailInfo = mapper.readValue(
					peopleInfoResponse, HashMap.class);

			Object peopleDetailResult = peopleDetailInfo
					.get("peopleInfoResult");
			// 키값이 poepleListResult인 객체를 따로 저장
			String peopleDetailResult_StrToJsonFormat = mapper
					.writeValueAsString(peopleDetailResult); // kkk는
																// String
			// System.out.println("peopleListResult_StrToJsonFormat : " +
			// peopleDetailResult_StrToJsonFormat);

			JSONParser jsonParser = new JSONParser();
			JSONObject jsonPeopleDetailResult = (JSONObject) jsonParser
					.parse(peopleDetailResult_StrToJsonFormat);
			// json 형식으로 담아놓은 String을 다시 Json형식으로 parsing

			// System.out.println();
			// json형식에서 원하는배열을 추출 (peopleList)
			// System.out.println("456"+jsonPeopleDetailResult);
			// System.out.println();
			JSONObject peopleInfoObject = (JSONObject) jsonPeopleDetailResult
					.get("peopleInfo");
			JSONArray filmosList = (JSONArray) peopleInfoObject.get("filmos");
			// filmosList는 filmos의 배열
			// filmosList에서 하나씩 접근을 해야함
			// filmos리스트를

			HashMap<String, ArrayList<String>> movieInfoMap;
			ArrayList<String> genre = new ArrayList<String>(); // 메소드 실행후 저장된 장르
			ArrayList<String> nations = new ArrayList<String>(); // 메소드 실행후 저장된
																	// 국가
			ArrayList<String> grade = new ArrayList<String>(); // 메소드 실행후 저장된 등급
			ArrayList<String> openDt = new ArrayList<String>(); // 메소드 실행후 저장된
																// 등급

			// /////////////////////////////// 필터를 거친 값들

			int prdtInt = 0;

			System.out.println("한 배우가 출연한 작품 수 : " + filmosList.size());
			System.out.println("/////////////////////////////");

			for (int j = 0; j < filmosList.size(); j++) {
				// System.out.println(peopleCdList.get(i));
				JSONObject resFilmo = (JSONObject) filmosList.get(j);
				System.out.println();
				if (((String) resFilmo.get("moviePartNm")).equals("배우")) {
					movieInfoMap = movieDetail_Basic((String) resFilmo
							.get("movieCd"));

					prdtInt = Integer.parseInt(movieInfoMap.get("prdtYear")
							.get(0));
					genre = movieInfoMap.get("genres");
					nations = movieInfoMap.get("nations");
					openDt = movieInfoMap.get("openDt");
					grade = movieInfoMap.get("grade");

					System.out.println("gradecc : " + grade);

					movieCd.add((String) resFilmo.get("movieCd"));
					movieNm.add((String) resFilmo.get("movieNm"));
					openDtArr.add(openDt.get(0));
					prdtYear.add(movieInfoMap.get("prdtYear").get(0));
					gradeArr.add(movieInfoMap.get("grade").get(0));

					System.out.println("asd : "
							+ movieInfoMap.get("grade").get(0));
					System.out.println("제작년도 : "
							+ movieInfoMap.get("prdtYear").get(0));
					// grade = movieInfoMap.get("grade");

					System.out.println("처음에 그냥 담아오기");
					System.out.println("movieCd : " + movieCd);
					System.out.println("movieNm : " + movieNm);
					System.out.println("openDtArr : " + openDtArr);
					System.out.println("prdtYear : " + prdtYear);
					System.out.println("gradeArr : " + gradeArr);

					if (!startYear.equals("") && endYear.equals("")) {
						System.out.println("들어옴?");
						// 입력한 제작시작년도보다 영화의 제작년도가 크면 들어아야함.
						if (Integer.parseInt(startYear) <= prdtInt) {
							System.out
									.println("입력한 제작시작년도보다 영화의 제작년도가 크면 들어아야함. ");
							movieCdFilterStartYear.add((String) resFilmo
									.get("movieCd"));
							movieNmFilterStartYear.add((String) resFilmo
									.get("movieNm"));
							openDtFilterStartYear.add((String) resFilmo
									.get("openDt"));
							prdtFilterStartYear.add(movieInfoMap
									.get("prdtYear").get(0));
							gradeFilterStartYear.add(movieInfoMap.get("grade")
									.get(0));
							System.out.println("시작년도 해당할때 결과");
							System.out.println("movieCdFilterStartYear : "
									+ movieCdFilterStartYear);
							System.out.println("movieNmFilterStartYear : "
									+ movieNmFilterStartYear);
							System.out.println("openDtFilterStartYear : "
									+ openDtFilterStartYear);
							System.out.println("prdtFilterStartYear : "
									+ prdtFilterStartYear);
							System.out.println("gradeFilterStartYear : "
									+ gradeFilterStartYear);

							movieCd.retainAll(movieCdFilterStartYear);
							movieNm.retainAll(movieNmFilterStartYear);
							openDtArr.retainAll(openDtFilterStartYear);
							prdtYear.retainAll(prdtFilterStartYear);
							gradeArr.retainAll(gradeFilterStartYear);

						}
					} else if (!endYear.equals("") && startYear.equals("")) {
						if (Integer.parseInt(endYear) >= prdtInt) {
							movieCdFilterEndYear.add((String) resFilmo
									.get("movieCd"));
							movieNmFilterEndYear.add((String) resFilmo
									.get("movieNm"));
							openDtFilterEndYear.add((String) resFilmo
									.get("openDt"));
							prdtFilterEndYear.add(movieInfoMap.get("prdtYear")
									.get(0));
							gradeFilterEndYear.add(movieInfoMap.get("grade")
									.get(0));

							System.out.println("끝년도 해당할때 결과");
							System.out.println("movieCdFilterEndYear : "
									+ movieCdFilterEndYear);
							System.out.println("movieNmFilterEndYear : "
									+ movieNmFilterEndYear);
							System.out.println("openDtFilterEndYear : "
									+ openDtFilterEndYear);
							System.out.println("gradeFilterEndYear : "
									+ gradeFilterEndYear);
							System.out.println("prdtFilterEndYear : "
									+ prdtFilterEndYear);

							movieCd.retainAll(movieCdFilterEndYear);
							movieNm.retainAll(movieNmFilterEndYear);
							openDtArr.retainAll(openDtFilterEndYear);
							prdtYear.retainAll(prdtFilterEndYear);
							gradeArr.retainAll(gradeFilterEndYear);
						}
					} else if (!endYear.equals("") && !startYear.equals("")) {

						System.out.print("시작년도 : ");
						System.out
								.println(Integer.parseInt(endYear) >= prdtInt);
						System.out.print("끝년도 : ");
						System.out
								.println(Integer.parseInt(startYear) <= prdtInt);
						if (Integer.parseInt(endYear) >= prdtInt
								&& Integer.parseInt(startYear) <= prdtInt) {
							movieCdFilterYear.add((String) resFilmo
									.get("movieCd"));
							movieNmFilterYear.add((String) resFilmo
									.get("movieNm"));
							openDtFilterYear.add((String) resFilmo
									.get("openDt"));
							prdtFilterYear.add(movieInfoMap.get("prdtYear")
									.get(0));
							gradeFilterYear.add(movieInfoMap.get("grade")
									.get(0));

							System.out.println("시작~끝 해당할때 결과");
							System.out.println("movieCdFilterYear : "
									+ movieCdFilterYear);
							System.out.println("movieNmFilterYear : "
									+ movieNmFilterYear);
							System.out.println("openDtFilterYear : "
									+ openDtFilterYear);
							System.out.println("prdtFilterYear : "
									+ prdtFilterYear);
							System.out.println("gradeFilterYear : "
									+ gradeFilterYear);

							movieCd.retainAll(movieCdFilterYear);
							movieNm.retainAll(movieNmFilterYear);
							openDtArr.retainAll(openDtFilterYear);
							prdtYear.retainAll(prdtFilterYear);
							gradeArr.retainAll(gradeFilterYear);

						} else {
							System.out.println("안들어와?");
							movieCd.remove(movieCd.size() - 1);
							movieNm.remove(movieNm.size() - 1);
							openDtArr.remove(openDtArr.size() - 1);
							prdtYear.remove(prdtYear.size() - 1);
							gradeArr.remove(gradeArr.size() - 1);
						}
					}

					if (genreArr != null) {
						for (int k = 0; k < genre.size(); k++) {
							for (int g = 0; g < genreArr.length; g++) {
								if (genreArr[g].contains(genre.get(k))) {
									System.out.println("1235");

									movieCdFilterGenre.add((String) resFilmo
											.get("movieCd"));
									movieNmFilterGenre.add((String) resFilmo
											.get("movieNm"));
									openDtFilterGenre.add((String) resFilmo
											.get("openDt"));
									prdtFilterGenre.add(movieInfoMap.get(
											"prdtYear").get(0));
									gradeFilterGenre.add(movieInfoMap.get(
											"grade").get(0));

									System.out.println("장르 해당할때 결과");
									System.out.println("movieCdFilterGenre : "
											+ movieCdFilterGenre);
									System.out.println("movieNmFilterGenre : "
											+ movieNmFilterGenre);
									System.out.println("openDtFilterGenre : "
											+ openDtFilterGenre);
									System.out.println("prdtFilterGenre : "
											+ prdtFilterGenre);
									System.out.println("gradeFilterGenre : "
											+ gradeFilterGenre);

									movieCd.retainAll(movieCdFilterGenre);
									movieNm.retainAll(movieNmFilterGenre);
									openDtArr.retainAll(openDtFilterGenre);
									gradeArr.retainAll(gradeFilterGenre);
									prdtYear.retainAll(prdtFilterGenre);
								}
							}
						}
					}

					if (gradeParam != null) {
						for (int k = 0; k < grade.size(); k++) {
							for (int g = 0; g < gradeParam.length; g++) {
								if (gradeParam[g].contains(grade.get(k))) {
									System.out.println("grade");

									movieCdFilterGrade.add((String) resFilmo
											.get("movieCd"));
									movieNmFilterGrade.add((String) resFilmo
											.get("movieNm"));
									openDtFilterGrade.add((String) resFilmo
											.get("openDt"));
									prdtFilterGrade.add(movieInfoMap.get(
											"prdtYear").get(0));
									gradeFilterGrade.add(movieInfoMap.get(
											"grade").get(0));

									System.out.println("등급 해당할때 결과");
									System.out.println("movieCdFilterGrade : "
											+ movieCdFilterGrade);
									System.out.println("movieNmFilterGrade : "
											+ movieNmFilterGrade);
									System.out.println("openDtFilterGrade : "
											+ openDtFilterGrade);
									System.out.println("prdtFilterGrade : "
											+ prdtFilterGrade);
									System.out.println("gradeFilterGrade : "
											+ gradeFilterGrade);

									movieCd.retainAll(movieCdFilterGrade);
									movieNm.retainAll(movieNmFilterGrade);
									openDtArr.retainAll(openDtFilterGrade);
									gradeArr.retainAll(gradeFilterGrade);
									prdtYear.retainAll(prdtFilterGrade);
								}
							}
						}
					}

					if (nationArr != null) {
						for (int k = 0; k < nations.size(); k++) {
							for (int g = 0; g < nationArr.length; g++) {
								if (nationArr[g].equals(nations.get(k))) {
									// 중복된것만 가지고 가자
									System.out.println("잡앗따요놈");
									if (movieCd.contains((String) resFilmo
											.get("movieCd"))) {

										movieCdFilterNation
												.add((String) resFilmo
														.get("movieCd"));
										movieNmFilterNation
												.add((String) resFilmo
														.get("movieNm"));
										openDtFilterNation
												.add((String) resFilmo
														.get("openDt"));
										prdtFilterNation.add(movieInfoMap.get(
												"prdtYear").get(0));
										gradeFilterNation.add(movieInfoMap.get(
												"grade").get(0));

										System.out.println("국가 해당할때 결과");
										System.out
												.println("movieCdFilterNation : "
														+ movieCdFilterNation);
										System.out
												.println("movieNmFilterNation : "
														+ movieNmFilterNation);
										System.out
												.println("openDtFilterNation : "
														+ openDtFilterNation);
										System.out
												.println("prdtFilterNation : "
														+ prdtFilterNation);
										System.out
												.println("gradeFilterNation : "
														+ gradeFilterNation);

										movieCd.retainAll(movieCdFilterNation);
										movieNm.retainAll(movieNmFilterNation);
										openDtArr.retainAll(openDtFilterNation);
										prdtYear.retainAll(prdtFilterNation);
										gradeArr.retainAll(gradeFilterNation);

									}
								}
							}
						}
					}
				}

				/*
				 * movieCd.retainAll(movieCdFilterEndYear);
				 * movieCd.retainAll(movieCdFilterStartYear);
				 * movieCd.retainAll(movieCdFilterGenre);
				 * movieCd.retainAll(movieCdFilterNation);
				 * 
				 * movieNm.retainAll(movieNmFilterEndYear);
				 * movieNm.retainAll(movieNmFilterStartYear);
				 * movieNm.retainAll(movieNmFilterNation);
				 * movieNm.retainAll(movieNmFilterGenre);
				 * 
				 * 
				 * openDtArr.retainAll(openDtFilterEndYear);
				 * openDtArr.retainAll(openDtFilterStartYear);
				 * openDtArr.retainAll(openDtFilterGenre);
				 * openDtArr.retainAll(openDtFilterNation);
				 * 
				 * prdtYear.retainAll(prdtFilterEndYear);
				 * prdtYear.retainAll(prdtFilterStartYear);
				 * prdtYear.retainAll(prdtFilterGenre);
				 * prdtYear.retainAll(prdtFilterNation);
				 * 
				 * 
				 * //클리어해보자 movieCdAnd.clear(); movieNmAnd.clear();
				 * openDtAnd.clear(); prdtAnd.clear();
				 */

				System.out.println("나름 중복처리해준거... 담아오기");
				System.out.println("movieCd : " + movieCd);
				System.out.println("movieNm : " + movieNm);
				System.out.println("openDtArr : " + openDtArr);
				System.out.println("gradeArr : " + gradeArr);
				System.out.println("prdtYear : " + prdtYear);

				// System.out.println("aaA :" + resList.size());

			}

		}
		resMap.put("movieNm", movieNm);
		resMap.put("movieCd", movieCd);
		resMap.put("openDt", openDtArr);
		resMap.put("prdtYear", prdtYear);
		resMap.put("grade", gradeArr);

		return resMap;
	}

	public static HashMap<String, ArrayList<String>> movieDetail_Basic(String movieCode) throws OpenAPIFault, Exception {
		
		System.out.println("=========movieDetail_Basic use getMovieInfo");
		//리턴타입에 들어가있는 속성들 (영화 하나에 대한)
		/*
		 * key : movieNms / values : movieNm, movieNmEn
		 * key : directors / values : 감독들이름
		 * key : actors / values : 배우이름들 
		 * key : genres / values : 장르들 
		 * key : grade  / values : 등급
		 * key : nations  / values : 참여국가 
		 * key : genres / values : 장르들 
		 * key : openDt / value : 개봉일
		 * key : showTm / value : 상영시간
		 * 사용방법
		 * map.get("movieNms").get(idx)
		 * 
		 */
		
		//String movieCd = request.getParameter("movieCd");
		String movieCd = movieCode;
		String movieInfoResponse = 
				service.getMovieInfo(true, movieCd);
		
		
		
		System.out.println("===showResponseTTT : " + movieInfoResponse);
		ObjectMapper mapper = new ObjectMapper();
		
		HashMap<String,Object> showMovieInfoResult = mapper.readValue(movieInfoResponse, HashMap.class);
		//System.out.println("showMovieInfoResult : " +showMovieInfoResult);
		Object movieInfoResultObj = showMovieInfoResult.get("movieInfoResult");
		//System.out.println("movieInfoResultObj : " +movieInfoResultObj);
		
		String movieInfoResultObj_StrToJsonFormat = mapper.writeValueAsString(movieInfoResultObj);
		//System.out.println("movieInfoResultObj_StrToJsonFormat : " + movieInfoResultObj_StrToJsonFormat);
		
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonMovieInfoResult = (JSONObject) jsonParser.parse(movieInfoResultObj_StrToJsonFormat);
		//System.out.println("jsonMovieInfoResult : " + jsonMovieInfoResult);
		JSONObject movieInfoObj = (JSONObject) jsonMovieInfoResult.get("movieInfo");
		
		
		JSONArray directorsJsonArr = (JSONArray) movieInfoObj.get("directors");
		JSONArray actorsJsonArr = (JSONArray) movieInfoObj.get("actors"); 
		JSONArray genresJsonArr = (JSONArray) movieInfoObj.get("genres");
		JSONArray auditsJsonArr = (JSONArray) movieInfoObj.get("audits");
		JSONArray nationsJsonArr = (JSONArray) movieInfoObj.get("nations");

		//JSONObject predYearO = (JSONObject) movieInfoObj.get("prdtYear");
		
		
		HashMap<String, ArrayList<String>> movieInfoMap = new HashMap();
		ArrayList<String> genres = new ArrayList();
		ArrayList<String> grade = new ArrayList();
		ArrayList<String> nations = new ArrayList();
		ArrayList<String> openDt = new ArrayList();
		ArrayList<String> prdtYear = new ArrayList();
		
		SimpleDateFormat dateFmt = new SimpleDateFormat("yyyy년 MM월 dd일");
		
		
		
		
		prdtYear.add((String) movieInfoObj.get("prdtYear"));

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyyMMdd");
		//String openDateStr = dateFmt.format(to);
		
		
		String openDateStr = null;
		
		if(movieInfoObj.get("openDt").equals("")) {
			openDateStr = "";
		} else {
			String from = (String)(movieInfoObj.get("openDt"));
			Date to = transFormat.parse(from);
			openDateStr = dateFmt.format(to);
		}

		//System.out.println("+dddd" + (String)(movieInfoObj.get("openDt")));
		
		openDt.add(openDateStr);
		
		for(int i = 0 ; i < genresJsonArr.size() ; i++) {
			JSONObject genresObj = (JSONObject) genresJsonArr.get(i);
			genres.add((String) genresObj.get("genreNm"));
			System.out.println("genre : " + genresObj.get("genreNm"));
		}
		
		if(auditsJsonArr.size() != 0) {
		JSONObject auditsObj = (JSONObject) auditsJsonArr.get(0);
		grade.add((String)auditsObj.get("watchGradeNm"));
		System.out.println("grade : " + ((String)auditsObj.get("watchGradeNm")));
		} else {
		grade.add("미정");	
		}
		for(int i = 0 ; i < nationsJsonArr.size() ; i++) {
			JSONObject nationsObj = (JSONObject) nationsJsonArr.get(i);
			nations.add((String)nationsObj.get("nationNm"));
			System.out.println("nation : " + nationsObj.get("nationNm"));
		}
		
		movieInfoMap.put("genres", genres);
		movieInfoMap.put("grade", grade);
		movieInfoMap.put("nations", nations);
		movieInfoMap.put("openDt", openDt);
		movieInfoMap.put("prdtYear", prdtYear);
		
		
		
		for(int i = 0 ; i < movieInfoMap.get("genres").size() ; i++) {
			System.out.println(movieInfoMap.get("genres").get(i));
		}
		
		
		String codeResponse = service.getComCodeList(true, "01050000000");
		
		
		HashMap<String,Object> codeResult = mapper.readValue(codeResponse, HashMap.class);
		
		return movieInfoMap;
	}

	public static HashMap<String, ArrayList<String>> movieDetail(String movieCode) throws OpenAPIFault, Exception {
		
		System.out.println("=========movieDetail use getMovieInfo");
		//리턴타입에 들어가있는 속성들
		/*
		 * key : movieNms / values : movieNm, movieNmEn
		 * key : directors / values : 감독들이름
		 * key : actors / values : 배우이름들 
		 * key : genres / values : 장르들 
		 * key : grade  / values : 등급
		 * key :  nations  / values : 참여국가 
		 * key : genres / values : 장르들 
		 * key : openDt / value : 개봉일
		 * key : showTm / value : 상영시간
		 * 사용방법
		 * map.get("movieNms").get(idx)
		 * 
		 */
		
		//String movieCd = request.getParameter("movieCd");
		String movieCd = movieCode;
		String movieInfoResponse = 
				service.getMovieInfo(true, movieCd);
		
		
		
		System.out.println("===showResponseTTT : " + movieInfoResponse);
		ObjectMapper mapper = new ObjectMapper();
		
		HashMap<String,Object> showMovieInfoResult = mapper.readValue(movieInfoResponse, HashMap.class);
		//System.out.println("showMovieInfoResult : " +showMovieInfoResult);
		Object movieInfoResultObj = showMovieInfoResult.get("movieInfoResult");
		//System.out.println("movieInfoResultObj : " +movieInfoResultObj);
		
		String movieInfoResultObj_StrToJsonFormat = mapper.writeValueAsString(movieInfoResultObj);
		//System.out.println("movieInfoResultObj_StrToJsonFormat : " + movieInfoResultObj_StrToJsonFormat);
		
		JSONParser jsonParser = new JSONParser();
		JSONObject jsonMovieInfoResult = (JSONObject) jsonParser.parse(movieInfoResultObj_StrToJsonFormat);
		//System.out.println("jsonMovieInfoResult : " + jsonMovieInfoResult);
		JSONObject movieInfoObj = (JSONObject) jsonMovieInfoResult.get("movieInfo");
		
		
		JSONArray directorsJsonArr = (JSONArray) movieInfoObj.get("directors");
		JSONArray actorsJsonArr = (JSONArray) movieInfoObj.get("actors"); ;
		JSONArray genresJsonArr = (JSONArray) movieInfoObj.get("genres");;
		JSONArray auditsJsonArr = (JSONArray) movieInfoObj.get("audits");;
		JSONArray nationsJsonArr = (JSONArray) movieInfoObj.get("nations");;
		
		
		HashMap<String, ArrayList<String>> movieInfoMap = new HashMap();
		ArrayList<String> directors = new ArrayList();
		ArrayList<String> actors = new ArrayList();
		ArrayList<String> genres = new ArrayList();
		ArrayList<String> grade = new ArrayList();
		ArrayList<String> nations = new ArrayList();
		ArrayList<String> movieNms = new ArrayList();
		ArrayList<String> openDt = new ArrayList();
		ArrayList<String> showTm = new ArrayList();
		ArrayList<String> peopleCds = new ArrayList();
		ArrayList<String> directorCds = new ArrayList();
		
		SimpleDateFormat dateFmt = new SimpleDateFormat("yyyy년 MM월 dd일");
		
		
		

		SimpleDateFormat transFormat = new SimpleDateFormat("yyyyMMdd");
		//String openDateStr = dateFmt.format(to);
		
		
		String openDateStr = null;
		
		if(movieInfoObj.get("openDt").equals("")) {
			openDateStr = "";
		} else {
			String from = (String)(movieInfoObj.get("openDt"));
			Date to = transFormat.parse(from);
			openDateStr = dateFmt.format(to);
		}

		//System.out.println("+dddd" + (String)(movieInfoObj.get("openDt")));
		
		movieNms.add((String)(movieInfoObj.get("movieNm")));
		movieNms.add((String)(movieInfoObj.get("movieNmEn")));
		openDt.add(openDateStr);
		showTm.add((String)(movieInfoObj.get("showTm")));
		
		
		for(int i = 0 ; i < directorsJsonArr.size() ; i++) {
			JSONObject directorsObj = (JSONObject) directorsJsonArr.get(i);
			directors.add((String) directorsObj.get("peopleNm"));
		}
		
		System.out.println("actors Num : " + actorsJsonArr.size());
		
		int actorSize = actorsJsonArr.size();
		
		if(actorSize < 5) {
			for(int i = 0 ; i < actorSize ; i++) { // 배우가 5명 미만이면 사이즈 그대로
				JSONObject actorsObj = (JSONObject) actorsJsonArr.get(i);
				System.out.println("aaa : " + ((String) actorsObj.get("peopleNm")));
				actors.add((String) actorsObj.get("peopleNm"));
			}
		} else {
			for(int i = 0 ; i < 5 ; i++) { // 배우는 5명까지만
				JSONObject actorsObj = (JSONObject) actorsJsonArr.get(i);
				System.out.println("aaa : " + ((String) actorsObj.get("peopleNm")));
				actors.add((String) actorsObj.get("peopleNm"));
			}
		}
		
		
	
		
		peopleCds = peopleNameListToPeopleCdList(actors);
		directorCds = peopleNameListToPeopleCdList(directors); 
		//HashMap<String, ArrayList<String>> directorCd = movieMatchPeople(directorCds, movieCd);
		
		
		/*
		for(int i = 0 ; i < directorCd.size() ; i++) {
			ArrayList<String> directorName = directorCd.get("movieNm");
			ArrayList<String> directorCode = directorCd.get("movieCd");
		}*/
		
		System.out.println("이름이 ㅁㅁㅁ인 배우와 감독인 수 : " + peopleCds.size());
		for(int i = 0 ; i < peopleCds.size() ; i++) {
			System.out.println(peopleCds.get(i)+ " 이름이 같은 영화인들의 수 중에 배우와 감독인 사람들의 이름코드");
		}
		
		//System.out.println(movieInfoObj.get("movieNmEn"));
		for(int i = 0 ; i < genresJsonArr.size() ; i++) {
			JSONObject genresObj = (JSONObject) genresJsonArr.get(i);
			genres.add((String) genresObj.get("genreNm"));
		}
		
		for(int i = 0 ; i < auditsJsonArr.size() ; i++) {
			JSONObject auditsObj = (JSONObject) auditsJsonArr.get(i);
			grade.add((String)auditsObj.get("watchGradeNm"));
		}
		
		for(int i = 0 ; i < nationsJsonArr.size() ; i++) {
			JSONObject nationsObj = (JSONObject) nationsJsonArr.get(i);
			nations.add((String)nationsObj.get("nationNm"));
		}
		
		
		movieInfoMap.put("movieNms", movieNms);
		movieInfoMap.put("directors", directors);
		movieInfoMap.put("actors", actors);
		movieInfoMap.put("genres", genres);
		movieInfoMap.put("grade", grade);
		movieInfoMap.put("nations", nations);
		movieInfoMap.put("openDt", openDt);
		movieInfoMap.put("showTm", showTm);
		movieInfoMap.put("peopleCds", peopleCds);
		movieInfoMap.put("directorCds", directorCds);
		
		
		
		String codeResponse = service.getComCodeList(true, "01050000000");
		
		
		HashMap<String,Object> codeResult = mapper.readValue(codeResponse, HashMap.class);
		
		return movieInfoMap;
	}

	public static ArrayList<String> peopleNameListToPeopleCdList(
			ArrayList<String> peopleNameList) throws OpenAPIFault, Exception {

		System.out
				.println("=========peopleNameListToPeopleCdList use getPeopleList");
		String curPage = "1";
		String itemPerPage = "100";
		String filmoNames = "";
		int idx = 0;

		ArrayList<String> peopleCdAL = new ArrayList<String>();

		for (int i = 0; i < peopleNameList.size(); i++) {

			String searchPeopleResponse = service.getPeopleList(true, curPage,
					itemPerPage, peopleNameList.get(i), filmoNames);
			ObjectMapper mapper = new ObjectMapper();
			HashMap<String, Object> peopleInfo = mapper.readValue(
					searchPeopleResponse, HashMap.class);
			Object peopleListResult = peopleInfo.get("peopleListResult");
			String peopleListResult_StrToJsonFormat = mapper
					.writeValueAsString(peopleListResult); // kkk는
			JSONParser jsonParser = new JSONParser();
			JSONObject jsonPeopleListResult = (JSONObject) jsonParser
					.parse(peopleListResult_StrToJsonFormat);
			JSONArray peopleList = (JSONArray) jsonPeopleListResult
					.get("peopleList");

			System.out.println(peopleList.size());
			for (int j = 0; j < peopleList.size(); j++) {
				JSONObject peopleCdList = (JSONObject) peopleList.get(j);
				// peopleList에서 나온 각각의 object를 담는 JSONObject를 추출
				if (((String) peopleCdList.get("repRoleNm")).equals("배우")
						|| ((String) peopleCdList.get("repRoleNm"))
								.equals("감독")) {
					peopleCdAL.add((String) peopleCdList.get("peopleCd"));
				}
			}
		}

		return peopleCdAL;

	}

	public static ArrayList<String> peopleNameToPeopleCd(String peopleName) throws OpenAPIFault, Exception {

		System.out.println("=========peopleNameToPeopleCd use getPeopleList");
		String curPage = "1";
		String itemPerPage = "100";
		String peopleNm = peopleName;
		String filmoNames = "";

		ArrayList<String> peopleCdListRes = new ArrayList();

		String searchPeopleResponse = service.getPeopleList(true, curPage, itemPerPage, peopleNm, filmoNames);
		// System.out.println("===searchPeopleResponse : " +
		// searchPeopleResponse);

		ObjectMapper mapper = new ObjectMapper();
		HashMap<String, Object> peopleInfo = mapper.readValue(searchPeopleResponse, HashMap.class);
		// 그 결과를 HashMap에 저장

		Object peopleListResult = peopleInfo.get("peopleListResult");
		// 키값이 poepleListResult인 객체를 따로 저장
		String peopleListResult_StrToJsonFormat = mapper.writeValueAsString(peopleListResult); // kkk는
																								// PeopleListResult를
																								// json형식으로
																								// 담아놓은
																								// String
		// System.out.println("peopleListResult_StrToJsonFormat : " +
		// peopleListResult_StrToJsonFormat);

		JSONParser jsonParser = new JSONParser();
		JSONObject jsonPeopleListResult = (JSONObject) jsonParser.parse(peopleListResult_StrToJsonFormat);
		// json 형식으로 담아놓은 String을 다시 Json형식으로 parsing

		// json형식에서 원하는배열을 추출 (peopleList)
		JSONArray peopleList = (JSONArray) jsonPeopleListResult.get("peopleList");

		// ***********************************************
		// peopleCdList.get("repRoleNm") => "배우", "감독" 이 사람들만 추가하기
		// ***********************************************
		for (int i = 0; i < peopleList.size(); i++) {
			JSONObject peopleCdList = (JSONObject) peopleList.get(i);
			// 배우로 들어왔는지 감독으로 들어왔는지 그냥 한번에 처리.
			if(((String) peopleCdList.get("repRoleNm")).equals("배우") || ((String) peopleCdList.get("repRoleNm")).equals("감독")) {
				// peopleList에서 나온 각각의 object를 담는 JSONObject를 추출
				peopleCdListRes.add((String) peopleCdList.get("peopleCd"));
			}
		}

		return peopleCdListRes;

	}

	public static HashMap<String, ArrayList<String>> movieMatchPeople(ArrayList<String> peopleCdList, String movieCode) throws OpenAPIFault, Exception {
		//영화 검색시 클릭하면 영화 상세정보가 나오고 영화 상세정보가 나왔을때
		//해당 배우 클릭하면 그 배우가 출연한 영화들을 보여 주는 페이지.
		System.out.println("=========movieMatchPeople use getPeopleInfo");
		
		List resMatchList = new ArrayList();
		ArrayList<String> movieCd = new ArrayList();
		ArrayList<String> movieNm = new ArrayList();
		HashMap<String, ArrayList<String>> movieMatchNameMap = new HashMap();

		for (int i = 0; i < peopleCdList.size(); i++) {

			String peopleInfoResponse = service.getPeopleInfo(true, peopleCdList.get(i));
			ObjectMapper mapper = new ObjectMapper();
			HashMap<String, Object> peopleDetailInfo = mapper.readValue(peopleInfoResponse, HashMap.class);

			Object peopleDetailResult = peopleDetailInfo.get("peopleInfoResult");
			// 키값이 poepleListResult인 객체를 따로 저장
			String peopleDetailResult_StrToJsonFormat = mapper.writeValueAsString(peopleDetailResult); // kkk는
																										// PeopleListResult를
																										// json형식으로
																										// 담아놓은
																										// String
			// System.out.println("peopleListResult_StrToJsonFormat : " +
			// peopleDetailResult_StrToJsonFormat);

			JSONParser jsonParser = new JSONParser();
			JSONObject jsonPeopleDetailResult = (JSONObject) jsonParser.parse(peopleDetailResult_StrToJsonFormat);
			// json 형식으로 담아놓은 String을 다시 Json형식으로 parsing

			// System.out.println();
			// json형식에서 원하는배열을 추출 (peopleList)
			// System.out.println("456"+jsonPeopleDetailResult);
			// System.out.println();
			JSONObject peopleInfoObject = (JSONObject) jsonPeopleDetailResult.get("peopleInfo");
			JSONArray filmosList = (JSONArray) peopleInfoObject.get("filmos");
			// 한 사람의 필모 전체를 받아오고 있음
			// 만약 이 사람의 필모 안에 파라미터의 영화가 있을 때 그 필모전체를 넘겨를 리턴값에 저장하기.
			System.out.println("hkhkh:" + filmosList.size());
			System.out.println("/////////////////////////////");

			for (int j = 0; j < filmosList.size(); j++) {
				
				// System.out.println(peopleCdList.get(i));
				JSONObject resFilmo = (JSONObject) filmosList.get(j);
				
				
				if(((String)resFilmo.get("movieCd")).equals(movieCode)) {
					System.out.println((String)resFilmo.get("movieCd"));
					resMatchList.add(filmosList);
					break;
				}
			}
		}
		
		System.out.println("resMatchList size : " + resMatchList.size());

		
		JSONArray aaa = (JSONArray) resMatchList.get(0);
		System.out.println(aaa);
		System.out.println("ggggggggggg" + aaa.size());
	
		//크기는 미리 정해주고 
		
		for(int i = 0 ; i < aaa.size() ; i++) {
			
			System.out.println("test"+i);
			JSONObject obj = (JSONObject) aaa.get(i);
			
			if (((String)obj.get("moviePartNm")).equals("감독") 
					|| ((String)obj.get("moviePartNm")).equals("배우")) {
				
				movieCd.add((String)obj.get("movieCd"));
				movieNm.add((String)obj.get("movieNm"));
			}
		}
		
		for(int i = 0 ; i < movieCd.size(); i++) {
			System.out.println("mc : " + movieCd.get(i));
			System.out.println("nm : " + movieNm.get(i));
		}
		
		movieMatchNameMap.put("movieCd", movieCd);
		movieMatchNameMap.put("movieNm", movieNm);
		return movieMatchNameMap;
	}

	public static HashMap<String, ArrayList<String>> movieChart() throws OpenAPIFault, Exception {
		
		SimpleDateFormat dateFmt = new SimpleDateFormat("yyyy년 MM월 dd일");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		SimpleDateFormat openDtsdf = new SimpleDateFormat("yyyy-MM-dd");

	    Calendar c1 = Calendar.getInstance();
	    c1.add(Calendar.DATE, -1);

		String targetDt = sdf.format(c1.getTime());
		String itemPerPage = "10";
		String multiMovieYn = "";
		String repNationCd = "";
		String wideAreaCd = "";
		
		HashMap<String, ArrayList<String>> movieChartMap = new HashMap();
		
		ArrayList<String> movieNmArr = new ArrayList();
		ArrayList<String> movieCdArr = new ArrayList();
		ArrayList<String> openDtArr = new ArrayList();

		KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);
		
		String dailyResponse = service.getDailyBoxOffice(true, targetDt,itemPerPage,multiMovieYn,repNationCd,wideAreaCd);
		System.out.println("===dailyResponse : " + dailyResponse);
		ObjectMapper mapper = new ObjectMapper();
		JSONParser jsonParser = new JSONParser();
		HashMap<String,Object> dailyResult = mapper.readValue(dailyResponse, HashMap.class);
		Object movieChartObj = dailyResult.get("boxOfficeResult");
		String movieChartObj_StrToJsonFormat = mapper.writeValueAsString(movieChartObj);
		JSONObject jsonMovieChart = (JSONObject) jsonParser.parse(movieChartObj_StrToJsonFormat);
		JSONArray movieChartArr = (JSONArray) jsonMovieChart.get("dailyBoxOfficeList");
		
		System.out.println("무비차트 : " + movieChartArr);
		
		for(int i = 0 ; i < movieChartArr.size() ; i++) {
			JSONObject obj = (JSONObject) movieChartArr.get(i);
				
				String openDateStr = null;
				
				if(obj.get("openDt").equals("")) {
					openDateStr = "";
				} else {
					String from = (String)(obj.get("openDt"));
					Date to = openDtsdf.parse(from);
					openDateStr = dateFmt.format(to);
				}
					
				movieNmArr.add((String)obj.get("movieNm"));
				movieCdArr.add((String)obj.get("movieCd"));
				openDtArr.add(openDateStr);
					
				}

		movieChartMap.put("movieNm", movieNmArr);
		movieChartMap.put("movieCd", movieCdArr);
		movieChartMap.put("openDt", openDtArr);
	
		
		return movieChartMap;
		
		
	}
}
