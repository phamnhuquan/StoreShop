
package com.mycompany.spring_project_final.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;


public class HashPassword {
    
    public static String hashPass(String pass){
        String generatedPassword = null;
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            //add password bytes to digest
            md.update(pass.getBytes());
            //Get the hash's bytes
            byte[] bytes = md.digest();
            //convert it to hexadecimal format
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < bytes.length; i++) {
                sb.append(Integer.toString((bytes[i] & 0xff) + 0x100, 16).substring(1));
            }
            generatedPassword = sb.toString();
        return sb.toString();
        }
        catch(NoSuchAlgorithmException e){
            e.printStackTrace();
        }
        return generatedPassword;
        
    }
}
