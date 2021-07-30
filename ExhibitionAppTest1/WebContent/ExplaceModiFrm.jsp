<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/Header.jsp"%>
<%@ include file="./include/incLogin.jsp"%>
<br/><br/>
<h3>전시관 정보 수정</h3>
<%
	String code = request.getParameter("CodeChk");
	
	
	String placename ="";
	String slocation =""; 
	String contactno =""; 
	String times =""; 
	String texts ="";  
	String holiday ="";
	
	
	
	String sql = "select * from exprice where codes = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, code);
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		do{
			codes = rs.getString("codes");
			placename = rs.getString("placename");
			rslocation = rs.getString("rslocation");
			contactno = rs.getString("contactno");
			times= rs.getString("times");
			texts= rs.getString("texts");
			holiday= rs.getString("holiday");
			
	
		%>
<section class="row">
<form action="ExplaceModiFrmProc.jsp">
<div class="col-md-12">
	<table class="table table-striped">
		<tr>
			<th>전시관 코드(수정불가)</th>
			<td>
			<input type="text" class="form-control" value="<%=codes %>" name="codes" disabled/>
			
			</td>
		</tr>
		<tr>
			<th>전시관이름</th>
			<td>
			<input type="text" class="form-control" name="placename"value="<%=placename %>"/>
			전시관 코드 가져와서 찍어준 후 수정가능</td>
		</tr>
		<tr>
			<th>위치</th>
			<td>
			<input type="text" class="form-control" name="slocation"value="<%=rslocation %>"/>
			위치가져와서 찍어줌</td>
		</tr>
		<tr>
			<th>연락처</th>
			<td>
			<input type="text" class="form-control" name="contactno"value="<%=contactno %>"/>
			</td>
		</tr>
		<tr>
			<th>개관시간</th>
			<td>
				<h4 class="text-primary">현재운영 시간 : <%out.println(times.substring(1, 3) + "시~" + times.substring(4, 6)+"까지"); %></h4>
				<div class="form-group form-inline">
				OPEN : <input type="text" class="form-inline form-control" value="<%=times.substring(1, 3) %>" name="n1"/>
				&nbsp;&nbsp;&nbsp;
				CLOSE : <input type="text" class="form-inline form-control" value="<%=times.substring(4, 6) %>" name="n2"/>
				
				</div>
	
			</td>
		</tr>
		<tr>
			<th>휴관일</th>
			<td>
			<input type="text" class="form-inline form-control" value="<%=holiday %>" name="holiday"/>
			</td>
		</tr>
	
		<tr>
			<th colspan="2">
			<input type="submit" class="form-inline form-control"/ value="" name="">
			</th>
			
		</tr>
	</table>
</div>
</form>
</section>
		
		<% 
			
		}while(rs.next());
	}else{out.println("조회 실패");}
%>
<%@ include file="./include/Footer.jsp"%>