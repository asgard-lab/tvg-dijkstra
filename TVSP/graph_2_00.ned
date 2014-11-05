package tvsp;


network graph_2_00 {
	parameters:
		string sourceNodeLabel = default("Input (Between quotation marks) the node you wish to be the source.");
		string destinationNodeLabel = default("Input (Between quotation marks) the node you wish to be the destination.");


	submodules:
		node_10: Node {
			parameters:
				nodeLabel = "node_10";
				@display("p=181,235");
		}

		node_17: Node {
			parameters:
				nodeLabel = "node_17";
				@display("p=321,26");
		}


	connections:
		node_17.gate++ <--> node_10.gate++;
		node_10.gate++ <--> node_17.gate++;
}