<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@page import="network.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
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
<!--          <li class="active"><a href="index.jsp"><span>Home Page</span></a></li>
          <li><a href="support.html"><span>Support</span></a></li>
          <li><a href="about.html"><span>About Us</span></a></li>
          <li><a href="blog.html"><span>Blog</span></a></li>-->
          <li><a href="index.jsp"><span>Back</span></a></li>
        </ul>
      </div>
      <div class="clr"></div>
     
      <div class="clr"></div>
    </div>
  </div>
  <div class="content">
      <div class="content_resize">
<!-- start body---->
  <div class="row">
                    <div class="col-md-12">
<!--                        <h1 class="page-head-line">Abstract</h1>-->

  
<!--      <br> -->
       <%
       
        Connection con = DbConnection.getConnection();
         Connection conn = DbConnection.getConnection();
        Statement st = con.createStatement();
        Statement st1 = con.createStatement();
        Statement st2 = conn.createStatement();
//  ResultSet rs = st2.executeQuery("select * from patient_details");
//   int sea =rs.getInt("pAge");

        ResultSet rs1=null;
                 rs1 = st.executeQuery("SELECT COUNT(*) AS UserCount FROM patient_details WHERE status ='file'");
 
              if (rs1.next()){
                
                    int searchs =rs1.getInt("UserCount");
                   int time2 =rs1.getInt("UserCount");
                   System.out.println("this is time2"+time2);
                   float time1 = time2/10f;
                   System.out.println("this is time"+time1);
    
  
               int j =searchs; 
               float i =time1;
                  %>
      
      
  <!--<center><h1><font color="white">Status Graph</font></h1><hr><br><br></center>-->
  
    
    <script type="text/javascript" src="js/graph.js"></script>
    <script type="text/javascript">
        
        
        var value = <%= i %>;
        var value1 = <%= j %>;
        
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['', 'Files', 'Time'],
          ['Status', value1 ,   value],
          
        ]);

        var options = {
          title: 'Status',
          hAxis: {title: '', titleTextStyle: {color: 'red' }}
        };

        var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
        
        <%
        
          } else {
                out.println("not updated");
            }

          %>

 

    <div id="chart_div" style="width: 800px; height: 400px; right: 100px"></div>


                

                    </div>
                </div>



<!-- end body---->
<br></br><br></br><br></br>
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

