<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title>Wuction</title>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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

      .infoTable {
        height: 180px;
        width: 336px
      }

      .height-22 {
        height: 22px;
      }

      .infoList {
        font-size: 15px; font-weight: normal;
      }
      #btnTable {
        text-align: center;
        width: 336px;
        padding-bottom: 20px;
      }
      .cancel-btn{
        width: 100px;
        height: 30px;
        background-color: #ff0000;
        color: #ffffff;
        border-radius: 10px;
        border-style: none;
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
                <form action="<%= contextPath %>/delete.me" method="post">
                  <table class="infoTable" method="post" >
                    <tr>
                      <td class="infoList">비밀번호 확인</td>
                      <td><input type="password" class="height-22" name="userPwd" required></td>
                    </tr>
                  </table>
                  <table id="btnTable">
                    <tr>
                      <td><button class="cancel-btn">탈퇴하기</button></td>
                    </tr>
                  </table>
              </form>
              </div>
            </div>
          </main>
          <%@ include file="../common/footer.jsp" %>
      </div>
      <div></div>
    </div>
    
  </body>

  </html>