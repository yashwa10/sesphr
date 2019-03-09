package pack;

import java.io.File;
import java.io.FileInputStream;
import org.apache.commons.net.ftp.FTPClient;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author java4
 */
public class Ftpcon {
    FTPClient client = new FTPClient();
    FileInputStream fis = null;
    boolean status;

public boolean upload(File file){
   try{
//           client.enterLocalPassiveMode();
            client.connect("ftp.drivehq.com");
       
            client.login("drive05", "drive15");
            client.enterLocalPassiveMode();
             //String filename = "/home/ibn/Desktop/report.txt";
             fis = new FileInputStream(file);
             
             status= client.storeFile(" /kk/"+file.getName(), fis);
       
             client.logout();
             fis.close();
    
}
catch(Exception e){
    System.out.println(e);
}
        if(status){
             System.out.println("success");
             return true;
        }
        else{
            System.out.println("failed");
            return false;
          
        }
    
} 
//    public static void main(String[] args) {
//        Ftpcon f=new Ftpcon();
//        f.upload();
//    }
   
}
