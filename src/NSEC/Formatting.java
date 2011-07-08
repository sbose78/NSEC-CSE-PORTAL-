package NSEC;
/**
 * Write a description of class Newline here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */

import java.io.*;
import java.util.*;


public class Formatting
{
    private String html;
    
    public Formatting(String str){
       html=new String();
       html=str;
    }

//  public static void main(String args[])throws IOException{
    
        
        public String applyFormattingnbsp()
        {      System.out.println(html);
               html=createWhiteSpace(html);
              String processed=new String();
              processed="<br>";
     
              int i=0,count=0,count2=0;
    
              for(i=0;i<html.length();i++){
                  if( Character.isWhitespace(html.charAt(i))){
                      processed+=" &nbsp;&nbsp;"; continue;
                    }
                    if(html.charAt(i)=='\n'){
                        System.out.println("found newline");
                        processed+="<br>";
                        continue;
                    }
            //if( Character.isLetterOrDigit(html.charAt(i)) || html.charAt(i)=='<' || html.charAt(i)=='>'){
                     else{   
                         processed+=html.charAt(i);continue;
                        }
                  }   
                  processed=removeMalicious(processed);
            System.out.println(processed);        
            return processed;
     
        }
        public String createWhiteSpace(String s){
            String processed=new String();
            String temp=new String();
		
            processed="<br>";
		
            StringTokenizer strtok=new StringTokenizer(s,"\n");
		
            while(strtok.hasMoreTokens()){
                temp=strtok.nextToken();
                processed+=temp;
                processed+="<br>";
            }return processed;
        }
        
        public String removeMalicious(String s){
            String lessThan="<font face=\"Symbol\">&#60;</font>";
            String greaterThan="<font face=\"Symbol\">&#62;</font>";
            
            String processed=new String();
            processed="";
            for(int i=0;i<s.length();i++){
                if(s.charAt(i) == '<')
                {
                    if( i+3 < s.length() ){
                        if( s.charAt(i+1) == 'b' && s.charAt(i+2)=='r' && s.charAt(i+3)=='>'){
                            processed+="<br>";
                            i+=3;
                            continue;
                        }
                    }
                        processed+=lessThan;
                   
                }
                else if(s.charAt(i) == '>'){
                        processed+=greaterThan;
                }
                 else
                 {
                     processed+=s.charAt(i);
                 }
               }return processed;
            }
            
                  
                            
        
        
        
}
