<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }

        .container {
            display: grid;
            grid-template-columns: minmax(192px, 896px) minmax(896px, 1020px) minmax(192px, 896px);
            width: 100%;
            height: 100%;
        }

        .content {
            display: grid;
            grid-template-rows: minmax(100px, 150px) minmax(520px, 2fr) minmax(100px, 150px);
            height: 100%;
        }

        main {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            grid-column-gap: 20px;
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
                <div class="main-GoodsTextArea">
                    "${keyword}"의 검색 결과
                </div>
                <div style="height: 45px"></div>
                <div class="goodsContainer">
                    <c:if test="${not empty pList}">
                        <c:forEach var="post" items="${pList}">
                            <button onclick="productPage(${post.postingNo});" class="goodsArea">
                                <div class="goodsImg" style="background-image: url('resources/uploadFiles/${post.imgFile}');"></div>
                                <div>
                                    <table class="goodsInfoTable">
                                        <tr>
                                            <td colspan="2">${post.productName}</td>
                                        </tr>
                                        <tr>
                                            <td>현재가</td>
                                            <td>${post.maxPrice}원</td>
                                        </tr>
                                        <tr>
                                            <td>입찰자수</td>
                                            <td>${post.bidCount}명</td>
                                        </tr>
                                        <tr>
                                            <td>경매기간</td>
                                            <td>${post.endTime}</td>
                                        </tr>
                                    </table>
                                </div>
                            </button>
                        </c:forEach>
                    </c:if>
                    <c:if test="${ empty pList }"><h2>검색 결과가 없습니다.</h2></c:if>
                </div>
            </main>
            <%@ include file="footer.jsp" %>
        </div>
        <div></div>
    </div>

    <script>
    function productPage(postingNo) {
        location.href = "detail.pr?postingNo=" + postingNo;
    }
    </script>
</body>
</html>
