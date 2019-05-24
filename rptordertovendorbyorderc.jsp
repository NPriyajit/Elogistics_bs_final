
<%@ page language="java" contentType="text/html" import="java.sql.*" %>

<html>
<title>Report Product Information</title>
<%@ include file="header.jsp" %>
<head>


</head>

<body>
     <%!
    Connection conn;
    Statement stmtfill,stmtshow;
    ResultSet rsfill,rsshow;
    String  ordno;
    int i;
    public void doConnect()
    {
     try
      {
        Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
      }
      catch(ClassNotFoundException e)
      {
        System.out.println("A error"+e);
      }
      try
      {
        conn=DriverManager.getConnection("jdbc:odbc:LocalServer","sa","root");
      }
      catch(SQLException e)
      {
        System.out.println("B error");
      }
    }
    %>

<h3   style="text-align:center;padding-bottom:15px;">Order Information [Any] &nbsp;<sup><small class="text-muted">Report</small></sup></h3>

  
  <div class="well" style="border-top: solid black;border-bottom: solid black ;" >
          <div class="container">

                  <form name="f1" id="myForm" action="rptordertovendorbyorders.jsp" >
                        <table class="table table-borderless ">
                            <div>
                               <tr>
                                <td >
                                    Order No:
                                </td>
                                 <td>
                          <div class="col-xs-4" >
                                    <select name="cmbordno"  id="inputs" class="form-control input-sm" >
                                        <option value="">-Select-</option>
                       <%
                           doConnect();
                           try{
                           stmtfill=conn.createStatement();
                           rsfill=stmtfill.executeQuery("select * from tblorderinfo");
                           while(rsfill.next()){
                             ordno=rsfill.getString("orderno");
                             %>
                             <option value="<%=ordno%>"><%=ordno%></option>
                             <%
                           }
                         }
                         catch(SQLException se){
                           out.println("Error 2");
                         }
                       %>
                                    </select>
                                    </div>
                                </td>
                            </tr>
                          </table>
                        <div class="btn">
                            <input id="btn" class="btn btn-primary" type="submit" name="btnup" value="Show">
                            <input id="btn" class="btn btn-danger" type="button" name="btndel" value="Reset" >
                            
                        </div>
                </form>

      <%@ include file="footer.jsp" %>
        </div>
</body>
</html>
