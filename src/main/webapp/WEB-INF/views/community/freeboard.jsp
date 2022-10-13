<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Shop Mall</title>
    <!-- reset.css / google fonts / goole material icon -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" />
    
    <!-- common css -->
    <link rel="stylesheet" href="/resources/css/common.css" />
    <!-- section css -->
    <link rel="stylesheet" href="/resources/css/signin.css" />

    <!-- Jquery -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <!-- common js -->
    <script defer src="/resources/js/common.js"></script>
</head>
<body>
    <!-- HEADER -->
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
		
    <!-- SECTION -->
    <section class="board">
      <div class="inner">
        <h1>자유게시판</h1>
        <div class="search">
          <ul class="search__wrap">
            <li>
              <select name="" id="">
                <option value="">전체</option>
                <option value="">제목</option>
                <option value="">내용</option>
              </select>
            </li>
            <li>
              <input type="text" placeholder="검색어를 입력하세요.">
            </li>
            <li>
              <button class="btn-blue">검색</button>
            </li>
          </ul>
        </div>
        <div class="board__table">
          <ul class="th">
            <li>번호</li>
            <li>제목</li>
            <li>첨부파일</li>
            <li>작성일자</li>
            <li>조회수</li>
          </ul>
          <ul class="td">
            <li>번호</li>
            <li>제목</li>
            <li>첨부파일</li>
            <li>작성일자</li>
            <li>조회수</li>
          </ul>
          <ul class="td">
            <li>번호</li>
            <li>제목</li>
            <li>첨부파일</li>
            <li>작성일자</li>
            <li>조회수</li>
          </ul>
        </div>
        <ul class="pagenation">
          <li><a class="first" href="javascript:void(0)"></a></li>
          <li><a class="prev" href="javascript:void(0)"></a></li>
          <li><a class="active" href="javascript:void(0)">1</a></li>
          <li><a href="javascript:void(0)">2</a></li>
          <li><a href="javascript:void(0)">3</a></li>
          <li><a href="javascript:void(0)">4</a></li>
          <li><a href="javascript:void(0)">5</a></li>
          <li><a class="next" href="javascript:void(0)"></a></li>
          <li><a class="end" href="javascript:void(0)"></a></li>
        </ul>
      </div>
    </section>		
		
		
		<!-- FOOTER -->
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</body>
</html>