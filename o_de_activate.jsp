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
                int id=Integer.parseInt(request.getQueryString());
        System.out.println("id get successfully"+id);
   String block = "Not_Allowed";
    String  email=(String)session.getAttribute("session_mail");
    
     System.out.println("Session Email id"+email);
    int i = st.executeUpdate("update registration set permission = '" + block + "' where id = '" + id + "'");
    if (i != 0) {
        response.sendRedirect("owner_de.jsp?Msg=Accuont_Blacked");
    } else {
        response.sendRedirect("owner_de.jsp?msg=Error");
    }
%>