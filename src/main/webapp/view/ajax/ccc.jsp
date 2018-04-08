<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="t3-1"><div>
			<img src="<%=request.getContextPath()%>/common/image/mainImage/2_1.png" height="25px" width="100%" 
			style=" position: relative; top: 0px; left: 0px; z-index: 1;"></div>
			<div class="t1_1_1" style="position: relative; top: -25px; left: 0px; z-index: 2;">영화</div></div>
			<div class="t3-2">
				<div>
					<div style="width: 90%;margin-left:5%; background-color: white; margin-top: 5px;
					margin-bottom: 5px; border:solid #e1e1e1;">
						<center>
							<button type="button" onclick="ShowTabex('0')" style="width: 25%;">전체</button>
							<button type="button" onclick="ShowTabex('1')" style="width: 38%;">아트하우스</button>
							<button type="button" onclick="ShowTabex('2')" style="width: 30%;">특별관</button>
						</center>
					</div>
				</div>
				<div style="text-align: center;">
					<!-- ==================='전쳬' div 안으로============== -->
					<div id="tab_0" style="width: 100%; display: block;">

						<div style="width: 90%;margin-left:5%; margin-top: 5px; background-color: white;">
							<button onclick="ShowTabex3('0')" style=" width: 30%; float: left;border-bottom: solid #e1e1e1;">예매율 순</button>
							<button onclick="ShowTabex3('1')" style=" width: 30%;float: left;border-bottom: solid #e1e1e1;">가나다 순</button>
							<br><br>
						</div>
						
						<div style="text-align: center;">
							<div id="tab3_0" style="width: 90%; display: block;margin-left: 5%;">
								<table id="moviediv" class="moviediv" style="font-size: 13px;">
									<c:forEach var="article" items="${articleList}">
										<tr>
											<td>icon
											</td>
											<td></td>
											<td>${article.movie_name}</td>
											<td id="unVisible" class="unVisible">${article.grade}</td> 
										</tr>
										<tr></tr>
									</c:forEach>
								</table>
							</div>
							<div id="tab3_1" style="width: 100%; display: none;">가나다 순
								보여짐</div>
						</div>
					</div>

					<div id="tab_1" style="width: 100%; display: none;">아트하우스</div>
					<div id="tab_2" style="width: 100%; display: none;">특별관</div>
				</div>
			</div>
			<script>
		// 테이블의 Row 클릭시 값 가져오기
		$("#moviediv tr").click(function() {
			alert("moviediv clicked")
			var str1 = "";
			var str2 = "";
			var tdArr = new Array(); // 배열 선언

			// 현재 클릭된 Row(<tr>)
			var tr = $(this);
			var td = tr.children();

			// tr.text()는 클릭된 Row 즉 tr에 있는 모든 값을 가져온다.
			console.log("클릭한 Row의 모든 데이터 : " + tr.text());

			// 반복문을 이용해서 배열에 값을 담아 사용할 수 도 있다.
			td.each(function(i) {
				tdArr.push(td.eq(i).text());
			});

			// td.eq(index)를 통해 값을 가져올 수도 있다.

			var grade = td.eq(3).text();
			var movieName = td.eq(2).text();

			str2 += "등급 : " + grade;
			str1 += "제목 : " + movieName;

			document.getElementById('SelectedMovieName').innerHTML = str1;
			document.getElementById('SelectedMovieGrade').innerHTML = str2;
			document.getElementById('SelectedMovie').value = movieName;

			reservationLevelCheck();
			clickMovieName();
		});
	</script>