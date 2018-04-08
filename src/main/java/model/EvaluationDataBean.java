package model;

import java.io.Serializable;
import java.sql.Timestamp;

public class EvaluationDataBean implements Serializable{
	
	private String content;
	private String id;
	private Timestamp reg_date;
	private double star;
	private int likeup;
	private int likedown;
	private int eval_id;
	private String movie_name;
	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Timestamp getReg_date() {
		return reg_date;
	}

	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}

	public double getStar() {
		return star;
	}

	public void setStar(double star) {
		this.star = star;
	}

	public int getLikeup() {
		return likeup;
	}

	public void setLikeup(int likeup) {
		this.likeup = likeup;
	}

	public int getLikedown() {
		return likedown;
	}

	public void setLikedown(int likedown) {
		this.likedown = likedown;
	}

	public int getEval_id() {
		return eval_id;
	}

	public void setEval_id(int eval_id) {
		this.eval_id = eval_id;
	}

	public String getMovie_name() {
		return movie_name;
	}

	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}

	@Override
	public String toString() {
		return "EvaluationDataBean [content=" + content + ", id=" + id
				+ ", reg_date=" + reg_date + ", star=" + star + ", likeup="
				+ likeup + ", likedown=" + likedown + ", eval_id=" + eval_id
				+ ", movie_name=" + movie_name + "]";
	}


}
