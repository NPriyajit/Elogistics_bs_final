<%@ page language="java" contentType="text/html" import="java.sql.*" %>


<html>
<head>
<title>Purchase Information</title>
<link rel="icon" type="image/ico" href="./images/imageicon.png" />
</head>

<body>

 
 <%!
 Statement stmtSave,stmtUpdate,stmtshow1;
 ResultSet rsshow1;
 String  orderno,odate,vendname,locality,city,state,slno,prodcode,prodname,prodcat,price,quant,amt,purchaseno,pdate,disper,disamt,cgst,sgst,taxamt,netamt;
 Connection conn;
 public void doConnect()
    {
      try
      {
        Class.forName("sun.jdbc.odbc.JdbcodbcDriver");
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


<%

purchaseno=request.getParameter("txtpurchno");
pdate=request.getParameter("pdate");
 orderno=request.getParameter("cmbordno");
odate=request.getParameter("odate");
 vendname=request.getParameter("txtvendname");
 locality=request.getParameter("txtlocality");
 city=request.getParameter("txtcity");
 state=request.getParameter("txtstate");
 slno=request.getParameter("slno");
 prodcode=request.getParameter("cmbprodcode");
 prodname=request.getParameter("txtprodname");
 prodcat=request.getParameter("txtprodcat");
 price=request.getParameter("price");
 quant=request.getParameter("quant");
 amt=request.getParameter("amt");
 disper=request.getParameter("disper");
 disamt=request.getParameter("disamt");
 cgst=request.getParameter("cgstper");
 sgst=request.getParameter("sgstper");
 taxamt=request.getParameter("taxamt");
 netamt=request.getParameter("netamt");


 
 doConnect();
 try
 {
   stmtUpdate=conn.createStatement();
   stmtUpdate.executeUpdate("update tblproductdetails set openingstock= openingstock +'"+quant+"' where prodcode='"+prodcode+"'");
 }
 catch(SQLException e)
 {
	 System.out.println("error"+e);
 }

 doConnect();
 try{
	 stmtSave=conn.createStatement();
	 stmtSave.executeUpdate("insert into tblpurchaseinfo  values('"+purchaseno+"','"+pdate+"','"+orderno+"','"+odate+"','"+vendname+"','"+locality+"','"+city+"','"+state+"','"+slno+"','"+prodcode+"','"+prodname+"','"+prodcat+"','"+price+"','"+quant+"','"+amt+"','"+disper+"','"+disamt+"','"+cgst+"','"+sgst+"','"+taxamt+"','"+netamt+"')");
  out.println("<table style=' align:center; padding:60px; margin-left:70px;\'>");
    out.println("  <tr><td ><img src='./images/submit.gif' style='width:582px; left:50px;  height:470px;\'></td><td><p style=' font-family: Courier, monospace; font-weight:500; font-size:20px; position: relative; margin-left:-60px;'>Data Added successfully</p></td></tr>");
     out.println("<tr><td></td><td></td><td></td>");
      out.println("  <td><button style='border-radius:4px; font-size:20px;'  onclick='window.open(\"purchaseinfoc.jsp\",\"_SELF\")'>Back</button></td>");
      out.println("</tr> </table>");
 }
 catch(SQLException e)
 {
	 System.out.println("error"+e);
 }

%>

</body>
</html>