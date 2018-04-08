<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/common/css/EveryP.css?ver=1">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/common/css/vipLounge_khj.css?ver=1">
<script script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
/* function qnaClick(){
	$.ajax({
		url: "",
		type:"",
		dataType: "",
		data:"",
		success: function(){
			
		},
		error: function(error, status, request){
			
		}
	})
} */
</script>
</head>
<body>
<div class="vip_tit1"><h2 class="tit1_h2">VIP LOUNGE</h2><hr class="hr1"></div>
<div class="vip1"><img src="<%=request.getContextPath()%>/common/image/vipImage/vip1.png"></div>
<div class="vip2"><img src="<%=request.getContextPath()%>/common/image/vipImage/vip2.png"></div>
	<div class="vip3">
	     <div class="vip3_button1"> 	
			<a href="<c:url value= "/vip/vip_FAQ"/>"><img src="<%=request.getContextPath()%>/common/image/vipImage/VIP button1.png"></a>
		 </div>
		    
		 <div class="vip3_button2">
			<a href="#modalLayer" class="modalLink"><img src="<%=request.getContextPath()%>/common/image/vipImage/VIP button2.png"></a>
         </div>
			<div id="modalLayer">
				<div class="modalContent">
					VIP연간 혜택  <button type="button"style="background-color: transparent; float: right; border:0;">X</button>
				<div class="modalContent1"> 123123</div></div>
					
			</div> 
	</div>

	<div class="lounge">
	 <h2 class="lounge_h2">VIP 등급별 혜택 안내</h2>
	 <table>
      <thead>
     	 <colgroup>
    		<col span="1" style="background-color:#fff0ff">
   		 </colgroup>
        <tr class="tr1">
          <th>고객등급</th><th>SVIP</th><th>VVIP</th><th>RVIP</th><th>&nbsp;VIP</th><th>상세설명</th>
        </tr>
      </thead>
      <tbody>
        <tr class="lounge_tr1">
          <td >온라인 쿠폰북<br>(A형 쿠폰 기준)</td>
          <td>영화 무료쿠폰  15매<br>매점 쿠폰 7매<br>매점 할인쿠폰 5매<br>포토티켓 무료쿠폰 96매 </td>
          <td>영화 무료쿠폰  13매<br>매점 무료쿠폰 5매<br>매점 할인쿠폰 4매<br>포토티켓 무료쿠폰 12매 </td>
          <td>영화 무료쿠폰  10매<br>매점 무료쿠폰 5매<br>매점 할인쿠폰 4매<br>포토티켓 무료쿠폰 2매 </td>
          <td>영화 무료쿠폰  7매<br>매점 무료쿠폰 2매<br>매점 할인쿠폰 5매<br> </td>
           <td>vip고객님 취향에 따라 <br>쿠폰선택이 가능한<br>맞춤형 온라인 쿠폰북<br><button type="button"> 자세히보기 > </button> </td>
        </tr>
        <tr class="lounge_tr1">
          <td>포인트 반값 할인</td>
          <td>등급기간 내에 30매</td><td>등급기간 내에 20매</td><td>등급기간 내에 10매</td><td>등급기간 내에 5매</td>
          <td>전국 영화관에서 포인트로 <br>일반 영화 관람시 50%할인<br><button type="button"> 자세히보기 > </button></td>
        </tr>
      <tr class="lounge_tr1">
          <td>VIP 더블 적립</td>
          <td>5%</td><td>5%</td><td>5%</td><td>5%</td><td>매주 수요일 영화관람시,<br>5% 추가적립<br><button type="button"> 자세히보기 > </button></td>
        </tr>
        <tr class="lounge_tr1">
          <td>VIP 리필 적립</td><td>5%</td><td>3%</td><td>1%</td><td>-</td>
          <td>선정기준(14000p)달성 시 <br>다음달 초부터 영화관람<br> 추가포인트 적립<br><button type="button"> 자세히보기 > </button></td>
        </tr>
        <tr class="lounge_tr1">
          <td>스페셜데이</td><td>에이드2잔 무료</td><td>에이드2잔 무료</td><td>에이드2잔 무료</td><td>-</td>
          <td>VIP고객님이 직접 설정한 기념일에 <br>영화관람 시 혜택증정<br><button type="button"> 자세히보기 > </button></td>
        </tr>
        <tr class="lounge_tr1">
          <td>스페셜기프트</td><td>SVIP전용GIFT+<br>SVIP전용카드+<br>SVIP원데이프리패스카드</td>
          <td>VVIP전용카드+<br>VVIP원데이프리패스카드</td><td>-</td><td>-</td>
          <td>VVIP,SVIP고객님을 위한<br>특별한 선물<br><button type="button"> 자세히보기 > </button></td>
          </tr>
          <tr class="lounge_tr1">
          <td>SVIP특별관</td><td>특별관 1만원권</td>  <td>-</td><td>-</td><td>-</td>
          <td>SVIP고객님꼐 드리는<br>특별한 관람혜택<br><button type="button"> 자세히보기 > </button></td>
          </tr>
          <tr class="lounge_tr1">
          <td>VIP스티커</td><td>이용가능</td><td>이용가능</td><td>이용가능</td><td>이용가능</td>
          <td>전국 극장에서 포인트카드에<br>VIP스티커부착<br><button type="button"> 자세히보기 > </button></td>
          </tr>
          <tr class="lounge_tr1">
          <td>VIP전용 이벤트</td><td>참여가능</td>
          <td>참여가능</td><td>참여가능</td><td>참여가능</td>
          <td>매월 VIP 시사회등 <br>VIP고객님을 위한<br>다채로운 이벤트 진행<br><button type="button"> 자세히보기 > </button></td>
          </tr>
          </tbody>
          </table>
          </div>
          <br>
          <div class="lounge1">
          <div class="vip_tit1"><h2 class="tit1_h2">등급별 선정 기준 안내</h2><hr class="hr1"></div>
          <table>
          <tbody>
        <%--   <colgroup>
    		<col span="1" style="width:20%">
    		<col span="2" style="width:25%">
    		<col span="3" style="width:45%">
    		<col span="4" style="width:10%">
   		 	</colgroup> --%>
          <tr class="lounge_tr2"><td>SVIP</td><td>VVIP</td><td>RVIP</td><td>VIP</td></tr>
          <tr class="lounge_tr3">
          <td>선정 : VVIP 5년 연속 유지 고객<br>유지 : 20,000P 이상 달성 고객</td>
          <td><b>선정 : RVIP 3년 연속 유지 고객 또는</b><br><b style="margin-left:41px;">RVIP승급 후 1년 간 유료 관람횟수</b><br><b style="margin-left:41px;">상위 0.1% 고객</b><br><b>유지 : 16,000P 이상 달성 고객</b></td>
          <td><b>선정 : VVIP 고객 중 1년 간 14,000P 달성 고객</b><br><b style="margin-left:41px;">또는 VIP 승급 후 1년 이내</b><br><b style="margin-left:41px;">28,000P 달성 시 다음달 승급</b><br><b style="margin-left:41px;">유지 : 14,000P 이상 달성 고객</td>
          <td><b>선정 : 일반고객 중 최근 1년 구매 누적</b><br><b style="margin-left:41px;">14,000P 달성 고객</b></td>
          </tr>
          </tbody></table>
          </div>
	
	<script type="text/javascript">
	$(document).ready(function(){
		  var modalLayer = $("#modalLayer");
		  var modalLink = $(".modalLink");
		  var modalCont = $(".modalContent");
		  var marginLeft = modalCont.outerWidth()/2;
		  var marginTop = modalCont.outerHeight()/2; 

		  modalLink.click(function(){
		    modalLayer.fadeIn("slow");
		    modalCont.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
		    $(this).blur();
		    $(".modalContent > a").focus(); 
		    return false;
		  });

		  $(".modalContent > button").click(function(){
		    modalLayer.fadeOut("slow");
		    modalLink.focus();
		  });		
		});
	</script>
	<script type="text/javascript">
$(document).ready(function(){
  var modalLayer = $("#modalLayer");
  var modalLink = $(".modalLink");
  var modalCont = $(".modalContent");
  var marginLeft = modalCont.outerWidth()/2;
  var marginTop = modalCont.outerHeight()/2; 

  modalLink.click(function(){
    modalLayer.fadeIn("fast");
    modalCont.css({"margin-top" : -marginTop, "margin-left" : -marginLeft});
    $(this).blur();
    $(".modalContent > a").focus(); 
    return false;
  });

  $(".modalContent > button").click(function(){
    modalLayer.fadeOut("fast");
    modalLink.focus();
  });      
});
</script>
</body>
</html>
	 	