package stats;
/**
 * @author 		Niklas Karlsson<br>
 * @version     1.0<br>
 *  a "chain of responsibility" that build up the XML-string.<br>
 * build the tag: loan info <br>
 * (activity, mosttotal, gender,  agespan, loans, ans the same for most30day and thar same 2 for the "least" tags)
 *
 * @see Chain
 */
public class StatPart4 implements Chain {
	private  Chain nextInChain;
	// Defines the next Object to receive the data 
	@Override
	public void setNextChain(Chain nextInChain) {
		this.nextInChain = nextInChain;

	}

	@Override
	public void getStatInString(XMLholder theXMLForStats) {

		System.out.println("in chain 4" + theXMLForStats.getFinalXML());
		//Make the Statcall in the database
		
		//then populate the XMLForStats.
		theXMLForStats.addThisXMLStringblock(""
		
		 		+ "<loaninfo>"
				+ "<activity>"
					+ "<most>"
						+ "<mosttotal>"
							+ "<gender>"
								+ theXMLForStats.getRowStat().getMosteActiveUserGroup().getfName()
							+ "</gender>"
							+ "<agespan>"
								+ theXMLForStats.getRowStat().getMosteActiveUserGroup().getlName()
							+ "</agespan>"						
							+ "<loans>"
								+ theXMLForStats.getRowStat().getMosteActiveUserGroup().getlName()
							+ "</loans>"
						+ "</mosttotal>"	
						+ "<most30day>"
						+ "<gender>"
							+ theXMLForStats.getRowStat().getMosteActiveUserGroup().getfName()
						+ "</gender>"
						+ "<agespan>"
							+ theXMLForStats.getRowStat().getMosteActiveUserGroup().getlName()
						+ "</agespan>"						
						+ "<loans>"
							+ theXMLForStats.getRowStat().getMosteActiveUserGroup().getlName()
						+ "</loans>"
						+ "</most30day>"	
					+ "</most>"
					+ "<least>"
						+ "<leasttotal>"
							+ "<gender>"
								+ theXMLForStats.getRowStat().getLeastActiveUserGroup().getfName()
							+ "</gender>"
							+ "<agespan>"
								+ theXMLForStats.getRowStat().getLeastActiveUserGroup().getlName()
							+ "</agespan>"						
							+ "<loans>"
								+ theXMLForStats.getRowStat().getLeastActiveUserGroup().getlName()
							+ "</loans>"
						+ "</leasttotal>"
						+ "<least30day>"
							+ "<gender>"
								+ theXMLForStats.getRowStat().getLeastActiveUserGroup().getfName()
							+ "</gender>"
							+ "<agespan>"
								+ theXMLForStats.getRowStat().getLeastActiveUserGroup().getlName()
							+ "</agespan>"						
							+ "<loans>"
								+ theXMLForStats.getRowStat().getLeastActiveUserGroup().getlName()
							+ "</loans>"
						+ "</least30day>"
					+ "</least>"
				+ "</activity>"
			+ "</loaninfo>"
			
				+ "");
		
		//then pass it to the next
			nextInChain.getStatInString(theXMLForStats);
			
		}
}

