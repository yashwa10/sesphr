<%@page import="com.oreilly.servlet.*,java.sql.*,java.lang.*,java.text.SimpleDateFormat,java.util.*,java.io.*,javax.servlet.*, javax.servlet.http.*"  errorPage="Error.jsp"%>

<%@ page import="network.DbConnection"%>





  
       <% 
        try
                {
				
//           int a1 =(Integer)(session.getAttribute( "id" ));
                  String  User_Name=(String)session.getAttribute("SSname");
                   String  Email=(String)session.getAttribute("SSmail");
                    String  State=(String)session.getAttribute("SSstate");
                     String  Country=(String)session.getAttribute("SScountry");
                      String  Categories=(String)session.getAttribute("SSpcategories");
                      String  Patient_ID=(String)session.getAttribute("SSpatient_id");
                     String  file_Name=(String)session.getAttribute("SSfilename");
                    String  Secret_Key=(String)session.getAttribute("SSsecret_key"); 
                   String  Status="No";  
       System.out.println("Request is activated"+Email+State+Country+Categories+Patient_ID+file_Name+Secret_Key+Status);
	  	  
	 
       Connection con= DbConnection.getConnection();
        Statement st=con.createStatement();
		
        
            String sql="insert into request(user_name, email, state, country, categories, patient_id, file_name, secret_key, status) values ('"+User_Name+"','"+Email+"','"+State+"','"+Country+"','"+Categories+"','"+Patient_ID+"','"+file_Name+"','"+Secret_Key+"','"+Status+"')";
		
        int x=st.executeUpdate(sql);
		if(x!=0){
		response.sendRedirect("search_patient.jsp?message=Request_send_Successfully");
	
		}
				else{
		response.sendRedirect("u_search_result.jsp?message=fail");
		
		}
        con.close();
        st.close();
        }
        catch(Exception e)
                {
        out.println(e);
		
        }
        %>