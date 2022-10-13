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
    <link rel="stylesheet" href="/resources/css/info.css" />

    <!-- Jquery -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script defer src="/resources/js/common.js"></script>
    
    <script defer>
    $(function(){
    	//회원 정보
   		$.ajax({
   		    url: '/members'
   		    ,type: 'GET'
   		    ,headers: {'content-type' : 'application/json'}
   		    //,data: JSON.stringify({"member_id":member_id, "member_pw":member_pw})
   		    ,success: (result) => {
   		    	$("#member_name").text(result.member_name)
   		    	$("#member_id").text(result.member_id)
   		    	$("#member_birth").text(result.member_birth)
   		    	$("#phone_number").text(result.phone_number)
   		    	$("#member_email").text(result.member_email)
   		    }
   		}); // ajax
   		
			//주문 내역
/*    		$.ajax({
   		    url: '/orders'
   		    ,type: 'GET'
   		    ,headers: {'content-type' : 'application/json'}
   		    //,data: JSON.stringify({"member_id":member_id, "member_pw":member_pw})
   		    ,success: (result) => {
   		    	result.forEach(function(data){
   	   		    	htmls = `<ul class="td">
   			   	              <li>\${data.order_date}</li>
   			   	              <li>\${data.order_info}</li>
   			   	              <li>\${data.state}</li>
   			   	              <li>\${data.get_chk}</li>
   			   	            </ul>`
   	   		    	$(".order__history").append(htmls)
   		    	})
   		    }
   		}); // ajax */
    }); // fn
    </script>
    
  </head>
  <body>
    <!-- HEADER -->
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

    <!-- SECTION -->
    <section class="mypage">
      <div class="inner">
        <div class="side"></div>
        <div class="article">
          <h1>마이페이지 홈</h1>
          <div class="info">
            <div class="info__head">
              <h2><strong id="member_name"></strong>님</h2>
              <div class="link">
                <a href="/members/modify"><strong>개인정보수정</strong></a>
              </div>
            </div>
            <ul class="info__contents">
              <li>아이디</li>
              <li><span id="member_id"></span></li>
            </ul>
            <ul class="info__contents">
              <li>생년월일</li>
              <li><span id="member_birth"></span></li>
            </ul>
            <ul class="info__contents">
              <li>휴대폰번호</li>
              <li><span id="phone_number"></span></li>
            </ul>
            <ul class="info__contents">
              <li>이메일</li>
              <li><span id="member_email"></span></li>
            </ul>
          </div>
        </div>
      </div>
      <div class="inner">
        <div class="order">
          <h1>최근 주문내역</h1>
          <div class="order__history">
            <ul class="th">
              <li>구입일자</li>
              <li>상품정보</li>
              <li>상태</li>
              <li>확인</li>
            </ul>
            <ul class="td">
              <li>2022-09-30</li>
              <li>반팔티 / S(90) / 2개</li>
              <li>주문완료</li>
              <li></li>
            </ul>
            <ul class="td">
              <li>2022-09-30</li>
              <li>반팔티 / S(90) / 2개</li>
              <li>주문완료</li>
              <li></li>
            </ul>
            <ul class="td">
              <li>2022-09-30</li>
              <li>난방 / S(90) / 3개</li>
              <li>주문완료</li>
              <li></li>
            </ul>
            <ul class="td">
              <li>2022-09-30</li>
              <li>자켓 / S(90) / 4개</li>
              <li>주문완료</li>
              <li></li>
            </ul>
          </div>
        </div>
      </div>
    </section>



    <!-- FOOTER -->
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

  </body>
</html>
