package tvg;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class TVSP_Algorithm {
	/*==============*/
	/*= Attributes =*/
	/*==============*/
	List<Node> nodes;
	List<Edge> edges;
	Set<Node> settledNodes;
	Set<Node> unSettledNodes;
	Map<Node, Node> predecessors;
	Map<Node, Double> distance;
	Double current_interval_time;
	
	/*===========*/
	/*= Methods =*/
	/*===========*/
	/* Specific Constructor */
	public TVSP_Algorithm(TVG tvg) {
		// Copies the graph's nodes and edges into the Djikstra object so that one can operate on both.
		this.nodes = new ArrayList<Node>(tvg.getNodes());
		this.edges = new ArrayList<Edge>(tvg.getEdges());
	}
	
	/* Execute */
	public void execute(Node source) {
		settledNodes = new HashSet<Node>();
		unSettledNodes = new HashSet<Node>();
		distance = new HashMap<Node, Double>();
		predecessors = new HashMap<Node, Node>();
		
		// Initially only source node is in unsettled nodes set, and has distance 0.
		distance.put(source, 0.0);
		unSettledNodes.add(source);
		
		while (unSettledNodes.size() > 0) {
			Node node = getMinimum(unSettledNodes);
			settledNodes.add(node);
			unSettledNodes.remove(node);
			findMinimalDistances(node);
		}
	}

	public void findMinimalDistances(Node node) {
		List<Node> adjacentNodes = getNeighbors(node);
		for (Node target : adjacentNodes) {
			/* Here is the infamous relaxation process of Dijkstra TVSP */
			
			/*
			 * The gambiarra here to work is the following, we must consider that the COST to traverse an edge, that is,
			 * to send a message from one node to other, is practically the same.
			 * 
			 * If we were to think in terms of Dijkstra, the method getShortestDistance returns the "weight" accumulated on a node,
			 * and getDistance(node, target) returns the weight of the edge (That is, the minimum start time of the earliest interval).
			 * 
			 * At first, the weight on the source node is 0, and every other node has INFINITY as their weight.
			 * During the relaxation process we check if the weight on the target node (neighbouring node) is greater than
			 * the distance to it. If it is greater, we set the weight of said target node with a smaller value, that is
			 * the value of the edge that reaches it.
			 * 
			 * In practical terms this means we will always be searching the earliest possible way to reach from one node to another, even
			 * if it means not going straight for the first ealiest edge possible (Because if we wait a bit instead of send the message
			 * through an edge, and wait a bit till another appear, we might arrive on the destination earlier!!)
			 * 
			 * */
			if (getShortestDistance(target) > getDistance(node, target)) {
				distance.put(target, getDistance(node, target));
				predecessors.put(target, node);
				unSettledNodes.add(target);
			}
			
			/*
			if (getShortestDistance(target) > getShortestDistance(node) + getDistance(node, target)) {
				distance.put(target, (getShortestDistance(node) + getDistance(node, target)));
				predecessors.put(target, node);
				unSettledNodes.add(target);
			}
			*/
		}
	}
	
	public double getDistance(Node node, Node target) {
		for (Edge edge : edges) {
			if (edge.getSource().equals(node) && edge.getDestination().equals(target)) {
				return edge.getWeight();
			}else if (edge.getDestination().equals(node) && edge.getSource().equals(target)) {
				return edge.getWeight();
			}
		}
		throw new RuntimeException("Should not happen");
	}
	
	public List<Node> getNeighbors(Node node) {
		List<Node> neighbors = new ArrayList<Node>();
		for (Edge edge : edges) {
			/*
			 * This gambiarra here, is considering always the EARLIEST possible interval start times of each edge, so that one could
			 * hope to reach the nodes as earliest as possible. This idea is because, if a pair of nodes are to reconect, it means
			 * a long time may have passed.
			 * 
			 * We compare the distance accumulated so far in a node with the edge's original earliest interval starting time.
			 * If the accumulated distance is greater than said starting time, it means that, during the simulation, you would never
			 * be able to reach said node, since the edge connection both nodes already disconnected (The pair of nodes may or
			 * may not reconnect in the future.
			 * 
			 * */
			if (edge.getWeight() > distance.get(node)){
				if (edge.getSource().equals(node) && !isSettled(edge.getDestination())) {
					neighbors.add(edge.getDestination());
				}else if (edge.getDestination().equals(node) && !isSettled(edge.getSource())) {
					neighbors.add(edge.getSource());
				}
			}
			
			/*
			if (edge.getMinimumIntervalStartTime() > distance.get(node)){
				if (edge.getSource().equals(node) && !isSettled(edge.getDestination())) {
					neighbors.add(edge.getDestination());
				}else if (edge.getDestination().equals(node) && !isSettled(edge.getSource())) {
					neighbors.add(edge.getSource());
				}
			}
			*/

		}
		return neighbors;
	}
	
	public Node getMinimum(Set<Node> nodes) {
		Node minimum = null;
		for (Node node : nodes) {
			if (minimum == null) {
				minimum = node;
			} else {
				if (getShortestDistance(node) < getShortestDistance(minimum)) {
					minimum = node;
				}
			}
		}
		return minimum;
	}
	
	public boolean isSettled(Node vertex) {
		return settledNodes.contains(vertex);
	}
	
	public double getShortestDistance(Node destination) {
		Double d = distance.get(destination);
		if (d == null) {
			return Double.POSITIVE_INFINITY; // Aqui é o famoso processo de inicializar toda a galera, exceto source, com INFINITO.
		} else {
			return d;
		}
	}
	
	/* getPath */
	// This method returns the path from the source to the selected target and NULL if no path exists
	public LinkedList<Node> getPath(Node target) {
		LinkedList<Node> path = new LinkedList<Node>();
		Node step = target;
		
		// check if a path exists
		if (predecessors.get(step) == null) {
			return null;
		}
		path.add(step);
		while (predecessors.get(step) != null) {
			step = predecessors.get(step);
			path.add(step);
		}
		// Put it into the correct order
		Collections.reverse(path);
		return path;
	}
}