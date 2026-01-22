<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="resources/images/favicon.png">

<title>Wuction</title>
<style>
	table {
	    margin: auto;
	    margin-top: 200px;
	    width: 326px;
	}
	#btn{
	    width: 326px;
	    height: 50px;
	    background-color: #ff6c6c;
	    color: white;
	    font-size: 16px;
	    border: none;
	    border-radius: 0px;  
	}
	.input1{
	    width: 320px;
	    height: 50px;
	    border-top-left-radius: 10px;
	    border-top-right-radius: 10px;
	    border-bottom: none;
	    border-width: 1px;
	}
	.input2{
	    width: 320px;
	    height: 50px;
	    border-bottom-left-radius: 10px;
	    border-bottom-right-radius: 10px;
	    border-width: 1px;
	}
	#logo{
	    width: 288px;
	    height: 151px;
	}
	#idCheck{
	    text-align: left;
	    
	}
	a{
	    text-decoration: none;
	    color: #909090;
	    margin: 10px;
	}
	
	
	#idSave {
	    display: flex;
	    align-items: end;
	}
	input[type="checkbox"]{
	    display: none;
	}
	
	input[type="checkbox"] + label{
	    display: inline-block;
	    width: 15px;
	    height: 15px;
	    border:1px solid #707070;
	    border-radius: 50%;
	    position: relative;
	    margin-top: 10px;
	}
	
	input[id="remember"]:checked + label::after{
	    content:'✔';
	    font-size: 11px;
	    width: 15px;
	    height: 15px;
	    position: absolute;
	    border-radius: 50%;
	    background-color: #ffffff;
	    line-height: 15px;
	    text-align: center;
	}
	#id-none {
	    display: flex;
	    margin-left: 75px;
	    color: #d30000;
	    font-size: 14px;
	}
        
        
</style>
</head>
<body>
	<%
		String contextPath = request.getContextPath();
		String uncorrectLogin = (String)request.getAttribute("uncorrectLogin");
		String savedUserId = (String)request.getAttribute("savedUserId");
	%>
    <table>
        <tr>
            <th><img src="resources/images/wuctionLogo.png" onclick="location.href='<%= contextPath %>/mainPage.co'" alt=""></th>
        </tr>
            <form action="<%= contextPath %>/login.me" method="post">
        <tr>
            <td>
                <input class="input1" type="text" name="userId" value="<%= savedUserId != null ? savedUserId : "" %>"
           															placeholder="<%= savedUserId == null ? "아이디" : "" %>">
                <input class="input2" type="password" name="userPwd" placeholder="비밀번호">
                <div id="idCheck">
                    <div id="idSave">
                        <input type="checkbox" name="remember" id="remember" <%= savedUserId != null ? "checked" : "" %>>
                        <label for="remember"></label> &nbsp;<label for="remember">아이디 저장</label>
                        <% if (uncorrectLogin != null && !uncorrectLogin.isEmpty()) { %>
    						<text id="id-none"><%= uncorrectLogin %></text>
						<% } %>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
        <tr>
            <td>
                <button id="btn" type="submit">로그인</button>
            </td>
            </form>
        </tr>
        <tr>
            <td>
                <a href="<%= contextPath %>/idFindPage.me">아이디 찾기</a>
                <a href="<%= contextPath %>/pwdFindPage.me">비밀번호 찾기</a>
                <a href="<%= contextPath %>/signupPage.me">회원가입</a>
            </td>
        </tr>
    </table>
</body>
</html>