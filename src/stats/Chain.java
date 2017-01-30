
package stats;



/**
 * @author Niklas Karlsson
 * 
 *  A "chain of responsibility" interface that is build up the XML-string.<br>
 * <img src="./javadoc-img/chain.PNG" WIDTH=95% HEIGHT=95%/>
 *  * //<img src="./javadoc-img/PDFpart.PNG" />
 * This is the main class <br>
 *  //<img src="./doc-UML/PDFpart.PNG" WIDTH=95% HEIGHT=95%/>
 */
public interface Chain {
	
public void setNextChain(Chain nextInChain);
	
	// Either solves the problem or passes the data
	// to the next Object in the chain
	
	public void getStatInString(XMLholder theXMLForStats);

}
