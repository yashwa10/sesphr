<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="network.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
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
          <li><a href="admin_home.jsp"><span>Admin Home</span></a></li>
          <li><a href="user_de.jsp"><span>User Details</span></a></li>
          <li><a href="owner_de.jsp"><span>Owner Details</span></a></li>
          <li><a href="research_de.jsp"><span>Researcher Details</span></a></li>
           <li><a href="user_req.jsp"><span>User Request</span></a></li>
           <li><a href="researcher_req.jsp"><span>Researcher Request</span></a></li>
           <li class="active"><a href="download_de.jsp"><span>Downloaded file</span></a></li>
          <li><a href="index.jsp"><span>logout</span></a></li>
        </ul>
      </div>
      <div class="clr"></div>
     
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
      <div class="content_resize">
<!-- start body---->
   <!-- /.container -->
 

        <div class="container">
            <div class="row">
                <div class="box" style="height: 400px;">
                    <!--To do you work-->
                    <div style="border: 1px solid white;height: 350px;border-top-width: 20px;border-bottom-width: 10px">
                        <center><h3>Owner Details</h3></center><br />
                        <table border="1" style="text-align: center;margin-left: 220px">
                            <tr>
                                <th style="text-align: center;width: 30px;">ID</th>
                                <th style="text-align: center;width: 70px;">File Name</th>
                                <th style="text-align: center;width: 300px;">Time</th>
                                <th style="text-align: center;width: 100px;">User Name</th>

                            </tr>
                            <tr>
                                <%
                                    Connection con = null;
                                    Statement st = null;
                                    ResultSet rs = null;
                                    try {
                                        con = DbConnection.getConnection();
                                        st = con.createStatement();
                                        rs = st.executeQuery("select * from downloads");
                                        while(rs.next())
                                            
                                        {%>
                                        <td><%=rs.getString("id")%></td>     
                                        <td><%=rs.getString("filename")%></td>     
                                        <td><%=rs.getString("time")%></td>     
                                        <td><%=rs.getString("username")%></td>     
                                        
                                        </tr>
                                        <%
                                      
                                        
                                        } 
                                    } catch (Exception ex) {
                                        ex.printStackTrace();
                                    }

                                %>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.container -->



<!-- end body---->
<br></br><br></br>
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

