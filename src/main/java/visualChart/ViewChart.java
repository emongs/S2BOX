package visualChart;

public class ViewChart {

	public static String view(String[] mm) {
		String line = "";
		for (String str : mm) {
			line += "'"+str+"',";
		}
		line = line.substring(0, line.length()-1);
		return line;
	}
	
	public static String view(int[] mm) {
		String line = "";
		for(int str : mm) {
			line += ""+str+",";
		}
			line = line.substring(0, line.length()-1);
			return line;
		
		
	}
	
}
