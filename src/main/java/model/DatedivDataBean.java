package model;

import java.io.Serializable;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;


public class DatedivDataBean implements Serializable {
	private String screen_date;
	private String day;
	
	public String getDay() {
		return day;
	}

	

	public String getScreen_date() {
		return screen_date;
	}

	public void setScreen_date(Date screen_date) {
		this.day=dateToDay(screen_date.toString());
		this.screen_date = screen_date.toString().substring(8,10);
	}
	
	
	public String dateToDay(String date){
		String day=" ";
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd") ;
		java.util.Date nDate;
		Calendar cal = Calendar.getInstance() ;
		try {
			nDate = dateFormat.parse(date);
			cal.setTime(nDate);
			int dayNum = cal.get(Calendar.DAY_OF_WEEK) ;
			switch(dayNum){
			case 1:
				day = "일";
				break ;
			case 2:
				day = "월";
				break ;
			case 3:
				day = "화";
				break ;
			case 4:
				day = "수";
				break ;
			case 5:
				day = "목";
				break ;
			case 6:
				day = "금";
				break ;
			case 7:
				day = "토";
				break ;

			}

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return day ;
	}

}
