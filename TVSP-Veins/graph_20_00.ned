package tvsp;


network graph_20_00 {
	parameters:
		string sourceNodeLabel = default("Input (Between quotation marks) the node you wish to be the source.");
		string destinationNodeLabel = default("Input (Between quotation marks) the node you wish to be the destination.");


	submodules:
		node_10: Node {
			parameters:
				nodeLabel = "node_10";
				@display("p=240,207");
		}

		node_17: Node {
			parameters:
				nodeLabel = "node_17";
				@display("p=196,88");
		}

		node_24: Node {
			parameters:
				nodeLabel = "node_24";
				@display("p=94,141");
		}

		node_31: Node {
			parameters:
				nodeLabel = "node_31";
				@display("p=408,123");
		}

		node_38: Node {
			parameters:
				nodeLabel = "node_38";
				@display("p=171,96");
		}

		node_45: Node {
			parameters:
				nodeLabel = "node_45";
				@display("p=93,270");
		}

		node_52: Node {
			parameters:
				nodeLabel = "node_52";
				@display("p=235,199");
		}

		node_59: Node {
			parameters:
				nodeLabel = "node_59";
				@display("p=235,79");
		}

		node_66: Node {
			parameters:
				nodeLabel = "node_66";
				@display("p=282,169");
		}

		node_73: Node {
			parameters:
				nodeLabel = "node_73";
				@display("p=91,272");
		}

		node_80: Node {
			parameters:
				nodeLabel = "node_80";
				@display("p=53,198");
		}

		node_87: Node {
			parameters:
				nodeLabel = "node_87";
				@display("p=190,87");
		}

		node_94: Node {
			parameters:
				nodeLabel = "node_94";
				@display("p=143,249");
		}

		node_101: Node {
			parameters:
				nodeLabel = "node_101";
				@display("p=159,171");
		}

		node_108: Node {
			parameters:
				nodeLabel = "node_108";
				@display("p=250,112");
		}

		node_115: Node {
			parameters:
				nodeLabel = "node_115";
				@display("p=274,149");
		}

		node_122: Node {
			parameters:
				nodeLabel = "node_122";
				@display("p=49,198");
		}

		node_129: Node {
			parameters:
				nodeLabel = "node_129";
				@display("p=429,112");
		}

		node_136: Node {
			parameters:
				nodeLabel = "node_136";
				@display("p=242,66");
		}

		node_143: Node {
			parameters:
				nodeLabel = "node_143";
				@display("p=286,170");
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
		node_115.gate++ <--> node_10.gate++;
		node_10.gate++ <--> node_115.gate++;
		node_115.gate++ <--> node_17.gate++;
		node_17.gate++ <--> node_115.gate++;
		node_115.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_115.gate++;
		node_115.gate++ <--> node_31.gate++;
		node_31.gate++ <--> node_115.gate++;
		node_115.gate++ <--> node_38.gate++;
		node_38.gate++ <--> node_115.gate++;
		node_115.gate++ <--> node_45.gate++;
		node_45.gate++ <--> node_115.gate++;
		node_115.gate++ <--> node_52.gate++;
		node_52.gate++ <--> node_115.gate++;
		node_115.gate++ <--> node_59.gate++;
		node_59.gate++ <--> node_115.gate++;
		node_115.gate++ <--> node_66.gate++;
		node_66.gate++ <--> node_115.gate++;
		node_115.gate++ <--> node_73.gate++;
		node_73.gate++ <--> node_115.gate++;
		node_115.gate++ <--> node_80.gate++;
		node_80.gate++ <--> node_115.gate++;
		node_115.gate++ <--> node_87.gate++;
		node_87.gate++ <--> node_115.gate++;
		node_115.gate++ <--> node_94.gate++;
		node_94.gate++ <--> node_115.gate++;
		node_115.gate++ <--> node_101.gate++;
		node_101.gate++ <--> node_115.gate++;
		node_115.gate++ <--> node_108.gate++;
		node_108.gate++ <--> node_115.gate++;
		node_122.gate++ <--> node_10.gate++;
		node_10.gate++ <--> node_122.gate++;
		node_122.gate++ <--> node_17.gate++;
		node_17.gate++ <--> node_122.gate++;
		node_122.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_122.gate++;
		node_122.gate++ <--> node_31.gate++;
		node_31.gate++ <--> node_122.gate++;
		node_122.gate++ <--> node_38.gate++;
		node_38.gate++ <--> node_122.gate++;
		node_122.gate++ <--> node_45.gate++;
		node_45.gate++ <--> node_122.gate++;
		node_122.gate++ <--> node_52.gate++;
		node_52.gate++ <--> node_122.gate++;
		node_122.gate++ <--> node_59.gate++;
		node_59.gate++ <--> node_122.gate++;
		node_122.gate++ <--> node_66.gate++;
		node_66.gate++ <--> node_122.gate++;
		node_122.gate++ <--> node_73.gate++;
		node_73.gate++ <--> node_122.gate++;
		node_122.gate++ <--> node_80.gate++;
		node_80.gate++ <--> node_122.gate++;
		node_122.gate++ <--> node_87.gate++;
		node_87.gate++ <--> node_122.gate++;
		node_122.gate++ <--> node_94.gate++;
		node_94.gate++ <--> node_122.gate++;
		node_122.gate++ <--> node_101.gate++;
		node_101.gate++ <--> node_122.gate++;
		node_122.gate++ <--> node_108.gate++;
		node_108.gate++ <--> node_122.gate++;
		node_122.gate++ <--> node_115.gate++;
		node_115.gate++ <--> node_122.gate++;
		node_129.gate++ <--> node_10.gate++;
		node_10.gate++ <--> node_129.gate++;
		node_129.gate++ <--> node_17.gate++;
		node_17.gate++ <--> node_129.gate++;
		node_129.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_129.gate++;
		node_129.gate++ <--> node_31.gate++;
		node_31.gate++ <--> node_129.gate++;
		node_129.gate++ <--> node_38.gate++;
		node_38.gate++ <--> node_129.gate++;
		node_129.gate++ <--> node_45.gate++;
		node_45.gate++ <--> node_129.gate++;
		node_129.gate++ <--> node_52.gate++;
		node_52.gate++ <--> node_129.gate++;
		node_129.gate++ <--> node_59.gate++;
		node_59.gate++ <--> node_129.gate++;
		node_129.gate++ <--> node_66.gate++;
		node_66.gate++ <--> node_129.gate++;
		node_129.gate++ <--> node_73.gate++;
		node_73.gate++ <--> node_129.gate++;
		node_129.gate++ <--> node_80.gate++;
		node_80.gate++ <--> node_129.gate++;
		node_129.gate++ <--> node_87.gate++;
		node_87.gate++ <--> node_129.gate++;
		node_129.gate++ <--> node_94.gate++;
		node_94.gate++ <--> node_129.gate++;
		node_129.gate++ <--> node_101.gate++;
		node_101.gate++ <--> node_129.gate++;
		node_129.gate++ <--> node_108.gate++;
		node_108.gate++ <--> node_129.gate++;
		node_129.gate++ <--> node_115.gate++;
		node_115.gate++ <--> node_129.gate++;
		node_129.gate++ <--> node_122.gate++;
		node_122.gate++ <--> node_129.gate++;
		node_136.gate++ <--> node_10.gate++;
		node_10.gate++ <--> node_136.gate++;
		node_136.gate++ <--> node_17.gate++;
		node_17.gate++ <--> node_136.gate++;
		node_136.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_136.gate++;
		node_136.gate++ <--> node_31.gate++;
		node_31.gate++ <--> node_136.gate++;
		node_136.gate++ <--> node_38.gate++;
		node_38.gate++ <--> node_136.gate++;
		node_136.gate++ <--> node_45.gate++;
		node_45.gate++ <--> node_136.gate++;
		node_136.gate++ <--> node_52.gate++;
		node_52.gate++ <--> node_136.gate++;
		node_136.gate++ <--> node_59.gate++;
		node_59.gate++ <--> node_136.gate++;
		node_136.gate++ <--> node_66.gate++;
		node_66.gate++ <--> node_136.gate++;
		node_136.gate++ <--> node_73.gate++;
		node_73.gate++ <--> node_136.gate++;
		node_136.gate++ <--> node_80.gate++;
		node_80.gate++ <--> node_136.gate++;
		node_136.gate++ <--> node_87.gate++;
		node_87.gate++ <--> node_136.gate++;
		node_136.gate++ <--> node_94.gate++;
		node_94.gate++ <--> node_136.gate++;
		node_136.gate++ <--> node_101.gate++;
		node_101.gate++ <--> node_136.gate++;
		node_136.gate++ <--> node_108.gate++;
		node_108.gate++ <--> node_136.gate++;
		node_136.gate++ <--> node_115.gate++;
		node_115.gate++ <--> node_136.gate++;
		node_136.gate++ <--> node_122.gate++;
		node_122.gate++ <--> node_136.gate++;
		node_136.gate++ <--> node_129.gate++;
		node_129.gate++ <--> node_136.gate++;
		node_143.gate++ <--> node_10.gate++;
		node_10.gate++ <--> node_143.gate++;
		node_143.gate++ <--> node_17.gate++;
		node_17.gate++ <--> node_143.gate++;
		node_143.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_143.gate++;
		node_143.gate++ <--> node_31.gate++;
		node_31.gate++ <--> node_143.gate++;
		node_143.gate++ <--> node_38.gate++;
		node_38.gate++ <--> node_143.gate++;
		node_143.gate++ <--> node_45.gate++;
		node_45.gate++ <--> node_143.gate++;
		node_143.gate++ <--> node_52.gate++;
		node_52.gate++ <--> node_143.gate++;
		node_143.gate++ <--> node_59.gate++;
		node_59.gate++ <--> node_143.gate++;
		node_143.gate++ <--> node_66.gate++;
		node_66.gate++ <--> node_143.gate++;
		node_143.gate++ <--> node_73.gate++;
		node_73.gate++ <--> node_143.gate++;
		node_143.gate++ <--> node_80.gate++;
		node_80.gate++ <--> node_143.gate++;
		node_143.gate++ <--> node_87.gate++;
		node_87.gate++ <--> node_143.gate++;
		node_143.gate++ <--> node_94.gate++;
		node_94.gate++ <--> node_143.gate++;
		node_143.gate++ <--> node_101.gate++;
		node_101.gate++ <--> node_143.gate++;
		node_143.gate++ <--> node_108.gate++;
		node_108.gate++ <--> node_143.gate++;
		node_143.gate++ <--> node_115.gate++;
		node_115.gate++ <--> node_143.gate++;
		node_143.gate++ <--> node_122.gate++;
		node_122.gate++ <--> node_143.gate++;
		node_143.gate++ <--> node_129.gate++;
		node_129.gate++ <--> node_143.gate++;
		node_143.gate++ <--> node_136.gate++;
		node_136.gate++ <--> node_143.gate++;
}