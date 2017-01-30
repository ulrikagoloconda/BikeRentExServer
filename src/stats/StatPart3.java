package stats;

/**
 * @author 		Niklas Karlsson<br>
 * @version     1.0<br>
 *  a "chain of responsibility" that build up the XML-string.<br>
 * build the tag: UserStatus <br>
 * (totalusers, totalloans30day, maletotal,  maleloans30day, male2030, male3040, male4050, male50more and women and other tags)
 *
 * @see Chain
 */
public class StatPart3 implements Chain {
	private  Chain nextInChain;
	// Defines the next Object to receive the data 
	@Override
	public void setNextChain(Chain nextInChain) {
		this.nextInChain = nextInChain;

	}

	@Override
	public void getStatInString(XMLholder theXMLForStats) {

		System.out.println("in chain 3" + theXMLForStats.getFinalXML());
		//Make the Statcall in the database
		
		//then populate the XMLForStats.
		theXMLForStats.addThisXMLStringblock(""
				+ "<userstatus>"
				+ "<totalusers>"
					+ theXMLForStats.getRowStat().getNumberOfUsers()
				+ "</totalusers>"
				+ "<totalloans30day>"
					+ theXMLForStats.getRowStat().getNumberNewLoans30DaysBackTotal()
				+ "</totalloans30day>"
				
				+ "<male>"
				+    "<maletotal>"
					  + theXMLForStats.getRowStat().getNumberOfMenPercent()
				+    "</maletotal>"
				+    "<maleloans30day>"
					  + theXMLForStats.getRowStat().getNumberNewLoans30DaysBackMenPercent()
				+    "</maleloans30day>"
				+    "<male2030>"
					  + theXMLForStats.getRowStat().getNumberMen20to30Percent()
				+    "</male2030>"
				+    "<male3040>"
					  + theXMLForStats.getRowStat().getNumberMen30to40Percent()
				+    "</male3040>"
				+    "<male4050>"
					  + theXMLForStats.getRowStat().getNumberMen40to50Percent()
				+    "</male4050>"
				+    "<male50more>"
					  + theXMLForStats.getRowStat().getNumberMen5to130Percent()
				+    "</male50more>"
				+ "</male>"
				+ "<female>"
				+    "<femaletotal>"
					+ theXMLForStats.getRowStat().getNumberOfWomenPercent()
				+    "</femaletotal>"
				+    "<femaleloans30day>"
					  + theXMLForStats.getRowStat().getNumberNewLoans30DaysBackWomenPercent()
				+    "</femaleloans30day>"
				+    "<female2030>"
					  + theXMLForStats.getRowStat().getNumberWomen20to30Percent()
				+    "</female2030>"
				+    "<female3040>"
					  + theXMLForStats.getRowStat().getNumberWomen30to40Percent()
				+    "</female3040>"
				+    "<female4050>"
					  + theXMLForStats.getRowStat().getNumberWomen40to50Percent()
				+    "</female4050>"
				+    "<female50more>"
			    	  + theXMLForStats.getRowStat().getNumberWomen50to130Percent()
				+    "</female50more>"					
				+ "</female>"
				+ "<other>"
				+    "<othertotal>"
					+ theXMLForStats.getRowStat().getNumberOfOthersPercent()
				+    "</othertotal>"
				+    "<otherloans30day>"
					  + theXMLForStats.getRowStat().getNumberNewLoans30DaysBackOtherPercent()
				+    "</otherloans30day>"
					+    "<other2030>"
						  + theXMLForStats.getRowStat().getNumberOther20to30Percent()
					+    "</other2030>"
					+    "<other3040>"
						  + theXMLForStats.getRowStat().getNumberOther30to40Percent()
					+    "</other3040>"
					+    "<other4050>"
						  + theXMLForStats.getRowStat().getNumberOther40to50Percent()
					+    "</other4050>"
					+    "<other50more>"
				    	  + theXMLForStats.getRowStat().getNumberOther50to130Percent()
					+    "</other50more>"			
				+ "</other>"
			+ "</userstatus>"
				+ "");
		
		//then pass it to the next
			nextInChain.getStatInString(theXMLForStats);
			
		}
}

