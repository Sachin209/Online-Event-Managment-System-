<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%
	String Pid = request.getParameter("Pid");
	int no = Integer.parseInt(Pid);
	Class.forName("com.mysql.jdbc.Driver").newInstance();
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineevent","root","");
	Statement stat = conn.createStatement();
	stat.executeUpdate("delete from pay where Pid ='" +Pid+"'");
	response.sendRedirect("PaymentView.jsp");
	%>