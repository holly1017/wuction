<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	<!DOCTYPE html>
	<html>

	<head>
		<meta charset="UTF-8">
		<title>Wuction</title>
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
				display: grid;
				grid-template-columns: repeat(12, 1fr);
				grid-gap: 10px;
			}

			.goodsBox1span4 {
				grid-column: 1/span 4;
			}

			.goodsBox5span4 {
				grid-column: 5/span 4;
			}

			.goodsBox9span4 {
				grid-column: 9/span 4;
			}

			.goodsBox {
				height: 316px;
				display: block;
				border: 0;
				cursor: pointer;
				padding: 0;
				margin: 0;
				background-color: white;
			}

			.goodsBox>div:first-child {
				width: 100%;
				height: 55%;
				background-size: cover;
				background-position: center;
			}

			.goodsBox>div:nth-child(2) {
				width: 100%;
				height: 45%;
				border-bottom: 2px solid #ffcccc;
				border-left: 2px solid #ffcccc;
				border-right: 2px solid #ffcccc;
				box-sizing: border-box;
			}

			.goodsInfo {
				width: 100%;
				height: 100%;
			}

			.goodsInfo tr:first-child>td {
				text-align: left;
				font-size: 15px;
			}

			.goodsInfoCategory {
				text-align: left;
				color: #949494;
				font-size: 12px
			}

			.goodsInfoCategory+td {
				text-align: right;
				font-size: 12px;
			}

			.fw {
				font-weight: 900;
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
							<div class="clickedCategory">
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
								<text>나의 경매 목록<text>
							</div>
							<div>
								<c:forEach var="item" items="${postingList}" varStatus="status">
								    <c:set var="boxNumber" value="${status.index % 3 * 4 + 1}" />
								    <button class="goodsBox goodsBox${boxNumber}span4" onclick="productPage(${item.postingNo})">
								        <div style="background-image: url('resources/uploadFiles/${item.imgFile}');"></div>
								        <div>
								            <table class="goodsInfo">
								                <tr>
								                    <td colspan="2">${item.productName}</td>
								                </tr>
								                <tr>
								                    <td class="goodsInfoCategory">현재가</td>
								                    <td class="fw">${item.maxPrice}원</td>
								                </tr>
								                <tr>
								                    <td class="goodsInfoCategory">입찰자수</td>
								                    <td>${item.bidCount}명</td>
								                </tr>
								                <tr>
								                    <td class="goodsInfoCategory">경매기간</td>
								                    <td>${item.endTime}</td>
								                </tr>
								            </table>
								        </div>
								    </button>
								</c:forEach>
						
							</div>
						</div>
					</main>
					<%@ include file="../common/footer.jsp" %>
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