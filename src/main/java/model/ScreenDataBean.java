package model;

import java.io.Serializable;

public class ScreenDataBean implements Serializable {
	private String screen_name;
	private String screen_code;
	public String getScreen_name() {
		return screen_name;
	}
	public void setScreen_name(String screen_name) {
		this.screen_name = screen_name;
	}
	public String getScreen_code() {
		return screen_code;
	}
	public void setScreen_code(String screen_code) {
		this.screen_code = screen_code;
	}
	
}
