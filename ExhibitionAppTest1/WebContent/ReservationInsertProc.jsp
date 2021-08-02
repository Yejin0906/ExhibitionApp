<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/dbconn.jsp" %>
<%
	String exidx = request.getParameter("exidx");
	String extitle = request.getParameter("extitle");
	String genre = request.getParameter("genre");
	String author = request.getParameter("author");
	String rating = request.getParameter("rating");
	String texts = request.getParameter("texts");
	String placename = request.getParameter("placename");
	int exprice = Integer.parseInt(request.getParameter("exprice"));
	String sdate = request.getParameter("sdate");
	String edate = request.getParameter("edate");
	String docent = request.getParameter("docent");

	
	String sql = "UPDATE members SET exidx = ? , extitle = ? , genre = ?, author=?, rating=?, texts=?, placename=?, exprice=?, sdate=?, sdate=?, docent=?  where exhibition  = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,exidx);
	pstmt.setString(2,extitle);
	pstmt.setString(3,genre);
	pstmt.setString(4,author);
	pstmt.setString(5,rating);
	pstmt.setString(6,texts);
	pstmt.setString(7,placename);
	pstmt.setInt(8,exprice);
	pstmt.setString(9,sdate);
	pstmt.setString(10,edate);
	pstmt.setString(11,docent);

	int rs1 = pstmt.executeUpdate();

	if(rs1 > 0){
		response.sendRedirect("Reservation.jsp");
	}
	

%>