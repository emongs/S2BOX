<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/common/css/EveryP.css?ver=1">
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/common/css/trailer_eh.css?ver=1">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
      function fnGetList(sGetToken){
         var $getval = $("#search_box").val();
         if($getval==""){
            alert("검색어를 입력하세요.");
            $("#search_box").focus();
            return;
         }
         $("#get_view").empty();
         $("#nav_view").empty()


         var sTargetUrl = "https://www.googleapis.com/youtube/v3/search?part=snippet&order=relevance"
                        + "&q="+ encodeURIComponent($getval) +"&key=AIzaSyAp2wHQgH9yz90htwTdVp9oRUDrrVz4iZQ";
         if(sGetToken){
            sTargetUrl += "&pageToken="+sGetToken;
         }
         $.ajax({
            type: "POST",
            url: sTargetUrl,
            dataType: "jsonp",
            success: function(jdata) {
               console.log(jdata);

               $(jdata.items).each(function(i){
                  
                  //console.log(this.snippet.channelId);
                  $("#get_view").append("&nbsp;&nbsp;<p class='box'>&nbsp;&nbsp;&nbsp;<a href='https://www.youtube.com/embed/"+
                        this.id.videoId+"'><img src='"
                        +this.snippet.thumbnails.default.url+"'>&nbsp;&nbsp;&nbsp;&nbsp;<span style='color:black'>"
                        +this.snippet.title+"</span></a></p>");
               }).promise().done(function(){
                  if(jdata.prevPageToken){
                     $("#nav_view").append("<a class='a' href='javascript:fnGetList(\""+jdata.prevPageToken+"\");' style='color: #b90000'><이전페이지></a>");
                  }
                  if(jdata.nextPageToken){
                     $("#nav_view").append("<a class='a' href='javascript:fnGetList(\""+jdata.nextPageToken+"\");'  style='color: #b90000'><다음페이지></a>");
                  }
               });
            },
            error:function(xhr, textStatus) {
               console.log(xhr.responseText);
               alert("지금은 시스템 사정으로 인하여 요청하신 작업이 이루어지지 않았습니다.\n잠시후 다시 이용하세요.[2]");
               return;
            }
         });
      }
   </script>
</head>
<body>
<h1 class="trailer">TRAILER</h1>
<center>

<div class="tr1">

<br><br>
<iframe src="https://www.youtube.com/embed/8Tyj7CbplnY?rel=0&amp;showinfo=0" 
frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe> <!-- 레디플레이어원 -->
<iframe src="https://www.youtube.com/embed/qGPonnuCUZ0?rel=0&amp;showinfo=0" 
frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>  <!-- 퍼시픽 림 -->
<iframe src="https://www.youtube.com/embed/zilOSo2Ykag?rel=0&amp;showinfo=0" 
frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe> <!-- 알파 -->
<iframe src="https://www.youtube.com/embed/tu5IXn0kUvY?rel=0&amp;showinfo=0"
 frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe> <!-- 인시디어스 -->
</div>

<div class="tr2">
<a class="tx1">[레디플레이어원]</a>
<a class="tx2">[퍼시픽 림]</a>
<a class="tx3">[알파]</a>
<a class="tx1">[인시디어스]</a>
</div>
<div class="tr1">
<iframe src="https://www.youtube.com/embed/9vSDfC3JIqQ?rel=0&amp;showinfo=0" 
frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe> <!-- 데드풀 -->
<iframe src="https://www.youtube.com/embed/l-jESOo5ZDM?rel=0&amp;showinfo=0" 
frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe> <!-- 쿵푸로봇 -->
<iframe src="https://www.youtube.com/embed/x0sNnty1wXo?rel=0&amp;showinfo=0" 
frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe><!-- 강철비 -->
<iframe src="https://www.youtube.com/embed/5O5PVvHTWRo?rel=0&amp;showinfo=0" 
frameborder="0" gesture="media" allow="encrypted-media" allowfullscreen></iframe>  <!-- 신과함께 -->
</div>
<div class="tr2">
<a class="tx3">[데드풀]</a>
<a class="tx4">[쿵푸로봇]</a>
<a class="tx4">[강철비]</a>
<a class="tx1">[신과함께]</a>
</div>
</center>
<br>
   <center>
      <div class="w3-text-black">
         <form name="form1" method="post" onsubmit="return false;">
            <input type="text" id="search_box"> &nbsp;
            <button onclick="fnGetList();" class="w3-button w3-pale-red"
               value="글쓰기">검색</button>
      </div>
   </center>

   </form>
   <div id="get_view"></div>
   <div id="nav_view" class="nav_view"></div>



</body>
</html>