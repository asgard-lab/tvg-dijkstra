package tvg;

public class EdgeInterval {
	/*==============*/
	/*= Attributes =*/
	/*==============*/
	double start_time, end_time; // Interval's starting and ending time.
	String label;

	/*===========*/
	/*= Methods =*/
	/*===========*/	
	/* Specific Constructor */
	public EdgeInterval(double t1, double t2){
		this.start_time = t1;
		this.end_time = t2;
		this.label = "[" + String.valueOf(this.start_time) + "," + String.valueOf(this.end_time) + "]";
	}
	
	/* setLabel */
	public void setLabel(String label_parameter){
		this.label = label_parameter;
	}
	
	/* getLabel */
	public String getLabel(){
		return this.label;
	}
	
	/* getStartTime */
	public double getStartTime() {
		return start_time;
	}
	
	/* setStartTime */
	public void setStartTime(Double value) {
		this.start_time = value;
	}
	
	/* getEndTime */
	public double getEndTime() {
		return end_time;
	}
	
	/* setEndTime */
	public void setEndTime(Double value) {
		this.end_time = value;
	}
	
	/* Same crap as getLabel */
	@Override
	public String toString(){
		return this.getLabel();
	}
}
