<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/onlineevent";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%
String Pid = request.getParameter("Pid");
String EIname =request.getParameter("EIname");
String Pmethod =request.getParameter("Pmethod");
String Pdate=request.getParameter("Pdate");
String Pprice=request.getParameter("Pprice");





if(Pid != null)
{
Connection con = null;
PreparedStatement ps = null;
int personID = Integer.parseInt(Pid);
try
{
Class.forName(driverName);
con = DriverManager.getConnection(url,user,psw);
String sql="Update pay set Pid=?,EIname=?,Pmethod=?,Pdate=?,Pprice=? where Pid="+personID;
ps = con.prepareStatement(sql);
ps.setInt(1, personID);
ps.setString(2,EIname);
ps.setString(3,Pmethod);
ps.setString(4,Pdate);
ps.setString(5,Pprice);

int i = ps.executeUpdate();
if(i > 0)
{
	

RequestDispatcher rd = request.getRequestDispatcher("PaymentView.jsp");
rd.include(request, response);
}
else
{
out.print("There is a problem in updating Record.");

}
}
catch(SQLException sql)
{
request.setAttribute("error", sql);
out.println(sql);
}
}
%> 