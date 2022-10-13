<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Shop Mall</title>
<!-- reset.css -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" />
<!-- google fonts & Material Icon -->
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap"
	rel="stylesheet" />
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet" />
<!-- css -->
<link rel="stylesheet" href="/resources/css/common.css" />
<link rel="stylesheet" href="/resources/css/register.css" />

<!-- Jquery -->
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script defer src="/resources/js/common.js"></script>

	<script defer>
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

	/* 완료 버튼 클릭시 회원가입 요청하는 이벤트 */
	$(function(){
		setDateBox();
		
		let year = $("#birth_year").val()
		let month = $("#birth_month").val()
   	if(year=="" || month=="") { alert("년, 월을 선택해주세요."); return false }
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
		
		$("#submit").on("click", () => {
			let form1 = $("#register_form").serializeObject();
			const year = form1.birth_year;
			const month = form1.birth_month;
			const day = form1.birth_day;
			if(year=="" || month=="" || day=="") {
			} else {
				form1.member_birth = year + "-" + month + "-" + day;
			}
			console.log(form1);
			$.ajax({
			    url: '/members'
			    ,type: 'POST'
			    ,headers: {'content-type' : 'application/json'}
			    ,data: JSON.stringify(form1)
			    ,success: (data, textStatus, jqXHR) => {
			    	location.href = "/";
			    }
			    }
			    ,error: (request) => {
		        console.log('error');
		        console.log("code: " + request.status)
		        console.log("message: " + request.responseText);
		        alert("입력 값을 확인해주세요.");   		        
			    }
			});
		});
	});
	</script>

</head>
<body>
	<!-- HEADER -->
	<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<!-- SECTION REGISTER -->
	<section class="register">
		<div class="inner">
			<h1>회원가입</h1>
			<form id="register_form">
				<div class="register__card">
					<img src="/resources/images/main/register_logo.png" alt="회원정보">
					<h2>회원정보를 입력해주세요.</h2>
					<div class="input_box id_chk">
						<h3>
							아이디<span class="fonts-green">(필수)</span>
						</h3>
						<input type="text" name="member_id" placeholder="아이디를 입력하세요" />
					</div>
					<div class="input_box pw_chk">
						<h3>
							비밀번호<span class="fonts-green">(필수)</span>
						</h3>
						<input type="password" name="member_pw" placeholder="비밀번호를 입력하세요" />
					</div>
					<div class="input_box pw_chk2">
						<h3>
							비밀번호 확인<span class="fonts-green">(필수)</span>
						</h3>
						<input type="password" name="member_pw2" placeholder="비밀번호 확인" />
					</div>
				</div>
				<div class="register__card">
					<div class="input_box gender_chk">
						<h3>
							이름<span class="fonts-green">(필수)</span>
						</h3>
						<input type="text" name="member_name" placeholder="이름을 입력하세요" />
					</div>
					<div class="input_box birth_chk">
						<h3>
							생년월일<span class="fonts-green">(필수)</span>
						</h3>
						<select name="birth_year" id="birth_year">
							<option value>선택</option>
						</select> <select name="birth_month" id="birth_month">
							<option value>선택</option>
						</select> <select name="birth_day" id="birth_day">
							<option value>선택</option>
						</select>
					</div>
				</div>
				<div class="register__card">
					<div class="input_box phone_chk">
						<h3>
							휴대폰<span class="fonts-green">(필수)</span>
						</h3>
						<input type="text" name="phone_number" placeholder="숫자만 입력해주세요" />
					</div>
					<div class="input_box email_chk">
						<h3>
							메일<span class="fonts-green">(필수)</span>
						</h3>
						<input type="text" name="member_email" placeholder="이메일을 입력하세요" />
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