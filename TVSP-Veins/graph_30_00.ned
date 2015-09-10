package tvsp;


network graph_30_00 {
	parameters:
		string sourceNodeLabel = default("Input (Between quotation marks) the node you wish to be the source.");
		string destinationNodeLabel = default("Input (Between quotation marks) the node you wish to be the destination.");


	submodules:
		node_185: Node {
			parameters:
				nodeLabel = "node_185";
				@display("p=212,81");
		}

		node_150: Node {
			parameters:
				nodeLabel = "node_150";
				@display("p=220,171");
		}

		node_24: Node {
			parameters:
				nodeLabel = "node_24";
				@display("p=130,232");
		}

		node_199: Node {
			parameters:
				nodeLabel = "node_199";
				@display("p=427,113");
		}

		node_213: Node {
			parameters:
				nodeLabel = "node_213";
				@display("p=135,130");
		}

		node_192: Node {
			parameters:
				nodeLabel = "node_192";
				@display("p=169,245");
		}

		node_52: Node {
			parameters:
				nodeLabel = "node_52";
				@display("p=202,131");
		}

		node_59: Node {
			parameters:
				nodeLabel = "node_59";
				@display("p=278,163");
		}

		node_66: Node {
			parameters:
				nodeLabel = "node_66";
				@display("p=205,223");
		}

		node_73: Node {
			parameters:
				nodeLabel = "node_73";
				@display("p=210,224");
		}

		node_80: Node {
			parameters:
				nodeLabel = "node_80";
				@display("p=106,137");
		}

		node_87: Node {
			parameters:
				nodeLabel = "node_87";
				@display("p=254,120");
		}

		node_94: Node {
			parameters:
				nodeLabel = "node_94";
				@display("p=91,156");
		}

		node_101: Node {
			parameters:
				nodeLabel = "node_101";
				@display("p=171,240");
		}

		node_108: Node {
			parameters:
				nodeLabel = "node_108";
				@display("p=275,187");
		}

		node_115: Node {
			parameters:
				nodeLabel = "node_115";
				@display("p=232,80");
		}

		node_122: Node {
			parameters:
				nodeLabel = "node_122";
				@display("p=122,269");
		}

		node_129: Node {
			parameters:
				nodeLabel = "node_129";
				@display("p=334,158");
		}

		node_136: Node {
			parameters:
				nodeLabel = "node_136";
				@display("p=314,29");
		}

		node_143: Node {
			parameters:
				nodeLabel = "node_143";
				@display("p=240,88");
		}

		node_157: Node {
			parameters:
				nodeLabel = "node_157";
				@display("p=256,116");
		}

		node_164: Node {
			parameters:
				nodeLabel = "node_164";
				@display("p=166,184");
		}

		node_171: Node {
			parameters:
				nodeLabel = "node_171";
				@display("p=281,187");
		}

		node_178: Node {
			parameters:
				nodeLabel = "node_178";
				@display("p=62,221");
		}

		node_206: Node {
			parameters:
				nodeLabel = "node_206";
				@display("p=95,145");
		}


	connections:
		node_150.gate++ <--> node_143.gate++;
		node_143.gate++ <--> node_150.gate++;
		node_178.gate++ <--> node_185.gate++;
		node_185.gate++ <--> node_178.gate++;
		node_136.gate++ <--> node_150.gate++;
		node_150.gate++ <--> node_136.gate++;
		node_199.gate++ <--> node_192.gate++;
		node_192.gate++ <--> node_199.gate++;
		node_129.gate++ <--> node_150.gate++;
		node_150.gate++ <--> node_129.gate++;
		node_199.gate++ <--> node_185.gate++;
		node_185.gate++ <--> node_199.gate++;
		node_171.gate++ <--> node_185.gate++;
		node_185.gate++ <--> node_171.gate++;
		node_122.gate++ <--> node_150.gate++;
		node_150.gate++ <--> node_122.gate++;
		node_213.gate++ <--> node_206.gate++;
		node_206.gate++ <--> node_213.gate++;
		node_178.gate++ <--> node_199.gate++;
		node_199.gate++ <--> node_178.gate++;
		node_192.gate++ <--> node_185.gate++;
		node_185.gate++ <--> node_192.gate++;
		node_115.gate++ <--> node_150.gate++;
		node_150.gate++ <--> node_115.gate++;
		node_192.gate++ <--> node_178.gate++;
		node_178.gate++ <--> node_192.gate++;
		node_192.gate++ <--> node_171.gate++;
		node_171.gate++ <--> node_192.gate++;
		node_192.gate++ <--> node_164.gate++;
		node_164.gate++ <--> node_192.gate++;
		node_164.gate++ <--> node_185.gate++;
		node_185.gate++ <--> node_164.gate++;
		node_108.gate++ <--> node_150.gate++;
		node_150.gate++ <--> node_108.gate++;
		node_52.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_52.gate++;
		node_171.gate++ <--> node_199.gate++;
		node_199.gate++ <--> node_171.gate++;
		node_199.gate++ <--> node_213.gate++;
		node_213.gate++ <--> node_199.gate++;
		node_157.gate++ <--> node_192.gate++;
		node_192.gate++ <--> node_157.gate++;
		node_157.gate++ <--> node_185.gate++;
		node_185.gate++ <--> node_157.gate++;
		node_101.gate++ <--> node_150.gate++;
		node_150.gate++ <--> node_101.gate++;
		node_59.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_59.gate++;
		node_164.gate++ <--> node_199.gate++;
		node_199.gate++ <--> node_164.gate++;
		node_192.gate++ <--> node_213.gate++;
		node_213.gate++ <--> node_192.gate++;
		node_150.gate++ <--> node_192.gate++;
		node_192.gate++ <--> node_150.gate++;
		node_59.gate++ <--> node_52.gate++;
		node_52.gate++ <--> node_59.gate++;
		node_150.gate++ <--> node_185.gate++;
		node_185.gate++ <--> node_150.gate++;
		node_94.gate++ <--> node_150.gate++;
		node_150.gate++ <--> node_94.gate++;
		node_66.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_66.gate++;
		node_157.gate++ <--> node_199.gate++;
		node_199.gate++ <--> node_157.gate++;
		node_185.gate++ <--> node_213.gate++;
		node_213.gate++ <--> node_185.gate++;
		node_143.gate++ <--> node_192.gate++;
		node_192.gate++ <--> node_143.gate++;
		node_66.gate++ <--> node_52.gate++;
		node_52.gate++ <--> node_66.gate++;
		node_66.gate++ <--> node_59.gate++;
		node_59.gate++ <--> node_66.gate++;
		node_143.gate++ <--> node_185.gate++;
		node_185.gate++ <--> node_143.gate++;
		node_87.gate++ <--> node_150.gate++;
		node_150.gate++ <--> node_87.gate++;
		node_73.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_73.gate++;
		node_150.gate++ <--> node_199.gate++;
		node_199.gate++ <--> node_150.gate++;
		node_178.gate++ <--> node_213.gate++;
		node_213.gate++ <--> node_178.gate++;
		node_136.gate++ <--> node_192.gate++;
		node_192.gate++ <--> node_136.gate++;
		node_73.gate++ <--> node_52.gate++;
		node_52.gate++ <--> node_73.gate++;
		node_73.gate++ <--> node_59.gate++;
		node_59.gate++ <--> node_73.gate++;
		node_73.gate++ <--> node_66.gate++;
		node_66.gate++ <--> node_73.gate++;
		node_136.gate++ <--> node_185.gate++;
		node_185.gate++ <--> node_136.gate++;
		node_80.gate++ <--> node_150.gate++;
		node_150.gate++ <--> node_80.gate++;
		node_80.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_80.gate++;
		node_143.gate++ <--> node_199.gate++;
		node_199.gate++ <--> node_143.gate++;
		node_171.gate++ <--> node_213.gate++;
		node_213.gate++ <--> node_171.gate++;
		node_129.gate++ <--> node_192.gate++;
		node_192.gate++ <--> node_129.gate++;
		node_80.gate++ <--> node_52.gate++;
		node_52.gate++ <--> node_80.gate++;
		node_80.gate++ <--> node_59.gate++;
		node_59.gate++ <--> node_80.gate++;
		node_80.gate++ <--> node_66.gate++;
		node_66.gate++ <--> node_80.gate++;
		node_80.gate++ <--> node_73.gate++;
		node_73.gate++ <--> node_80.gate++;
		node_129.gate++ <--> node_185.gate++;
		node_185.gate++ <--> node_129.gate++;
		node_73.gate++ <--> node_150.gate++;
		node_150.gate++ <--> node_73.gate++;
		node_87.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_87.gate++;
		node_136.gate++ <--> node_199.gate++;
		node_199.gate++ <--> node_136.gate++;
		node_164.gate++ <--> node_213.gate++;
		node_213.gate++ <--> node_164.gate++;
		node_122.gate++ <--> node_192.gate++;
		node_192.gate++ <--> node_122.gate++;
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
		node_122.gate++ <--> node_185.gate++;
		node_185.gate++ <--> node_122.gate++;
		node_66.gate++ <--> node_150.gate++;
		node_150.gate++ <--> node_66.gate++;
		node_94.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_94.gate++;
		node_129.gate++ <--> node_199.gate++;
		node_199.gate++ <--> node_129.gate++;
		node_157.gate++ <--> node_213.gate++;
		node_213.gate++ <--> node_157.gate++;
		node_115.gate++ <--> node_192.gate++;
		node_192.gate++ <--> node_115.gate++;
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
		node_115.gate++ <--> node_185.gate++;
		node_185.gate++ <--> node_115.gate++;
		node_59.gate++ <--> node_150.gate++;
		node_150.gate++ <--> node_59.gate++;
		node_101.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_101.gate++;
		node_122.gate++ <--> node_199.gate++;
		node_199.gate++ <--> node_122.gate++;
		node_150.gate++ <--> node_213.gate++;
		node_213.gate++ <--> node_150.gate++;
		node_108.gate++ <--> node_192.gate++;
		node_192.gate++ <--> node_108.gate++;
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
		node_108.gate++ <--> node_185.gate++;
		node_185.gate++ <--> node_108.gate++;
		node_52.gate++ <--> node_150.gate++;
		node_150.gate++ <--> node_52.gate++;
		node_108.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_108.gate++;
		node_115.gate++ <--> node_199.gate++;
		node_199.gate++ <--> node_115.gate++;
		node_143.gate++ <--> node_213.gate++;
		node_213.gate++ <--> node_143.gate++;
		node_101.gate++ <--> node_192.gate++;
		node_192.gate++ <--> node_101.gate++;
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
		node_101.gate++ <--> node_185.gate++;
		node_185.gate++ <--> node_101.gate++;
		node_192.gate++ <--> node_59.gate++;
		node_59.gate++ <--> node_192.gate++;
		node_115.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_115.gate++;
		node_108.gate++ <--> node_199.gate++;
		node_199.gate++ <--> node_108.gate++;
		node_136.gate++ <--> node_213.gate++;
		node_213.gate++ <--> node_136.gate++;
		node_94.gate++ <--> node_192.gate++;
		node_192.gate++ <--> node_94.gate++;
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
		node_94.gate++ <--> node_185.gate++;
		node_185.gate++ <--> node_94.gate++;
		node_213.gate++ <--> node_101.gate++;
		node_101.gate++ <--> node_213.gate++;
		node_122.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_122.gate++;
		node_101.gate++ <--> node_199.gate++;
		node_199.gate++ <--> node_101.gate++;
		node_129.gate++ <--> node_213.gate++;
		node_213.gate++ <--> node_129.gate++;
		node_87.gate++ <--> node_192.gate++;
		node_192.gate++ <--> node_87.gate++;
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
		node_87.gate++ <--> node_185.gate++;
		node_185.gate++ <--> node_87.gate++;
		node_199.gate++ <--> node_73.gate++;
		node_73.gate++ <--> node_199.gate++;
		node_129.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_129.gate++;
		node_94.gate++ <--> node_199.gate++;
		node_199.gate++ <--> node_94.gate++;
		node_122.gate++ <--> node_213.gate++;
		node_213.gate++ <--> node_122.gate++;
		node_80.gate++ <--> node_192.gate++;
		node_192.gate++ <--> node_80.gate++;
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
		node_80.gate++ <--> node_185.gate++;
		node_185.gate++ <--> node_80.gate++;
		node_24.gate++ <--> node_150.gate++;
		node_150.gate++ <--> node_24.gate++;
		node_136.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_136.gate++;
		node_87.gate++ <--> node_199.gate++;
		node_199.gate++ <--> node_87.gate++;
		node_115.gate++ <--> node_213.gate++;
		node_213.gate++ <--> node_115.gate++;
		node_73.gate++ <--> node_192.gate++;
		node_192.gate++ <--> node_73.gate++;
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
		node_73.gate++ <--> node_185.gate++;
		node_185.gate++ <--> node_73.gate++;
		node_66.gate++ <--> node_185.gate++;
		node_185.gate++ <--> node_66.gate++;
		node_143.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_143.gate++;
		node_80.gate++ <--> node_199.gate++;
		node_199.gate++ <--> node_80.gate++;
		node_108.gate++ <--> node_213.gate++;
		node_213.gate++ <--> node_108.gate++;
		node_66.gate++ <--> node_192.gate++;
		node_192.gate++ <--> node_66.gate++;
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
		node_59.gate++ <--> node_185.gate++;
		node_185.gate++ <--> node_59.gate++;
		node_157.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_157.gate++;
		node_66.gate++ <--> node_199.gate++;
		node_199.gate++ <--> node_66.gate++;
		node_94.gate++ <--> node_213.gate++;
		node_213.gate++ <--> node_94.gate++;
		node_52.gate++ <--> node_192.gate++;
		node_192.gate++ <--> node_52.gate++;
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
		node_52.gate++ <--> node_185.gate++;
		node_185.gate++ <--> node_52.gate++;
		node_164.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_164.gate++;
		node_59.gate++ <--> node_199.gate++;
		node_199.gate++ <--> node_59.gate++;
		node_87.gate++ <--> node_213.gate++;
		node_213.gate++ <--> node_87.gate++;
		node_24.gate++ <--> node_185.gate++;
		node_185.gate++ <--> node_24.gate++;
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
		node_192.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_192.gate++;
		node_171.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_171.gate++;
		node_52.gate++ <--> node_199.gate++;
		node_199.gate++ <--> node_52.gate++;
		node_80.gate++ <--> node_213.gate++;
		node_213.gate++ <--> node_80.gate++;
		node_213.gate++ <--> node_59.gate++;
		node_59.gate++ <--> node_213.gate++;
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
		node_213.gate++ <--> node_66.gate++;
		node_66.gate++ <--> node_213.gate++;
		node_178.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_178.gate++;
		node_213.gate++ <--> node_52.gate++;
		node_52.gate++ <--> node_213.gate++;
		node_73.gate++ <--> node_213.gate++;
		node_213.gate++ <--> node_73.gate++;
		node_199.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_199.gate++;
		node_178.gate++ <--> node_52.gate++;
		node_52.gate++ <--> node_178.gate++;
		node_178.gate++ <--> node_59.gate++;
		node_59.gate++ <--> node_178.gate++;
		node_178.gate++ <--> node_66.gate++;
		node_66.gate++ <--> node_178.gate++;
		node_178.gate++ <--> node_73.gate++;
		node_73.gate++ <--> node_178.gate++;
		node_178.gate++ <--> node_80.gate++;
		node_80.gate++ <--> node_178.gate++;
		node_178.gate++ <--> node_87.gate++;
		node_87.gate++ <--> node_178.gate++;
		node_178.gate++ <--> node_94.gate++;
		node_94.gate++ <--> node_178.gate++;
		node_178.gate++ <--> node_101.gate++;
		node_101.gate++ <--> node_178.gate++;
		node_178.gate++ <--> node_108.gate++;
		node_108.gate++ <--> node_178.gate++;
		node_178.gate++ <--> node_115.gate++;
		node_115.gate++ <--> node_178.gate++;
		node_178.gate++ <--> node_122.gate++;
		node_122.gate++ <--> node_178.gate++;
		node_178.gate++ <--> node_129.gate++;
		node_129.gate++ <--> node_178.gate++;
		node_178.gate++ <--> node_136.gate++;
		node_136.gate++ <--> node_178.gate++;
		node_178.gate++ <--> node_143.gate++;
		node_143.gate++ <--> node_178.gate++;
		node_178.gate++ <--> node_150.gate++;
		node_150.gate++ <--> node_178.gate++;
		node_178.gate++ <--> node_157.gate++;
		node_157.gate++ <--> node_178.gate++;
		node_178.gate++ <--> node_164.gate++;
		node_164.gate++ <--> node_178.gate++;
		node_178.gate++ <--> node_171.gate++;
		node_171.gate++ <--> node_178.gate++;
		node_206.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_206.gate++;
		node_213.gate++ <--> node_24.gate++;
		node_24.gate++ <--> node_213.gate++;
		node_206.gate++ <--> node_52.gate++;
		node_52.gate++ <--> node_206.gate++;
		node_206.gate++ <--> node_59.gate++;
		node_59.gate++ <--> node_206.gate++;
		node_206.gate++ <--> node_66.gate++;
		node_66.gate++ <--> node_206.gate++;
		node_206.gate++ <--> node_73.gate++;
		node_73.gate++ <--> node_206.gate++;
		node_206.gate++ <--> node_80.gate++;
		node_80.gate++ <--> node_206.gate++;
		node_206.gate++ <--> node_87.gate++;
		node_87.gate++ <--> node_206.gate++;
		node_206.gate++ <--> node_94.gate++;
		node_94.gate++ <--> node_206.gate++;
		node_206.gate++ <--> node_101.gate++;
		node_101.gate++ <--> node_206.gate++;
		node_206.gate++ <--> node_108.gate++;
		node_108.gate++ <--> node_206.gate++;
		node_206.gate++ <--> node_115.gate++;
		node_115.gate++ <--> node_206.gate++;
		node_206.gate++ <--> node_122.gate++;
		node_122.gate++ <--> node_206.gate++;
		node_206.gate++ <--> node_129.gate++;
		node_129.gate++ <--> node_206.gate++;
		node_206.gate++ <--> node_136.gate++;
		node_136.gate++ <--> node_206.gate++;
		node_206.gate++ <--> node_143.gate++;
		node_143.gate++ <--> node_206.gate++;
		node_206.gate++ <--> node_150.gate++;
		node_150.gate++ <--> node_206.gate++;
		node_206.gate++ <--> node_157.gate++;
		node_157.gate++ <--> node_206.gate++;
		node_206.gate++ <--> node_164.gate++;
		node_164.gate++ <--> node_206.gate++;
		node_206.gate++ <--> node_171.gate++;
		node_171.gate++ <--> node_206.gate++;
		node_206.gate++ <--> node_178.gate++;
		node_178.gate++ <--> node_206.gate++;
		node_206.gate++ <--> node_185.gate++;
		node_185.gate++ <--> node_206.gate++;
		node_206.gate++ <--> node_192.gate++;
		node_192.gate++ <--> node_206.gate++;
		node_206.gate++ <--> node_199.gate++;
		node_199.gate++ <--> node_206.gate++;
}