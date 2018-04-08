package model;

import java.io.Serializable;

public class WishListDataBean implements Serializable {

	private String id;
	private String movie_name;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMovie_name() {
		return movie_name;
	}
	public void setMovie_name(String movie_name) {
		this.movie_name = movie_name;
	}
	
	
}
