<%-- 
    Document   : loginaction
    Created on : Feb 23, 2016, 3:43:53 PM
    Author     : java4
--%>

<%@page import="java.util.UUID"%>
<%@page import="java.security.SecureRandom"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="network.DbConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.Random"%>

<%
    Connection con = null;
    Statement st = null;
   ResultSet rs = null;
   String pname = request.getParameter("pname");
    session.setAttribute( "session_pname", pname );
    String pAge = request.getParameter("page");
     String pheight = request.getParameter("pheight");
      String pweight = request.getParameter("pweight");
       String pdate = request.getParameter("pdate");
        String preligion = request.getParameter("preligion");
         String pmstatus = request.getParameter("pmstatus");
          String paddress = request.getParameter("paddress");
           String padmission = request.getParameter("padmission");
            String pcotact = request.getParameter("pcontact");
             String pmail = request.getParameter("pmail");
              String poccupation = request.getParameter("poccupation");
               String pblood = request.getParameter("pblood");
                String preffered = request.getParameter("preffered");
                 String pgender = request.getParameter("pgender");
                  String pcategories = request.getParameter("pcategories");
                  System.out.println("Patient Details"+pname+pAge+pheight+pweight+pdate+preligion+pmstatus+paddress+padmission+pcotact+pmail+poccupation+pblood+preffered+pgender+pcategories);
   String secret = request.getParameter("secret");               
    String name = request.getParameter("uname");
     String email = request.getParameter("email");
      String pass = request.getParameter("pass");
       String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
       String phone = request.getParameter("phone");
      String street = request.getParameter("street");
     String state = request.getParameter("state");
    String Country = request.getParameter("country");
   String Role = request.getParameter("role");
  String allow = "Not_Allowed"; 
     int status = Integer.parseInt(request.getParameter("status"));
     System.out.println("status"+status+name+email+pass+fname+lname+phone+street+state+Country+Role);
    String key = "file"; 
        Random RAND = new SecureRandom();
                     int PASSWORD_LENGTHe = 4;
                     String letter = "9876543210";
                     
                    String patient_id = "";  
                     for (int i=0; i<PASSWORD_LENGTHe; i++)
                 {
                int index = (int)(RAND.nextDouble()*letter.length());
              
                patient_id += letter.substring(index, index+1);
                 }
      Random RANDOM = new SecureRandom();
                     int PASSWORD_LENGTH = 8;
                     String letters = "mnbvcxzasddfghjklpoiuytrewq1234567890-=+-*/";
                     
                    String secret_key = "";  
                     for (int i=0; i<PASSWORD_LENGTH; i++)
                 {
                int index = (int)(RANDOM.nextDouble()*letters.length());
              
                secret_key += letters.substring(index, index+1);
                 }

    try {
        con = DbConnection.getConnection();
        st = con.createStatement();
        switch (status) {
            case 1:
                try {
                    rs = st.executeQuery("select * from registration where uname='" + name + "' AND pass='" + pass + "' AND role='user'");
                    if (rs.next()) {
                        session.setAttribute("SSmail", rs.getString("email"));
                        session.setAttribute("SSname", rs.getString("uname"));
                        session.setAttribute("SSstate", rs.getString("state"));
                        session.setAttribute("SScountry", rs.getString("country"));
                         session.setAttribute("SSid", rs.getString("id"));
                        response.sendRedirect("user_home.jsp?msg=success");
                    } else {
                        response.sendRedirect("user.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
            case 2:
                try {
                    rs = st.executeQuery("select * from registration where uname='" + name + "' AND pass='" + pass + "' AND secret_key='" + secret + "' AND role='owner' AND permission='Allowed'");
                    if (rs.next()) {
                        session.setAttribute("omail", rs.getString("email"));
                        session.setAttribute("ouname", rs.getString("uname"));
                        session.setAttribute("orole", rs.getString("role"));
                        session.setAttribute("oid", rs.getString("id"));
                        
                        response.sendRedirect("owner_home.jsp?msg=success");
                    } else {
                        response.sendRedirect("owner.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
                
                case 3:

              try {
                 con = DbConnection.getConnection();
                 st = con.createStatement();
            int i = st.executeUpdate("insert into registration(uname, email, pass, fname, lname, phone, street, state, country, role, permission) values ('" + name + "','" + email + "','" + pass + "','" + fname + "','" + lname + "','" + phone + "','" + street + "','" + state + "','" + Country + "','" + Role + "','" + allow + "')");                                           
                if (i != 0) {

                response.sendRedirect("register.jsp?msg=success");
                } else {
                     response.sendRedirect("register.jsp?msgg=failed");
                 }
                  } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
           case 4:
              try {
                    rs = st.executeQuery("select * from registration where uname='" + name + "' AND pass='" + pass + "' AND role='researcher'");
                    if (rs.next()) {
                        session.setAttribute("Smail", rs.getString("email"));
                        session.setAttribute("Sid", rs.getString("id"));
                        session.setAttribute("Sname", rs.getString("uname"));
                        session.setAttribute("Sstate", rs.getString("state"));
                        session.setAttribute("Scountry", rs.getString("country"));
                        
                        response.sendRedirect("re_home.jsp?msg=success");
                    } else {
                        response.sendRedirect("researcher.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
                case 5:
                try {
                 con = DbConnection.getConnection();
                 st = con.createStatement();
            int i = st.executeUpdate("insert into patient_details(pname, pAge, pheight, pweight, pdate, preligion, pmstatus, paddress, padmission, pcotact, pmail, poccupation, pblood, preffered, pcategories, pgender, secret_key, patient_id, status) values ('" + pname + "','" + pAge + "','" + pheight + "','" + pweight + "','" + pdate + "','" + preligion + "','" + pmstatus + "','" + paddress + "','" + padmission + "','" + pcotact + "','" + pmail + "','" + poccupation + "','" + pblood + "','" + preffered + "','" + pcategories + "','" + pgender + "','" + secret_key + "','" + patient_id + "','" + key + "')");                                           
                if (i != 0) {

                response.sendRedirect("p_medical_re.jsp?msg=success");
                } else {
                     response.sendRedirect("p_information.jsp?msgg=failed");
                 }
                  } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
  
                case 6:
             
                try {
                    rs = st.executeQuery("select * from patient_details where secret_key='" + pass + "'");
                    if (rs.next()) {
                        session.setAttribute("SSmail", rs.getString("email"));
                        session.setAttribute("SSname", rs.getString("uname"));
                                             
                        response.sendRedirect("user_home.jsp?msg=success");
                    } else {
                        response.sendRedirect("search_down.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                               
                break;
            
            case 8:
                try {
                    if (name.equalsIgnoreCase("Admin") && pass.equalsIgnoreCase("project")) {
                        response.sendRedirect("admin_home.jsp?msg=success");
                    } else {
                        response.sendRedirect("admin.jsp?msgg=failed");
                    }
                } catch (Exception ex) {
                    ex.printStackTrace();
                }
                break;
            default:
                response.sendRedirect("index.html");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }

%>