<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="db.DBManager"%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	try {
		DBManager db = DBManager.getInstance();
		Connection con = db.open();
		String sql = "insert into article values (null, ?, ?, 0, ?)";
		PreparedStatement stmt = con.prepareStatement(sql);
		stmt.setString(1, title);
		stmt.setString(2, content);
		stmt.setString(3, "a");	
		int result = stmt.executeUpdate(); // �����̸� 1 �̻�, ���и� 0
		if(result > 0) {
			out.println("�ۼ��Ϸ�");
		} else {
			out.println("�ۼ�����");
		}
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
	} catch (SQLException e) {
		e.printStackTrace();
	}	
%>



