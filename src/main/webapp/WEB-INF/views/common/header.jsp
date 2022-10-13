<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<header>
  <div class="header__content inner">
    <div class="logo-box">
      <a href="/" class="logo">
        <img src="/resources/images/logo.png" alt="쇼핑몰 로고" />
      </a>
    </div>
    <div class="search-box">
      <input type="text" id="" name="" />
      <div class="material-icons"><a href="javascript:void(0)">search</a></div>
    </div>
    <div class="mytool-box">
      <a href="/members/info" class="link">
        <img src="/resources/images/svg/image__header-mypage.svg" alt="" />
      </a>
      <a href="javascript:void(0)" class="link">
        <img src="/resources/images/svg/image__header-cart.svg" alt="" />
      </a>
    </div>
  </div>

  <div class="header__nav">
    <div class="inner">
      <!-- main-menu -->
      <ul class="main-menu">
        <li class="item">
          <div class="item__name">
            <a href="javascript:void(0)"><span>WOMEN</span></a>
          </div>
          <div class="item__contents">
            <ul>
              <li><a href="/products/list">상의</a></li>
              <li><a href="/products/list">하의</a></li>
              <li><a href="/products/list">기타</a></li>
            </ul>
          </div>
        </li>
        <li class="item">
          <div class="item__name">
            <a href="javascript:void(0)"><span>MEN</span></a>
          </div>
          <div class="item__contents">
            <ul>
              <li><a href="/products/list">상의</a></li>
              <li><a href="/products/list">하의</a></li>
              <li><a href="/products/list">기타</a></li>
            </ul>
          </div>
        </li>
        <li class="item">
          <div class="item__name">
            <a href="javascript:void(0)"><span>KIDS</span></a>
          </div>
          <div class="item__contents">
            <ul>
              <li><a href="/products/list">상의</a></li>
              <li><a href="/products/list">하의</a></li>
              <li><a href="/products/list">기타</a></li>
            </ul>
          </div>
        </li>
        <li class="item">
          <div class="item__name">
            <a href="javascript:void(0)"><span>COMMUNITY</span></a>
          </div>
          <div class="item__contents">
            <ul>
              <li><a href="/community/events/main">이벤트</a></li>
              <li><a href="/community/free/main">자유게시판</a></li>
              <li><a href="/community/qna/main">Q & A</a></li>
            </ul>
          </div>
        </li>
      </ul>
      <!-- user-menu -->
      <c:choose>
      	<c:when test="${empty member.member_id}">
        <ul class="user-menu">
          <li class="item">
            <a href="/auth/new">로그인</a>
          </li>
          <li class="item">
            <a href="/members/new">회원가입</a>
          </li>
        </ul>
      	</c:when>
      	<c:when test="${not empty member.member_id}">
        <ul class="user-menu">
          <li class="item">
            <a href="/members/info"><c:out value="${member.member_name}">님</c:out></a>
          </li>
          <li class="item">
            <a href="javascript:logout()">로그아웃</a> 
            <script defer>
	        	/* 로그아웃 함수 */
	        	function logout(){
	       			$.ajax({
	       			    url: '/auth'
	       			    ,type: 'DELETE'
	       			    ,headers: {'content-type' : 'application/json'}
	       			    //,data: JSON.stringify(form1)
	       			    ,success: (data, textStatus, jqXHR) => {	       			     
	       			    	location.href = "/auth/new";
	       			    }
	       			});
	        	};
            </script>
						</li>
        </ul>
      	</c:when>
      </c:choose>
    </div>
  </div>
</header>
<script defer>
  // main-menu hover 이벤트
  $(".main-menu .item").on("mouseenter", function () {
    $(".main-menu .item").css("opacity", ".4");
    $(this).css("opacity", "1");
  });
  $(".main-menu .item").on("mouseleave", function () {
    $(".main-menu .item").css("opacity", "1");
  });
</script>