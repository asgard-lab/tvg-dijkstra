package tvsp;


network graph_6_00
{
    parameters:
        string sourceNodeLabel = default("Input (Between quotation marks) the node you wish to be the source.");
        string destinationNodeLabel = default("Input (Between quotation marks) the node you wish to be the destination.");


        @display("bgb=753,405");
    submodules:
        node_10: Node {
            parameters:
                nodeLabel = "node_10";
                @display("p=115,350");
        }

        node_17: Node {
            parameters:
                nodeLabel = "node_17";
                @display("p=300,36");
        }

        node_24: Node {
            parameters:
                nodeLabel = "node_24";
                @display("p=97,69");
        }

        node_31: Node {
            parameters:
                nodeLabel = "node_31";
                @display("p=490,101");
        }

        node_38: Node {
            parameters:
                nodeLabel = "node_38";
                @display("p=544,350");
        }

        node_45: Node {
            parameters:
                nodeLabel = "node_45";
                @display("p=45,191");
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
}
