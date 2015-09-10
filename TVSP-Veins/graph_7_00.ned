package tvsp;


network graph_7_00
{
    parameters:
        string sourceNodeLabel = default("Input (Between quotation marks) the node you wish to be the source.");
        string destinationNodeLabel = default("Input (Between quotation marks) the node you wish to be the destination.");


        @display("bgb=1083,441");
    submodules:
        node_10: Node {
            parameters:
                nodeLabel = "node_10";
                @display("p=93,377");
        }

        node_17: Node {
            parameters:
                nodeLabel = "node_17";
                @display("p=750,53");
        }

        node_24: Node {
            parameters:
                nodeLabel = "node_24";
                @display("p=382,329");
        }

        node_31: Node {
            parameters:
                nodeLabel = "node_31";
                @display("p=711,362");
        }

        node_38: Node {
            parameters:
                nodeLabel = "node_38";
                @display("p=608,178");
        }

        node_45: Node {
            parameters:
                nodeLabel = "node_45";
                @display("p=47,193");
        }

        node_52: Node {
            parameters:
                nodeLabel = "node_52";
                @display("p=132,53");
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
}
