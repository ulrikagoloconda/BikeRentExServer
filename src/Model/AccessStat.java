package Model;

import helpers.PCRelated;

import java.io.ByteArrayInputStream;
import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

/**
 * @author Niklas Karlsson
 * @version 1.0
 * @since 2017-01-29
 */

//TODO denna klass är utmarkerad för att lättast kunna få ett program som kör, en nödlösning i mergporcessen

public class AccessStat {
    /*
    public Statistics getStat(int userID) {
        System.out.println("getStat from" + " user " + userID);
        DBType dataBase = null;
        Connection conn = null;
        if (helpers.PCRelated.isThisNiklasPC()) {
            dataBase = DBType.Niklas;
        } else {
            dataBase = DBType.Ulrika;
        }
        try {
            conn = DBUtil.getConnection(dataBase);
            String sql = "SELECT * FROM statistic_view WHERE generated_by_id=?";
            CallableStatement cs = conn.prepareCall(sql);
            cs.setInt(1, userID);
          ResultSet rs = cs.executeQuery();
          Statistics returnStat = new Statistics();
         while (rs.next()) {
           returnStat.setNumberOfTotalBikes(rs.getInt("total_num_of_bikes"));
           returnStat.setAvailableBikesPercent(rs.getDouble("avalible_bikes_precent"));
           returnStat.setNumberOfUsableBikesPercent(rs.getDouble("usable_bikes_percent"));
           returnStat.setNumberOfMaintenancePercent(rs.getDouble("maintenance_percent"));
           returnStat.setNumberOfDisabledBikesPercent(rs.getDouble("disabled_percent"));

           returnStat.setNumberOfUsers(rs.getInt("total_numbers_of_users"));
           returnStat.setNumberOfMenPercent(rs.getDouble("male_users_percent"));
           returnStat.setNumberOfWomenPercent(rs.getDouble("female_users_percent"));
           returnStat.setNumberOfOthersPercent(rs.getDouble("other_users_percent"));

           returnStat.setNumberMen20to30Percent(rs.getDouble("male_20_to_30_percent"));
           returnStat.setNumberMen30to40Percent(rs.getDouble("male_30_to_40_percent"));
           returnStat.setNumberMen40to50Percent(rs.getDouble("male_40_to_50_percent"));
           returnStat.setNumberMen5to130Percent(rs.getDouble("male_50_or_more_percent"));

           returnStat.setNumberWomen20to30Percent(rs.getDouble("female_20_to_30_percent"));
           returnStat.setNumberWomen30to40Percent(rs.getDouble("female_30_to_40_percent"));
           returnStat.setNumberWomen40to50Percent(rs.getDouble("female_40_to_50_percent"));
           returnStat.setNumberWomen50to130Percent(rs.getDouble("female_50_or_more_percent"));

           returnStat.setNumberOther20to30Percent(rs.getDouble("female_20_to_30_percent"));
           returnStat.setNumberOther30to40Percent(rs.getDouble("female_30_to_40_percent"));
           returnStat.setNumberOther40to50Percent(rs.getDouble("female_40_to_50_percent"));
           returnStat.setNumberOther50to130Percent(rs.getDouble("female_50_or_more_percent"));

           returnStat.setNumberNewLoans30DaysBackTotal(rs.getInt("new_loans_30_days_back_total"));
           returnStat.setNumberNewLoans30DaysBackMenPercent(rs.getDouble("new_loans_30_days_back_male_percent"));
           returnStat.setNumberNewLoans30DaysBackWomenPercent(rs.getDouble("new_loans_30_days_back_female_percent"));
           returnStat.setNumberNewLoans30DaysBackOtherPercent(rs.getDouble("new_loans_30_days_back_other_percent"));

           // TODO: gender,categoty, total_number of loans...
           //BikeUser bikeUser= new BikeUser();
           //TODO: ReturnStat.setMosteActiveUserGroup(rs.getInt("moste_active_user_group_total"));
           //TODO: ReturnStat.setLeastActiveUserGroup(rs.getInt("least_active_user_group_total"));

           // TODO: gender,categoty, total_number of loans...
           //TODO: ReturnStat.setMosteActiveUserGroup30DaysBack(rs.getInt("moste_active_user_group_30_days_back"));
           //TODO: ReturnStat.setLeastActiveUserGroup30DaysBack(rs.getInt("least_active_user_group_30_days_back"));

           //TODO do a loop..
           //TODO: populate bikeArray.. : setMostPopularBikes ArrayList<Bike> mostPopularBikes..
           //setMostPopularBikes
           //TODO: populate bikeArray.. : setLeastPopulareBIkes ArrayList<Bike> leastPopulareBIkes..
           /*
           Bike b = new Bike();
              b.setBikeID(rs.getInt("bikeID"));
              b.setColor(rs.getString("color"));
              b.setSize(rs.getInt("size"));
              b.setModelYear(rs.getInt("modelyear"));
              b.setType(rs.getString("typeName"));
              b.setBrandName(rs.getString("brandname"));
              allBikes.add(b);


           returnStat.setGeneratedBy(rs.getString("generated_by"));

            }
            return returnStat;
            }
          }
        catch (SQLException e) {
          e.printStackTrace();
        }

    public static Statistics getStatContet(Object p0) {
    }
        return null;
        }
*/
}
