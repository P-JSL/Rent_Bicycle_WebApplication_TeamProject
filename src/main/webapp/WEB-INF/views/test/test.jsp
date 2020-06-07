<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>상세보기</title>
<%@include file="../headers.jsp"%>
<div class="ftco-blocks-cover-1">
	<div class="site-section-cover overlay"
		data-stellar-background-ratio="0.5"
		style="background-image: url('images/hero_1.jpg')">
		<div class="container">
			<div
				class="row align-items-center justify-content-center text-center">
				<div class="col-md-7">
					<!-- header      end -->
					<span class="h4 text-primary mb-4 d-block">ようこそ</span>
					<h1 class="mb-2">日本の美しいスパ</h1>

					<p class="text-center mb-5">
						<span
							class="small address d-flex align-items-center justify-content-center">
							<span class="icon-room mr-3 text-primary"></span> <span>156/10
								Sapling Street, Harrison, ACT 2914</span>
						</span>
					</p>

					<div class="d-flex media-38289 justify-content-around mb-5">
						<div class="sq d-flex align-items-center">
							<span class="wrap-icon icon-fullscreen
"></span> <span>2911
								Sq Ft.</span>
						</div>
						<div class="bed d-flex align-items-center">
							<span class="wrap-icon icon-bed"></span> <span>100</span>
						</div>
						<div class="bath d-flex align-items-center">
							<span class="wrap-icon icon-bath"></span> <span>200</span>
						</div>
					</div>
					<!--  <p><a href="#" class="btn btn-primary text-white px-4 py-3">Learn More</a></p> -->
				</div>
			</div>
		</div>
	</div>
</div>

<style>
			img { display: block; margin: 0px auto; width:100%; position: relative;
        left: 77px; height:500px;
        
 }
 
			 table{
			  height: 300px;
   			 width: 1200px;
    			margin: 0 auto;
			
			 } 
			
td{
border-left: none; border-right: none;
 border: none; color:#343a40;
}
prod-art{
display: inline-block;
    width: 100%;
    
}
table td, th {
    border: #f8f9fa solid 1px;
    padding: 5px;
}
		</style>



</head>
<body>

	
							
							
	<%-- <%@include file="../include/menu.jsp" %> --%>
	<h2 style="padding:40" align="center">상품 정보 보기</h2>
	<table border="1">
	<div class="prod-art">
		<tr>
			<td style="border: hidden; text-align:center;">
				<%-- <img src="${path}/images/${vo.productUrl}"width="340" height="300"> --%>
				<img src="images/her.jpg" alt="Image"  
				/>
					
			</td>
			

			<td>
				<table border="1" style="height: 800px; width: 480px; border: none;">
					
					<tr align="center" style="height:10px;">
						
						<td style="border-left: none; border-right: none;">랑케레이시 T8플래그쉽버전 전기자전거 PAS 스로틀 겸용 26인치 48V 500W</td>
					</tr>
					<tr align="center" style="height:10px;">
						
						<td style="border-right: none; border-left: none; border: #08c solid 3px;">관리자</td>
					</tr>

					<tr align="center"style="height:30px;">
						
						<td style="border-right: none; border-left: none;">fmt:formatNumber value="${vo.productPrice}"
							pattern="###,###,###"/></td>
					</tr>

					<tr align="center"style="height:30px;">
						
						<td style="border-right:none; border-left: none;">${vo.productDesc}</td>
					</tr>

					<tr align="center" style="height:50px;">
						<td colspan="2" style="border: none;">
							<form name="form1" method="post"
								action="${path }/shop/cart/insert.do">
								<input type="hidden" name="productId" value="${vo.productId }">
								<select name="amount">
									<c:forEach begin="1" end="10" var="i">
										<option value="${i }">${i }</option>
									</c:forEach>

								</select>&nbsp;개 <input type="submit" value="장바구니 담기">
							</form> <a href="${path}/shop/product/list.do">상품목록</a>
						</td>
						
					</tr>
					
				</table>
				
			</td>
			</tr>
				<table border="1">
					
					<tr align="center" style="height: 100px; width: 500px;">
						
						<td>자전거</td>
					</tr>
					<tr align="center" style="height: 500px; width: 1000px;">
						
						<td>좀 사주세요 용욱이형 </td>
					</tr>

					


						
					
				</table>
				</div>
			
	</table>

<br><br><br><br>
	
	<%@include file="../footer.jsp"%>
</body>
</html>