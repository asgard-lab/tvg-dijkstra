package tvg;

public class Node {
	/*==============*/
	/*= Attributes =*/
	/*==============*/
	String id;
	String label;
	
	/*===========*/
	/*= Methods =*/
	/*===========*/
	/* Specific Constructor */
	public Node(String id, String label) {
		this.id = id;
		this.label = label;
	}
	
	/* GetId */
	public String getId() {
		return id;
	}
	
	/* GetLabel */
	public String getLabel() {
		return label; // Returns the label of the node, often something like the node group + a number, for instance "n42"
	}
	
	/* Crappy random method which came in the original Djikstra to hash the nodes, and some junk... */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((id == null) ? 0 : id.hashCode());
		return result;
	}
	
	/* Overriden equals method in order to compare nodes! */
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		
		Node other = (Node) obj;
		if (id == null) {
			if (other.id != null)
				return false;
			} else if (!id.equals(other.id))
				return false;
			return true;
		}
	
	/* Same shit as GetLabel method above */
	@Override
	public String toString() {
		return label;
	}	  
}