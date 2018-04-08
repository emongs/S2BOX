package model;

import java.io.Serializable;


public class MoviedivDataBean implements Serializable {
	private String movie_name;
	private String grade;
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		
		this.movie_name = movie_name;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		
		this.grade = grade;
	}
	
}
