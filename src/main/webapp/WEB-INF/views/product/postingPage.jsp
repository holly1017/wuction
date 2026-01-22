<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
      html,
      body {
        height: 100%;
        margin: 0; /* 기본 마진 제거 */
        padding: 0; /* 기본 패딩 제거 */
      }

      #container {
        display: grid;
        grid-template-columns: minmax(192px, 896px) minmax(896px, 1020px) minmax(
            192px,
            896px
          );
        width: 100%;
        height: 100%;
      }

      #content {
        display: grid;
        grid-template-rows: minmax(100px, 150px) minmax(520px, 2fr) minmax(
            100px,
            150px
          );
        height: 100%;
      }

      .posting-btn-area2 {
        display: grid;
        grid-template-columns: repeat(9, 1fr);
        grid-column-gap:20px;
        margin-top: 58px;
      }

      .posting-btn-area2 button {
        grid-column: 7 / span 2;
        width: 203px;
        height: 37px;
        border-radius: 15px;
        border-style: none;
        background-color: #31D322;
        color: white;
        font-size: 20px;
        font-weight: 900;
      }

      .posting-info-area {
        display: grid;
        grid-template-columns: repeat(9, 1fr);
        grid-column-gap:20px;
        margin-top: 56px;
      }

      .posting-info-area table {
        grid-column: 1 / span 8;
      }

      .posting-info-area tr td:first-child {
        vertical-align: top;
        font-size: 18px;
        font-weight: 500;
        color: #2C2C2C;
      }

      .posting-info-area tr {
       
      }

      .hidden-upload {
        display: none;
      }

      .upload-container {
        display: flex;
        gap: 20px; /* 이미지들 사이의 간격 조절 */
      }

      .upload {
        width: 180px;
        height: 180px;
        background-color: #EBEBEB;
        overflow: hidden;
        border: 2px solid #B0B0B0;
        display: flex;
        justify-content: center;
        align-items: center;
      }

      .img-preview {
        width: 700px;
        height: 200px;
        background-color: aquamarine;
        display: flex;
        gap: 20px;
      }

      img {
        width: 200px;
        height: 200px;
      }

      li {
        list-style: none;
      }
    </style>
</head>
<body>
    <div id="container">
      <div></div>

      <div id="content">
        <%@ include file="../common/header.jsp" %>

        <main>
        <form action="<%= contextPath %>/posting.pr" method="post" enctype="multipart/form-data">
        <!-- 세션을 통해서 받아올 회원 정보 -->
          <input name="userNo" value="${ loginUser.memNo }" type="hidden">
        
          <div class="posting-btn-area2">
            <button type="submit">등록하기</button>
          </div>

          <div class="posting-info-area">
            <table>
              <tr>
                <td>상품 이미지</td>
                <td>
                  <div class="upload-container">
                    <input class="hidden-upload" type="file" name="img1" id="hidden-upload-1" required/>
                    <div class="upload" id="upload-1"><img src="resources/images/camera-icon.png" style="width:32px; height: 32px;" alt=""></div>
                    <input class="hidden-upload" type="file" name="img2" id="hidden-upload-2" />
                    <div class="upload" id="upload-2"><img src="resources/images/camera-icon.png" style="width:32px; height: 32px;" alt=""></div>
                    <input class="hidden-upload" type="file" name="img3" id="hidden-upload-3" />
                    <div class="upload" id="upload-3"><img src="resources/images/camera-icon.png" style="width:32px; height: 32px;" alt=""></div>
                  </div>
                  <!-- TODO: 재추가 로직, 삭제 로직 -->
                </td>
              </tr>
              <tr>
                <td style="padding-top: 20px">제품명</td>
                <td style="padding-top: 20px">
                  <input type="text" name="productName" id="" style="font-size: 18px; height:40px; width: 100%; box-sizing: border-box;" required/>
                </td>
              </tr>
              <tr>
                <td style="padding-top: 40px">제품 설명</td>
                <td style="padding-top: 40px">
                  <textarea name="productInfo" id="" cols="30" rows="10" style="font-size: 18px; box-sizing: border-box; width: 100%; resize: none;" required></textarea>
                </td>
              </tr>
              <tr>
                <td style="padding-top: 40px">시작가</td>
                <td style="padding-top: 40px">
                  <input type="number" min="1000" name="startPrice" id="" style="box-sizing: border-box; width: 100%; height: 40px; font-size: 18px;" required/>
                </td>
              </tr>
              <tr>
                <td style="padding-top: 40px">입찰 단위</td>
                <td style="padding-top: 40px">
                  <input type="number" step="1000" min="1000" name="bidUnit" id="" style="box-sizing: border-box; width: 100%; height: 40px; font-size: 18px;" required/>
                </td>
              </tr>
              <tr>
                <td style="padding-top: 40px">카테고리</td>
                <td style="padding-top: 40px">
                  <select name="categoryNo" id="" style="width:280px; height:40px; font-size: 18px;">
                    <option value="1">의류</option>
                    <option value="2">전자제품</option>
                    <option value="3">기타 제품</option>
                  </select>
                </td>
              </tr>
              <tr>
                <td style="padding-top: 40px">마감시간</td>
                <td style="padding-top: 40px">
                  <input type="datetime-local" name="endTime" id="date" style="width:280px; height:40px; font-size: 18px;" required/>
                </td>
              </tr>
            </table>
          </div>
          <br><br><br><br><br><br><br>
          </form>
        </main>

        <%@ include file="../common/footer.jsp" %>
      </div>

      <div></div>
    </div>
  </body>
  <script>
    function loadFile(file, container) {
      const newImage = document.createElement("img");
      newImage.src = URL.createObjectURL(file);
      newImage.style.width = "100%";
      newImage.style.height = "100%";
      newImage.style.objectFit = "cover";
      container.innerHTML = '';
      container.appendChild(newImage);
    }

    function getImageFiles(e) {
      const file = e.target.files[0];
      const container = e.target.nextElementSibling;
      if (file && file.type.match("image/.*")) {
        loadFile(file, container);
      } else {
        alert("이미지 파일만 업로드가 가능합니다.");
      }
    }

    document.querySelectorAll('.hidden-upload').forEach(input => {
      input.addEventListener('change', getImageFiles);
    });

    document.querySelectorAll('.upload').forEach(upload => {
      upload.addEventListener('click', () => {
        upload.previousElementSibling.click();
      });
    });
    
    document.addEventListener("DOMContentLoaded", function() {
        // 현재 날짜 가져오기
        let today = new Date();
        // 다음 날 계산
        today.setDate(today.getDate() + 1);
        // yyyy-mm-dd 형식으로 변환
        let nextDay = today.toISOString().split('T')[0];
        // input 요소에 최소값 설정
        document.getElementById('date').setAttribute('min', nextDay);
    });
  </script>
</html>