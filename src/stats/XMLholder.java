package stats;

import model.*;

/**
 * @author 		Niklas Karlsson<br>
 * @version     1.0<br>
 * 
 * This is a singelton that holds the information in "row and a XMLstring that we need to populate"<br>
 * (then we need to "init" the XMLholder and then to get the XML string that we just populated we need to use: getFinalXML-method)
 *
 */
public class XMLholder {
	private static XMLholder instance = null;
	private String XMLstartTag = ""
			+ "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
			+ "<response>"; //just test
	
	private String XMLendTag = "</response>"; //just test
	
	private String XMLstring = XMLstartTag;
	private Statistics RowStat;
	private MainViewInformaiton mvi = null;

	public static XMLholder getInstance(){
		if(instance == null) {
			instance = new XMLholder();
		}
		return instance;
	}
	
	protected XMLholder(){
	}
	/**
	 * @param theXMLblock and a chunk of tags in the XML-holder-string<br>
	 * NOTE: need to be complete start and stop-tags!
	 *
	 */
	public void addThisXMLStringblock(String theXMLblock) {
		StringBuilder sb = new StringBuilder();
		sb.append(XMLstring);
		sb.append(theXMLblock);
		XMLstring = sb.toString();		
	}
	
	/**
	 * @return String return the final XMLstring with endtag, this is IMPORTANT to use this to get the whole XLM-string
	 */
	public String getFinalXML() {
		return XMLstring + XMLendTag;
	}
	
	private void restet() {
		XMLstring = XMLstartTag;
		RowStat = null;
		mvi = null;
	}

	private void setCreater(MainViewInformaiton mvi) {
		this.mvi = mvi;
		
	}
	
	public MainViewInformaiton getCreater() {
		return mvi;
	}
	
	public Statistics getRowStat() {
		return RowStat;
	}
	
	/**
	 * Here we make the database request of the stat, ant then parse it to a Stat-object (rowstat)  
	 *(from the init-method)
	 */
	private void populateRowStat() {
		// TODO: make a stet-servercall with the user in mvi
    RowStat = AccessStat.getStat( mvi.getCurrentUser().getUserID());
		//this in just a dummyContent!
		//RowStat = dummyRowStatContent();
		
	}
	
//just for test..
	private Statistics dummyRowStatContent() {
		Statistics dummy = new Statistics();
		BikeUser tempUser =  new  BikeUser();
		tempUser.setUserID(123);
		tempUser.setUserName("test123");

		Bike tempBike = new Bike();
		//done row1
		dummy.setNumberOfTotalBikes(1017);
		
		//done table1
		dummy.setAvailableBikesPercent(60.4720);
		dummy.setNumberOfUsableBikesPercent(60.9636);
		dummy.setNumberOfMaintenancePercent(18.58);
		dummy.setNumberOfDisabledBikesPercent(19.08);
		dummy.setNumberNewLoans30DaysBackTotal(25);
		
		dummy.setNumberOfUsers(18);
		dummy.setNumberOfMenPercent(33.33);
		dummy.setNumberOfWomenPercent(27.78);
		dummy.setNumberOfOthersPercent(16.67);
		
		//done table2
		dummy.setNumberNewLoans30DaysBackMenPercent(15.20);
		dummy.setNumberNewLoans30DaysBackWomenPercent(50.5);
		dummy.setNumberNewLoans30DaysBackOtherPercent(40.0);

		//done table3
		dummy.setNumberMen20to30Percent(60);
		dummy.setNumberMen30to40Percent(22);
		dummy.setNumberMen40to50Percent(11);
		dummy.setNumberMen50to130Percent(1);
		
		dummy.setNumberWomen20to30Percent(40.56);
		dummy.setNumberWomen30to40Percent(20.56);
		dummy.setNumberWomen40to50Percent(11.11);
		dummy.setNumberWomen50to130Percent(30.56);
		
		dummy.setNumberOther20to30Percent(10);
		dummy.setNumberOther30to40Percent(20);
		dummy.setNumberOther40to50Percent(60);
		dummy.setNumberOther50to130Percent(10);
				
		
		dummy.setMosteActiveUserGroup(tempUser);//"Other 40 to 50");
		dummy.setLeastActiveUserGroup(tempUser);//"Male 30 to 40");
		
		/*TODO: most_active_user_group_total	
		 * least_active_user_group_total	
		 * most_active_user_group_30_days_back	
		 * least_active_user_group_30_days_back*/
		tempBike.setType("Barn");
		tempBike.setBrandName("DBS");
		tempBike.setModelYear(2014);
		//TODO: nr of loans on bikes!			
		//TODO: dummy.setMostPopularBikes(tempBike);
		//TODO: leastPopulareBIkes;
		
		dummy.setGeneratedBy(tempUser.getUserName());
		
		
		return dummy;
	}

	/**
	 * @param mvi
	 * We have to init the XMLHolder, please do this before you start use this instanse!
	 */
	public void init(MainViewInformaiton mvi) {
		restet();
		setCreater(mvi);
		populateRowStat();		
	}


}
