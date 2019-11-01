package com.evidu.bank.sva;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.sql.rowset.serial.SerialException;

public class UserImageController {
 
 public boolean InsertImageData(byte[] image_arr,byte[] nid_image_arr,byte[] kyc_image_arr,String referenceNo,String mobilenumber,String card_pan){
  boolean status=false;
  Connection con = null;
  
  
  try {
   DatabaseController d = DatabaseController.getInstance(); 
   con=(Connection)d.getConnection(); 
   
      String sql = "UPDATE tempory_account SET NID_IMAGE= ?, USER_IMAGE=?,KYC_IMAGE=? ,CARD_PAN=?, MODIFIED_DATE=NOW() WHERE MSISDN=? AND REF_NO=? AND MODIFIED_DATE IS NULL";
      PreparedStatement statement = con.prepareStatement(sql);
     
     
      statement.setBytes(1, nid_image_arr); 
      statement.setBytes(2, image_arr);
      statement.setBytes(3, kyc_image_arr);
        //  statement.setBlob(3, is);
      statement.setString(4, card_pan);
      statement.setString(5, mobilenumber);
      statement.setString(6,referenceNo);
     
      int row = statement.executeUpdate();
      System.out.println("*****rows "+row);
      if(row>0){
       status=true;
      }
  } catch (SQLException e) {
   System.out.println("Error On update user Image Data : "+e.toString());
  }
  finally{  
   if (con != null) { 
    try { 
     con.close(); 
    }catch (SQLException e) {
     
    }
    con = null;
   } 
  }
  System.out.println("status : "+status);
  return status;
 }
}