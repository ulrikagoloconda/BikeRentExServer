package stats;

/**
 * @author 		Niklas Karlsson<br>
 * @version     1.0<br>
 *  a "chain of responsibility" that build up the XML-string.<br>
 * build the tag: bikes <br>
 * (popularbikes, leastpopularbike tag)
 *
 * @see Chain
 */
public class StatPartLAST implements Chain {
	private  Chain nextInChain;
	// Defines the next Object to receive the data 
	@Override
	public void setNextChain(Chain nextInChain) {
		this.nextInChain = nextInChain;

	}

	@Override
	public void getStatInString(XMLholder theXMLForStats) {

		System.out.println("in chain Last" + theXMLForStats.getFinalXML());
		//Make the Statcall in the database
		
		//stringbuild the bikes:
		StringBuilder sb = new StringBuilder("");
		// TODO fix a dummy bikes then test this..
		
		/*TODO fix a dummy bikes then test this..
		 * response/bikes/popularbikes/bike"
		 * type
		 * brand			
		 * model_year
		 * number_of_loans
		 * 
		 * response/bikes/leastpopularbikes/bike
		 * 
		ArrayList<Bike> MostpopularBikes =  theXMLForStats.getRowStat().getMostPopularBikes();
		for (int i = 0; i < MostpopularBikes.size(); i++) {
			System.out.println(MostpopularBikes.get(i));
			sb.append(""
					+ "<popularbike>"	
						+ "<bikenr>"
							+ 	i
						+ "</bikenr>"
						+ "<type>"
							+ MostpopularBikes.get(i).getType()
						+ "</type>"
						+ "<brand>"
							+ MostpopularBikes.get(i).getBrandName()
						+ "</brand>"
						+ "<year>"
							+ MostpopularBikes.get(i).getModelYear()
						+ "</year>"
						+ "<totalloans>"
						//TODO: get nr of loans
							+ MostpopularBikes.get(i).getSize()
						+ "</totalloans>"						
					+ "</popularbike>"	
			);
		}
		ArrayList<Bike> LeastpopularBikes =  theXMLForStats.getRowStat().getLeastPopulareBIkes();
		for (int i = 0; i < MostpopularBikes.size(); i++) {
			System.out.println(MostpopularBikes.get(i));
			sb.append(""
					+ "<notpopularbike>"	
						+ "<bikenr>"
							+ 	i
						+ "</bikenr>"
						+ "<type>"
							+ MostpopularBikes.get(i).getType()
						+ "</type>"
						+ "<brand>"
							+ MostpopularBikes.get(i).getBrandName()
						+ "</brand>"
						+ "<year>"
							+ MostpopularBikes.get(i).getModelYear()
						+ "</year>"
						+ "<totalloans>"
						//TODO: get nr of loans
							+ MostpopularBikes.get(i).getSize()
						+ "</totalloans>"						
					+ "</notpopularbike>"	
			);
		}
 
		 */
		
		//then populate the XMLForStats.
		theXMLForStats.addThisXMLStringblock(""
				+ "<bikes>"				
				+  sb.toString()
				+ "</bikes>"
				+ "");
		//then 
			//this IS the last one we are done!!
		}
}
