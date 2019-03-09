<%-- 
    Document   : update
    Created on : Mar 10, 2016, 11:01:22 AM
    Author     : java4
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="network.DbConnection"%>
<%
    String j = request.getQueryString();
                Connection con = DbConnection.getConnection();
                Statement st =con.createStatement();
String  msg=(String)session.getAttribute("Key");
String block = "Allowed";
    System.out.println("message"+msg);
    String  mail=(String)session.getAttribute("Email");
    String  email=(String)session.getAttribute("Email");
     System.out.println("Email id"+email);
    int i = st.executeUpdate("update registration set secret_key = '" + msg + "', permission='" + block + "' where email = '" + email + "'");
    if (i != 0) {
        response.sendRedirect("owner_de.jsp?msg = Activate key sent to Your Email");
    } else {
        response.sendRedirect("owner_de.jsp? msg = Error");
    }
%>