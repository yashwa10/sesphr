<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
                    <%
            if (request.getParameter("msg") != null) {
        %>
        <script>alert('Login Succesfully');</script>
        <%
            }
        %>
<div class="main">
  <div class="header">
    <div class="header_resize">
      <div class="logo">
        <h1><a href="index.html">SeSPHR: A Methodology for Secure Sharing of Personal Health Records in the Cloud</a></h1>
      </div>
      <div class="menu_nav">
        <ul>
          <li class="active"><a href="owner_home.jsp"><span>Owner Home</span></a></li>
          <li><a href="p_information.jsp"><span>Medical Record</span></a></li>
          <li><a href="view_o_p_d.jsp"><span>View Patient Details</span></a></li>
          <li><a href="index.jsp"><span>logout</span></a></li>
<!--          <li><a href="#"><span>User</span></a></li>
          <li><a href="#"><span>Registration</span></a></li>-->
        </ul>
      </div>
      <div class="clr"></div>
      <div class="slider">
        <div id="coin-slider"> <a href="#"><img src="img/oi1.jpg" width="960" height="320" alt="" /> </a> <a href="#"><img src="img/oi3.jpg" width="960" height="320" alt="" /> </a> <a href="#"><img src="img/oi2.jpg" width="960" height="320" alt="" /> </a> <a href="#"><img src="img/oi4.jpg" width="960" height="320" alt="" /> </a> </div>
        <div class="clr"></div>
      </div>
      <div class="clr"></div>
    </div>
  </div>

<br></br>
  <div class="footer">
    <div class="footer_resize">
      <p class="lf">&copy; Copyright@ <a href="#">ProjectTeam5</a>.</p>
      <div style="clear:both;"></div>
    </div>
  </div>
</div>
</body>
</html>
