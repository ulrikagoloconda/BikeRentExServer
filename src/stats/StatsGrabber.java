
package stats;

import helpers.ProgramPathAndDir;
import Model.MainViewInformaiton;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

/**
 * @author 		Niklas Karlsson<br>
 * @version     1.0<br>
 * 
 * This is a singelton that we get an instance of. <br>
 * And then we load the generatePDFStatsGetFileName with a MainViewInformation object<br>
 * that return a path+filename to a generated pdf-file with stat-information.  <br>
 *
 * //<img src="./javadoc-img/PDFpart.PNG" />
 * This is the main class <br>
 *  //<img src="./doc-UML/PDFpart.PNG" WIDTH=95% HEIGHT=95%/>
 */

public class StatsGrabber {
	private static StatsGrabber instance = null;
	public String Rootpath = ProgramPathAndDir.getPathfromfile();
	static String FOLDER_NAME = "stats";
	String fileName;

	public static StatsGrabber getInstance() {
		if(instance == null) {
	         instance = new StatsGrabber();
	      }
	      return instance;
	   }

	protected StatsGrabber() {
		
		
	}

	/**
	 * @param mvi  MainViewInformation (mvi) object is a holder for the user so we know the userID (gennerated by)<br>
	 * 
	 * @return String return a path+filename to a generated pdf-file with stat-information.<br>
	 * 
	 * 
	 * The method do the following: <br>
	 * <b>first<b/> make a XMLholder-object that holds a statistic object and a empty string of a XML-string that we populate with data using <br>
	 *  a "chain of responsibility" that is build up the XML-string.<br>
	 * then we finalyse the XML-string<br>
	 * <b>second<b/>:
	 * we make a file and use PDFmaker.makeRapport('fileName','theXMLContent') to make a PDFfile from the XML-string.  
	 *
	 */
	public String generatePDFStatsGetFileName(MainViewInformaiton mvi) {
		// First go thru the chain of stats
		Chain chainStatPart1 = new StatPartFIRST(); //make a (Chain-interface) 
		Chain chainStatPart2 = new StatPart2();
		Chain chainStatPart3 = new StatPart3();
		Chain chainStatPart4 = new StatPart4();
		Chain chainStatPart5 = new StatPartLAST(); //and so on..
		
		// tell each object where to forward the
				// data if it can't process the request
				
		chainStatPart1.setNextChain(chainStatPart2); // do 'part1' then go to next..
		chainStatPart2.setNextChain(chainStatPart3);
		chainStatPart3.setNextChain(chainStatPart4);
		chainStatPart4.setNextChain(chainStatPart5); //and so on.. 
		
		//make a XML holder
		XMLholder theXMLForStats = XMLholder.getInstance();
		theXMLForStats.init(mvi);
		//pass the holder to create the final XML 
		chainStatPart1.getStatInString(theXMLForStats);
		//then receive the XML in a string! 
		String theXMLContent = theXMLForStats.getFinalXML();
		System.out.println(theXMLContent);
		//make the dir that holds the pdf-stats
		ProgramPathAndDir.makeDir(Rootpath +"Rapporter");
		//make a filename to save the upcoming PDF
		String fileNamePath = Rootpath + "Rapporter/"+ ProgramPathAndDir.makeFoldertext(FOLDER_NAME) + "/" + ProgramPathAndDir.makeFoldertext(FOLDER_NAME);
		String datetext = new SimpleDateFormat("yyyy-MM-dd HH-mm-ss'.pdf'").format(new Date());
		 Random rand= new Random();
         int pick = rand.nextInt(900) + 100;
         System.out.println("fil Ending ID is: " + pick);		 
		datetext = datetext.substring(0,16) + " IDnr" +  pick + ".pdf"; 
		fileName = fileNamePath + " " + datetext;
		
		String fileAloneName = FOLDER_NAME + " " + datetext;
		String  rootmall = Rootpath + "resurser/mallar/";
		try {
			PDFmaker.makeRapport(fileName,theXMLContent);
		} catch (IOException e) {
			e.printStackTrace();
		}
		//clean the tempfiles!
		ProgramPathAndDir.dumptempfiles(rootmall + "howto.html"  );
		ProgramPathAndDir.dumptempfiles(rootmall + "howtoNEW.html"  );
		ProgramPathAndDir.dumptempfiles(rootmall + "dosnloadestemp.xml"  );
		
		return fileName;
	}
	
}
