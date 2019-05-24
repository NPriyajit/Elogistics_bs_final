
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
    String  vendname;
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

<h3   style="text-align:center;padding-bottom:15px;">Purchase Information [Any] &nbsp;<sup><small class="text-muted">Report</small></sup></h3>

  
  <div class="well" style="border-top: solid black;border-bottom: solid black ;" >
          <div class="container">

                  <form name="f1" id="myForm" action="rptpurchasebynames.jsp" >
                        <table class="table table-borderless ">
                            <div>
                               <tr>
                                <td >
                                    Vendor Name:
                                </td>
                                 <td>
                          <div class="col-xs-4" >
                                    <select name="cmbvendname"  id="inputs" class="form-control input-sm" >
                                      <option value="">-Select-</option>
                       <%
                           doConnect();
                           try{
                           stmtfill=conn.createStatement();
                           rsfill=stmtfill.executeQuery("select * from tblvendorinfo");
                           while(rsfill.next()){
                             vendname=rsfill.getString("vendname");
                             %>
                             <option value="<%=vendname%>"><%=vendname %></option>
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
                            <input id="btn" class="btn btn-danger" type="Reset" name="btndel" value="Reset" >
                            
                        </div>
                </form>

      <%@ include file="footer.jsp" %>
        </div>
</body>
</html>
