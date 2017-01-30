package helpers;


import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;

public class ProgramPathAndDir {

	/**
	 * @return filePath
	 * 
	 * read a file that holds the pathname of the source-images and converting files
	 */
	public static String getPathfromfile(){
	String filePath;
		try {
			filePath = readFile("path");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "";
		}
		return filePath + "/";

	
}

	/**
	 * @param filename
	 * @return
	 * @throws IOException
	 */
	public static String readFile(String filename) throws IOException {
	 BufferedReader br = new BufferedReader(
	 new InputStreamReader(new FileInputStream(filename), "UTF-8"));
	 String nextLine = "";
	   StringBuffer sb = new StringBuffer();
	   while ((nextLine = br.readLine()) != null) {
	     sb.append(nextLine);
	   }
	   return sb.toString();
	}
	

	 /**
	 * @param folder
	 */
	public static void makeDir(String folder) {


	File theDir = new File(folder);

	// if the directory does not exist, create it
	if (!theDir.exists()) {
	    System.out.println("creating directory: " + theDir);
	    boolean result = false;

	    try{
	        theDir.mkdir();
	        result = true;
	    } 
	    catch(SecurityException se){
	        //handle it
	    }        
	    if(result) {    
	        System.out.println("DIR created");  
	    }
	}


	}

	 /**
	 * @param tempFile
	 * Use this to remove a file
	 */
	public static void dumptempfiles(String tempFile) {
		 try{
		      
		        //Delete if tempFile exists
		        File fileTemp = new File(tempFile);
		          if (fileTemp.exists()){
		             fileTemp.delete();
		          }   
		      }catch(Exception e){
		         // if any error occurs
		         e.printStackTrace();
		      }

		
	}

	 /**
	 * @param textString
	 * @return corrected string from strange char
	 */
   public static String makeFoldertext(String textString){
     String old = textString;
     try {
       textString = textString.replaceAll("&", " o ");
       textString = textString.replaceAll("�" , " o ");
       textString = textString.replaceAll("�" , " n ");
       textString = textString.replaceAll("�" , " u ");
       textString = textString.replaceAll("�" , " SS ");
       textString = textString.replaceAll("�" , " Euro");
       textString = textString.replaceAll("�" , "AE");
       textString = textString.replaceAll("�" , "AE");
       textString = textString.replaceAll("�" , "A");
       textString = textString.replaceAll("�" , "E");
       textString = textString.replaceAll("�" , "E");
       textString = textString.replaceAll("�" , "paragraf");
       textString = textString.replaceAll("�" , "GRADER");
       textString = textString.replaceAll("�" , "Pound");
       textString = textString.replaceAll("�" , " ");
       textString = textString.replaceAll(">" , "-");
       textString = textString.replaceAll("<" , "-");
       textString = textString.replaceAll("\"" , "-");
       textString = textString.replaceAll("&" , "o");
       textString = textString.replaceAll("~" , "-");
       textString = textString.replaceAll("�" , "a");
       textString = textString.replaceAll("�" , "a");
       textString = textString.replaceAll("�" , "A");
       textString = textString.replaceAll("�" , "A");
       textString = textString.replaceAll("�" , "e");
       textString = textString.replaceAll("�" , "e");
       textString = textString.replaceAll("�" , "E");
       textString = textString.replaceAll("�" , "E");
       textString = textString.replaceAll("/" , "-");
       textString = textString.replaceAll(":" , "-");
       textString = textString.replaceAll(";" , "-");
       textString = textString.replaceAll("," , "-");
       textString = textString.replaceAll("@" , "-");
       textString = textString.replaceAll("#" , "-");
       textString = textString.replaceAll("/+" , " och ");
       return textString;
     } catch (Exception e) {
       e.printStackTrace();
       old = old.replaceAll("[^\\p{Alpha}\\p{Digit}]+","");
       return old;
     }

   }


  /**
	 * @param content
	 * @param filename
	 * @throws IOException
	 */
	public static void savefile(String content, String filename) throws IOException {
			  File file = new File (filename);
			  BufferedWriter out = new BufferedWriter(new FileWriter(file)); 
			  out.write(content);
			  out.close();
			};

}
