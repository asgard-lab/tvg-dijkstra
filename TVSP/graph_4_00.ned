package tvsp;


network graph_4_00 {
	parameters:
		string sourceNodeLabel = default("Input (Between quotation marks) the node you wish to be the source.");
		string destinationNodeLabel = default("Input (Between quotation marks) the node you wish to be the destination.");


	submodules:
		node_10: Node {
			parameters:
				nodeLabel = "node_10";
				@display("p=171,240");
		}

		node_17: Node {
			parameters:
				nodeLabel = "node_17";
				@display("p=314,29");
		}

		node_24: Node {
			parameters:
				nodeLabel = "node_24";
				@display("p=144,115");
		}

		node_31: Node {
			parameters:
				nodeLabel = "node_31";
				@display("p=300,177");
		}


	connections:
		node_17.gate++ <--> node_10.gate++;
		node_10.gate++ <--> node_17.gate++;
		node_24.gate++ <--> node_10.gate++;
		node_10.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_17.gate++;
		node_17.gate++ <--> node_24.gate++;
		node_31.gate++ <--> node_10.gate++;
		node_10.gate++ <--> node_31.gate++;
		node_31.gate++ <--> node_17.gate++;
		node_17.gate++ <--> node_31.gate++;
		node_31.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_31.gate++;
}