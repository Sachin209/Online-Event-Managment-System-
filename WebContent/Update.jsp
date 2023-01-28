<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String Pid = request.getParameter("Pid");
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
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from pay where Pid="+Pid;
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<html>
<head>
<style>
* {
  box-sizing: border-box;
}

input[type=text], select, textarea {
  width: 80%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}
input[type=number], select, textarea {
  width: 80%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}
input[type=date], select, textarea {
  width: 80%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}


h2 {
  text-align: center;
  padding: 12px;
  font-size: 44px;
  text-transform: uppercase;
  color: #8a2be2;
}

label {
  padding: 20px 20px 20px 0;
  font-size: 22px;
  display: inline-block;
}

input[type=submit] {
  background-color: #008b8b;
  color: white;
  padding: 20px 160px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: left;
}

input[type=submit]:hover {
  background-color: #800080;
}

.container {
  border-radius: 5px;
  background-color: #7fffd4;
  padding: 20px;
}

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}

.col-75 {
  float: left;
  width: 75%;
  margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
  .col-25, .col-75, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}
</style>
</head>
<body>

<h2>Customer Register Form</h2>


<div class="container">
  <form action="UpdateProcess.jsp" method="post">
  <div class="row">
    <div class="col-25">
      <label for="fname">Payment ID</label>
    </div>
    <div class="col-75">
      <input type="text" name="Pid"  readonly id="Pid" value="<%=resultSet.getInt("Pid") %>">
    </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="lname">Event Item Name</label>
    </div>
    <div class="col-75">
      <input type="text" id="EIname" name="EIname"   value="<%=resultSet.getString("EIname") %>">
    </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="lname">Payment Method</label>
    </div>
    <div class="col-75">
      <input type="text" id="Pmethod" name="Pmethod"   value="<%=resultSet.getString("Pmethod") %>">
    </div>
  </div>
  <div class="row">
    <div class="col-25">
      <label for="lname">Date</label>
    </div>
    <div class="col-75">
      <input type="date" id="Pdate" name="Pdate"  value="<%=resultSet.getString("Pdate") %>">
    </div>
  </div>
<div class="row">
    <div class="col-25">
      <label for="lname">Price</label>
    </div>
    <div class="col-75">
      <input type="number"  name="Pprice" id="Pprice" value="<%=resultSet.getString("Pprice") %>">
    </div>
  </div>
  
<br>
<br>
<br>
  <div class="row">
    <input type="submit" value="Submit">
  </div>
  </form>
<% 
 }
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%> 
</div>

</body>
</html>
