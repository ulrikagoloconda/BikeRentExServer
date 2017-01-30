package helpers;

import java.awt.*;
import java.io.*;

/**
 * @author Niklas Karlsson
 * @version 1.0
 * @since 2016-09-15
 */
public class FileHelper {
  /**
 * @param content
 * @param filename
 * @throws IOException
 */
public static void saveFile(String content, String filename) throws IOException
  {
    File file = new File (filename);
    BufferedWriter out = new BufferedWriter(new FileWriter(file));
    out.write(content);
    out.close();
  };

  /**
 * @param fileName
 * Open a pdf in the OS
 */
public static void openPDF(String fileName){
    try {

      File pdfFile = new File(fileName);
      if (pdfFile.exists()) {

        if (Desktop.isDesktopSupported()) {
          Desktop.getDesktop().open(pdfFile);
        } else {
          System.out.println("Awt Desktop is not supported!");
        }

      } else {
        System.out.println("File is not exists!");
      }

      System.out.println("Done");

    } catch (Exception ex) {
      ex.printStackTrace();
    }

  }

  /**
 * @param filePath
 * @param inputStream
 * @throws IOException
 */
public static void saveByteArrayToFile(String filePath, ByteArrayInputStream inputStream) throws IOException {
    ByteArrayInputStream input = inputStream;
    FileOutputStream output = new FileOutputStream(filePath);

    int DEFAULT_BUFFER_SIZE = 1024;
    byte[] buffer = new byte[DEFAULT_BUFFER_SIZE];
    long count = 0;
    int n = 0;

    n = input.read(buffer, 0, DEFAULT_BUFFER_SIZE);

    while (n >= 0) {
      output.write(buffer, 0, n);
      n = input.read(buffer, 0, DEFAULT_BUFFER_SIZE);
    }
  }


  public static byte[] readBytesFromFile(String filePath) {

    FileInputStream fileInputStream = null;
    byte[] bytesArray = null;

    try {

      File file = new File(filePath);
      bytesArray = new byte[(int) file.length()];

      //read file into bytes[]
      fileInputStream = new FileInputStream(file);
      fileInputStream.read(bytesArray);

    } catch (IOException e) {
      e.printStackTrace();
    } finally {
      if (fileInputStream != null) {
        try {
          fileInputStream.close();
        } catch (IOException e) {
          e.printStackTrace();
        }
      }

    }

    return bytesArray;

  }


}
