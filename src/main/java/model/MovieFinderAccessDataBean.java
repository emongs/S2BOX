package model;

import java.io.Serializable;
import java.util.Arrays;

public class MovieFinderAccessDataBean implements Serializable {

	private String movieNm;
	private String movieNmEn;
	private String prdtYear;
	private String movieType;
	private String directors;
	private String company;
	private String likenum;
	private String[] genre;
	private String[] nations;
	private String[] grade;
	public String getMovieNm() {
		return movieNm;
	}
	public void setMovieNm(String movieNm) {
		this.movieNm = movieNm;
	}
	public String getMovieNmEn() {
		return movieNmEn;
	}
	public void setMovieNmEn(String movieNmEn) {
		this.movieNmEn = movieNmEn;
	}
	public String getPrdtYear() {
		return prdtYear;
	}
	public void setPrdtYear(String prdtYear) {
		this.prdtYear = prdtYear;
	}
	public String getMovieType() {
		return movieType;
	}
	public void setMovieType(String movieType) {
		this.movieType = movieType;
	}
	public String getDirectors() {
		return directors;
	}
	public void setDirectors(String directors) {
		this.directors = directors;
	}
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getLikenum() {
		return likenum;
	}
	public void setLikenum(String likenum) {
		this.likenum = likenum;
	}
	public String[] getGenre() {
		return genre;
	}
	public void setGenre(String[] genre) {
		this.genre = genre;
	}
	public String[] getNations() {
		return nations;
	}
	public void setNations(String[] nations) {
		this.nations = nations;
	}
	public String[] getGrade() {
		return grade;
	}
	public void setGrade(String[] grade) {
		this.grade = grade;
	}
	@Override
	public String toString() {
		return "MovieFinderAccessDataBean [movieNm=" + movieNm + ", movieNmEn="
				+ movieNmEn + ", prdtYear=" + prdtYear + ", movieType="
				+ movieType + ", directors=" + directors + ", company="
				+ company + ", likenum=" + likenum + ", genre="
				+ Arrays.toString(genre) + ", nations="
				+ Arrays.toString(nations) + ", grade="
				+ Arrays.toString(grade) + "]";
	}
	
	
	
}
