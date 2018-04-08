package model;

import java.io.Serializable;
import java.sql.Timestamp;

public class MemberDataBean implements Serializable{
	
	
	private String id;
	private String passwd;
	private String name; 
	private String birth;
	private String birth1;
	private String birth2;
	private String birth3;
	private String mobile;
	private String mobile1;
	private String mobile2;
	private String mobile3;
	private String nickname;
	private String filename;
	private String email1;
	private String email2;
	private String email;
	private String blog;
	private String zipNo1;
	private String zipNo2; 
	private String address1;
	private String address2;
	private Timestamp reg_date;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getBirth1() {
		return birth1;
	}
	public void setBirth1(String birth1) {
		this.birth1 = birth1;
	}
	public String getBirth2() {
		return birth2;
	}
	public void setBirth2(String birth2) {
		this.birth2 = birth2;
	}
	public String getBirth3() {
		return birth3;
	}
	public void setBirth3(String birth3) {
		this.birth3 = birth3;
		this.birth=this.birth1+this.birth2+birth3;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getMobile1() {
		return mobile1;
	}
	public void setMobile1(String mobile1) {
		this.mobile1 = mobile1;
	}
	public String getMobile2() {
		return mobile2;
	}
	public void setMobile2(String mobile2) {
		this.mobile2 = mobile2;
	}
	public String getMobile3() {
		return mobile3;
	}
	public void setMobile3(String mobile3) {
		this.mobile3 = mobile3;
		this.mobile=this.mobile1+this.mobile2+mobile3;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getEmail1() {
		return email1;
	}
	public void setEmail1(String email1) {
		this.email1 = email1;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
		this.email=this.email1+'@'+email2;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getBlog() {
		return blog;
	}
	public void setBlog(String blog) {
		this.blog = blog;
	}
	public String getZipNo1() {
		return zipNo1;
	}
	public void setZipNo1(String zipNo1) {
		this.zipNo1 = zipNo1;
	}
	public String getZipNo2() {
		return zipNo2;
	}
	public void setZipNo2(String zipNo2) {
		this.zipNo2 = zipNo2;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public Timestamp getReg_date() {
		return reg_date;
	}
	public void setReg_date(Timestamp reg_date) {
		this.reg_date = reg_date;
	}
	@Override
	public String toString() {
		return "MemberDataBean [id=" + id + ", passwd=" + passwd + ", name="
				+ name + ", birth=" + birth + ", birth1=" + birth1
				+ ", birth2=" + birth2 + ", birth3=" + birth3 + ", mobile="
				+ mobile + ", mobile1=" + mobile1 + ", mobile2=" + mobile2
				+ ", mobile3=" + mobile3 + ", nickname=" + nickname
				+ ", filename=" + filename + ", email1=" + email1 + ", email2="
				+ email2 + ", email=" + email + ", blog=" + blog + ", zipNo1="
				+ zipNo1 + ", zipNo2=" + zipNo2 + ", address1=" + address1
				+ ", address2=" + address2 + ", reg_date=" + reg_date + "]";
	}
		

	
}
