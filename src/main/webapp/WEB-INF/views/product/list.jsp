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
    <link rel="stylesheet" href="/resources/css/product__main.css" />

    <!-- Jquery -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script defer src="/resources/js/common.js"></script>
    
    <script defer>
    $(function(){    	
    	// 상품 리스트 가져오기
   		$.ajax({
   		    url: '/products'
   		    ,type: 'GET'
   		    ,headers: {'content-type' : 'application/json'}
   		    //,data: JSON.stringify({"member_id":member_id, "member_pw":member_pw})
   		    ,success: (result) => {
   		    	console.log(result)
   		    	let htmls = "";
   		    	result.forEach(function(data) {
   		    		htmls = `<li>
					   		             <div class="product__contents">
					   		              <a href="/products/view?pd_code=\${data.pd_code}">
					   		                <img src="/product/image?file=\${data.pd_file}" alt="asddasd">
					   		              </a>
					   		            </div>
					   		            <div class="product__name">
					   		              <a href="/products/view?pd_code=\${data.pd_code}">
					   		              	\${data.pd_name}
					   		              </a>
					   		            </div>
					   		            <div class="product__price">
				   		              	\${data.pd_price}
					   		            </div>
					   		       </li>`;
					   	$(".product").append(htmls);
   		    	});
   		    }
   		}); // ajax
   		
    }); // fn
    </script>
    
  </head>
  <body>
    <!-- HEADER -->
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

   	<!-- SECTION -->
    <section class="board">
      <div class="inner">
        <ul class="product">
        </ul>
      </div>
    </section>



    <!-- FOOTER -->
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

  </body>
</html>
