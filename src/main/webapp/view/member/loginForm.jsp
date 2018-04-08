<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/common/css/EveryP.css?ver=1">
<script script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.4/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
    // 저장된 쿠키값을 가져와서 ID 칸에 넣어준다. 없으면 공백으로 들어감.
    var userInputId = getCookie("userInputId");
    $("input[name='id']").val(userInputId); 
     
    if($("input[name='id']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 ID가 표시된 상태라면,
        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 있다면,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
            var userInputId = $("input[name='id']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("userInputId");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("input[name='id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            var userInputId = $("input[name='id']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }
    });
});
 
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}
</script>
<style>

.login_f{
   margin-left: 15%;
   width: 70%;
   height: 450px;
   margin-top: 2%;
}

.btn_btn {
    background: #fff;
    color: #88387f;
    padding: 14px 21px;
    margin: 8px 0;
    border: 1px solid #88387f;
    cursor: pointer;
    width: 300px;
}

.btn_btn:hover {
    opacity: 0.8;
}

.psw a{
text-decoration:none;
color:black;
font-size:100%;
}

.psw_txt0{
margin-right:7px;
}

.psw_txt1{
margin:7px;
}

.psw_join{
margin:7px;
}
.login{
    width:300px;
    padding: 12px 20px;
    margin: 12px 0;
    display: inline-block;
    border: 1px solid #ccc;
    box-sizing: border-box;
    font-family:Tahoma, Geneva, sans-serif;
}
</style>
<body>
<div class="login_f">
<form action="<%= request.getContextPath() %>/member/loginPro" method = "post">
<h2 style="text-align: center;"><br>LOGIN</h2><br>
<center>
<input  type="text" placeholder="Enter Username" name="id" class="login" required>
<br>
    
    <input type="password" placeholder="Enter Password" name="passwd" class="login" required>
        <br> 
        
    <button type="submit" class="btn_btn" ><font size="+0.5">Login</font></button>
    <br><br>
      
 
  <span class="psw" ><input type="checkbox" id="idSaveCheck">아이디 저장 
 <a href="<%= request.getContextPath()%>/member/idForm"><h9>아이디 찾기</h9></a>
 <a href="<%= request.getContextPath()%>/member/passwordForm"><h9>비밀번호 찾기</h9></a></span><br>
  
<p> Not a member? <a href="<%= request.getContextPath() %>/member/inputForm"> Sign Up</a> </p>
</center>
</form>
</div>

</body>
</html>