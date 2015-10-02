package tvg;

import java.util.ArrayList;
import java.util.List;

public class Edge {
	/*==============*/
	/*= Attributes =*/
	/*==============*/
	String label;
	Node source;
	Node destination;
	double weight;
	List<EdgeInterval> edge_intervals;
	
	/*===========*/
	/*= Methods =*/
	/*===========*/
	/* Specific Constructor */
	public Edge(String label, Node source, Node destination, double weight) {
		this.label = label;
		this.source = source;
		this.destination = destination;
		this.weight = weight;
		this.edge_intervals = new ArrayList<EdgeInterval>();
	}
	
	/* getLabel */
	public String getLabel() {
		return label;
	}
	
	/* setLabel */
	public void setLabel(String label) {
		this.label = label;
	}
	
	/* getDestination */
	public Node getDestination() {
		return destination;
	}

	/* setDestination */
	public void setDestination(Node destination) {
		this.destination = destination;
	}		
	
	/* getSource */
	public Node getSource() {
		return source;
	}

	/* setSource */
	public void setSource(Node source) {
		this.source = source;
	}	

	/* getWeight */
	public double getWeight() {
		return weight;
	}

	/* setWeight */
	public void setWeight(double value) {
		this.weight = value;
	}	
	
	/* addInterval */
	public void addInterval(double t1, double t2){
		this.edge_intervals.add(new EdgeInterval(t1,t2));
	}	
	
	/* getIntervals */
	public List<EdgeInterval> getIntervals() {
		return edge_intervals; // Return the list of the time intervals stored within this edge!
	}	

	/* getMinimumIntervalStartTime*/
	// Returns the edge's smallest, thus earliest, interval start time.
	public double getMinimumIntervalStartTime(){
		double minimum = 0.0;
		for (EdgeInterval in : edge_intervals) {
			if (minimum == 0.0) {
				minimum = in.getStartTime();
			} else {
				if (in.getStartTime() < minimum) {
					minimum = in.getStartTime();
				}
			}
		}
		return minimum;
	}
	
	/* getSmallestIntervalStartTime*/
	// Returns the edge's smallest, thus earliest, interval end time.
	public double getMinimumIntervalEndTime(){
		double minimum = 0.0;
		for (EdgeInterval in : edge_intervals) {
			if (minimum == 0.0) {
				minimum = in.getEndTime();
			} else {
				if (in.getStartTime() < minimum) {
					minimum = in.getEndTime();
				}
			}
		}
		return minimum;
	}
	
	/* Overriden crap */
	@Override
	public String toString() {
		return source + "--" + destination;
	}
} 