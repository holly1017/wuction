<%@page import="com.woong.wuction.member.model.vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Wuction</title>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <style>
        /* 기존 스타일들 유지 */
        html,
        body {
            height: 100%;
            margin: 0;
            padding: 0;
        }

        #container {
            display: grid;
            grid-template-columns: minmax(192px, 896px) minmax(896px, 1020px) minmax(192px, 896px);
            width: 100%;
            height: 100%;
        }

        #content {
            display: grid;
            grid-template-rows: minmax(100px, 150px) minmax(520px, 2fr) minmax(100px, 150px);
            height: 100%;
        }

        main {
            display: grid;
            grid-template-columns: repeat(12, 1fr);
            grid-column-gap: 20px;
        }

        .cateoryContainer {
            grid-column: 1 / span 2;
            border-left: 1px solid #B1B1B1;
            border-right: 1px solid #B1B1B1;
        }

        .cateoryContainer>div:first-child {
            background-color: #9b9b9b;
            height: 76px;
            width: 100%;
        }

        .unclickedCategory {
            background-color: #ffffff;
            height: 41px;
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            border-bottom: 1px solid #c7c7c7;
        }

        .unclickedCategory>a {
            text-decoration: none;
            color: #2c2c2c;
            font-size: 15px;
        }

        .clickedCategory {
            background-color: #2c2c2c;
            height: 41px;
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            border-bottom: 1px solid #c7c7c7;
        }

        .clickedCategory>a {
            text-decoration: none;
            color: #ffffff;
            font-size: 15px;
        }

        .ContentContainer {
            grid-column: 4 / span 8;
        }

        .ContentContainer>div:first-child {
            height: 108px;
            width: 100%;
            display: flex;
            align-items: flex-end;
        }

        .ContentContainer>div:first-child>text {
            margin-bottom: 10px;
            font-size: 18px;
            font-weight: 800;
        }

        .ContentContainer>div:nth-child(2) {
            height: 403px;
            width: 100%;
            border: 1px solid #b1b1b1;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .infoTable {
            height: 269px;
            width: 336px;
        }

        .height-22 {
            height: 22px;
        }

        .infoList {
            font-size: 15px;
            font-weight: normal;
        }

        #btnTable {
            text-align: center;
            width: 336px;
            margin-top: 30px;
        }

        .myInfoBtn {
            width: 100px;
            height: 30px;
            background-color: #2c2c2c;
            color: #ffffff;
            border-radius: 10px;
        }

        .cancelMember {
            background-color: #ff0000;
            height: 41px;
            width: 100%;
            display: flex;
            align-items: center;
            justify-content: center;
            border-bottom: 1px solid #c7c7c7;
        }

        .cancelMember>a {
            text-decoration: none;
            color: #ffffff;
            font-size: 15px;
        }

        /* 모달 배경 */
        .modal-overlay {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5);
            z-index: 1000;
        }

        /* 모달 컨테이너 */
        .modal-container {
            display: none;
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            background-color: white;
            border: 2px solid black;
            width: 559px;
            height: 400px;
            z-index: 1001;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.3);
        }

        /* 모달 헤더 */
        .modal-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #DDE9E9;
            border-radius: 8px 8px 0 0;
            height: 35px;
            justify-content: flex-end;
        }

        /* 닫기 버튼 */
        .modal-close {
            background: none;
            border: none;
            font-size: 35px;
            cursor: pointer;
        }

        /* 모달 바디 */
        .modal-body {
            padding: 20px;
        }

        /* 경매 입찰 박스 */
        .modal-body .bid-box {
            margin-top: 15px;
            background-color: #FF7272;
            border-radius: 15px;
            height: 34px;
            display: flex;
            align-items: center;
            justify-content: left;
        }

        .modal-body table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        .modal-body table td:first-child {
            width: 173px;
            height: 55px;
            background-color: #EEEEEE;
        }

        .product_modal_input {
            font-size: 16px;
        }

        .modal-body table,
        .modal-body th,
        .modal-body td {
            border: 1px solid #ddd;
            padding: 8px;
        }

        .modal-body ul {
            margin-top: 15px;
            padding-left: 20px;
        }

        .modal-body ul li {
            color: #A6A6A6;
        }

        .bid-box p {
          font-size: 18px; color: white; font-weight: 900; text-align: left; padding-left: 10px;
        }

        .bid-btns {
          text-align: center; margin-top: 15px;
        }
        
        .bid-btns button {
          width: 110px; border:none; height:35px; border-radius: 6px; font-size: 16px; background-color: red;
        }
    </style>
</head>

<body>
	<%
	    Member loginUser = (Member) session.getAttribute("loginUser"); // 세션에서 사용자 객체를 가져옴
	    String sessionUserPwd = loginUser.getMemPwd(); // 사용자 객체에서 비밀번호를 가져옴
	%>
    <div id="container">
        <div></div>
        <div id="content">
            <%@ include file="../common/header.jsp" %>
            <main>
                <div class="cateoryContainer">
                    <div></div>
                    <div class="clickedCategory">
                        <a href="myPage.me">나의 정보</a>
                    </div>
                    <div class="unclickedCategory">
                        <a href="myPostingPage.me">나의 경매 목록</a>
                    </div>
                    <div class="unclickedCategory">
                        <a href="myBidPage.me">나의 입찰 목록</a>
                    </div>
                    <div class="cancelMember">
                        <a href="deleteMemberPage.me">탈퇴하기</a>
                    </div>
                </div>

                <div class="ContentContainer">
                    <div>
                        <text>나의 정보<text>
                    </div>
                    <div>
                        <form action="<%= contextPath %>/updateInfo.me" method="post">
                            <table class="infoTable" method="post">
                                <tr>
                                    <td class="infoList">이름</td>
                                    <td><input type="text" class="height-22" value="${ loginUser.name }" name="userName" required></td>
                                </tr>
                                <tr>
                                    <td class="infoList">생년월일</td>
                                    <td><input type="text" class="height-22" value="${ loginUser.birthDate }" name="birthDate" required></td>
                                </tr>
                                <tr>
                                    <td class="infoList">주소</td>
                                    <td><input type="text" name="postCode" id="postcode" style="width: 95px; margin-right: 5px" class="height-22" value="${ loginUser.postCode }" required><button onclick="execDaumPostcode(); return false;">우편번호</button></td>
                                </tr>
                                <tr>
                                    <td class="infoList"></td>
                                    <td><input type="text" name="address" id="address" class="height-22" value="${ address }" required></td>
                                </tr>
                                </tr>
                                <tr>
                                    <td class="infoList"></td>
                                    <td><input type="text" name="detailAddress" id="detailAddress" class="height-22" value="${ detailAddress }" required></td>
                                </tr>
                                <tr>
                                    <td class="infoList">이메일</td>
                                    <td><input type="text" class="height-22" value="${ loginUser.email }" name="email" required></td>
                                </tr>
                                <tr>
                                    <td class="infoList">비밀번호 확인</td>
                                    <td><input type="password" class="height-22" name="memPwd" required></td>
                                </tr>
                            </table>
                            <table id="btnTable">
                                <tr>
                                    <td>
                                        <input type="submit" class="myInfoBtn" value="수정">
                                    </td>
                                    <td>
                                        <input type="button" class="myInfoBtn" value="비밀번호 변경" onclick="openModal()">
                                    </td>
                                </tr>
                            </table>
                        </form>
                    </div>
                </div>

                <div class="cateoryContainer"></div>
            </main>
            <%@ include file="../common/footer.jsp" %>
        </div>
        <div></div>
    </div>

    <!-- 모달 배경 -->
    <div class="modal-overlay" id="modalOverlay"></div>

    <!-- 모달 컨테이너 -->
    <div class="modal-container" id="myModal">
        <!-- 모달 헤더 -->
        <div class="modal-header">
            <!-- 닫기 버튼 -->
            <button class="modal-close" onclick="closeModal()">×</button>
        </div>
        <!-- 모달 바디 -->
        <div class="modal-body">
            <form action="<%= contextPath %>/updatePwd.me" method="post">
                <div class="bid-box">
                    <p>비밀번호 변경</p>
                </div>
                <table>
                    <tr>
                        <td>현재 비밀번호</td>
                        <td><input type="password" class="product_modal_input" name="userPwd" id="userPwd" required></td>
                    </tr>
                    <tr>
                        <td>변경할 비밀번호</td>
                        <td><input type="password" class="product_modal_input" name="newPwd" id="newPwd" oninput="pwdCheck();" required></td>
                    </tr>
                    <tr>
                      <td>변경할 비밀번호 확인</td>
                      <td>
                      	<input type="password" class="product_modal_input" name="newPwdCheck" id="newPwdCheck" oninput="pwdCheck();" required>
                      	<div style="font-size: 12px; text-align: left; color: #ff0000;" id="pwdCheckWarn"></div>
                      </td>
                  </tr>
                </table>
                <div class="bid-btns">
                  <button type="submit" class="myInfoBtn" onclick="return validateForm();">변경하기</button>
                </div>
            </form>
        </div>
    </div>

    <script>
        function openModal() {
            document.getElementById("modalOverlay").style.display = "block";
            document.getElementById("myModal").style.display = "block";
        }

        function closeModal() {
            document.getElementById("modalOverlay").style.display = "none";
            document.getElementById("myModal").style.display = "none";
        }

        function execDaumPostcode() {
                    new daum.Postcode({
                        oncomplete: function (data) {
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
        
        function pwdCheck() {
            const pwd = document.getElementById("newPwd").value;
            const pwdCheck = document.getElementById("newPwdCheck").value;
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
            const pwd = document.getElementById("newPwd").value;
            const pwdCheck = document.getElementById("newPwdCheck").value;

            if (pwd != pwdCheck) {
                alert("비밀번호 일치여부를 확인해주세요.");
                return false;

            } else {

                return true;
            }
        }

        function charCheck() {
            const newPwd = document.getElementById("newPwd").value;
           
            const pwdEngNum = /^[a-zA-Z0-9]{8,12}$/;


            if (newPwd) {
				if (!pwdEngNum.test(newPwd)) {
                    alert("비밀번호 형식이 잘못 되었습니다.");
                    return false;
                }
                return true;

            } else {
                alert("입력하지 않은 사항들이 존재합니다. 입력해주십시오.");
                return false;
            }

        }

        function sessionPwdCheck() {
        	const userPwd = document.getElementById("userPwd").value;
        	
        	if(userPwd === "<%= sessionUserPwd %>") {
        		return true;
        	} else {
        		alert("현재 비밀번호와 일치하지 않습니다.");
        		return false;
        	}
        	
        	
        }
        
        function validateForm() {
        	const sessionPwdValid = sessionPwdCheck();
            const pwdValid = pwdCheckSubmit();
            const charValid = charCheck();
            
            console.log("Password Check Valid:", pwdValid);
            console.log("Character Check Valid:", charValid);
            console.log("Session Check Valid:", sessionPwdValid);

            
            return pwdValid && charValid && sessionPwdValid;
        }
    </script>
</body>

</html>
