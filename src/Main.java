;import Interfaces.DBAccess;
import Model.*;
import REST.RestRoot;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import java.io.ByteArrayInputStream;
import java.util.Calendar;
import java.util.Random;

//Denna klass ska bara anv�ndas f�r att testk�ra metoder
public class Main {
	private static DBAccess dbAccess = new DBAccessImpl();
private static ByteArrayInputStream stream;
	public static void main(String[] args) {
		System.out.println("Obs, k�rs fr�n main och inte som server ");
		RestRoot restRoot = new RestRoot();
		BikeUser user = new BikeUser();
		user.setUserName("Demo123");
		user.setPassw("Demo123");
		Gson g = new Gson();
		long millisStart = Calendar.getInstance().getTimeInMillis();
		System.out.println("start " + millisStart);
		AccessBike.selectAvailableBikes();
		long millisStop = Calendar.getInstance().getTimeInMillis();
		System.out.println("läsa från databas available bikes " + (millisStop - millisStart));
	}
		//restRoot.loginBikeUser(g.toJson(user));
		//String json = "{"sessionToken":"9tact15mmvehr8t6g0mhblh580","userID":19}"
		/*BikeUser user = new BikeUser();
=======
    RestRoot restRoot = new RestRoot();
		//String json = "{"sessionToken":"9tact15mmvehr8t6g0mhblh580","userID":19}"

    //the SUPERDUPER pathfinder!!
    makePathFile();
    //only one time

    BikeUser user = new BikeUser();
>>>>>>> 58a2ef807500066151d201a843943ce7df57e3d1
		user.setUserID(19);
		user.setSessionToken("9tact15mmvehr8t6g0mhblh580");
		Gson g = new Gson();
		String s = g.toJson(user);
		long millisStart = Calendar.getInstance().getTimeInMillis();
		restRoot.getAvailableBikes(s);
		long millisStop = Calendar.getInstance().getTimeInMillis();
		System.out.println("Tidsåtgång: " + (millisStop - millisStart));
		//AccessUser.UpdateUser("golo","golo",10,"gologologolo@golo.com",400,"Ulrika", "Golo");
	//	Bike b = AccessBike.getBikeByID(17);
		//stream = b.getImageStream();

	/*	for(int i = 0; i < 50; i++) {
			addBikesChild();
		}*/

	/*	for(int i = 37887; i < 37887+2; i++){
			deletBikes(i);
			/*
			27256
			18756

			18741  st = 69223 millisekunder

		}*/
		//System.out.println("Tidsåtgång: " + (millisStop - millisStart) + " millisekunder" );
		/*
		17729st
		18730
		28731st
		1000st = 7421 millisec
		10 000st = 48813 millisec

		10 000 = 87347 millisekunder med korrekt bild
		com.mysql.jdbc.exceptions.jdbc4.CommunicationsException: The driver was unable to create a connection due to an inability to establish the client portion of a socket.

This is usually caused by a limit on the number of sockets imposed by the operating system. This limit is usually configurable.

For Unix-based platforms, see the manual page for the 'ulimit' command. Kernel or system reconfiguration may also be required.


	}


  private static void makePathFile() {
    int action = JOptionPane.showConfirmDialog(null,
        "?r du s?ker p? att du ?nskar justera inst?llningar? \n"
            +"Detta kr?ver n?mligen ett korrekt val\n"
            + "detta skall endast utf?ras vid nyinstallation eller om programpaketen flyttats\n"
            + "\n Nuvarande pekar redan p?\n"
            + "" + ProgramPathAndDir.getPathfromfile()
        , "Utf?ra Inst?llningar?"
        , JOptionPane.YES_NO_OPTION);

    String get= ProgramPathAndDir.getPathfromfile();
    StringSelection selec= new StringSelection(get);
    Clipboard clipboard = Toolkit.getDefaultToolkit().getSystemClipboard();
    clipboard.setContents(selec, selec);
    //nu finns det i minnet att klistra in..

    if(action == 0 ){
      JFileChooser fc = new JFileChooser();
      int returnVal = fc.showOpenDialog(new JButton("Inst\u00E4llningar"));

      if (returnVal == JFileChooser.APPROVE_OPTION) {
        File file = fc.getSelectedFile();
        //This is where a real application would open the file.
        System.out.println("val : " + file.getName());
//           val : Konfiguration.jar
        System.out.println("l?nk1 : " + file.getPath());
//           l?nk1 : Q:\Projekt\guitest\GUITESTochRapportsnurra\Konfiguration.jar
        System.out.println("l?nk4 : " + file.getParent());
//           l?nk4 : Q:\Projekt\guitest\GUITESTochRapportsnurra
        String path = file.getParent();

        String pathfix = path.replaceAll("\\\\", "/"); //replace("\\", File.separator);
        try {
          ProgramPathAndDir.savefile(pathfix,"path");
        } catch (IOException e1) {
          // TODO Auto-generated catch block
          e1.printStackTrace();
        }

      } else {
        JOptionPane.showMessageDialog(null,
            "Du m?ste ange var alla filer finns.\n"
                + "V?lj filen som ni just ?ppnade f?r att l?nka alla mappar korrekt", "FEL..", JOptionPane.ERROR_MESSAGE);

      }
    }

  }

*/

  public static void addBikesChild(){

		Random random = new Random();
		int randomNumber = random.nextInt(6 - 1) + 1;
		Bike bike = new Bike();
		bike.setBrandName("Dbs");
		bike.setType("Barn");
		bike.setModelYear(2014);
		bike.setSize(20);
		bike.setState(randomNumber);
		bike.setColor("Rosa");
		stream.reset();
		bike.setImageStream(stream);

		AccessBike.insertNewBike(bike);
	}

	public static void deletBikes(int i){
		AccessBike.deleteBike(i);
	}
}
