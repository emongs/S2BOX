package model;

import java.io.Serializable;

public class LocalDataBean implements Serializable {
		private String local;
		private String theater_name;
		
		public String getLocal() {
			return local;
		}
		public void setLocal(String local) {
			
			this.local = local;
		}
		public String getTheater_name() {
			return theater_name;
		}
		public void setTheater_name(String theater_name) {
			this.theater_name = theater_name;
		}
		@Override
		public String toString() {
			return "LocalDataBean [local=" + local + ", theater_name="
					+ theater_name + "]";
		}
		
}
