/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package upload;

import network.DbConnection;

import upload.SimpleFTPClient;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;
import com.oreilly.servlet.MultipartRequest;
import java.io.FileInputStream;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.net.ftp.FTPClient;

/**
 *
 * @author jp
 */
public class uploads extends HttpServlet {

    
     SimpleFTPClient client;
//     FileInputStream fis = null;
//    boolean status;
//    FTPClient client = new FTPClient();
    File file;
final String filepath="D:/";
    private static final String TMP_DIR_PATH = "c:\\tmp";
    private File tmpDir;
    private static final String DESTINATION_DIR_PATH = "file";
    private File destinationDir;
    Calendar currentDate = Calendar.getInstance();
    SimpleDateFormat formatter =
            new SimpleDateFormat("yyyy/MMM/dd HH:mm:ss");
    String dateNow = formatter.format(currentDate.getTime());

    /**
     * Processes requests for both HTTP
     * <code>GET</code> and
     * <code>POST</code> methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         HttpSession session = request.getSession(true);
         Object spname = session.getAttribute("session_pname");
         System.out.println("session is get patient name "+spname);
         
        try {
//            MultipartRequest m=new MultipartRequest(request,filepath);
//             File file=m.getFile("file"); 
//             String useriddd = m.getParameter("ffname");
//             String captiondd = m.getParameter("ffname");
             
    response.setContentType("text/html;charset=UTF-8");
    PrintWriter out = response.getWriter();

    DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
    fileItemFactory.setSizeThreshold(1 * 1024 * 1024);
    fileItemFactory.setRepository(tmpDir);

    ServletFileUpload uploadHandler = new ServletFileUpload(fileItemFactory);
   
   
//   String getu = session.getAttribute("uid").toString();
//   System.out.println("id is " + getu);
     Connection con = null;
    Statement st = null;
    Statement st1 = null;
    
    PreparedStatement pstm1 = null;
    
    
    try {
        String gr=null;
        con = DbConnection.getConnection();
        st = con.createStatement();
        st1 = con.createStatement();
        List items = uploadHandler.parseRequest(request);
        Iterator itr = items.iterator();
        String fileName = "";
        FileItem item = (FileItem) itr.next();
        String fName = null;
        fName = item.getName();
        System.out.println("fname " + fName);
        
            client = new SimpleFTPClient();
            client.setHost("ftp.drivehq.com");
            client.setUser("drive05");
            client.setPassword("drive15");
            client.setRemoteFile(item.getName());
//            fis = new FileInputStream(item.getContentType());
//           status= client.storeFile(" /blocks/"+file.getName(), fis);
          

            boolean log = client.connect();
            
 System.out.println("FTP Connection is veerifyed " + fName);
        fileName = item.getName();
        System.out.println("filename " + fileName);
//         File file = new File(Constant.file, item.getName());
//         item.write(file);
//         System.out.println("" + file.getAbsolutePath());
        int x = fileName.lastIndexOf('\\');
        String fN = fileName.substring(x + 1, fileName.length());
        System.out.println(fN);
//                status= client.storeFile(" /blocks/"+file.getName(), fn);
        

        String get = "" + item.getInputStream();
        String str = getStringFromInputStream(item.getInputStream());
        
       
        System.out.println(str);
        String sq2 = "update patient_details set file='"+str+"' where name='"+spname+"'";
    
        pstm1 = con.prepareStatement(sq2);
//        pstm1.setString(1, useriddd);
//         pstm1.setString(2, captiondd);
//        pstm1.setString(3, item.getName());
        pstm1.setString(1, str);
        
       
        boolean sd = pstm1.execute();
        
        System.out.println(sd);
        
        
        if (log) {
                if (client.uploadFile(item.getInputStream())) {
                    response.sendRedirect("p_medical_re.jsp?msg=file_Uploaded"); 
                } else {
                    response.sendRedirect("p_information.jsp?msgg=Try_again"); 
                }
            } else {
                out.println("not connected");
            }
        
    } catch (Exception e) {
        System.out.println(e);
    }

} catch (Exception ex) {
            Logger.getLogger(uploads.class.getName()).log(Level.SEVERE, null,ex);
        }
    }
    private static String getStringFromInputStream(InputStream is) {
 
		BufferedReader br = null;
		StringBuilder sb = new StringBuilder();
 
		String line;
		try {
 
			br = new BufferedReader(new InputStreamReader(is));
			while ((line = br.readLine()) !=   null) {
				sb.append(line+"\n");
			}
 
		} catch (IOException e) {
			e.printStackTrace();
		}  finally {
			if (br != null) {
				try {
					br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return sb.toString();
	}

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
