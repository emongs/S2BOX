package model;

import java.io.Serializable;
import java.util.Arrays;

public class MovieDataBeanUsingAPI implements Serializable {

	private String movieNm;
	private String movieNmEn;
	private String prdtYear;
	private String movieType;
	private String status;
	private String directors;
	private String company;
	private String openDt;
	private String startYear;
	private String endYear;
	private String findType;
	private String movieCd;
	private String peopleNm;
	private String showTm;
	
	private String[] nations;
	private String[] genre;
	private String[] grade;
	private String[] directorCd;
	private String[] peopleCd;

	
	
	
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
	public String[] getNations() {
		return nations;
	}
	public void setNations(String[] nations) {
		this.nations = nations;
	}
	public String getMovieType() {
		return movieType;
	}
	public void setMovieType(String movieType) {
		this.movieType = movieType;
	}
	public String[] getGenre() {
		return genre;
	}
	public void setGenre(String[] genre) {
		this.genre = genre;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
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
	public String[] getGrade() {
		return grade;
	}
	public void setGrade(String[] grade) {
		this.grade = grade;
	}
	public String getOpenDt() {
		return openDt;
	}
	public void setOpenDt(String openDt) {
		this.openDt = openDt;
	}
	public String getStartYear() {
		return startYear;
	}
	public void setStartYear(String startYear) {
		this.startYear = startYear;
	}
	public String getEndYear() {
		return endYear;
	}
	public void setEndYear(String endYear) {
		this.endYear = endYear;
	}
	public String getFindType() {
		return findType;
	}
	public void setFindType(String findType) {
		this.findType = findType;
	}
	public String getMovieCd() {
		return movieCd;
	}
	public void setMovieCd(String movieCd) {
		this.movieCd = movieCd;
	}
	public String getPeopleNm() {
		return peopleNm;
	}
	public void setPeopleNm(String peopleNm) {
		this.peopleNm = peopleNm;
	}
	@Override
	public String toString() {
		return "MovieDataBean [movieNm=" + movieNm + ", movieNmEn=" + movieNmEn
				+ ", prdtYear=" + prdtYear + ", nations="
				+ Arrays.toString(nations) + ", movieType=" + movieType
				+ ", genre=" + Arrays.toString(genre) + ", status=" + status
				+ ", directors=" + directors + ", company=" + company
				+ ", grade=" + Arrays.toString(grade) + ", openDt=" + openDt
				+ ", startYear=" + startYear + ", endYear=" + endYear
				+ ", findType=" + findType + ", movieCd=" + movieCd
				+ ", peopleNm=" + peopleNm + "]";
	}
	
	
	
	
}