package model;

import java.io.Serializable;
import java.sql.Timestamp;

public class CurrentMovieDataBean implements Serializable {

	private String movie_name;
	private Timestamp start_day;
	private Timestamp end_day;
	private String movie_cd;
	private double book_rate;
	private int likecount;
	
	
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	public Timestamp getStart_day() {
		return start_day;
	}
	public void setStart_day(Timestamp start_day) {
		this.start_day = start_day;
	}
	public Timestamp getEnd_day() {
		return end_day;
	}
	public void setEnd_day(Timestamp end_day) {
		this.end_day = end_day;
	}
	public String getMovie_cd() {
		return movie_cd;
	}
	public void setMovie_cd(String movie_cd) {
		this.movie_cd = movie_cd;
	}
	public double getBook_rate() {
		return book_rate;
	}
	public void setBook_rate(double book_rate) {
		this.book_rate = book_rate;
	}
	public int getLikecount() {
		return likecount;
	}
	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}
	
	
	
}
