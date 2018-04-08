<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!-- ================극장 부분 입니다아아아아================================= -->

<div class="t4-1"><div>
			<img src="<%=request.getContextPath()%>/common/image/mainImage/2_1.png" height="25px" width="100%" 
			style=" position: relative; top: 0px; left: 0px; z-index: 1;"></div>
			<div class="t1_1_1" style="position: relative; top: -25px; left: 0px; z-index: 2;">극장</div></div>
			<div class="t4-2">
				<div>
				<div style="width: 90%;margin-left:5%; background-color: white; margin-top: 5px;
					margin-bottom: 5px; border:solid #e1e1e1;">
						<center>
							<button type="button" onclick="ShowTabex2('0')" style="width: 25%;">전체</button>
							<button type="button" onclick="ShowTabex2('1')" style="width: 38%;">아트하우스</button>
							<button type="button" onclick="ShowTabex2('2')" style="width: 30%;">특별관</button>
						</center>
					</div>
				</div>
			<div style="text-align: center; height: 300px; margin-top: 6px; margin-left: 6px;">
					<div id="tab2_0" style="width: 100%; display: block;">

						<div class="tt0" style="width: 45%; margin-top: 5px;">
							<center>
								<c:forEach var="article2" items="${articleList2}">
									<c:if test="${article2.local eq 'SU' }">
										<c:set var="sunum" value="${sunum+1}" />
									</c:if>
									<c:if test="${article2.local eq 'KK' }">
										<c:set var="kknum" value="${kknum+1}" />
									</c:if>
									<c:if test="${article2.local eq 'IC' }">
										<c:set var="icnum" value="${icnum+1}" />
									</c:if>
									<c:if test="${article2.local eq 'BS' }">
										<c:set var="bsnum" value="${bsnum+1}" />
									</c:if>
									<c:if test="${article2.local eq 'DK' }">
										<c:set var="dknum" value="${dknum+1}" />
									</c:if>
									<c:if test="${article2.local eq 'DJ' }">
										<c:set var="cnum" value="${cnum+1}" />
									</c:if>
									<c:if test="${article2.local eq 'US' }">
										<c:set var="bsnum" value="${bsnum+1}" />
									</c:if>
									<c:if test="${article2.local eq 'KJ' }">
										<c:set var="jnum" value="${jnum+1}" />
									</c:if>
									<c:if test="${article2.local eq 'CN' }">
										<c:set var="cnum" value="${cnum+1}" />
									</c:if>
									<c:if test="${article2.local eq 'CB' }">
										<c:set var="cnum" value="${cnum+1}" />
									</c:if>
									<c:if test="${article2.local eq 'KN' }">
										<c:set var="knum" value="${knum+1}" />
									</c:if>
									<c:if test="${article2.local eq 'KB' }">
										<c:set var="knum" value="${knum+1}" />
									</c:if>
									<c:if test="${article2.local eq 'JN' }">
										<c:set var="jnum" value="${jnum+1}" />
									</c:if>
									<c:if test="${article2.local eq 'JB' }">
										<c:set var="jnum" value="${jnum+1}" />
									</c:if>
									<c:if test="${article2.local eq 'JJ' }">
										<c:set var="jnum" value="${jnum+1}" />
									</c:if>
									<c:if test="${article2.local eq 'KW' }">
										<c:set var="kwnum" value="${kwnum+1}" />
									</c:if>
								</c:forEach>
								
								<button type="button" onclick="ShowTabex4('0')"
									style="width: 100%; height: 35px; font-size: 12px;">서울(${sunum})</button>
								<button type="button" onclick="ShowTabex4('1')"
									style="width: 100%; height: 35px; font-size: 12px;">경기(${kknum})</button>
								<button type="button" onclick="ShowTabex4('2')"
									style="width: 100%; height: 35px; font-size: 12px;">인천(${icnum})</button>
								<button type="button" onclick="ShowTabex4('3')"
									style="width: 100%; height: 35px; font-size: 12px;">강원(${kwnum})</button>
								<button type="button" onclick="ShowTabex4('4')"
									style="width: 100%; height: 35px; font-size: 12px;">대전/충청(${cnum})</button>
								<button type="button" onclick="ShowTabex4('5')"
									style="width: 100%; height: 35px; font-size: 12px;">대구(${dknum})</button>
								<button type="button" onclick="ShowTabex4('6')"
									style="width: 100%; height: 35px; font-size: 12px;">부산/울산(${bsnum})</button>
								<button type="button" onclick="ShowTabex4('7')"
									style="width: 100%; height: 35px; font-size: 12px;">경상(${knum})</button>
								<button type="button" onclick="ShowTabex4('8')"
									style="width: 100%; height: 35px; font-size: 12px;">광주/전라/제주(${jnum})</button>

							</center>

						</div>
						<div class="tt1" style="width: 50%; margin-left: 6px;">
							<div id="tab4_0"
								style="width: 100%; height: 100%; overflow-y: scroll;">
								<c:forEach var="article" items="${articleList2}">
									<c:if test="${article.local eq 'SU' }">
										<button type="button"
											onclick="clickTheaterName('${article.theater_name}')"
											style="width: 100%; height: 35px; font-size: 12px;">${article.theater_name}</button>
									</c:if>
								</c:forEach>
							</div>
							<div id="tab4_1"
								style="width: 100%; height: 100%; display: none; overflow-y: scroll;">
								<c:forEach var="article" items="${articleList2}">
									<c:if test="${article.local eq 'KK' }">
										<button type="button"
											onclick="clickTheaterName('${article.theater_name}')"
											style="width: 100%; height: 35px; font-size: 12px;">${article.theater_name}</button>
									</c:if>
								</c:forEach>

							</div>
							<div id="tab4_2"
								style="width: 100%; height: 100%; display: none; overflow-y: scroll;">
								<c:forEach var="article" items="${articleList2}">
									<c:if test="${article.local eq 'IC' }">
										<button type="button"
											onclick="clickTheaterName('${article.theater_name}')"
											style="width: 100%; height: 35px; font-size: 12px;">${article.theater_name}</button>
									</c:if>
								</c:forEach>
							</div>
							<div id="tab4_3"
								style="width: 100%; height: 100%; display: none; overflow-y: scroll;">
								<c:forEach var="article" items="${articleList2}">
									<c:if test="${article.local eq 'KW' }">
										<button type="button"
											onclick="clickTheaterName('${article.theater_name}')"
											style="width: 100%; height: 35px; font-size: 12px;">${article.theater_name}</button>
									</c:if>
								</c:forEach>

							</div>
							<div id="tab4_4"
								style="width: 100%; height: 100%; display: none; overflow-y: scroll;">
								<c:forEach var="article" items="${articleList2}">
									<c:if
										test="${article.local eq 'CN'||article.local eq 'CB'||article.local eq 'DJ' }">
										<button type="button"
											onclick="clickTheaterName('${article.theater_name}')"
											style="width: 100%; height: 35px; font-size: 12px;">${article.theater_name}</button>
									</c:if>
								</c:forEach>
							</div>
							<div id="tab4_5"
								style="width: 100%; height: 100%; display: none; overflow-y: scroll;">
								<c:forEach var="article" items="${articleList2}">
									<c:if test="${article.local eq 'DK' }">
										<button type="button"
											onclick="clickTheaterName('${article.theater_name}')"
											style="width: 100%; height: 35px; font-size: 12px;">${article.theater_name}</button>
									</c:if>
								</c:forEach>
							</div>
							<div id="tab4_6"
								style="width: 100%; height: 100%; display: none; overflow-y: scroll;">
								<c:forEach var="article" items="${articleList2}">
									<c:if test="${article.local eq 'BS'||article.local eq 'US' }">
										<button type="button"
											onclick="clickTheaterName('${article.theater_name}')"
											style="width: 100%; height: 35px; font-size: 12px;">${article.theater_name}</button>
									</c:if>
								</c:forEach>
							</div>
							<div id="tab4_7"
								style="width: 100%; height: 100%; display: none; overflow-y: scroll;">
								<c:forEach var="article" items="${articleList2}">
									<c:if test="${article.local eq 'KN'||article.local eq 'KB' }">
										<button type="button"
											onclick="clickTheaterName('${article.theater_name}')"
											style="width: 100%; height: 35px; font-size: 12px;">${article.theater_name}</button>
									</c:if>
								</c:forEach>
							</div>
							<div id="tab4_8"
								style="width: 100%; height: 100%; display: none; overflow-y: scroll;">
								<c:forEach var="article" items="${articleList2}">
									<c:if
										test="${article.local eq 'JJ'||article.local eq 'JN'||article.local eq 'JB'||article.local eq 'KJ' }">
										<button type="button"
											onclick="clickTheaterName('${article.theater_name}')"
											style="width: 100%; height: 35px; font-size: 12px;">${article.theater_name}</button>
									</c:if>
								</c:forEach>
							</div>
							 </div>
					</div>
					<div id="tab2_1" style="width: 100%; display: none;">
						<div class="tt0" style="width: 45%; margin-top: 5px;">
							<center>
								<button type="button" onclick="ShowTabex5('0')"
									style="width: 100%; height: 35px; font-size: 12px;">서울()</button>
								<button type="button" onclick="ShowTabex5('1')"
									style="width: 100%; height: 35px; font-size: 12px;">경기()</button>
								<button type="button" onclick="ShowTabex5('2')"
									style="width: 100%; height: 35px; font-size: 12px;">인천()</button>
								<button type="button" onclick="ShowTabex5('3')"
									style="width: 100%; height: 35px; font-size: 12px;">강원()</button>
								<button type="button" onclick="ShowTabex5('4')"
									style="width: 100%; height: 35px; font-size: 12px;">대전/충청()</button>
								<button type="button" onclick="ShowTabex5('5')"
									style="width: 100%; height: 35px; font-size: 12px;">대구()</button>
								<button type="button" onclick="ShowTabex5('6')"
									style="width: 100%; height: 35px; font-size: 12px;">부산/울산()</button>
								<button type="button" onclick="ShowTabex5('7')"
									style="width: 100%; height: 35px; font-size: 12px;">경상()</button>
								<button type="button" onclick="ShowTabex5('8')"
									style="width: 100%; height: 35px; font-size: 12px;">광주/전라/제주()</button>
							</center>
						</div>
						<div class="tt1" style="width: 50%; margin-left: 6px;">
							<div id="tab5_0" style="width: 100%; display: block;">
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">강변</button>

							</div>
							<div id="tab5_1" style="width: 100%; display: none;">
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">동수원</button>

							</div>
							<div id="tab5_2" style="width: 100%; display: none;">
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">인천</button>
							</div>
							<div id="tab5_3" style="width: 100%; display: none;">없음</div>
							<div id="tab5_4" style="width: 100%; display: none;">
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">대전</button>
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">천안펜타포트</button>
							</div>
							<div id="tab5_5" style="width: 100%; display: none;">
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">대구</button>
							</div>
							<div id="tab5_6" style="width: 100%; display: none;">
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">서면</button>
							</div>
							<div id="tab5_7" style="width: 100%; display: none;">없음</div>
							<div id="tab5_8" style="width: 100%; display: none;">
								<button type="button"
									style="width: 100%; height: 35px; font-size: 12px;">광주터미널</button>
							</div>
						</div>
					</div>
					<div id="tab2_2" style="width: 100%; display: none;">
						<!-- overflow-y:scroll; -->
						<div class="tt0" style="width: 45%; margin-top: 5px;">
							<center>
								<button type="button" onclick="ShowTabex6('0')"
									style="width: 100%; height: 35px; font-size: 12px;">4DX(2)</button>
								<button type="button" onclick="ShowTabex6('1')"
									style="width: 100%; height: 35px; font-size: 12px;">IMAX(19)</button>
								<button type="button" onclick="ShowTabex6('2')"
									style="width: 100%; height: 35px; font-size: 12px;">STARIUM(1)</button>
								<button type="button" onclick="ShowTabex6('3')"
									style="width: 100%; height: 35px; font-size: 12px;">CINE
									DE CHEF(3)</button>
								<button type="button" onclick="ShowTabex6('4')"
									style="width: 100%; height: 35px; font-size: 12px;">GOLD
									CLASS(5)</button>
								<button type="button" onclick="ShowTabex6('5')"
									style="width: 100%; height: 35px; font-size: 12px;">BRAND(1)</button>
								<button type="button" onclick="ShowTabex6('6')"
									style="width: 100%; height: 35px; font-size: 12px;">PREMIUM(7)</button>
								<button type="button" onclick="ShowTabex6('7')"
									style="width: 100%; height: 35px; font-size: 12px;">CINE
									KIDS(2)</button>
								<button type="button" onclick="ShowTabex6('8')"
									style="width: 100%; height: 35px; font-size: 12px;">Sphere(2)</button>
								<button type="button" onclick="ShowTabex6('9')"
									style="width: 100%; height: 35px; font-size: 12px;">REMPER
									CINEMA(3)</button>
								<button type="button" onclick="ShowTabex6('10')"
									style="width: 100%; height: 35px; font-size: 12px;">ScreenX(4)</button>
							</center>
						</div>
						<div class="tt1" style="width: 50%; margin-left: 6px;">
							<div id="tab6_0" style="width: 100%; display: block;"></div>
							<div id="tab6_1" style="width: 100%; display: none;">2</div>
							<div id="tab6_2" style="width: 100%; display: none;">3</div>
							<div id="tab6_3" style="width: 100%; display: none;">4</div>
							<div id="tab6_4" style="width: 100%; display: none;">5</div>
							<div id="tab6_5" style="width: 100%; display: none;">6</div>
							<div id="tab6_6" style="width: 100%; display: none;">6</div>
							<div id="tab6_7" style="width: 100%; display: none;">7</div>
							<div id="tab6_8" style="width: 100%; display: none;">8</div>
							<div id="tab6_9" style="width: 100%; display: none;">9</div>
							<div id="tab6_10" style="width: 100%; display: none;">10</div>
						</div>
					</div>
				</div>
			</div>