<%-- 
    Document   : status_update
    Created on : May 14, 2016, 3:56:41 PM
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
   String Status = "No";
    int i = st.executeUpdate("update patient_details set status = '" + Status + "' where id = '" + id + "'");
    if (i != 0) {
        response.sendRedirect("search_patient.jsp?Msg=Request_Send_Successfully");
    } else {
        response.sendRedirect("u_search_result.jsp?msg=Error");
    }
%>
