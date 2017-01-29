package stats;

/**
 * @author 		Niklas Karlsson<br>
 * @version     1.0<br>
 *  a "chain of responsibility" that build up the XML-string.<br>
 * build the tag: BikesCondition (total, avalible, usable,  maintenance and disabled tag
 *
 * @see Chain
 */

public class StatPart2 implements Chain {
	private  Chain nextInChain;
	// Defines the next Object to receive the data 
	@Override
	public void setNextChain(Chain nextInChain) {
		this.nextInChain = nextInChain;

	}

	@Override
	public void getStatInString(XMLholder theXMLForStats) {

		System.out.println("in chain 2" + theXMLForStats.getFinalXML());
		//Make the Statcall in the database
		
		//then populate the XMLForStats.
		theXMLForStats.addThisXMLStringblock(""
				+ "<bikescondition>"
				+ "<total>"
				+ theXMLForStats.getRowStat().getNumberOfTotalBikes()
				+ "</total>"
				+ "<avalible>"
				+ theXMLForStats.getRowStat().getAvailableBikesPercent()
				+ "</avalible>"
				+ "<usable>"
				+ theXMLForStats.getRowStat().getNumberOfUsableBikesPercent()
				+ "</usable>"
				+ "<maintenance>"
				+ theXMLForStats.getRowStat().getNumberOfMaintenancePercent()
				+ "</maintenance>"
				+ "<disabled>"
				+ theXMLForStats.getRowStat().getNumberOfDisabledBikesPercent()
				+ "</disabled>"
			+ "</bikescondition>"
				+ "");
		//then pass it to the next
			nextInChain.getStatInString(theXMLForStats);
			
		}
}


