package model;

import java.time.LocalDateTime;
import java.util.ArrayList;

/**
 * Created by Niklas och Goloconda on 2017-01-18.
 *
 * TODO: lägg till kön och födelseår
 * TODO: schemalägg event som sparar ner en sekvensraport i databasen
 */
public class Statistics {
  private LocalDateTime dateTime;
  private String generatedBy;

  //BikeStatistics
  private int numberOfTotalBikes;
  private double availableBikesPercent;
  private double numberOfUsableBikesPercent; //3, 4 eller 5
  private double numberOfMaintenancePercent; //2
  private double numberOfDisabledBikesPercent; //1

  //Användarstatistik
  private int numberOfUsers;
  private double numberOfMenPercent;
  private double numberOfWomenPercent;
  private double numberOfOthersPercent;
  
  private double numberMen20to30Percent;
  private double numberMen30to40Percent;
  private double numberMen40to50Percent;
  private double numberMen5to130Percent;
  
  private double numberWomen20to30Percent;
  private double numberWomen30to40Percent;
  private double numberWomen40to50Percent;
  private double numberWomen50to130Percent;

  private double numberOther20to30Percent;
  private double numberOther30to40Percent;
  private double numberOther40to50Percent;
  private double numberOther50to130Percent;

  //Aktivitetsstatistic
  private int numberNewLoans30DaysBackTotal;
  private double numberNewLoans30DaysBackMenPercent;
  private double numberNewLoans30DaysBackWomenPercent;
  private double numberNewLoans30DaysBackOtherPercent;
  private BikeUser mosteActiveUserGroup; //Ev ett enum
  private BikeUser leastActiveUserGroup;
  private BikeUser mosteActiveUserGroup30DaysBack; //Ev ett enum
  private BikeUser leastActiveUserGroup30DaysBack;

  //Cykelaktivitetsstatic
  private ArrayList<Bike> mostPopularBikes; //utan id, men med bild
  private ArrayList<Bike> leastPopulareBIkes;


  public int getNumberOfTotalBikes() {
    return numberOfTotalBikes;
  }

  public void setNumberOfTotalBikes(int numberOfTotalBikes) {
    this.numberOfTotalBikes = numberOfTotalBikes;
  }


  public double getAvailableBikesPercent() {
    return availableBikesPercent;
  }

  public void setAvailableBikesPercent(double availableBikesPercent) {
    this.availableBikesPercent = availableBikesPercent;
  }

  public double getNumberOfUsableBikesPercent() {
    return numberOfUsableBikesPercent;
  }

  public void setNumberOfUsableBikesPercent(double numberOfUsableBikesPercent) {
    this.numberOfUsableBikesPercent = numberOfUsableBikesPercent;
  }

  public double getNumberOfMaintenancePercent() {
    return numberOfMaintenancePercent;
  }

  public void setNumberOfMaintenancePercent(double numberOfMaintenancePercent) {
    this.numberOfMaintenancePercent = numberOfMaintenancePercent;
  }

  public double getNumberOfDisabledBikesPercent() {
    return numberOfDisabledBikesPercent;
  }

  public void setNumberOfDisabledBikesPercent(double numberOfDisabledBikesPercent) {
    this.numberOfDisabledBikesPercent = numberOfDisabledBikesPercent;
  }

  public int getNumberOfUsers() {
    return numberOfUsers;
  }

  public void setNumberOfUsers(int numberOfUsers) {
    this.numberOfUsers = numberOfUsers;
  }

  public double getNumberOfMenPercent() {
    return numberOfMenPercent;
  }

  public void setNumberOfMenPercent(double numberOfMenPercent) {
    this.numberOfMenPercent = numberOfMenPercent;
  }

  public double getNumberOfWomenPercent() {
    return numberOfWomenPercent;
  }

  public void setNumberOfWomenPercent(double numberOfWomenPercent) {
    this.numberOfWomenPercent = numberOfWomenPercent;
  }

  public double getNumberOfOthersPercent() {
    return numberOfOthersPercent;
  }

  public void setNumberOfOthersPercent(double numberOfOthersPercent) {
    this.numberOfOthersPercent = numberOfOthersPercent;
  }


  public double getNumberMen20to30Percent() {
    return numberMen20to30Percent;
  }

  public void setNumberMen20to30Percent(double numberMen20to30Percent) {
    this.numberMen20to30Percent = numberMen20to30Percent;
  }

  public double getNumberMen30to40Percent() {
    return numberMen30to40Percent;
  }

  public void setNumberMen30to40Percent(double numberMen30to40Percent) {
    this.numberMen30to40Percent = numberMen30to40Percent;
  }

  public double getNumberMen40to50Percent() {
    return numberMen40to50Percent;
  }

  public void setNumberMen40to50Percent(double numberMen40to50Percent) {
    this.numberMen40to50Percent = numberMen40to50Percent;
  }

  public double getNumberMen5to130Percent() {
    return numberMen5to130Percent;
  }

  public void setNumberMen5to130Percent(double numberMen5to130Percent) {
    this.numberMen5to130Percent = numberMen5to130Percent;
  }

  public double getNumberWomen20to30Percent() {
    return numberWomen20to30Percent;
  }

  public void setNumberWomen20to30Percent(double numberWomen20to30Percent) {
    this.numberWomen20to30Percent = numberWomen20to30Percent;
  }

  public double getNumberWomen30to40Percent() {
    return numberWomen30to40Percent;
  }

  public void setNumberWomen30to40Percent(double numberWomen30to40Percent) {
    this.numberWomen30to40Percent = numberWomen30to40Percent;
  }

  public double getNumberWomen40to50Percent() {
    return numberWomen40to50Percent;
  }

  public void setNumberWomen40to50Percent(double numberWomen40to50Percent) {
    this.numberWomen40to50Percent = numberWomen40to50Percent;
  }

  public double getNumberWomen50to130Percent() {
    return numberWomen50to130Percent;
  }

  public void setNumberWomen50to130Percent(double numberWomen50to130Percent) {
    this.numberWomen50to130Percent = numberWomen50to130Percent;
  }

  public double getNumberOther20to30Percent() {
    return numberOther20to30Percent;
  }

  public void setNumberOther20to30Percent(double numberOther20to30Percent) {
    this.numberOther20to30Percent = numberOther20to30Percent;
  }

  public double getNumberOther30to40Percent() {
    return numberOther30to40Percent;
  }

  public void setNumberOther30to40Percent(double numberOther30to40Percent) {
    this.numberOther30to40Percent = numberOther30to40Percent;
  }

  public double getNumberOther40to50Percent() {
    return numberOther40to50Percent;
  }

  public void setNumberOther40to50Percent(double numberOther40to50Percent) {
    this.numberOther40to50Percent = numberOther40to50Percent;
  }

  public double getNumberOther50to130Percent() {
    return numberOther50to130Percent;
  }

  public void setNumberOther50to130Percent(double numberOther50to130Percent) {
    this.numberOther50to130Percent = numberOther50to130Percent;
  }


public int getNumberNewLoans30DaysBackTotal() {
	return numberNewLoans30DaysBackTotal;
}

public void setNumberNewLoans30DaysBackTotal(int numberNewLoans30DaysBackTotal) {
	this.numberNewLoans30DaysBackTotal = numberNewLoans30DaysBackTotal;
}

public double getNumberNewLoans30DaysBackMenPercent() {
	return numberNewLoans30DaysBackMenPercent;
}

public void setNumberNewLoans30DaysBackMenPercent(double numberNewLoans30DaysBackMenPercent) {
	this.numberNewLoans30DaysBackMenPercent = numberNewLoans30DaysBackMenPercent;
}

public double getNumberNewLoans30DaysBackWomenPercent() {
	return numberNewLoans30DaysBackWomenPercent;
}

public void setNumberNewLoans30DaysBackWomenPercent(double numberNewLoans30DaysBackWomenPercent) {
	this.numberNewLoans30DaysBackWomenPercent = numberNewLoans30DaysBackWomenPercent;
}

public double getNumberNewLoans30DaysBackOtherPercent() {
	return numberNewLoans30DaysBackOtherPercent;
}

public void setNumberNewLoans30DaysBackOtherPercent(double numberNewLoans30DaysBackOtherPercent) {
	this.numberNewLoans30DaysBackOtherPercent = numberNewLoans30DaysBackOtherPercent;
}

public BikeUser getMosteActiveUserGroup() {
	return mosteActiveUserGroup;
}

public void setMosteActiveUserGroup(BikeUser mosteActiveUserGroup) {
	this.mosteActiveUserGroup = mosteActiveUserGroup;
}

public BikeUser getLeastActiveUserGroup() {
	return leastActiveUserGroup;
}

public void setLeastActiveUserGroup(BikeUser leastActiveUserGroup) {
	this.leastActiveUserGroup = leastActiveUserGroup;
}

public ArrayList<Bike> getMostPopularBikes() {
	return mostPopularBikes;
}

public void setMostPopularBikes(ArrayList<Bike> mostPopularBikes) {
	this.mostPopularBikes = mostPopularBikes;
}

public ArrayList<Bike> getLeastPopulareBIkes() {
	return leastPopulareBIkes;
}

public void setLeastPopulareBIkes(ArrayList<Bike> leastPopulareBIkes) {
	this.leastPopulareBIkes = leastPopulareBIkes;
}


  public BikeUser getMosteActiveUserGroup30DaysBack() {
    return mosteActiveUserGroup30DaysBack;
  }

  public void setMosteActiveUserGroup30DaysBack(BikeUser mosteActiveUserGroup30DaysBack) {
    this.mosteActiveUserGroup30DaysBack = mosteActiveUserGroup30DaysBack;
  }

  public BikeUser getLeastActiveUserGroup30DaysBack() {
    return leastActiveUserGroup30DaysBack;
  }

  public void setLeastActiveUserGroup30DaysBack(BikeUser leastActiveUserGroup30DaysBack) {
    this.leastActiveUserGroup30DaysBack = leastActiveUserGroup30DaysBack;
  }

  public LocalDateTime getDateTime() {
    return dateTime;
  }

  public void setDateTime(LocalDateTime dateTime) {
    this.dateTime = dateTime;
  }

  public String getGeneratedBy() {
    return generatedBy;
  }

  public void setGeneratedBy(String generatedBy) {
    this.generatedBy = generatedBy;
  }

  


}
