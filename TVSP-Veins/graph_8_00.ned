package tvsp;


network graph_8_00
{
    parameters:
        string sourceNodeLabel = default("Input (Between quotation marks) the node you wish to be the source.");
        string destinationNodeLabel = default("Input (Between quotation marks) the node you wish to be the destination.");


        @display("bgb=1201,445");
    submodules:
        node_10: Node {
            parameters:
                nodeLabel = "node_10";
                @display("p=128,406");
        }

        node_17: Node {
            parameters:
                nodeLabel = "node_17";
                @display("p=651,41");
        }

        node_24: Node {
            parameters:
                nodeLabel = "node_24";
                @display("p=88,74");
        }

        node_31: Node {
            parameters:
                nodeLabel = "node_31";
                @display("p=999,215");
        }

        node_38: Node {
            parameters:
                nodeLabel = "node_38";
                @display("p=258,248");
        }

        node_45: Node {
            parameters:
                nodeLabel = "node_45";
                @display("p=49,198");
        }

        node_52: Node {
            parameters:
                nodeLabel = "node_52";
                @display("p=330,41");
        }

        node_59: Node {
            parameters:
                nodeLabel = "node_59";
                @display("p=411,303");
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
}
