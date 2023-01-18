<%@page import="com.UserDAO"%>
<%@page import="com.BoardDTO"%>
<%@page import="com.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <%
 	int num = Integer.parseInt(request.getParameter("num"));
 	UserDAO dao = new UserDAO();
 	BoardDAO bdao = new BoardDAO();
 	BoardDTO bdto = bdao.boardSelectOne(num);
 	
 	
 	String id = (String) session.getAttribute("id");
 	String password = dao.getPass(id);
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ include file="front_header.jsp" %>
<title>Insert title here</title>
			<style>
				* {
					padding: 0;
					box-sizing: border-box;
					margin: 0;
				}

				body {
					letter-spacing:-1.5px;
				}

				.sec_table {
					padding: 50px 0;
				}
				
				.table{
					margin-bottom:100px;
					padding:25px;
				}


				h2 {
					padding: 20px 0;
					font-size: 26px;
					border-bottom: 3px solid #000;
					margin-bottom: 25px;
				}

				.line {
					display: flex;
					justify-content:space-between;
				}
				
				
				.line input[type="text"]{width:90%; height:50px;}
				.line input[type="submit"]{}
				
				

				
				.ad{font-size:18px;}
				.ad .num{padding:15px 0;}
				.ad .subject{padding-bottom:10px; font-weight:bold; font-size:25px;}
				.ad ul{display:flex; font-size:17px; color:#555; padding-bottom:50px;}
				.ad ul li{margin-right:10px;}
				.ad .context{font-size:26px;}

				
				.reple .reple_item{border-bottom:1px solid #e5e5e5; padding:25px; background: #f7f7f7;}
				
				.reple ul{display:flex; margin-bottom:10px;}
				.reple ul li{margin-right: 8px; color:#555; font-size:16px}
				.reple ul li:last-child{color:#b3b3b3; font-size:14px; padding-top:3px;}
				
				
				

			</style>
</head>
<body>
				<%@ include file="header.jsp" %>
		
					<div class="sec_table">
						<div class="inner">
							<div class="table">
								<h2><%=bdto.getSubject() %></h2>
								<div class="ad">
									<p class="num">글번호 : <%=bdto.getNum() %></p>
									<ul>
										<li>작성자 : <%=bdto.getWriter() %></li>
										<li>작성날짜 : <%=bdto.getReg_date() %></li>
									</ul>
									<p class="context">내용</p>
								</div>
							</div>
							<div class="reple">
								<div class="reple_item">
									<ul>
										<li class="rwriter"><%=bdto.getWriter() %></li>
									</ul>
									<h5>
										<form action="boardinfoProc.jsp">
											<div class="line">
												<input type="hidden" name="writer" value="<%=id %>">
												<input type="hidden" name="password" value="<%=password %>">
												<input type="hidden" name="ref" value="<%=bdto.getNum() %>">
												<input type="text" name="context">
												<input type="submit" value="댓글작성">
											</div>
										</form>
									</h5>
								</div>
							</div>
							<div class="reple">
								<div class="reple_item">
									<ul>
										<li class="rwriter">dbrjsdml</li>
										<li class="rtime">20212</li>
									</ul>
									<h5>헐 미친</h5>
								</div>
								<div class="reple_item">
									<ul>
										<li class="rwriter">dbrjsdml</li>
										<li class="rtime">20212</li>
									</ul>
									<h5>헐 미친</h5>
								</div>
							</div>
						</div>
					</div>


			<%@ include file="footer.jsp" %>
	</body>
</html>