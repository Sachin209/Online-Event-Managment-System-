<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "onlineevent";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
        
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">  
    <meta name="description" content="">
    <meta name="author" content="templatemo">

    <link href="css/viewtable.css" rel="stylesheet">
 <style>
h1 {
  text-align: center;
  padding: 12px;
  font-size: 44px;
  text-transform: uppercase;
  color: #8a2be2;
}
.button1 {
  background-color: #008b8b;
  border: none;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 10px;
  margin: 4px 2px;
  cursor: pointer;
}
 </style>   
<title>Payment Details</title>
</head>
<body>

<h1>Payment Details</h1>


        
<div class="">
			  <center>
							
							<table id="mytable" class="content-table">
								 
								 <thead>
								 <th scope="col">Payment ID</th>
								 <th scope="col">Event Item Name</th>
								 <th scope="col">Payment Method</th>
								  <th scope="col">Date</th>
								   <th scope="col">Price</th>
								   
								  
									<th>Update</th>
									
									 <th>Delete</th>
								 </thead>
				  
				  
				 <%			  
				 try {
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from pay";
resultSet = statement.executeQuery(sql);
int i=0;
while(resultSet.next()){
%>
				  <tbody>
				  
				  <tr>
				  <td><%=resultSet.getInt("Pid") %></td>
				  <td><%=resultSet.getString("EIname") %></td>
				  <td><%=resultSet.getString("Pmethod") %></td>
				  <td><%=resultSet.getString("Pdate") %></td>
				  <td><%=resultSet.getString("Pprice") %></td>
				  
				  
				   <td><a href="Update.jsp?Pid=<%=resultSet.getInt("Pid") %>"><button class="button1" data-title="Edit" data-toggle="modal" data-target="#edit" ><span class="fas fa-trash-alt"></span></button></p></a></td>
				 
				  <td><a href="Delete.jsp?Pid=<%=resultSet.getInt("Pid") %>"><button class="button1" data-title="Delete" data-toggle="modal" data-target="#delete" ><span class="fas fa-trash-alt"></span></button></p></a></td>
				  
				  </tr>
				  
				  <%
i++;
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
				  
				  </tbody>
					  
			  </table>
			</center>
			
		</div>





</div>
</div>
</div>
</div>
</body>
</html>