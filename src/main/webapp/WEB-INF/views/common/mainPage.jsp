<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<style>
    html,
    body {
      height: 100%;
      margin: 0;
      /* 기본 마진 제거 */
      padding: 0;
      /* 기본 패딩 제거 */
    }

    .container {
      display: grid;
      grid-template-columns: minmax(192px, 896px) minmax(896px, 1020px) minmax(192px,
          896px);

      width: 100%;
      height: 100%;
    }

    .content {
      display: grid;
      grid-template-rows: minmax(100px, 150px) minmax(520px, 2fr) minmax(100px,
          150px);
      height: 100%;
    }

    main {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      grid-column-gap: 20px;
    }

    .main-adArea {
      height: 336px;
      display: flex;
      flex-direction: column;
      grid-column: 1 / span 4;
    }

    .main-adTextArea {
      flex: 2;
      font-weight: bold;
      display: flex;
      align-items: flex-end;
    }

    .main-adTextArea > text > b {
      background: linear-gradient(to right top, #ff0101, #e1ff00);
      color: transparent;
      -webkit-background-clip: text;
      font-size: 30px;
    }

    .slider-container {
      flex: 5;
      overflow: hidden;
      position: relative;
    }

    .slides {
      display: flex;
      height: 100%;
      transition: transform 0.5s ease-in-out;
    }

    .slide {
      min-width: 100%;
      height: 100%;
      display: flex;
      flex-direction: row;
      align-items: center;
      justify-content: center;
      background-color: rgb(255, 255, 255);
      color: #2c2c2c;
      font-size: 15px;
      font-weight: bold;
      border: 2px solid #e5e5e5;
      box-sizing: border-box;
    }

    .slide>div {
      width: 100%;
      height: 100%;
      object-fit: cover;
    }

    .slide-description {
      text-align: center;
      font-size: 16px;
      margin-top: 10px;
    }

    .prev,
    .next {
      position: absolute;
      top: 50%;
      transform: translateY(-50%);
      background-color: #ffffff00;
      color: rgb(146, 146, 146);
      border: none;
      padding: 10px;
      cursor: pointer;
    }

    .prev {
      left: 0.5%;
      font-size: x-large;
    }

    .next {
      right: 0.5%;
      font-size: x-large;
    }

    .prevNextButtonArea, .adContentArea > div {
      flex: 1;
    }

    .adContentArea {
      flex: 12; display: flex
    }

    .adContentArea > div > button {
      width: 100%;
      height: 100%;
      cursor: pointer;
      border: 0px;
      margin: 0px;
      padding: 0px;
    }

    .adContentArea > div > button > img {
      width: 100%;
      height: 100%
    }

    .adContentArea > div > table {
      width: 100%;
      height: 100%
    }

    .adGoodsTitle {
      text-decoration: none;
      color: #000000
    }

    .adContentArea table tr td:first-child {
      color: #949494
    }

    .adContentArea table tr td:nth-child(2) {
      text-align: right
    }

    .main-GoodsTextArea {
      grid-column: 1 / span 4;
      height: 150px;
      font-size: 25px;
      color: #2c2c2c;
      font-weight: normal;
      display: flex;
      align-items: flex-end;
    }

    .goodsArea {
      height: 316px;
      display: block;
      border: 0;
      cursor: pointer;
      padding: 0;
      margin: 0;
      background-color: white;
      margin-bottom: 5%;
    }

    .goods1span3 {
      grid-column: 1 / span 1;
    }

    .goodsImg {
      width: 100%;
      height: 55%;
      background-size: cover;
      background-position: center;
    }

    .goodsImg + div {
      width: 100%;
      height: 45%;
      border-bottom: 2px solid #ffcccc;
      border-left: 2px solid #ffcccc;
      border-right: 2px solid #ffcccc;
      box-sizing: border-box;
    }

    .goodsInfoTable {
      width: 100%;
      height: 100%
    }

    .goodsInfoTable tr td:first-child {
      text-align: left;
      color: #949494;
      font-size: 12px
    }

    .goodsInfoTable tr td:nth-child(2) {
      text-align: right;
      font-size: 12px;
    }

    .goodsInfoTable tr:nth-child(2) td {
      font-weight: 900
    }

    .goodsInfoTable tr:first-child td {
      font-size: 15px;
      color:#2c2c2c;
    }

    .goodsContainer {
      display: grid;
      grid-template-columns: repeat(4, 1fr);
      grid-column-gap: 20px;
      grid-column: 1 / 5;
    }


  </style>
</head>
<body>
  <div class="container">
    <div></div>
    <div class="content">
      <%@ include file="header.jsp" %>
      <main>
        <div class="main-adArea">
          <div class="main-adTextArea">
            인기
            <text><b>대폭발</b></text>
            상품 모음!!!!
          </div>
          <div class="slider-container">
            <div class="slides" id="slides">
           
            </div>
            <button class="prev" onclick="moveSlide(-1)">&#10094;</button>
            <button class="next" onclick="moveSlide(1)">&#10095;</button>
          </div>
        </div>
        <div class="main-GoodsTextArea">
          현재 상품
        </div>
        <div style="height: 45px"></div>
        <div class="goodsContainer">
	       
        </div>
      </main>
      <%@ include file="footer.jsp" %>
    </div>
    <div> </div>

  </div>

  <script>
    let currentSlide = 0;

    function moveSlide(step) {
      const slides = document.getElementById("slides");
      const totalSlides = slides.children.length;
      currentSlide = (currentSlide + step + totalSlides) % totalSlides;
      slides.style.transform = "translateX(-" + currentSlide * 100 + "%)";
    }

    window.onload = function() {
    	loadTopPosting();
        loadPosting();
    };
    
    function loadTopPosting() {
        $.ajax({
            url: 'loadTopPosting.pr',
            dataType: 'json',
            success: function(posts) {
                const slidesContainer = document.getElementById("slides");
                slidesContainer.innerHTML = ""; // 기존 슬라이드 내용 초기화
                let slideHTML = ""; // 슬라이드 HTML을 누적할 변수

                for (let i = 0; i < posts.length; i += 2) {
                    slideHTML += "<div class='slide'>"
                                + "<div class='prevNextButtonArea'></div>"
                                + "<div class='adContentArea'>"
                                + "<div><button onclick='productPage(" + posts[i].postingNo + ")'><img src='resources/uploadFiles/" + posts[i].imgFile + "' alt='" + posts[i].productName + "'/></button></div>"
                                + "<div>"
                                + "<table>"
                                + "<tr>"
                                + "<td colspan='2'>"
                                + "<a href='#' class='adGoodsTitle'>" + posts[i].productName + "</a>"
                                + "</td>"
                                + "</tr>"
                                + "<tr>"
                                + "<td>현재가</td>"
                                + "<td>" + posts[i].maxPrice + "원</td>"
                                + "</tr>"
                                + "<tr>"
                                + "<td>입찰자</td>"
                                + "<td>" + posts[i].bidCount +  "명</td>"
                                + "</tr>"
                                + "<tr>"
                                + "<td>경매기간</td>"
                                + "<td>" + posts[i].endTime + "</td>"
                                + "</tr>"
                                + "</table>"
                                + "</div>"
                                + "</div>";

                    // 두 번째 게시물이 있을 경우 추가
                    if (i + 1 < posts.length) {
                        slideHTML += "<div class='adContentArea'>"
                                   + "<div><button onclick='productPage(" + posts[i + 1].postingNo + ")'><img src='resources/uploadFiles/" + posts[i + 1].imgFile + "' alt='" + posts[i + 1].productName + "'/></button></div>"
                                   + "<div>"
                                   + "<table>"
                                   + "<tr>"
                                   + "<td colspan='2'>"
                                   + "<a href='#' class='adGoodsTitle'>" + posts[i + 1].productName + "</a>"
                                   + "</td>"
                                   + "</tr>"
                                   + "<tr>"
                                   + "<td>현재가</td>"
                                   + "<td>" + posts[i + 1].maxPrice + "원</td>"
                                   + "</tr>"
                                   + "<tr>"
                                   + "<td>입찰자</td>"
                                   + "<td>" + posts[i + 1].bidCount +  "명</td>"
                                   + "</tr>"
                                   + "<tr>"
                                   + "<td>경매기간</td>"
                                   + "<td>" + posts[i + 1].endTime + "</td>"
                                   + "</tr>"
                                   + "</table>"
                                   + "</div>"
                                   + "</div>";
                    }

                    slideHTML += "<div class='prevNextButtonArea'></div>"
                               + "</div>"; // slide div 닫기
                }

                slidesContainer.innerHTML = slideHTML; // 슬라이드 내용 추가
                console.log("파일 로드 성공");
            },
            error: function(err) {
                console.log("파일 로드 실패", err);
            }
        });
    }






    
    function loadPosting() {
        $.ajax({
            url: 'loadPosting.pr',
            method: 'GET',
            dataType: 'json',
            success: function(posts) {
                const containers = document.getElementsByClassName("goodsContainer");
                if (containers.length === 0) {
                    console.error("No elements with class 'goodsContainer' found.");
                    return;
                }
                const container = containers[0]; // 첫 번째 컨테이너를 선택
                let htmlContent = ''; // HTML 문자열을 저장할 변수

                posts.forEach(function(post, index) {
                    const buttonClass = index === 0 ? 'goods1span3 goodsArea' : 'goodsArea';
                    const postHTML = 
                        '<button onclick="productPage(' + post.postingNo + ');" class="' + buttonClass + '">' +
                            '<div class="goodsImg" style="background-image: url(\'resources/uploadFiles/' + post.imgFile + '\');"></div>' +
                            '<div>' +
                                '<table class="goodsInfoTable">' +
                                    '<tr>' +
                                        '<td colspan="2">' + post.productName + '</td>' +
                                    '</tr>' +
                                    '<tr>' +
                                        '<td>현재가</td>' +
                                        '<td>' + post.maxPrice + '원</td>' +
                                    '</tr>' +
                                    '<tr>' +
                                        '<td>입찰자수</td>' +
                                        '<td>' + post.bidCount + '명</td>' +
                                    '</tr>' +
                                    '<tr>' +
                                        '<td>경매기간</td>' +
                                        '<td>' + post.endTime + '</td>' +
                                    '</tr>' +
                                '</table>' +
                            '</div>' +
                        '</button>';
                    htmlContent += postHTML; // 모든 게시물의 HTML을 누적
                });
                container.innerHTML = htmlContent; // 모든 HTML을 한 번에 추가
            },
            error: function(err) {
                console.error("파일 로드에 실패했습니다.", err);
            }
        });
    }
    
    function productPage(postingNo) {
        location.href = "detail.pr?postingNo=" + postingNo;
    }
  </script>
</body>
</html>