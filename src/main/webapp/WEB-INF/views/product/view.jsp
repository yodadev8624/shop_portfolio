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
    <link rel="stylesheet" href="/resources/css/product__view.css" />

    <!-- Jquery -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script defer src="/resources/js/common.js"></script>
    
    <script defer>
    function plus() {
    	let count = Number($("#count").text())
    	count += 1
    	$("#count").text(count)
    	calc(count)
    }
    function minus() {
    	let count = Number($("#count").text())
    	count -= 1
    	if(count <= 0 ) count = 1;
    	$("#count").text(count)
    	calc(count)
    }
    function calc(count) {
    	count = ${product.pd_price} * count
    	$("#calc").text(count)
    }
    
    $(function(){   
    	// 사이즈 선택 css
    	$(".option__detail a").on("click", function() {
    		$(".option__detail a").removeClass("chk")
    		$(this).addClass("chk")
    	})
    	
			$("#submit").on("click", function() {
				let count = Number($("#count").text())
				console.log(count)
				// 구입하기
				$.ajax({
				    url: '/orders'
				    ,type: 'POST'
				    ,headers: {'content-type' : 'application/json'}
				    ,data: JSON.stringify({"pd_count":count, "pd_ct_seq":"${product2.pd_ct_seq}"})
				    ,success: () => {
			    		alert("주문 완료")
			    		location.href = "/members/info";
					   }
				    ,error: (request) => {
				        console.log('error');
				        console.log("code: " + request.status)
				        console.log("message: " + request.responseText);
				        alert("입력 값을 확인해주세요.");  
				    }
					});  // ajax
				});
    }); // fn
    </script>
    
  </head>
  <body>
    <!-- HEADER -->
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

   	<!-- SECTION -->
    <section class="product">
      <div class="inner">
        <div class="product__wrap">
          <div class="product__photo">
            <a id="pd_image" href="javascript:void(0)">
            	<img src="/product/image?file=${product.pd_file}" alt="">
            </a>
          </div>  
          <div class="product__contents">
          	<input type="hidden" name="code" value="${product.pd_code}">
            <h1>${product.pd_name}</h1>
            <h2 class="price">${product.pd_price} 원</h2>
            <p>${product.pd_contents}</p>
            <div class="option">
              <h4>Size</h4>
              <div class="option__detail">
                <a class="chk" href="javascript:void(0)">
                	S(90)
                	<input type="hidden" name="size" value="90">
                </a>
                <a href="javascript:void(0)">
                	M(95)
                	<input type="hidden" name="size" value="95">
                </a>
                <a href="javascript:void(0)">
                	L(100)
                	<input type="hidden" name="size" value="100">
                </a>
                <a href="javascript:void(0)">
                	XL(105)
                	<input type="hidden" name="size" value="105">
                </a>
              </div>
            </div>
            <ul class="choice">
              <li class="choice__product">${product.pd_name}</li>
              <li class="choice__count">
                <a href="javascript:void(0)" onclick="minus()">－</a>
                <span id="count" class="count">1</span>
                <a href="javascript:void(0)" onclick="plus()">＋</a>
              </li>
            </ul>
            <ul class="total">
              <li>총 상품 금액 <span id="calc">${product.pd_price}</span></li>
              <li>
                <button class="btn-green" id="add">장바구니</button>
                <button class="btn-blue" id="submit">구입하기</button>
              </li>
            </ul>
          </div>
        </div>
      </div>
    </section>



    <!-- FOOTER -->
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

  </body>
</html>
