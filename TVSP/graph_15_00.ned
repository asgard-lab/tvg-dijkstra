package tvsp;


network graph_15_00 {
	parameters:
		string sourceNodeLabel = default("Input (Between quotation marks) the node you wish to be the source.");
		string destinationNodeLabel = default("Input (Between quotation marks) the node you wish to be the destination.");


	submodules:
		node_10: Node {
			parameters:
				nodeLabel = "node_10";
				@display("p=213,222");
		}

		node_17: Node {
			parameters:
				nodeLabel = "node_17";
				@display("p=198,84");
		}

		node_24: Node {
			parameters:
				nodeLabel = "node_24";
				@display("p=136,115");
		}

		node_31: Node {
			parameters:
				nodeLabel = "node_31";
				@display("p=407,127");
		}

		node_38: Node {
			parameters:
				nodeLabel = "node_38";
				@display("p=191,111");
		}

		node_45: Node {
			parameters:
				nodeLabel = "node_45";
				@display("p=86,263");
		}

		node_52: Node {
			parameters:
				nodeLabel = "node_52";
				@display("p=220,171");
		}

		node_59: Node {
			parameters:
				nodeLabel = "node_59";
				@display("p=256,117");
		}

		node_66: Node {
			parameters:
				nodeLabel = "node_66";
				@display("p=256,123");
		}

		node_73: Node {
			parameters:
				nodeLabel = "node_73";
				@display("p=62,222");
		}

		node_80: Node {
			parameters:
				nodeLabel = "node_80";
				@display("p=82,250");
		}

		node_87: Node {
			parameters:
				nodeLabel = "node_87";
				@display("p=216,75");
		}

		node_94: Node {
			parameters:
				nodeLabel = "node_94";
				@display("p=182,235");
		}

		node_101: Node {
			parameters:
				nodeLabel = "node_101";
				@display("p=136,133");
		}

		node_108: Node {
			parameters:
				nodeLabel = "node_108";
				@display("p=233,82");
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
		node_45.gate++ <--> node_10.gate++;
		node_10.gate++ <--> node_45.gate++;
		node_45.gate++ <--> node_17.gate++;
		node_17.gate++ <--> node_45.gate++;
		node_45.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_45.gate++;
		node_45.gate++ <--> node_31.gate++;
		node_31.gate++ <--> node_45.gate++;
		node_45.gate++ <--> node_38.gate++;
		node_38.gate++ <--> node_45.gate++;
		node_52.gate++ <--> node_10.gate++;
		node_10.gate++ <--> node_52.gate++;
		node_52.gate++ <--> node_17.gate++;
		node_17.gate++ <--> node_52.gate++;
		node_52.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_52.gate++;
		node_52.gate++ <--> node_31.gate++;
		node_31.gate++ <--> node_52.gate++;
		node_52.gate++ <--> node_38.gate++;
		node_38.gate++ <--> node_52.gate++;
		node_52.gate++ <--> node_45.gate++;
		node_45.gate++ <--> node_52.gate++;
		node_59.gate++ <--> node_10.gate++;
		node_10.gate++ <--> node_59.gate++;
		node_59.gate++ <--> node_17.gate++;
		node_17.gate++ <--> node_59.gate++;
		node_59.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_59.gate++;
		node_59.gate++ <--> node_31.gate++;
		node_31.gate++ <--> node_59.gate++;
		node_59.gate++ <--> node_38.gate++;
		node_38.gate++ <--> node_59.gate++;
		node_59.gate++ <--> node_45.gate++;
		node_45.gate++ <--> node_59.gate++;
		node_59.gate++ <--> node_52.gate++;
		node_52.gate++ <--> node_59.gate++;
		node_66.gate++ <--> node_10.gate++;
		node_10.gate++ <--> node_66.gate++;
		node_66.gate++ <--> node_17.gate++;
		node_17.gate++ <--> node_66.gate++;
		node_66.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_66.gate++;
		node_66.gate++ <--> node_31.gate++;
		node_31.gate++ <--> node_66.gate++;
		node_66.gate++ <--> node_38.gate++;
		node_38.gate++ <--> node_66.gate++;
		node_66.gate++ <--> node_45.gate++;
		node_45.gate++ <--> node_66.gate++;
		node_66.gate++ <--> node_52.gate++;
		node_52.gate++ <--> node_66.gate++;
		node_66.gate++ <--> node_59.gate++;
		node_59.gate++ <--> node_66.gate++;
		node_73.gate++ <--> node_10.gate++;
		node_10.gate++ <--> node_73.gate++;
		node_73.gate++ <--> node_17.gate++;
		node_17.gate++ <--> node_73.gate++;
		node_73.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_73.gate++;
		node_73.gate++ <--> node_31.gate++;
		node_31.gate++ <--> node_73.gate++;
		node_73.gate++ <--> node_38.gate++;
		node_38.gate++ <--> node_73.gate++;
		node_73.gate++ <--> node_45.gate++;
		node_45.gate++ <--> node_73.gate++;
		node_73.gate++ <--> node_52.gate++;
		node_52.gate++ <--> node_73.gate++;
		node_73.gate++ <--> node_59.gate++;
		node_59.gate++ <--> node_73.gate++;
		node_73.gate++ <--> node_66.gate++;
		node_66.gate++ <--> node_73.gate++;
		node_80.gate++ <--> node_10.gate++;
		node_10.gate++ <--> node_80.gate++;
		node_80.gate++ <--> node_17.gate++;
		node_17.gate++ <--> node_80.gate++;
		node_80.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_80.gate++;
		node_80.gate++ <--> node_31.gate++;
		node_31.gate++ <--> node_80.gate++;
		node_80.gate++ <--> node_38.gate++;
		node_38.gate++ <--> node_80.gate++;
		node_80.gate++ <--> node_45.gate++;
		node_45.gate++ <--> node_80.gate++;
		node_80.gate++ <--> node_52.gate++;
		node_52.gate++ <--> node_80.gate++;
		node_80.gate++ <--> node_59.gate++;
		node_59.gate++ <--> node_80.gate++;
		node_80.gate++ <--> node_66.gate++;
		node_66.gate++ <--> node_80.gate++;
		node_80.gate++ <--> node_73.gate++;
		node_73.gate++ <--> node_80.gate++;
		node_87.gate++ <--> node_10.gate++;
		node_10.gate++ <--> node_87.gate++;
		node_87.gate++ <--> node_17.gate++;
		node_17.gate++ <--> node_87.gate++;
		node_87.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_87.gate++;
		node_87.gate++ <--> node_31.gate++;
		node_31.gate++ <--> node_87.gate++;
		node_87.gate++ <--> node_38.gate++;
		node_38.gate++ <--> node_87.gate++;
		node_87.gate++ <--> node_45.gate++;
		node_45.gate++ <--> node_87.gate++;
		node_87.gate++ <--> node_52.gate++;
		node_52.gate++ <--> node_87.gate++;
		node_87.gate++ <--> node_59.gate++;
		node_59.gate++ <--> node_87.gate++;
		node_87.gate++ <--> node_66.gate++;
		node_66.gate++ <--> node_87.gate++;
		node_87.gate++ <--> node_73.gate++;
		node_73.gate++ <--> node_87.gate++;
		node_87.gate++ <--> node_80.gate++;
		node_80.gate++ <--> node_87.gate++;
		node_94.gate++ <--> node_10.gate++;
		node_10.gate++ <--> node_94.gate++;
		node_94.gate++ <--> node_17.gate++;
		node_17.gate++ <--> node_94.gate++;
		node_94.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_94.gate++;
		node_94.gate++ <--> node_31.gate++;
		node_31.gate++ <--> node_94.gate++;
		node_94.gate++ <--> node_38.gate++;
		node_38.gate++ <--> node_94.gate++;
		node_94.gate++ <--> node_45.gate++;
		node_45.gate++ <--> node_94.gate++;
		node_94.gate++ <--> node_52.gate++;
		node_52.gate++ <--> node_94.gate++;
		node_94.gate++ <--> node_59.gate++;
		node_59.gate++ <--> node_94.gate++;
		node_94.gate++ <--> node_66.gate++;
		node_66.gate++ <--> node_94.gate++;
		node_94.gate++ <--> node_73.gate++;
		node_73.gate++ <--> node_94.gate++;
		node_94.gate++ <--> node_80.gate++;
		node_80.gate++ <--> node_94.gate++;
		node_94.gate++ <--> node_87.gate++;
		node_87.gate++ <--> node_94.gate++;
		node_101.gate++ <--> node_10.gate++;
		node_10.gate++ <--> node_101.gate++;
		node_101.gate++ <--> node_17.gate++;
		node_17.gate++ <--> node_101.gate++;
		node_101.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_101.gate++;
		node_101.gate++ <--> node_31.gate++;
		node_31.gate++ <--> node_101.gate++;
		node_101.gate++ <--> node_38.gate++;
		node_38.gate++ <--> node_101.gate++;
		node_101.gate++ <--> node_45.gate++;
		node_45.gate++ <--> node_101.gate++;
		node_101.gate++ <--> node_52.gate++;
		node_52.gate++ <--> node_101.gate++;
		node_101.gate++ <--> node_59.gate++;
		node_59.gate++ <--> node_101.gate++;
		node_101.gate++ <--> node_66.gate++;
		node_66.gate++ <--> node_101.gate++;
		node_101.gate++ <--> node_73.gate++;
		node_73.gate++ <--> node_101.gate++;
		node_101.gate++ <--> node_80.gate++;
		node_80.gate++ <--> node_101.gate++;
		node_101.gate++ <--> node_87.gate++;
		node_87.gate++ <--> node_101.gate++;
		node_101.gate++ <--> node_94.gate++;
		node_94.gate++ <--> node_101.gate++;
		node_108.gate++ <--> node_10.gate++;
		node_10.gate++ <--> node_108.gate++;
		node_108.gate++ <--> node_17.gate++;
		node_17.gate++ <--> node_108.gate++;
		node_108.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_108.gate++;
		node_108.gate++ <--> node_31.gate++;
		node_31.gate++ <--> node_108.gate++;
		node_108.gate++ <--> node_38.gate++;
		node_38.gate++ <--> node_108.gate++;
		node_108.gate++ <--> node_45.gate++;
		node_45.gate++ <--> node_108.gate++;
		node_108.gate++ <--> node_52.gate++;
		node_52.gate++ <--> node_108.gate++;
		node_108.gate++ <--> node_59.gate++;
		node_59.gate++ <--> node_108.gate++;
		node_108.gate++ <--> node_66.gate++;
		node_66.gate++ <--> node_108.gate++;
		node_108.gate++ <--> node_73.gate++;
		node_73.gate++ <--> node_108.gate++;
		node_108.gate++ <--> node_80.gate++;
		node_80.gate++ <--> node_108.gate++;
		node_108.gate++ <--> node_87.gate++;
		node_87.gate++ <--> node_108.gate++;
		node_108.gate++ <--> node_94.gate++;
		node_94.gate++ <--> node_108.gate++;
		node_108.gate++ <--> node_101.gate++;
		node_101.gate++ <--> node_108.gate++;
}