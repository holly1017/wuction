<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wuction</title>
<link rel="icon" href="resources/images/favicon.png">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>

	table {
	    margin: auto;
	    margin-top:120px;
	    width: 326px;
	    text-align: center;
	    border-spacing: 10px;
	    font-size: 14px;
	}
	
	#id-find-btn {
	    width: 100%;
	    height: 50px;
	    background-color: #ff6c6c;
	    color: white;
	    font-size: 15px;
	    border: none;
	    border-radius: 0px;
	    margin-top: 90px;
	}
	
	#find-text {
	    font-size: 20px;
	    font-weight: bold;
	}
	
	#email {
	    height: 40px;
	    width: 326px;
	    border-radius: 10px;
	    text-indent: 15px;
	}
	
	#input-container {
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
	
	.blackBtn {
	    width: 65px;
	    height: 45px;
	    border-radius: 10px;
	    background-color: black;
	    color: white;
	    border: none;
	    cursor: pointer;
	}
	
	#authCode {
	    border-right: none;
	    width: 135px;
	    padding-left: 10px;
	    border-top-left-radius: 10px;
	    border-bottom-left-radius: 10px;
	}
	#input2{
	    border-left: none;
	    width: 94px;
	    text-align: right;
	    padding-right:10px;
	    border-top-right-radius: 10px;
	    border-bottom-right-radius: 10px;
	    font-size: 14px;
	    color: #909090;
	    height: 38px;
	    background-color: white;
	    border-color: black;
	}
	.auth-btn {
	    height: 40px;
	    width: 148px;
	    border-radius: 10px;
	    background-color: white;
	    font-size: 14px;
	    font-weight: 600;
	    cursor: pointer;
	}
	
	.auth-btn:first-child {
	    margin-right: 28px;
	}
	#your-id2{
	    margin-left: 100px;
	    font-weight: 600;
	}
	#your-id-container{
	    border: 1px solid black;
	    height: 40px;
	    line-height: 40px;
	    border-radius: 10px;
	}
	#id-find-btn a {
		color: #ffffff;
       	text-decoration: none;
	}

</style>
</head>
<body>
	<% 
		String contextPath = request.getContextPath();
	%>
    <table>
        <tr>
            <th><img src="resources/images/wuctionLogo.png" onclick="location.href='<%= contextPath %>/mainPage.co'"  alt="" style="margin-bottom: 50px;"></th>
        </tr>
        <tr>
            <td id="find-text">아이디 찾기</td>
        </tr>
        <tr>
            <td><input id="email" type="text" placeholder="이메일"></td>
        </tr>
        <tr>
            <td><button class="auth-btn" onclick="idFindFromEmail();">인증 번호 전송</button><button class="auth-btn">재전송</button></td>
        </tr>
        <tr>
            <td>
                <div style="display: flex; justify-content: space-between;">
                    <div id="input-container">
                        <input type="text" id="authCode" class="same-input" placeholder="인증 번호">
                        <input type="text" id="input2" class="same-input" placeholder="">
                    </div>
                    <button class="blackBtn" onclick="authCodeCheck();">인증</button>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <div id="your-id-container" hidden>
                    <div><text id="your-id1">당신의 아이디</text><text id="your-id2"></text></div>
                </div>
            </td>
        </tr>
        <tr>
            <td><button id="id-find-btn" type="submit" onclick="location.href='<%= contextPath %>/loginPage.me'">로그인 하기</button></td>
        </tr>
    </table>
    
    <script>
    
    function idFindFromEmail() {
    	const emailEle = $("#email");
    	const email = emailEle.val();
    	
    	$.ajax ({
    		url: 'emailCheck.me',
    		type: 'get',
    		data: {
    			email: email
    		},
    		success: function(result) {
    			if(result === 'NNN') {
    				alert("인증번호를 전송했습니다.");
    				
    				$.ajax({
    					url: 'sendAuthCode.me',
    					type: 'post',
    					data: {email: email},
    					success: function(response) {
    						console.log("인증 코드 전송 완료");
    					},
    					error: function(err) {
    						console.log(err);
    					}
    				});
		
    			} else {
    				alert("존재하지 않는 이메일입니다. 다시 입력해주세요.");
    				emailEle.focus();
    			}
    		},
    		error: function(err) {
    			console.log(err);
    		}
    	});
    }
    
    function authCodeCheck() {
    	const authCode = document.getElementById('authCode').value;
    	const email = document.getElementById('email').value;
    	
    	$.ajax({
    		url: 'verifyCode.me',
    		type: 'post',
    		data: {authCode : authCode},
    		success: function(result) {
    			if (result === 'NNY') {
    				alert("인증번호 인증에 성공하셨습니다.");
    				
    				$.ajax({
    					url: 'idFind.me',
    					type: 'get',
    					data: {email: email},
    					success: function(result) {
    						if (result.startsWith('NNN')) {
    							document.getElementById("your-id-container").hidden = false;
    							
    							 // memId를 파싱하여 텍스트에 설정
    							const memId = result.split(":")[1];
    				            document.getElementById("your-id2").textContent = memId;
    						} else {
    							alert("오류가 발생했습니다. 다시 시도해주세요");
    						}
    					}
    				})
    					
    				
    			} else {
    				alert("인증번호 인증에 실패하셨습니다. 다시 시도해주십시오.");
    			}
    		},
    		error: function(err) {
    			console.log(err);
    		}
    	});
    }
    
    </script>
</body>
</html>