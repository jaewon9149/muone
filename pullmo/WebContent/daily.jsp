<%@page import="com.ProductDTO"%>
<%@page import="java.util.Vector"%>
<%@page import="com.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("UTF-8");
	String id=(String) session.getAttribute("id");
	System.out.println(id);
	ProductDAO pdao = new ProductDAO();
	Vector<ProductDTO> list = pdao.selectAll();
%>
<!DOCTYPE>
<html>
<%@ include file="front_header.jsp"%>
<body>
	<%@ include file="header.jsp"%>
	<div id="bener">
		<img src="./image/dailymain.png" alt="" id="mainImg1">
		<div class="inner">
			<div class="daily-banner">
				</div>
				<div id="recom">
					<h3 id="recom-logo">매일매일,먹어봐요</h3>
					<div class="swiper-wrapper">
						<%
							for (int i = 0; i < 4; i++) {
								ProductDTO dto = list.get(i);
						%>
						<a href="dailyInfo.jsp?num=<%=dto.getNum() %>" class="recom-part">
							<img src="<%=dto.getMainimg()%>" alt="" class="recom-goods-img">
							<div class="goods-info">
								<span class="goods-brand"><%=dto.getCategory()%></span>
								<span class="goods-name"><%=dto.getName()%></span>
								<span class="goods-price"><%=dto.getPrice()%>원</span>
								<div class="goods-wrap-item">	
									<div class="goods-delfree">무료배송</div>
									<form action="dailyProc.jsp" >
										<button class="add-cart" style="cursor: pointer"onclick="functtion(e)"  name="num" value="<%=dto.getNum()%>">
											<input type="hidden" name="user_id" value="<%= (String) session.getAttribute("id")%>"> 
										<img src="./image/showcart.png" alt="" class="cart">
									</button>
									</form>
								</div>
							</div>
						</a>
						<%
							}
						%>
					</div>
				</div>
		</div>
	</div>
	<div id="contents">
		<ul class="tabs">
			<label for="" class="daily-tab-list" style="cursor: pointer">
				<li class="active" rel="tab1"><img src="./image/dailytab1.png"
					alt="" class="nav-icon">녹즙</li>

			</label>
			<label for="" class="daily-tab-list" style="cursor: pointer">
				<li class="active" rel="tab2"><img src="./image/dailytab2.png"
					alt="" class="nav-icon">디자인밀</li>
			</label>
			<label for="" class="daily-tab-list" style="cursor: pointer">
				<li class="active" rel="tab3"><img src="./image/dailytab3.png"
					alt="" class="nav-icon">베이비밀</li>
			</label>
		</ul>
		<div class="inner">
			<div class="contents">
				<nav class="nav-daily-shipping">
				<div id="tab1" class="tab_content">
					<div class="result-header">

						<div class="result-total">
							총<span class="count">12</span>개
						</div>
					</div>
					<ul class="product-list">
					<%
						for (int i = 0; i < 12; i++) {
							ProductDTO dto = list.get(4 + i);
					%>
					
													<a href="dailyInfo.jsp?num=<%=dto.getNum() %>" class="recom-part">
							<img src="<%=dto.getMainimg()%>" alt="" class="recom-goods-img">
							<div class="goods-info">
								<span class="goods-brand"><%=dto.getCategory()%></span>
								<span class="goods-name"><%=dto.getName()%></span>
								<span class="goods-price"><%=dto.getPrice()%>원</span>
								<div class="goods-wrap-item">	
									<div class="goods-delfree">무료배송</div>
									<form action="dailyProc.jsp" >
										<button class="add-cart" style="cursor: pointer"onclick="functtion(e)"  name="num" value="<%=dto.getNum()%>">
											<input type="hidden" name="user_id" value="<%= (String) session.getAttribute("id")%>"> 
										<img src="./image/showcart.png" alt="" class="cart">
									</button>
									</form>
								</div>
									
							</div>
						</a>
					
					<%
						}
					%>
					</ul>
				</div>
				<!-- #tab1 --> <!-- #tab2 -->
				<div id="tab2" class="tab_content">
					<div class="result-header">

						<div class="result-total">
							총<span class="count">7</span>개
						</div>
						<div class="result-listType">
							<div class="result-header-sort">
								<label for=""><input type="radio" value="high-price"
									name="priceD"><span>높은가격</span></label> <label for=""><input
									type="radio" value="low-price" name="priceD"><span>낮은가격</span></label>
							</div>

						</div>
					</div>
					<ul class="product-list">
					<%
						for (int i = 0; i < 7; i++) {
							ProductDTO dto = list.get(16 + i);
					%>
													<a href="dailyInfo.jsp?num=<%=dto.getNum() %>" class="recom-part">
							<img src="<%=dto.getMainimg()%>" alt="" class="recom-goods-img">
							<div class="goods-info">
								<span class="goods-brand"><%=dto.getCategory()%></span>
								<span class="goods-name"><%=dto.getName()%></span>
								<span class="goods-price"><%=dto.getPrice()%>원</span>
								<div class="goods-wrap-item">	
									<div class="goods-delfree">무료배송</div>
									<form action="dailyProc.jsp" >
										<button class="add-cart" style="cursor: pointer"onclick="functtion(e)"  name="num" value="<%=dto.getNum()%>">
											<input type="hidden" name="user_id" value="<%= (String) session.getAttribute("id")%>"> 
										<img src="./image/showcart.png" alt="" class="cart">
									</button>
									</form>
								</div>
									
							</div>
						</a>
					<%
						}
					%>
					</ul>
				</div>
				<!-- #tab2 --> <!-- #tab3 -->
				<div id="tab3" class="tab_content">
					<div class="result-header">

						<div class="result-total">
							총<span class="count">11</span>개
						</div>
						<div class="result-listType">
							<div class="result-header-sort">
								<label for=""><input type="radio" value="high-price"
									name="priceB"><span>높은가격</span></label> <label for=""><input
									type="radio" value="low-price" name="priceB"><span>낮은가격</span></label>
							</div>

						</div>
					</div>
					<ul class="product-list">
					<%
						for (int i = 0; i < 11; i++) {
							ProductDTO dto = list.get(23 + i);
					%>
												<a href="dailyInfo.jsp?num=<%=dto.getNum() %>" class="recom-part">
							<img src="<%=dto.getMainimg()%>" alt="" class="recom-goods-img">
							<div class="goods-info">
								<span class="goods-brand"><%=dto.getCategory()%></span>
								<span class="goods-name"><%=dto.getName()%></span>
								<span class="goods-price"><%=dto.getPrice()%>원</span>
								<div class="goods-wrap-item">	
									<div class="goods-delfree">무료배송</div>
									<form action="dailyProc.jsp" >
										<button class="add-cart" style="cursor: pointer"onclick="functtion(e)"  name="num" value="<%=dto.getNum()%>">
											<input type="hidden" name="user_id" value="<%= (String) session.getAttribute("id")%>"> 
										<img src="./image/showcart.png" alt="" class="cart">
									</button>
									</form>
								</div>
									
							</div>
						</a>

					<%
						}
					%>
					</ul>
				</div>
				</nav>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.3.js"
		integrity="sha256-nQLuAZGRRcILA+6dMBOvcRh5Pe310sBpanc6+QBmyVM="
		crossorigin="anonymous"></script>
	<script>
		$(function() {
			$(".tab_content").hide();
			$(".tab_content:first").show();

			$("ul.tabs li").click(function() {
				$("ul.tabs li").removeClass("active").css("color", "#555");
				$(this).addClass("active").css("color", "#80c342");
				$(".tab_content").hide()
				var activeTab = $(this).attr("rel");
				$("#" + activeTab).fadeIn()
			});
		});
	</script>
	<%@ include file="TopBtn.jsp"%>
	<%@include file="footer.jsp"%>
</body>
</html>