<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Shop Mall</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    
    <link rel="stylesheet" href="/resources/css/common.css" />
    <link rel="stylesheet" href="/resources/css/signin.css" />

    <!-- Jquery -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script defer src="/resources/js/common.js"></script>
    
    <script defer>
    $(function(){
    	$("#login").on("click", () => {
    		let member_id = $("#member_id").val();
    		let member_pw = $("#member_pw").val();
    		$.ajax({
    		    url: '/auth'
    		    ,type: 'POST'
    		    ,headers: {'content-type' : 'application/json'}
    		    ,data: JSON.stringify({"member_id":member_id, "member_pw":member_pw})
    		    ,success: (data, textStatus, jqXHR) => {
    		    	location.href = "/";
    		    }
    		    ,error: (request) => {
    		        console.log('error');
    		        console.log("code: " + request.status)
    		        console.log("message: " + request.responseText)
    		        if(fn_strNullCheck(request.responseText) != "") {
        		        let result = JSON.parse(request.responseText);
        		        result.forEach((item,index)=>{
            		        $("#" + item.field).addClass("input-warn");
        		        });
    		        }
    		        $("#msg").css("display", "block");
    		    }
    		}); // ajax
    	});	// onclick
    	$("#member_id, #member_pw").on("focus", function(){
    		$(this).removeClass("input-warn");
    	}); // on focus
    	
    	$("#member_pw").on("keyup", function(key) {
    		if(key.keyCode==13) {
    			$("#login").click()
    		}
    	})
    }); // fn
    </script>
    
  </head>
  <body>
    <!-- HEADER -->
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

		<!-- SECTION SIGNIN -->
    <section class="signin">
      <h1>로그인</h1>
      <div class="signin__card">
        <h2>
          Shop Mall에 오신 것을 환영합니다!
        </h2>
        <form action="<c:url value='/auth' />" method="post">
          <input type="text" id="member_id" name="member_id" placeholder="아이디를 입력하세요" />
          <input type="password" id="member_pw" name="member_pw" placeholder="비밀번호를 입력하세요" />
          <input type="button" class="btn-green" id="login" value="로그인">

          <p id="msg" style="display:none;">
          	죄송합니다. 로그인에 실패했습니다. <br> 
          	<strong>아이디(ID)와 비밀번호</strong>를 <em>확인</em>하고 다시 로그인해주세요.
          </p>

        </form>
        <div class="actions">
          <a href="/members/new">회원가입</a>
          <!-- <a href="javascript:void(0)">아이디 찾기</a>
          <a href="javascript:void(0)">비밀번호 찾기</a> -->
        </div>
      </div>
    </section>


    <!-- FOOTER -->
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

  </body>
</html>
