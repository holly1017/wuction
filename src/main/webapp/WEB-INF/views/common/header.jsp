<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" href="">
<title>Insert title here</title>
<script>
        document.addEventListener("DOMContentLoaded", function() {
            var link = document.createElement('link');
            link.rel = 'icon';
            link.type = 'image/x-icon';
            link.href = 'resources/images/favicon.png';
            document.head.appendChild(link);
        });
</script>
<style>
      html,
      body {
        height: 100%;
        margin: 0; /* 기본 마진 제거 */
        padding: 0; /* 기본 패딩 제거 */
      }

      header {
        display: grid;
        grid-template-columns: repeat(12, 1fr);
        grid-template-rows: 1fr 1fr;
        grid-column-gap: 20px;
        border-bottom: solid 1px #cecece;
        position: sticky;
        top: 0px; /* 도달했을때 고정시킬 위치 */
        z-index: 10;
        background-color: white;
      }

      .logo {
        background-image: url("resources/images/wuctionLogo.png");
        width: 100vw;
        height: 80%;
        border: 0px;
        background-color: white;
        background-repeat: no-repeat;
        background-size: contain;
        cursor: pointer;
      }

      .member-function-area {
        border: solid 2px #b6b6b6;
        border-radius: 20px;
        background-color: white;
        display: flex;
        justify-content: space-around;
        align-items: center;
        margin-top: 14%;
        height: 30%;
      }

      .member-function-area a {
        font-size: 10px;
        font-weight: normal;
        color: #2c2c2c;
        text-decoration-line: none;
      }
      
      .search-area {
         grid-column: 3 / span 8;
         grid-row: 2 / span 1;
         display: flex;
         align-items: center;
       }

       .search-area fieldset { 
         border: solid 4px red;
         width: 100%;
         height: 35%;
         padding: 0px;
         margin: 0px;
         display: flex;
       }

       .search-area > fieldset > input { 
         width: 90%;
         height: 100%;
         box-sizing: border-box;
         border: 0px;
         outline:none;
        
       }

       .posting-btn-area {
         grid-column: 11 / span 2;
         grid-row: 2 / span 1;
         display: flex;
         align-items: center;
       }

       .posting-btn-area button {
         font-size: 16px;
         background-color: #ff5252;
         border-radius: 30px;
         border: 0px;
         width: 95%;
         margin-left: 5%;
         height: 40%;
         font-weight: 600;
         cursor: pointer;
       }
       
       .posting-btn-area button a {
       	color: #ffffff;
       	text-decoration: none;
       }

       .search-btn {
        background-image: url("resources/images/free-icon-magnifier-2311526.png");
        box-sizing: border-box; 
        height: 100%;
        background-position: center;
        background-size: contain;
        background-repeat: no-repeat;
        border: 0px;
        width: 10%;
        cursor: pointer;
        background-color: white;
       }
    </style>
</head>
<body>
	<%
		String contextPath = request.getContextPath();
		
		String alertMsg = (String)session.getAttribute("alertMsg");
	%>
	
	<% if (alertMsg != null) { %>
	<script>
		alert("<%= alertMsg  %>");
	</script>
	<% session.removeAttribute("alertMsg"); %>
	<% } %>
	
    <header>
      <div
        style="
          grid-column: 1 / span 2;
          grid-row: 1 / span 2;
          display: flex;
          align-items: center;
        "
      >
        <button class="logo" onclick="location.href='<%= contextPath %>/mainPage.co'"></button>
      </div>
      <div style="grid-column: 3 / span 7; grid-row: 1 span 1;"></div>
      
      <div style="grid-column: 10 / span 3; grid-row: 1 / span 1;">
      
	  <c:choose>
	  	<c:when test="${empty loginUser}">
          <div class="member-function-area">
            <a href="<%= contextPath %>/loginPage.me">로그인</a>
            <a href="<%= contextPath %>/signupPage.me">회원가입</a>
            <a href="<%= contextPath %>/loginPage.me">마이페이지</a>
          </div>
        </c:when>
        <c:otherwise>
        	<div class="member-function-area">
            <a href="<%= contextPath %>/logout.me">로그아웃</a>
            <a href="<%= contextPath %>/myPage.me">마이페이지</a>
          </div>
        </c:otherwise>
	  </c:choose>
	  
        </div>
		<form class="search-area" method="get" action="<%= contextPath %>/search.pr">
		  	<fieldset>
	          <input
	            type="text"
	            name="keyword"
	            placeholder="검색어를 입력해주세요."   
          		/>
			  <button class="search-btn" type="submit"></button>
			</fieldset>
        </form>

	  <c:choose>
	  	<c:when test="${empty loginUser}">
	        <div class="posting-btn-area">
	          <button><a href="<%= contextPath %>/loginPage.me">내 상품 등록</a></button>
	        </div>
	    </c:when>
	    <c:otherwise>
	    	<div class="posting-btn-area">
	          <button><a href="<%= contextPath %>/postingPage.pr">내 상품 등록</a></button>
	        </div>
	    </c:otherwise>
	 </c:choose>
	 
      </header>
  </body>
</html>