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
	
	#login-btn {
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
	
	.pwd-btn {
	    height: 40px;
	    width: 150px;
	    border-radius: 10px;
	    background-color: white;
	    font-size: 14px;
	    font-weight: 600;
	}
	
	.pwd-btn:first-child {
	    margin-right: 28px;
	}
	
	#green-text{
	    color: #0B8500;
	    font-size: 14px;
	}

</style>
</head>
<body>
<% String contextPath = request.getContextPath(); %>
    <table>
        <tr>
            <th><img src="resources/images/wuctionLogo.png" onclick="location.href='<%= contextPath %>/mainPage.co'" alt="" style="margin-bottom: 50px;"></th>
        </tr>
        <tr>
            <td id="find-text">비밀번호 찾기</td>
        </tr>
        <tr>
            <td><input id="email" type="text" placeholder= "이메일"></td>
        </tr>
        <tr>
            <td><button class="pwd-btn" onclick="newPasswordSubmit();">비밀 번호 전송</button><button class="pwd-btn">재전송</button></td>
        </tr>
        <tr>
            <td><text id="green-text" hidden>비밀번호가 전송되었습니다.</text></td>
        </tr>
        <tr>
            <td><button id="login-btn" onclick="location.href='<%= contextPath %>/loginPage.me'">로그인 하기</button></td>
        </tr>
    </table>
    
    <script>
    	function newPasswordSubmit() {
    		const email = document.getElementById("email").value;
    		
    		$.ajax({
    			url: 'emailCheck.me',
    			type: 'get',
    			data: {
    				email : email
    			},
    			success: function(result) {
    				if(result === 'NNN') {
    					$("#green-text").removeAttr("hidden");
    					
    					$.ajax({
    						url: 'pwdFind.me',
    						type: 'post',
    						data: {
    							email : email
    						},
    						success: function(response) {
    							console.log("비밀번호 전송 완료");
    						},
    						error: function(err) {
    							console.log(err);
    						}
    					});
    					
    				} else {
    					alert("존재하지 않는 이메일입니다. 다시 입력해주세요.");
    					email.focus();
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