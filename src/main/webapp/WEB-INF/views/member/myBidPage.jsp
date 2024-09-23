<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
      html,
      body {
        height: 100%;
        margin: 0;
        /* 기본 마진 제거 */
        padding: 0;
        /* 기본 패딩 제거 */
      }

      #container {
        display: grid;
        grid-template-columns: minmax(192px, 896px) minmax(896px, 1020px) minmax(192px,
            896px);

        width: 100%;
        height: 100%;
      }

      #content {
        display: grid;
        grid-template-rows: minmax(100px, 150px) minmax(520px, 2fr) minmax(100px,
            150px);
        height: 100%;
      }

      main {
        display: grid;
        grid-template-columns: repeat(12, 1fr);
        grid-column-gap: 20px;
      }

      .cateoryContainer {
        grid-column: 1/span 2;
        border-left: 1px solid #B1B1B1;
        border-right: 1px solid #B1B1B1;
      }

      .cateoryContainer>div:first-child {
        background-color: #9b9b9b;
        height: 76px;
        width: 100%
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
        font-size: 15px
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
        font-size: 15px
      }

      .ContentContainer {
        grid-column: 4/span 8
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
        width: 100%;
        border: 1px solid #b1b1b1;
        display: flex;
        justify-content: center;
        align-items: center;
      }

      .myBidTable {
        width: 100%;
      }

      .bg-color {
        background-color: #F1F1F1;
      }

      .ta-center {
        text-align: center;
      }

      .ta-right {
        text-align: right;
      }

      .myBidTable tr>th:first-child {
        width: 350px;
        text-align: left;
        padding-left: 1%;
      }

      .myBidTable tr>th:nth-child(3) {
        text-align: right;
        padding-right: 1%;
      }

      tr {
        height: 50px;
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
        font-size: 15px
      }
    </style>
  </head>

  <body>
    <div id="container">
      <div></div>
      <div id="content">
        <%@ include file="../common/header.jsp" %>
          <main>
            <div class="cateoryContainer">
              <div></div>
              <div class="unclickedCategory">
                <a href="myPage.me">나의 정보</a>
              </div>
              <div class="unclickedCategory">
                <a href="myPostingPage.me">나의 경매 목록</a>
              </div>
              <div class="clickedCategory">
                <a href="myBidPage.me">나의 입찰 목록</a>
              </div>
              <div class="cancelMember">
                <a href="deleteMemberPage.me">탈퇴하기</a>
              </div>
            </div>

            <div class="ContentContainer">
              <div>
                <text>나의 입찰 목록<text>
              </div>
              <div>
                <table class="myBidTable">
                  <tr class="bg-color">
                    <th>상품명</td>
                    <th>내 입찰 가격</td>
                    <th>입찰일</td>
                  </tr>
                  <c:forEach var="p" items="${bidList}">
	                  <tr>
	                    <td>${ p.productName }</td>
	                    <td class="ta-center">${ p.bidPrice }</td>
	                    <td class="ta-right">${ p.bidTime }</td>
	                  </tr>
                  </c:forEach>
                </table>
              </div>
            </div>
          </main>
          <%@ include file="../common/footer.jsp" %>
      </div>
      <div></div>
    </div>
  </body>

  </html>