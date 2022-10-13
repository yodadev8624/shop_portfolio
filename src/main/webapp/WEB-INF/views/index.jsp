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
    <link rel="stylesheet" href="/resources/css/main.css" />

    <!-- Swiper -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.css" />
    <script src="https://cdn.jsdelivr.net/npm/swiper@8/swiper-bundle.min.js"></script>

    <!-- Jquery -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script defer src="/resources/js/main.js"></script>
    
    <script defer>
    
    </script>
  </head>
  <body>
		<!-- HEADER -->
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

    <!-- PROMOTION -->
    <section class="promotion">
      <div class="swiper">
        <div class="swiper-wrapper">
          <div class="swiper-slide">
            <img src="/resources/images/main/banner1.jpg" alt="">
          </div>
          <div class="swiper-slide">
            <img src="/resources/images/main/banner2.jpg" alt="">
          </div>
          <div class="swiper-slide">
            <img src="/resources/images/main/banner3.jpg" alt="">
          </div>
        </div>
      </div>
      <div class="swiper-pagination"></div>
      <button class="swiper-button-prev"></button>
      <button class="swiper-button-next"></button>
    </section>


    <!-- CONT  -->
    <section class="cont">
      <div class="inner">
        <h3>NEW ITEM</h3>
        <div class="cont__item-box">
          <ul>
          	<c:forEach var="product" items="${product}" varStatus="status">
	            <li>
	              <a href="/products/view?pd_code=${product.pd_code}">
	             	 <img src="/product/image?file=${product.pd_file}" alt="상품">
	              </a>
	              <div class="item-info">
	                <h6>${product.pd_name}</h6>
	                <span>${product.pd_price}</span>      
	              </div>
	            </li>
          	</c:forEach>
          </ul>
        </div>
      </div>
    </section>


    <!-- FOOTER -->
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

  </body>
</html>
