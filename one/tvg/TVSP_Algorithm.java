package tvg;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import core.DTNHost;
/* NOTE: This algorithm is heavily based off Lars Vogel's Djikstra Algorithm implementation, so credits to him for the original code!
 * The link to his implementation is at http://www.vogella.com/tutorials/JavaAlgorithmsDijkstra/article.html */
public class TVSP_Algorithm {
	/**==============**/
	/**= Attributes =**/
	/**==============**/
	List<Node> nodes;
	List<Edge> edges;
	List<Edge> filtered_edges;
	Set<Node> visitedNodes;
	Set<Node> unvisitedNodes;
	Map<Node, Node> predecessors;
	Map<Node, Node> alternate_predecessors;
	Map<Node, Double> accumulated_weight; // HashMap which setsa node as a key, and its accumulated weight, distance on the node.
	Double current_interval_time;
	
	/**===========**/
	/**= Métodos =**/
	/**===========**/
	/* Specific Constructor */
	public TVSP_Algorithm(TVG tvg) {
		// Copies the graph's nodes and edges into the Djikstra object so that one can operate on both.
		this.nodes = new ArrayList<Node>(tvg.getNodes());
		this.edges = new ArrayList<Edge>(tvg.getEdges());
		this.filtered_edges = new ArrayList<Edge>();
	}
	
	/* Execute (Call this method to start running TVSP, just input a source node and hope for the best!) */
	public void execute_tvsp(Node source) {
		visitedNodes = new HashSet<Node>();
		unvisitedNodes = new HashSet<Node>();
		accumulated_weight = new HashMap<Node, Double>(); // HashMap which setsa node as a key, and its accumulated weight on the node.
		predecessors = new HashMap<Node, Node>(); // Hash map containing a node and the predecessor node to it. Useful to map the shortet path.
		alternate_predecessors = new HashMap<Node, Node>();
		
		// Initially only source node is in unsettled nodes set, and has distance 0.
		accumulated_weight.put(source, 0.0); // Returns the accumulated weight of a node (Or accumulated distance of node). In this case we initially set origin node with weight 0.
		unvisitedNodes.add(source); // Initially only the source node is in this set of unvisited nodes.
		while (unvisitedNodes.size() > 0) {
			/*
			 * At firt only the source node is inside the unvisitedNodes set, so after analyizing it, it is now part of the visitednodes
			 * */
			
			Node node = getMinimumWeightNode(unvisitedNodes);
			visitedNodes.add(node);
			unvisitedNodes.remove(node);
			relaxationProcess(node); // Here we find the proper neighbours of the node with the least weight.
		}
	}

	/*
	 * HERE IN THIS METHOD THAT THE RELAXATION PROCESS WILL HAPPEn (RELAXATION similar to djikstra)
	 * */
	public void relaxationProcess(Node node) {
		List<Node> adjacentNodes = getNeighbors(node);
		for (Node target : adjacentNodes) {
			/* Aqui derivamos do famoso processo de relaxamento oriundo do Djikstra */
			
			/*
			 * A gambiarra aqui para fazer o código funcionar é a seguinte: Nós consideramos que o custo de atravessar uma aresta, isto é,
			 * o tempo de transmissão da mensagem de um nó a outro, é praticamente o mesmo (E de fato é, pois se notarmos nos logs da simulação
			 * impressos, veremos que o tempo de simulação sempre está na caasa dos 0,1 segundos).
			 * 
			 * Se pensássemos em termos de Djikstra, o método getShortestDistance retorna o "peso" acumulado em um nó, e
			 * o método getDistance(node, target) retorna o peso da aresta (Isto é, na nossa implementação, o limitante inferior,
			 * ou seja, o tempo de início, do intervalo mais cedo).
			 * 
			 * Primeiramente, o peso do nó origem é 0, e todos os demais nós tem peso INFINITY como seu peso.
			 * Durante este "relaxamento", nós verificamos se o peso do nó destino (ou seja, um nó vizinho) é maior que a distância até ele.
			 * Se for maior, nós setamos o peso de tal nó destino com um valor menor, ou seja, o valor da aresta que chega até ele.
			 * 
			 * De modo prático, significa que sempre estaremos buscando pelo caminho mais cedo possível de chegar em de um nó até outro, ou seja,
			 * significa que não necessariamente um nó vai sair mandando a mensagem para outro nó, indo direto pra primeira aresta que aparecer,
			 * uma vez que se esperamos um pouco ao invés de sair mandando a mensagem pela aresta, e esperar até que outra aresta apareça, posso
			 * chegar até o destino mais cedo!
			 * 
			 * É importante frisar que na nossa gambiarra, tomamos como referencia sempre os limitantes inferiores dos intervalos para o
			 * cálculo dos pesos, pois a velocidade de transmissão da mensagem é grande o suficiente para que a mensagem consiga ser transmitida
			 * de um nó a outro antes mesmo de desconectar, ou seja, atingir um valor superior ao limitante superior do intervalo de conexão.
			 * 
			 * */
			if (getNodeWeight(target) > getEdgeWeight(node, target) /*+ getNodeWeight(node)*/) {
				accumulated_weight.put(target, getEdgeWeight(node, target));
				predecessors.put(target, node);
				alternate_predecessors.put(target, node);
				unvisitedNodes.add(target);
			}
		}
	}
	
	// Returns the weight of a specific edge (receiving two end nodes as input)
	public double getEdgeWeight(Node node, Node target) {
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
			 * This mcgyverism here, is considering always the EARLIEST possible interval start times of each edge, so that one could
			 * hope to reach the nodes as earliest as possible. This idea is because, if a pair of nodes are to reconnect, it means
			 * a long time may have passed.
			 * 
			 * We compare the distance accumulated so far in a node with the edge's original earliest interval starting time.
			 * If the accumulated distance is greater than said starting time, it means that, during the simulation, you would never
			 * be able to reach said node, since the edge connection both nodes already disconnected (The pair of nodes may or
			 * may not reconnect in the future.
			 * 
			 * Basically this process here IGNORES edges with weight smaller than the current origin node's weight (Since, considering
			 * the simulation's timeline, if the node's weight is bigger than the edge's weight, this means, that the node can no longer
			 * send packets through this edge).
			 * */
			if (edge.getWeight() > accumulated_weight.get(node)){
				if (edge.getSource().equals(node) && !isVisited(edge.getDestination())) {
					neighbors.add(edge.getDestination());
					filtered_edges.add(edge);
				}else if (edge.getDestination().equals(node) && !isVisited(edge.getSource())) {
					neighbors.add(edge.getSource());
					filtered_edges.add(edge);
				}
			}
		}
		return neighbors;
	}
	
	// Returns the node with the smallest accumulated weight (distance) on it
	/* Receives a node lists and search within it comparing the accumulated weights of each node */
	public Node getMinimumWeightNode(Set<Node> nodes) {
		Node minimum = null;
		for (Node node : nodes) {
			/*
			 * Initially sets the first node it finds as the minimum, then it will compare the other nodes accumulated_weights, trying
			 * to find the node with the least accumulated weight (distance)
			 * */
			if (minimum == null) {
				minimum = node;
			} else {
				if (getNodeWeight(node) < getNodeWeight(minimum)) {
					minimum = node;
				}
			}
		}
		return minimum;
	}
	
	public boolean isVisited(Node vertex) {
		return visitedNodes.contains(vertex);
	}
	
	// Returns the accumulated weight of the node input as argument
	public double getNodeWeight(Node destination) {
		Double d = accumulated_weight.get(destination);
		if (d == null) {
			return Double.POSITIVE_INFINITY; // Here is the famous process of setting everyone's weight, but source's weight (which is 0), as INFINITY.
		} else {
			return d;
		}
	}
	
	
	// filtered edges search
	
	
	/* getPath */
	// This method returns the path from the source to the selected target and NULL if no path exists
	public LinkedList<Node> getPath(Node target) {
		LinkedList<Node> path = new LinkedList<Node>();
		LinkedList<Node> alternate_path = new LinkedList<Node>();
		Node step = target;
		Node alternate_step = target;
		// check if a path exists
		if (predecessors.get(step) == null) {
			return null;
		}
		
		if (alternate_predecessors.get(step) == null) {
			return null;
		}
		
		path.add(step);// Adds destination node to the path (may lead to earliest possible route)
		alternate_path.add(alternate_step); // Adds destination node to the alternate path (if above doesnt lead, this one may lead)
		
		while (predecessors.get(step) != null) {
			step = predecessors.get(step);
				path.add(step);
		}
		
		while (alternate_predecessors.get(alternate_step) != null) {
			alternate_step = alternate_predecessors.get(alternate_step);
			if (this.getNodeWeight(alternate_path.getLast()) > this.getNodeWeight(alternate_step))
				alternate_path.add(alternate_step);
		}
		
		// Put it into the correct order
		Collections.reverse(path);
		Collections.reverse(alternate_path);

		/* 
		 * Ultimate mcgyverism warning: 
		 * Had to do this to ensure in all situations (I hope) the arrival time at destination will be the earlist time possible!
		 * 
		 * It will compare the last edge of two paths, the edge with the smallest weight means the edge that should take me to the
		 * destination node as fast as possible!
		 * */
		double final_time = 0.0;
		double alternate_final_time = 0.0;
		String aux_edge_label = path.get(path.size()-1).getLabel()+"--"+path.get(path.size()-2).getLabel();
		Edge aux_edge = TVG.getInstance().getEdgeByLabel(aux_edge_label, filtered_edges);
		if(aux_edge == null ){
			aux_edge_label = path.get(path.size()-2).getLabel()+"--"+path.get(path.size()-1).getLabel();
			aux_edge = TVG.getInstance().getEdgeByLabel(aux_edge_label, filtered_edges);			
		}
		final_time = aux_edge.getWeight();
		
		aux_edge_label = alternate_path.get(alternate_path.size()-1).getLabel()+"--"+alternate_path.get(alternate_path.size()-2).getLabel();
		aux_edge = TVG.getInstance().getEdgeByLabel(aux_edge_label, filtered_edges);
		if(aux_edge == null ){
			aux_edge_label = alternate_path.get(alternate_path.size()-2).getLabel()+"--"+alternate_path.get(alternate_path.size()-1).getLabel();
			aux_edge = TVG.getInstance().getEdgeByLabel(aux_edge_label, filtered_edges);			
		}
		alternate_final_time = aux_edge.getWeight();
		//
		// Depending on which of the generated paths contains the last edge with least edge, choose to return the path containing it!
		if (final_time < alternate_final_time)
			return path;
		else
			return alternate_path;
	}
}