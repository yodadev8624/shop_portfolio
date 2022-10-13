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
    <link rel="stylesheet" href="/resources/css/modify.css" />

    <!-- Jquery -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script defer src="/resources/js/common.js"></script>
    
    <script defer>
		// 날짜 select box 뿌려주기
    function setDateBox() {
    	let dt = new Date();
    	let now_year = dt.getFullYear();
    	let htmls = ""
    	for(let year=now_year; year>=now_year-50; year--) {
    		htmls = "<option value ='"
    		htmls += year
    		htmls += "'>"
    		htmls += year
    		htmls += "</option>"
        $("#birth_year").append(htmls);
    	}
    	for(let month=1; month<=12; month++) {
    		htmls = "<option value ='"
    		htmls += month
    		htmls += "'>"
        if(month < 10) htmls += 0
    		htmls += month
    		htmls += "</option>"
        $("#birth_month").append(htmls);
    	}

			let year = $("#birth_year").val()
			let month = $("#birth_month").val()
    	//if(year=="" || month=="") { alert("년, 월을 선택해주세요."); return false }
   		let date = new Date(year, month+1, 0)
   		let day = date.getDate();
   		for(let i=1; i<=day; i++) {
      		htmls = "<option value ="
      		htmls += i
      		htmls += ">"
      	  if(i < 10) htmls += 0
      		htmls += i
      		htmls += "</option>"
         $("#birth_day").append(htmls);
   		}
    }
		
		/* serializ를 JSON 형태로 변환하는 함수 */
		jQuery.fn.serializeObject = function() {
		    let obj = null;
		    try {
		        if (this[0].tagName && this[0].tagName.toUpperCase() == "FORM") {
		            let arr = this.serializeArray();
		            if (arr) {
		                obj = {};
		                jQuery.each(arr, function() {
		                    obj[this.name] = this.value;
		                });
		            }//if ( arr ) {
		        }
		    } catch (e) {
		        alert(e.message);
		    } finally {
		    }
		    return obj;
		};
    
    $(function(){
    	// 날짜 select box 뿌려주기
    	setDateBox();
    	
    	$("#birth_day").on("click", function() {
    		let year = $("#birth_year").val()
    		let month = $("#birth_month").val()
    		if(year=="" || month=="") { alert("년, 월을 선택해주세요."); return false }
    		let date = new Date(year, month+1, 0)
    		let day = date.getDate();
    		for(let i=1; i<=day; i++) {
       		htmls = "<option value ='"
       		htmls += i
       		htmls += "'>"
       	  if(i < 10) htmls += 0
       		htmls += i
       		htmls += "</option>"
          $("#birth_day").append(htmls);
    		}
    	})
    	
    	// 회원 정보 가져오기
   		$.ajax({
   		    url: '/members'
   		    ,type: 'GET'
   		    ,headers: {'content-type' : 'application/json'}
   		    //,data: JSON.stringify({"member_id":member_id, "member_pw":member_pw})
   		    ,success: (result) => {
   		    	$("#member_id").text(result.member_id)
   		    	
   		    	$("#member_name").val(result.member_name)
   		    	   		    	
   		    	let birth = new Date(result.member_birth)
   		    	console.log(birth)
   		    	$("#birth_year").val(birth.getFullYear())
   		    	$("#birth_month").val(birth.getMonth()+1)
   		    	$("#birth_day").val(birth.getDate())
   		    	$("#phone_number").val(result.phone_number)
   		    	$("#member_email").val(result.member_email)
   		    }
   		}); // ajax
   		
   		// 수정 완료 버튼
			$("#submit").on("click", () => {
				let form1 = $("#register_form").serializeObject();
				const year = form1.birth_year;
				const month = form1.birth_month;
				const day = form1.birth_day;
				if(year=="" || month=="" || day=="") {
				} else {
					form1.member_birth = year + "-0" + month + "-" + day;
				}
				console.log(form1);
				$.ajax({
				    url: '/members'
				    ,type: 'PUT'
				    ,headers: {'content-type' : 'application/json'}
				    ,data: JSON.stringify(form1)
				    ,success: (data, textStatus, jqXHR) => {
				    	location.href = "/members/info";
				    }
				    ,error: (request) => {
   		        console.log('error');
   		        console.log("code: " + request.status)
   		        console.log("message: " + request.responseText);
   		        alert("입력 값을 확인해주세요.");   		        
				    }
				});
			});
    }); // fn
    </script>
    
  </head>
  <body>
    <!-- HEADER -->
		<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

    <!-- SECTION -->
    <section class="register">
      <div class="inner">
        <h1>개인정보 확인 및 수정</h1>
        <form id="register_form">
          <div class="register__card">
            <div class="input_box id_chk">
              <h3>아이디</h3>
              <div class="user_id">
                <p><span id="member_id"></span></p>
              </div>
            </div>
          </div>
          <div class="register__card">
            <div class="input_box gender_chk">
              <h3>이름(필수)</h3>
              <input id="member_name" name="member_name" type="text" placeholder="아이디를 입력하세요" />
            </div>
            <div class="input_box birth_chk">
              <h3>생년월일(필수)</h3>
              <select name="birth_year" id="birth_year">
              	<option value="">선택</option>
              </select>
              <select name="birth_month" id="birth_month">
              	<option value="">선택</option>
              </select>
              <select name="birth_day" id="birth_day">
              	<option value="">선택</option>
              </select>
            </div>
            <div class="input_box phone_chk">
              <h3>휴대폰(필수)</h3>
              <input name="phone_number" id="phone_number" type="text" placeholder="숫자만 입력해주세요" />
            </div>
            <div class="input_box email_chk">
              <h3>메일(필수)</h3>
              <input name="member_email" id="member_email" type="text" placeholder="이메일을 입력하세요" />
            </div>
          </div>
          <div class="actions">
            <input type="button" id="submit" value="완료" />
          </div>
        </form>
      </div>
    </section>


    <!-- FOOTER -->
		<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

  </body>
</html>
