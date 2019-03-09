<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="java.util.HashMap"%>
<%@page import="com.sun.org.apache.bcel.internal.generic.AALOAD"%>
<%@page import="java.util.ArrayList"%>
<%@page import="pack.decryption"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="network.DbConnection"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>SeSPHR: A Methodology for Secure Sharing of Personal Health Records in the Cloud</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="css/coin-slider.css" />
<script type="text/javascript" src="js/cufon-yui.js"></script>
<script type="text/javascript" src="js/cufon-aller.js"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript" src="js/coin-slider.min.js"></script>
</head>
<body>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1><a href="index.html">SeSPHR: A Methodology for Secure Sharing of Personal Health Records in the Cloud</a></h1>
      </div>
      <div class="menu_nav">
        <ul>
<!--          <li class="active"><a href="admin_home.jsp"><span>Admin Home</span></a></li>
          <li><a href="user_de.jsp"><span>User Details</span></a></li>
          <li><a href="owner_de.jsp"><span>Owner Details</span></a></li>
          <li><a href="research_de.jsp"><span>Researcher Details</span></a></li>-->
          <li><a href="view_o_p_d.jsp"><span>Back</span></a></li>
        </ul>
      </div>
      <div class="clr"></div>
     
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
      <div class="content_resize">
<!-- start body---->

<div id="content">
          <%
//HttpSession user=request.getSession();
//String uname=user.getAttribute("username").toString();   
//String name=user.getAttribute("name").toString();  
  
String id=request.getQueryString();
String fname=null;

Connection con= DbConnection.getConnection();
Statement st=con.createStatement();
ResultSet rt=st.executeQuery("select * from patient_details where id='"+id+"'");
StringBuffer sb=new StringBuffer();
if(rt.next()){
    String fkey=rt.getString("master_key");
    fname=rt.getString("filename");
    InputStream is=rt.getAsciiStream("content");
    BufferedReader br=new BufferedReader(new InputStreamReader(is));
    
    String temp=null;
    while((temp=br.readLine())!=null){
            sb.append(temp);
        }
    System.out.println(sb.toString());
    String content=new decryption().decrypt(sb.toString(),fkey);
  
%>

<h1>Report: <font style="color: tomato"> <%=fname%></font></h1><br>
<textarea name="content" style="width: 400px;height: 200px;position: relative;left: 250px;"><%=content%></textarea>
<%
}
%>
<pre>
                                                                      
</pre>
</form>

       
      </div>


<!-- end body---->
<br></br><br></br><br></br><br></br><br></br><br></br><br></br><br></br><br>
      <div class="clr"></div>
    </div>
  </div>
  <div class="fbg">
    <div class="fbg_resize">
    
      <div class="clr"></div>
    </div>
  </div>
  <div class="footer">
    <div class="footer_resize">
      <p class="lf">&copy; Copyright <a href="http://www.jpinfotech.com/"></a>ProjectTeam5</p>
      <p class="rf"><a href=""></a></p>
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
<div align=center>This template  downloaded form <a href='http://all-free-download.com/free-website-templates/'>free website templates</a></div></body>
</html>

