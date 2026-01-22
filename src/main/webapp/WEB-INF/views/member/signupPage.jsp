<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
table {
	padding-top: 20px;
	text-align: center;
	margin: auto;
	border-spacing: 10px;
}

.shortInput {
	width: 210px;
	height: 40px;
	border-radius: 10px;
}

.input {
	width: 326px;
	height: 40px;
	border-radius: 10px;
}

.blackBtn {
	width: 95px;
	height: 45px;
	margin-left: 20px;
	color: white;
	background-color: black;
	border: none;
	border-radius: 10px;
	cursor: pointer;
}

.right {
	text-align: right;
	font-size: 15px;
}

.authBtn {
	height: 25px;
	width: 153px;
	border-radius: 10px;
	background-color: white;
	font-size: 12px;
}

.authBtn:first-child {
	margin-right: 24px;
}

#signup-btn {
	width: 100%;
	height: 50px;
	background-color: #ff6c6c;
	color: white;
	font-size: 15px;
	border: none;
	border-radius: 0px;
	cursor: pointer;
}

#input-container {
	border-width: 1px;
	width: 210px;
	height: 40px;
	display: flex;
	align-items: center;
}

.same-input {
	width: 60px;
	margin: 0;
	margin-top: 5px;
	border-radius: 0px;
	font-size: 14px;
	color: #909090;
	height: 38px;
	background-color: white;
	border-color: black;
}

.auth-agree {
	border: 1px solid black;
	width: 326px;
	height: 40px;
	border-radius: 10px;
	line-height: 40px;
	text-align: left;
}

input[type="checkbox"] {
	display: none;
}

input[type="checkbox"]+label {
	display: inline-block;
	width: 15px;
	height: 15px;
	border: 1px solid #707070;
	border-radius: 50%;
	position: relative;
	margin-top: 3px;
	margin-bottom: 3px;
	color: #909090;
}

input[id="remember"]:checked+label::after {
	content: '✔';
	position: absolute;
	font-size: 11px;
	width: 15px;
	height: 15px;
	border-radius: 50%;
	background-color: #1dd200;
	color: white;
	line-height: 15px;
	left: 0;
}

#auth-check {
	display: flex;
	align-items: center;
}

#signup-text {
	font-size: 20px;
	font-weight: bold;
}

.password-text {
	vertical-align: super;
}

#input-container>input:first-child {
	border-right: none;
	width: 105px;
	padding-left: 10px;
	border-top-left-radius: 10px;
	border-bottom-left-radius: 10px;
}

#input-container>input:nth-child(2) {
	border-left: none;
	width: 94px;
	text-align: right;
	padding-right: 10px;
	border-top-right-radius: 10px;
	border-bottom-right-radius: 10px;
}
</style>
</head>

<body>

	<%
	String contextPath = (String) request.getContextPath();
	%>
	<form action="<%=contextPath%>/insert.me" method="post">
		<table style="width: 626px;">
			<tr>
				<th style="width: 150px;"></th>
				<th style="width: 326px;"><img src="../resource/Group38.png"
					alt=""></th>
				<th style="width: 150px;"></th>
			</tr>
			<tr>
				<td></td>
				<td><text id="signup-text">회원가입</text></td>

			</tr>
			<tr>
				<td class="right"><label for="" class="text">아이디</label></td>
				<td><input type="text" name="userId" id="userId"
					class="shortInput" maxlength="12"><button type="button" class="blackBtn" onclick="idCheck();">중복체크</button>
				</td>
			<tr>
				<td></td>
				<td>
					<div style="font-size: 9px; text-align: left;">8 ~ 12자리의 아이디를
						입력해주세요. ( * 영문자와 숫자만 입력 가능합니다.)</div>
				</td>
			</tr>

			</tr>
			<tr>
				<td class="right"><label for="" class="text">비밀번호</label></td>
				<td><input type="password" name="userPwd" class="input"
					id="userPwd" oninput="pwdCheck();" maxlength="12"></td>
			</tr>
			<tr>
				<td></td>
				<td>
					<div style="font-size: 9px; text-align: left;">8 ~ 12자리의
						비밀번호를 입력해주세요. ( * 영문자와 숫자만 입력 가능합니다.)</div>
				</td>
			</tr>
			<tr>
				<td class="right"><label for="password" class="text">비밀번호
						확인</label></td>
				<td><input type="password" name="userPwdCheck" class="input"
					id="userPwdCheck" oninput="pwdCheck();" maxlength="12"><br>
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<div style="font-size: 12px; text-align: left; color: #ff0000;"
						id="pwdCheckWarn"></div>
				</td>
			</tr>
			<tr>
				<td class="right"><label for="" class="text">이름</label></td>
				<td><input type="text" name="userName" class="input"
					id="userName" maxlength="5"></td>

			</tr>
			<tr>
				<td class="right"><label for="" class="text">생년월일 8자리</label></td>
				<td><input type="text" name="userBirth" class="input"
					maxlength="8" id="birth"></td>

			</tr>
			<tr>
				<td class="right"><label for="" class="text">배송지</label></td>
				<td><input type="text" name="userPostCode" id="postcode"
					class="shortInput" placeholder="우편번호"><button class="blackBtn" onclick="execDaumPostcode(); return false;">우편번호</button>
				</td>
			</tr>
			<tr>
				<td></td>
				<td><input type="text" name="userAddress" class="input"
					placeholder="주소" id="address"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="text" name="userAddressDetail" class="input"
					placeholder="상세 주소" id="detailAddress"></td>
			</tr>
			<tr>
				<td class="right"><label for="" class="text">이메일</label></td>
				<td><input type="email" name="userEmail" class="input"
					id="email"></td>
			</tr>
			<tr>
				<td></td>
				<td>
				<button class="authBtn" onclick="emailCheck(event);">인증번호 전송</button>
				<button class="authBtn">재전송</button></td>
			</tr>
			<tr>
				<td></td>
				<td>
					<div style="display: flex; justify-content: space-between;">
						<div id="input-container">
							<input type="text" name="authNum" id="authCode"
								class="same-input" placeholder="인증 번호"> <input
								type="text" id="input2" class="same-input" placeholder="남은시간"
								disabled>
						</div>
						<button type="button" class="blackBtn" onclick="emailAuthCodeCheck();">인증</button>
					</div>
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<div id="auth-check"
						style="border: 1px solid; width: 326px; height: 40px; border-radius: 10px; margin-top: 30px;">
						&nbsp;&nbsp;&nbsp;<input type="checkbox" id="remember"> <label
							for="remember"></label>
						<text style="line-height: 100%; color: #ff0000;">&nbsp;&nbsp;&nbsp;인증
						약관 동의</text>

						<div style="display: inline-block;">
							<span></span>
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td></td>
				<td><button id="signup-btn" disabled
						onclick="return validateForm();">회원가입</button></td>
			</tr>
		</table>
	</form>
	<script>
		function execDaumPostcode() {
			new daum.Postcode({
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수

					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('postcode').value = data.zonecode;
					document.getElementById("address").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("detailAddress").focus();
				}
			}).open();
		}

		function idCheck() {
			const idEle = $("#userId");

			console.log("userId : " + idEle.val());

			$.ajax({
				url : 'idCheck.me',
				type : 'get',
				data : {
					userId : idEle.val()
				},
				success : function(result) {
					if (result == "NNY") {
						alert("사용 가능한 아이디입니다.");

						$("#signup-btn").removeAttr("disabled");

					} else {
						alert("이미 사용중인 아이디입니다. 다시 입력해주세요.");

						idEle.focus();

					}
				},
				error : function(err) {
					console.log(err);
				}
			});
		}

		function emailCheck(event) {
			event.preventDefault();

			const emailEle = $("#email");
			const email = emailEle.val();

			// 이메일 형식 검사
			const emailCheck = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/i;
			if (!emailCheck.test(email)) {
				alert("이메일 형식이 올바르지 않습니다.");
				emailEle.val(""); // 입력값을 비워줍니다.
				emailEle.focus();
				return; // 형식이 올바르지 않으면 AJAX 요청을 하지 않습니다.
			}

			// 이메일 형식이 올바르면 서버에 요청을 보냅니다.
			$.ajax({
				url : 'emailCheck.me',
				type : 'get',
				data : {
					email : email
				},
				success : function(result) {
					if (result === "NNY") {
						alert("사용 가능한 이메일입니다.");
						alert("인증번호를 전송했습니다.");
						
						 $.ajax({
			                    url: 'sendAuthCode.me',
			                    type: 'post',
			                    data: { email: email },
			                    success: function(response) {
			                        console.log("인증 코드 전송 완료.");
			                    },
			                    error: function(err) {
			                        console.log(err);
			                    }
			                });
					} else {
						alert("이미 사용중인 이메일입니다. 다시 입력해주세요.");
						emailEle.focus();
					}
				},
				error : function(err) {
					console.log(err);
				}
			});
		}

		function emailAuthCodeCheck() {
			const authCode = document.getElementById("authCode").value;

			$.ajax({
				url : 'verifyCode.me',
				type : 'post',
				data : {
					authCode : authCode
				},
				success : function(result) {
					if (result === 'NNY') {
						alert("인증번호 인증에 성공하셨습니다.");
					} else {
						alert("인증번호 인증에 실패하셨습니다. 다시 시도해주십시오.");
					}
				},
				error : function(err) {
					console.log(err);
				}
			});
		}

		function pwdCheck() {
			const pwd = document.getElementById("userPwd").value;
			const pwdCheck = document.getElementById("userPwdCheck").value;
			const pwdCheckWarn = document.getElementById("pwdCheckWarn");

			console.log(pwd);
			console.log(pwdCheck);

			if (pwd == pwdCheck) {
				pwdCheckWarn.innerHTML = "비밀번호가 일치합니다.";
				pwdCheckWarn.style.color = 'green';

			} else {
				pwdCheckWarn.innerHTML = "동일한 비밀번호를 입력해주세요.";
				pwdCheckWarn.style.color = 'red';
			}

		}

		function pwdCheckSubmit() {
			const pwd = document.getElementById("userPwd").value;
			const pwdCheck = document.getElementById("userPwdCheck").value;

			if (pwd != pwdCheck) {
				alert("비밀번호 일치여부를 확인해주세요.");
				return false;

			} else {

				return true;
			}
		}

		function charCheck() {
			const id = document.getElementById("userId").value;
			const pwd = document.getElementById("userPwd").value;
			const pwdCheck = document.getElementById("userPwdCheck").value;
			const name = document.getElementById("userName").value;
			const birth = document.getElementById("birth").value;
			const address = document.getElementById("address").value;
			const detailAddress = document.getElementById("detailAddress").value;
			const email = document.getElementById("email").value;
			const authCode = document.getElementById("authCode").value;
			const remember = document.getElementById("remember");
			
			const idEngNum = /^[a-zA-Z0-9]{8,12}$/;
			const pwdEngNum = /^[a-zA-Z0-9]{8,12}$/;
			const pwdCheckEngNum = /^[a-zA-Z0-9]{8,12}$/;
			const nameKo = /^[가-힣]{1,5}$/;
			const birthNum = /^[0-9]{8}$/;


			if (id && pwd && pwdCheck && birth && address && email && authCode && remember.checked) {

				if (!idEngNum.test(id)) {
					alert("아이디 형식이 잘못 되었습니다.");
					return false;
				}

				if (!pwdEngNum.test(pwd)) {
					alert("비밀번호 형식이 잘못 되었습니다.");
					return false;
				}

				if (!pwdCheckEngNum.test(pwdCheck)) {
					alert("비밀번호 형식이 잘못 되었습니다.");
					return false;
				}

				if (!birthNum.test(birth)) {
					alert("날짜 형식이 잘못 되었습니다.");
					return false;
				}

				if (!nameKo.test(name)) {
					alert("최대 5글자 한글만 입력해주세요.");
					return false;
				}

				return true;

			} else {
				alert("입력하지 않은 사항들이 존재합니다. 입력해주십시오.");
				return false;
			}

		}

		function validateForm() {
			const pwdValid = pwdCheckSubmit();
			const charValid = charCheck();
			/*   const idValid = idCheck();
			  const emailValid = emailCheck(); */

			console.log("Password Check Valid:", pwdValid);
			console.log("Character Check Valid:", charValid);

			return pwdValid && charValid /* && idValid && emailValid */;
		}
	</script>
</body>

</html>