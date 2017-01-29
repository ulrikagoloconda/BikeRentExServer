package stats;

import helpers.ProgramPathAndDir;
import org.allcolor.yahp.converter.CYaHPConverter;
import org.allcolor.yahp.converter.IHtmlToPdfTransformer;
import org.apache.commons.io.FileUtils;

import javax.xml.transform.*;
import java.awt.*;
import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 		Niklas Karlsson<br>
 * @version     1.0<br>
 * 
 * This is a class that can make a PDF-file by using a number of methods <br>
 * the '<b>makeRapport</b>' take a filename and then a XMLstring.
 * This class need a xsl-file to build a temporary html-file.<br>
 * then the html-file is converted to a PDF-file.  
 *
 * @see PDFmaker#makeRapport(String, String)
 */
public class PDFmaker {
	private static final String HTML_FILE_NAME = "howto.html";
	private static final String XSL_FILE_NAME = "howto.xsl";
	private static final String XML_FILE_NAME = "dosnloadestemp.xml";
	private static final String PDF_FILE_NAME = "stat.pdf";
	public static String Rootpath = ProgramPathAndDir.getPathfromfile();
	/**
	 * @param fileName<br>
	 * @param theXMLContent<br>
	 * 
	 * @throws IOException
	 *  
	 * The method do the following: <br>
	 * the '<b>makeRapport</b>' take a filename and then a XMLstring.
	 * This class need a xsl-file to build a temporary html-file.<br>
	 * then the html-file is converted to a PDF-file.  
	 * Note: please "dump the tempfiles: 'howto.html' and "dosnloadestemp.xml" after the return of the file. 
	 * just for information: @see PDFmaker#makeXMLtoHTML(String, String, String)
   */
	public static void makeRapport(String fileName, String theXMLContent) throws IOException {
		theXMLContent = fixChar(theXMLContent);
		try (Writer writer = new BufferedWriter(new OutputStreamWriter(
				new FileOutputStream(Rootpath + "resurser/mallar/" + XML_FILE_NAME), "utf-8"))) {
				writer.write(theXMLContent);   
		}
		//theXMLContent to HTML
		  try {			  	
			    makeXMLtoHTML(XML_FILE_NAME, XSL_FILE_NAME,HTML_FILE_NAME);
			    }
			  catch (Exception e) {
			    e.printStackTrace( );
			    Toolkit.getDefaultToolkit().beep(); 
			    Toolkit.getDefaultToolkit().beep(); 
			    Toolkit.getDefaultToolkit().beep(); 
			    }
		  //the HTMLfile to PDF
		  try {
			  makePDFfile(Rootpath + "resurser/mallar/" + XML_FILE_NAME);
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		  File sourceFile = new File(Rootpath + "resurser/mallar/" + PDF_FILE_NAME);
		  File destFile = new File(fileName);
		  FileUtils.moveFile(sourceFile, destFile);
		  System.out.println("Filen sparad i: " + destFile);
		  
		  
		
	}


	/**
	 * @param xmlFileName
	 * @param xslFileName
	 * @param htmlFileName
	 * @throws TransformerFactoryConfigurationError
	 * @throws TransformerConfigurationException
	 * @throws TransformerException
	 * @throws FileNotFoundException
	 */
	private static void makeXMLtoHTML(String xmlFileName, String xslFileName, String htmlFileName) throws TransformerFactoryConfigurationError, TransformerConfigurationException,
			TransformerException, FileNotFoundException {
		TransformerFactory tFactory = TransformerFactory.newInstance();
		Transformer transformer =
		  tFactory.newTransformer
		     (new javax.xml.transform.stream.StreamSource
		    		 (Rootpath + "resurser/mallar/" + xslFileName));
		transformer.transform
		  (new javax.xml.transform.stream.StreamSource
				  (Rootpath + "resurser/mallar/" + xmlFileName),
		   new javax.xml.transform.stream.StreamResult
		   ( new FileOutputStream(Rootpath + "resurser/mallar/" + htmlFileName)));
  //_______________
		TransformerFactory tFactoryNEW = TransformerFactory.newInstance();
		Transformer transformerNEW =
			      tFactoryNEW.newTransformer
			         (new javax.xml.transform.stream.StreamSource
			            (Rootpath + "resurser/mallar/" + xslFileName));
		transformerNEW.transform
		(new javax.xml.transform.stream.StreamSource
			  (Rootpath + "resurser/mallar/" + xmlFileName),
		 new javax.xml.transform.stream.StreamResult
		      ( new FileOutputStream(Rootpath + "resurser/mallar/" + "howtoNEW.html")));		
		System.out.println("done med xml to html..");
	}

	
	/**
	 * @param string of the html
	 * @throws Exception
	 */
	private static void makePDFfile(String string) throws Exception {
		 CYaHPConverter converter = new CYaHPConverter();
		 File fout = new File(Rootpath + "resurser/mallar/" + PDF_FILE_NAME);
		 FileOutputStream out = new FileOutputStream(fout);
		 Map properties = new HashMap();
		 List headerFooterList = new ArrayList();
		 String filenameHtml = Rootpath + "resurser/mallar/" + HTML_FILE_NAME;
		 String str = ProgramPathAndDir.readFile(filenameHtml);
		 String html = str;
		 //make the CCS a INLINE styles!
		 ChangeHTMLStyleTOInline changeStyleObject= new ChangeHTMLStyleTOInline(html,str);
		 str = changeStyleObject.getHTMLMod();
		 //what color is the traffic-light?
		 if (str.contains("thetrafficgreen")){
		    	System.out.println( "green");
		    }
		    else if (str.contains("thetrafficyellow")){
		    	System.out.println("yellow");
		    }
		    else if (str.contains("thetrafficred")){
		    	System.out.println("red");
		    }
		    else{
		    	System.out.println("don't know, but probably red-status");
		    }
		 
		 properties.put(IHtmlToPdfTransformer.PDF_RENDERER_CLASS,
                 IHtmlToPdfTransformer.FLYINGSAUCER_PDF_RENDERER);
		 converter.convertToPdf(str,
				 IHtmlToPdfTransformer.A4P,
				 	headerFooterList,
				 	"file:///" + Rootpath + "resurser/",
				 		out,
				 			properties);
		 out.flush();
		 out.close();
  
		 
	}
	
	public static String getXmlFileName() {
		return XML_FILE_NAME;
	}
  /**
   * @param theXMLContent
   * @return string (converted to fix special char)
   */
  private static String fixChar(String theXMLContent) {
    theXMLContent = theXMLContent.replace("Ã¶", "ö");
    theXMLContent = theXMLContent.replace("Ã¥", "å");
    theXMLContent = theXMLContent.replace("Ã¤", "ä");
    theXMLContent = theXMLContent.replace("Ã¡", "á");
    theXMLContent = theXMLContent.replace("Ã?", "Ö");
    theXMLContent = theXMLContent.replace("Ã?", "É");
    theXMLContent = theXMLContent.replace("Ã?", "Å");
    theXMLContent = theXMLContent.replace("Ã?", "Ä");
    theXMLContent = theXMLContent.replace("Ã©", "é");
    theXMLContent = theXMLContent.replace("Ã¼", "ü");
    return theXMLContent;
  }

}
