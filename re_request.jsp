<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>

<%@ page import="network.DbConnection"%>





  
       <% 
        try
                {

                  String  User_Name=(String)session.getAttribute("Sname");
                   String  Email=(String)session.getAttribute("Smail");
                    String  State=(String)session.getAttribute("Sstate");
                          String  Country=(String)session.getAttribute("Scountry");
                                     String  Categories=(String)session.getAttribute("Spcategories");
                           String  Patient_ID=(String)session.getAttribute("Spatient_id");
                     String  file_Name=(String)session.getAttribute("Sfilename");
                    String  Secret_Key=(String)session.getAttribute("Ssecret_key"); 
                   String  Status="Not_Allowed";  
       System.out.println("Request is activated"+Email+State+Country+Categories+Patient_ID+file_Name+Secret_Key+Status);
	  	  
	 
       Connection con= DbConnection.getConnection();
        Statement st=con.createStatement();
		
        
            String sql="insert into request(user_name, email, state, country, categories, patient_id, file_name, secret_key, status) values ('"+User_Name+"','"+Email+"','"+State+"','"+Country+"','"+Categories+"','"+Patient_ID+"','"+file_Name+"','"+Secret_Key+"','"+Status+"')";
		
        int x=st.executeUpdate(sql);
		if(x!=0){
		response.sendRedirect("re_search_record.jsp?message=Request_send_Successfully");
	
		}
				else{
		response.sendRedirect("re_search_result.jsp?message=fail");
		
		}
        con.close();
        st.close();
        }
        catch(Exception e)
                {
        out.println(e);
		
        }
        %>