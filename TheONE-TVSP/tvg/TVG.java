package tvg;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class TVG {
	/*==================*/
	/*= Singleton Part =*/
	/*==================*/
	/* We decided that for our TheONE project a single instance of the graph will remain active in the whole simulation! */
	private static TVG singleton_tvg;
	
	public synchronized static TVG getInstance(){
		if (singleton_tvg == null)
			singleton_tvg = new TVG();
		return singleton_tvg;
	}
	
	/*==============*/
	/*= Attributes =*/
	/*==============*/
	List<Node> nodes;
	List<Edge> edges;
	LinkedList<Node> shortest_path;
	
	/*===========*/
	/*= Methods =*/
	/*===========*/
	/* Default Constructor */
	public TVG(){
		nodes = new ArrayList<Node>(); // List where them nodes will be stored!
		edges = new ArrayList<Edge>(); // List where them edges will be stored!
	}	
	
	/* Specific Constructor */
	public TVG(List<Node> nodes, List<Edge> edges) {
		this.nodes = nodes;
		this.edges = edges;
	}
	
	/* getNodes */
	public List<Node> getNodes() {
		return nodes; // Return the list of the nodes stored in the graph!
	}
	
	/* getNodeByLabel */
	// Search for an specific node, by its label, inside a specific node list!
	public Node getNodeByLabel(String label_parametro, List<Node> list){
		for(Node n : list)
			if(n.getLabel().equals(label_parametro))
				return n;
		return null;
	}
	
	/* getEdges */
	public List<Edge> getEdges() {
		return edges; // Returns the list of the edges stored in the graph!
	}
	
	/* getEdgeByLabel */
	// Search for a specific edge, by its label, inside a specific edge list!
	public Edge getEdgeByLabel(String label_parametro, List<Edge> list){
		for(Edge n : list)
			if(n.getLabel().equals(label_parametro))
				return n;
		return null;
	}

	/* isInsideAnInInterval */
	// Given a certain time, during simulation, verify if such time is part of a given edge (Such time may be in any of the edge's intervals)
	public boolean isInsideAnInterval(double t, Edge a){
		for (EdgeInterval in : a.getIntervals()){
			if(t>=in.getStartTime() && t<=in.getEndTime())
				return true;
		}
		return false;
	}	
	
	/* setShortestPath */
	public void setShortestPath(LinkedList<Node> caminho) {
		shortest_path = caminho;
	}

	/* getCurrentShortestPath */
	public LinkedList<Node> getCurrentShortestPath() {
		return shortest_path;
	}
	
	/* populateGraph */
	// Auxiliary method we call only once in order to populate the TVG accordingly (With nodes and edges), after reading a dot file.
	public void populateGraph(){
		Pattern pattern_node = Pattern.compile("[a-z][0-9]+;"); // Regex relativa a detectar o padr�o dos n�s, por exemplo, n0; ,n1;
		Pattern pattern_close_bracket = Pattern.compile("[^}]");
		Pattern pattern_edge = Pattern.compile("[a-zA-Z][0-9]+--[a-zA-Z][0-9]+");
		Pattern pattern_intervals = Pattern.compile("[0-9]+.[0-9]+,[0-9]+.[0-9]+");
        Matcher matcher; // Vari�vel auxiliar que faz o casamento da string lida com o padr�o procurado.
		String[] aux_array = null; // Array de string auxiliar para a execu��o de splits e populamento das estruturas de dados do TVG.
		String aux;
		Node new_node1 = null;
		Node new_node2 = null;
		Edge new_edge = null;
		double new_start_time = 0.0;
		double new_end_time = 0.0;

		int i = 0; // Iterador utilizado para percorrer o arquivo.
		
        try {
        	FileReader file =  new FileReader("tvg"+File.separator+"TVG.dot");
        	BufferedReader file_reader = new BufferedReader(file);
        	String current_line = file_reader.readLine(); // L� a primeira linha, q � graph {
        	
        	while (current_line != null){       		
        		current_line = file_reader.readLine(); // L� a segunda liiha, que come�a a definir os n�s
        		
            	if (current_line != null){
            		matcher = pattern_node.matcher(current_line);         		
            		
            		if (matcher.find()){ // Se acha o padr�o descrito � pq � defini��o de n�.
            			aux = matcher.group(); // acredito que tenha q usar este group() dentro do matcher.find()
            			aux_array = aux.split(";"); // Isola o label do n� do ";".
            			
            			/* Adiciona cada um dos nodes lidos ao array list de nodes do TVG */
            			nodes.add(new Node(aux_array[0],aux_array[0])); // Adiciona um novo n� ao array list.
            		} else { // Se n�o achou o padr�o acima, verifica se � as linha definindo arestas, mas n�o pode ser }
            			matcher = pattern_close_bracket.matcher(current_line);
            			if (matcher.find()){ // Se n�o encontrar o close bracket "}".
            				matcher = pattern_edge.matcher(current_line);
            				if (matcher.find()){
            					aux = matcher.group();
            					aux_array = aux.split("--");
            					new_node1 = getNodeByLabel(aux_array[0],nodes);
            					new_node2 = getNodeByLabel(aux_array[1],nodes);
            				}
            				
            				//new_edge = new Edge(new_node1.getLabel()+"--"+new_node2.getLabel(),new_node1,new_node2,0.0);
            				matcher = pattern_intervals.matcher(current_line);
            				while (matcher.find()){
            					new_edge = new Edge(new_node1.getLabel()+"--"+new_node2.getLabel(),new_node1,new_node2,0.0);
            					aux = matcher.group();
            					aux_array = aux.split(",");
            					new_start_time = Double.parseDouble(aux_array[0]);
            					new_end_time = Double.parseDouble(aux_array[1]);
            					//new_edge.addInterval(new_start_time,new_end_time);
                				new_edge.setWeight(new_start_time);
            					//new_edge.setWeight(new_edge.getMinimumIntervalStartTime());
                				edges.add(new_edge);
            				}
            				//new_edge.setWeight(new_edge.getMinimumIntervalStartTime());
            				//edges.add(new_edge);
            			}     			          			
            		}
            	}
            	i++;
        	}
    		file.close();
        } catch (IOException e) {
        	System.out.println("Arquivo inexistente");
        }
	}
}