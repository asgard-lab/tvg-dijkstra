package tvsp;


network graph_17_00 {
	parameters:
		string sourceNodeLabel = default("Input (Between quotation marks) the node you wish to be the source.");
		string destinationNodeLabel = default("Input (Between quotation marks) the node you wish to be the destination.");


	submodules:
		node_10: Node {
			parameters:
				nodeLabel = "node_10";
				@display("p=228,215");
		}

		node_17: Node {
			parameters:
				nodeLabel = "node_17";
				@display("p=189,88");
		}

		node_24: Node {
			parameters:
				nodeLabel = "node_24";
				@display("p=112,129");
		}

		node_31: Node {
			parameters:
				nodeLabel = "node_31";
				@display("p=432,114");
		}

		node_38: Node {
			parameters:
				nodeLabel = "node_38";
				@display("p=187,102");
		}

		node_45: Node {
			parameters:
				nodeLabel = "node_45";
				@display("p=91,273");
		}

		node_52: Node {
			parameters:
				nodeLabel = "node_52";
				@display("p=230,189");
		}

		node_59: Node {
			parameters:
				nodeLabel = "node_59";
				@display("p=244,95");
		}

		node_66: Node {
			parameters:
				nodeLabel = "node_66";
				@display("p=269,147");
		}

		node_73: Node {
			parameters:
				nodeLabel = "node_73";
				@display("p=75,244");
		}

		node_80: Node {
			parameters:
				nodeLabel = "node_80";
				@display("p=70,229");
		}

		node_87: Node {
			parameters:
				nodeLabel = "node_87";
				@display("p=206,80");
		}

		node_94: Node {
			parameters:
				nodeLabel = "node_94";
				@display("p=171,240");
		}

		node_101: Node {
			parameters:
				nodeLabel = "node_101";
				@display("p=142,143");
		}

		node_108: Node {
			parameters:
				nodeLabel = "node_108";
				@display("p=237,89");
		}

		node_115: Node {
			parameters:
				nodeLabel = "node_115";
				@display("p=284,168");
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
}