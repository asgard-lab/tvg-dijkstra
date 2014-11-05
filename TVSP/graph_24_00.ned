package tvsp;


network graph_24_00 {
	parameters:
		string sourceNodeLabel = default("Input (Between quotation marks) the node you wish to be the source.");
		string destinationNodeLabel = default("Input (Between quotation marks) the node you wish to be the destination.");


	submodules:
		node_10: Node {
			parameters:
				nodeLabel = "node_10";
				@display("p=222,168");
		}

		node_150: Node {
			parameters:
				nodeLabel = "node_150";
				@display("p=188,112");
		}

		node_24: Node {
			parameters:
				nodeLabel = "node_24";
				@display("p=92,164");
		}

		node_31: Node {
			parameters:
				nodeLabel = "node_31";
				@display("p=358,147");
		}

		node_38: Node {
			parameters:
				nodeLabel = "node_38";
				@display("p=141,112");
		}

		node_45: Node {
			parameters:
				nodeLabel = "node_45";
				@display("p=69,227");
		}

		node_52: Node {
			parameters:
				nodeLabel = "node_52";
				@display("p=237,195");
		}

		node_59: Node {
			parameters:
				nodeLabel = "node_59";
				@display("p=241,96");
		}

		node_66: Node {
			parameters:
				nodeLabel = "node_66";
				@display("p=275,186");
		}

		node_73: Node {
			parameters:
				nodeLabel = "node_73";
				@display("p=136,262");
		}

		node_80: Node {
			parameters:
				nodeLabel = "node_80";
				@display("p=46,179");
		}

		node_87: Node {
			parameters:
				nodeLabel = "node_87";
				@display("p=202,86");
		}

		node_94: Node {
			parameters:
				nodeLabel = "node_94";
				@display("p=116,201");
		}

		node_101: Node {
			parameters:
				nodeLabel = "node_101";
				@display("p=183,213");
		}

		node_108: Node {
			parameters:
				nodeLabel = "node_108";
				@display("p=275,158");
		}

		node_115: Node {
			parameters:
				nodeLabel = "node_115";
				@display("p=248,103");
		}

		node_122: Node {
			parameters:
				nodeLabel = "node_122";
				@display("p=69,233");
		}

		node_129: Node {
			parameters:
				nodeLabel = "node_129";
				@display("p=406,124");
		}

		node_136: Node {
			parameters:
				nodeLabel = "node_136";
				@display("p=271,53");
		}

		node_143: Node {
			parameters:
				nodeLabel = "node_143";
				@display("p=274,149");
		}

		node_157: Node {
			parameters:
				nodeLabel = "node_157";
				@display("p=284,167");
		}

		node_164: Node {
			parameters:
				nodeLabel = "node_164";
				@display("p=136,133");
		}

		node_171: Node {
			parameters:
				nodeLabel = "node_171";
				@display("p=251,202");
		}


	connections:
		node_150.gate++ <--> node_143.gate++;
		node_143.gate++ <--> node_150.gate++;
		node_24.gate++ <--> node_10.gate++;
		node_10.gate++ <--> node_24.gate++;
		node_136.gate++ <--> node_150.gate++;
		node_150.gate++ <--> node_136.gate++;
		node_31.gate++ <--> node_10.gate++;
		node_10.gate++ <--> node_31.gate++;
		node_129.gate++ <--> node_150.gate++;
		node_150.gate++ <--> node_129.gate++;
		node_31.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_31.gate++;
		node_38.gate++ <--> node_10.gate++;
		node_10.gate++ <--> node_38.gate++;
		node_122.gate++ <--> node_150.gate++;
		node_150.gate++ <--> node_122.gate++;
		node_38.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_38.gate++;
		node_38.gate++ <--> node_31.gate++;
		node_31.gate++ <--> node_38.gate++;
		node_45.gate++ <--> node_10.gate++;
		node_10.gate++ <--> node_45.gate++;
		node_115.gate++ <--> node_150.gate++;
		node_150.gate++ <--> node_115.gate++;
		node_45.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_45.gate++;
		node_45.gate++ <--> node_31.gate++;
		node_31.gate++ <--> node_45.gate++;
		node_45.gate++ <--> node_38.gate++;
		node_38.gate++ <--> node_45.gate++;
		node_52.gate++ <--> node_10.gate++;
		node_10.gate++ <--> node_52.gate++;
		node_108.gate++ <--> node_150.gate++;
		node_150.gate++ <--> node_108.gate++;
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
		node_101.gate++ <--> node_150.gate++;
		node_150.gate++ <--> node_101.gate++;
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
		node_94.gate++ <--> node_150.gate++;
		node_150.gate++ <--> node_94.gate++;
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
		node_87.gate++ <--> node_150.gate++;
		node_150.gate++ <--> node_87.gate++;
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
		node_80.gate++ <--> node_150.gate++;
		node_150.gate++ <--> node_80.gate++;
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
		node_73.gate++ <--> node_150.gate++;
		node_150.gate++ <--> node_73.gate++;
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
		node_66.gate++ <--> node_150.gate++;
		node_150.gate++ <--> node_66.gate++;
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
		node_59.gate++ <--> node_150.gate++;
		node_150.gate++ <--> node_59.gate++;
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
		node_52.gate++ <--> node_150.gate++;
		node_150.gate++ <--> node_52.gate++;
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
		node_45.gate++ <--> node_150.gate++;
		node_150.gate++ <--> node_45.gate++;
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
		node_38.gate++ <--> node_150.gate++;
		node_150.gate++ <--> node_38.gate++;
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
		node_31.gate++ <--> node_150.gate++;
		node_150.gate++ <--> node_31.gate++;
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
		node_24.gate++ <--> node_150.gate++;
		node_150.gate++ <--> node_24.gate++;
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
		node_150.gate++ <--> node_10.gate++;
		node_10.gate++ <--> node_150.gate++;
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
		node_157.gate++ <--> node_10.gate++;
		node_10.gate++ <--> node_157.gate++;
		node_157.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_157.gate++;
		node_157.gate++ <--> node_31.gate++;
		node_31.gate++ <--> node_157.gate++;
		node_157.gate++ <--> node_38.gate++;
		node_38.gate++ <--> node_157.gate++;
		node_157.gate++ <--> node_45.gate++;
		node_45.gate++ <--> node_157.gate++;
		node_157.gate++ <--> node_52.gate++;
		node_52.gate++ <--> node_157.gate++;
		node_157.gate++ <--> node_59.gate++;
		node_59.gate++ <--> node_157.gate++;
		node_157.gate++ <--> node_66.gate++;
		node_66.gate++ <--> node_157.gate++;
		node_157.gate++ <--> node_73.gate++;
		node_73.gate++ <--> node_157.gate++;
		node_157.gate++ <--> node_80.gate++;
		node_80.gate++ <--> node_157.gate++;
		node_157.gate++ <--> node_87.gate++;
		node_87.gate++ <--> node_157.gate++;
		node_157.gate++ <--> node_94.gate++;
		node_94.gate++ <--> node_157.gate++;
		node_157.gate++ <--> node_101.gate++;
		node_101.gate++ <--> node_157.gate++;
		node_157.gate++ <--> node_108.gate++;
		node_108.gate++ <--> node_157.gate++;
		node_157.gate++ <--> node_115.gate++;
		node_115.gate++ <--> node_157.gate++;
		node_157.gate++ <--> node_122.gate++;
		node_122.gate++ <--> node_157.gate++;
		node_157.gate++ <--> node_129.gate++;
		node_129.gate++ <--> node_157.gate++;
		node_157.gate++ <--> node_136.gate++;
		node_136.gate++ <--> node_157.gate++;
		node_157.gate++ <--> node_143.gate++;
		node_143.gate++ <--> node_157.gate++;
		node_157.gate++ <--> node_150.gate++;
		node_150.gate++ <--> node_157.gate++;
		node_164.gate++ <--> node_10.gate++;
		node_10.gate++ <--> node_164.gate++;
		node_164.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_164.gate++;
		node_164.gate++ <--> node_31.gate++;
		node_31.gate++ <--> node_164.gate++;
		node_164.gate++ <--> node_38.gate++;
		node_38.gate++ <--> node_164.gate++;
		node_164.gate++ <--> node_45.gate++;
		node_45.gate++ <--> node_164.gate++;
		node_164.gate++ <--> node_52.gate++;
		node_52.gate++ <--> node_164.gate++;
		node_164.gate++ <--> node_59.gate++;
		node_59.gate++ <--> node_164.gate++;
		node_164.gate++ <--> node_66.gate++;
		node_66.gate++ <--> node_164.gate++;
		node_164.gate++ <--> node_73.gate++;
		node_73.gate++ <--> node_164.gate++;
		node_164.gate++ <--> node_80.gate++;
		node_80.gate++ <--> node_164.gate++;
		node_164.gate++ <--> node_87.gate++;
		node_87.gate++ <--> node_164.gate++;
		node_164.gate++ <--> node_94.gate++;
		node_94.gate++ <--> node_164.gate++;
		node_164.gate++ <--> node_101.gate++;
		node_101.gate++ <--> node_164.gate++;
		node_164.gate++ <--> node_108.gate++;
		node_108.gate++ <--> node_164.gate++;
		node_164.gate++ <--> node_115.gate++;
		node_115.gate++ <--> node_164.gate++;
		node_164.gate++ <--> node_122.gate++;
		node_122.gate++ <--> node_164.gate++;
		node_164.gate++ <--> node_129.gate++;
		node_129.gate++ <--> node_164.gate++;
		node_164.gate++ <--> node_136.gate++;
		node_136.gate++ <--> node_164.gate++;
		node_164.gate++ <--> node_143.gate++;
		node_143.gate++ <--> node_164.gate++;
		node_164.gate++ <--> node_150.gate++;
		node_150.gate++ <--> node_164.gate++;
		node_164.gate++ <--> node_157.gate++;
		node_157.gate++ <--> node_164.gate++;
		node_171.gate++ <--> node_10.gate++;
		node_10.gate++ <--> node_171.gate++;
		node_171.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_171.gate++;
		node_171.gate++ <--> node_31.gate++;
		node_31.gate++ <--> node_171.gate++;
		node_171.gate++ <--> node_38.gate++;
		node_38.gate++ <--> node_171.gate++;
		node_171.gate++ <--> node_45.gate++;
		node_45.gate++ <--> node_171.gate++;
		node_171.gate++ <--> node_52.gate++;
		node_52.gate++ <--> node_171.gate++;
		node_171.gate++ <--> node_59.gate++;
		node_59.gate++ <--> node_171.gate++;
		node_171.gate++ <--> node_66.gate++;
		node_66.gate++ <--> node_171.gate++;
		node_171.gate++ <--> node_73.gate++;
		node_73.gate++ <--> node_171.gate++;
		node_171.gate++ <--> node_80.gate++;
		node_80.gate++ <--> node_171.gate++;
		node_171.gate++ <--> node_87.gate++;
		node_87.gate++ <--> node_171.gate++;
		node_171.gate++ <--> node_94.gate++;
		node_94.gate++ <--> node_171.gate++;
		node_171.gate++ <--> node_101.gate++;
		node_101.gate++ <--> node_171.gate++;
		node_171.gate++ <--> node_108.gate++;
		node_108.gate++ <--> node_171.gate++;
		node_171.gate++ <--> node_115.gate++;
		node_115.gate++ <--> node_171.gate++;
		node_171.gate++ <--> node_122.gate++;
		node_122.gate++ <--> node_171.gate++;
		node_171.gate++ <--> node_129.gate++;
		node_129.gate++ <--> node_171.gate++;
		node_171.gate++ <--> node_136.gate++;
		node_136.gate++ <--> node_171.gate++;
		node_171.gate++ <--> node_143.gate++;
		node_143.gate++ <--> node_171.gate++;
		node_171.gate++ <--> node_150.gate++;
		node_150.gate++ <--> node_171.gate++;
		node_171.gate++ <--> node_157.gate++;
		node_157.gate++ <--> node_171.gate++;
		node_171.gate++ <--> node_164.gate++;
		node_164.gate++ <--> node_171.gate++;
}