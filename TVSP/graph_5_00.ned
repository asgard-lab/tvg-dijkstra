package tvsp;


network graph_5_00 {
	parameters:
		string sourceNodeLabel = default("Input (Between quotation marks) the node you wish to be the source.");
		string destinationNodeLabel = default("Input (Between quotation marks) the node you wish to be the destination.");


	submodules:
		node_10: Node {
			parameters:
				nodeLabel = "node_10";
				@display("p=164,244");
		}

		node_17: Node {
			parameters:
				nodeLabel = "node_17";
				@display("p=308,32");
		}

		node_24: Node {
			parameters:
				nodeLabel = "node_24";
				@display("p=148,112");
		}

		node_31: Node {
			parameters:
				nodeLabel = "node_31";
				@display("p=303,176");
		}

		node_38: Node {
			parameters:
				nodeLabel = "node_38";
				@display("p=237,196");
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
		node_38.gate++ <--> node_10.gate++;
		node_10.gate++ <--> node_38.gate++;
		node_38.gate++ <--> node_17.gate++;
		node_17.gate++ <--> node_38.gate++;
		node_38.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_38.gate++;
		node_38.gate++ <--> node_31.gate++;
		node_31.gate++ <--> node_38.gate++;
}