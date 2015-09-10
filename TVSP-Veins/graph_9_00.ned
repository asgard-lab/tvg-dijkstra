package tvsp;


network graph_9_00
{
    parameters:
        string sourceNodeLabel = default("Input (Between quotation marks) the node you wish to be the source.");
        string destinationNodeLabel = default("Input (Between quotation marks) the node you wish to be the destination.");


        @display("bgb=1232,454");
    submodules:
        node_10: Node {
            parameters:
                nodeLabel = "node_10";
                @display("p=66,403");
        }

        node_17: Node {
            parameters:
                nodeLabel = "node_17";
                @display("p=1133,40");
        }

        node_24: Node {
            parameters:
                nodeLabel = "node_24";
                @display("p=171,100");
        }

        node_31: Node {
            parameters:
                nodeLabel = "node_31";
                @display("p=1002,403");
        }

        node_38: Node {
            parameters:
                nodeLabel = "node_38";
                @display("p=210,325");
        }

        node_45: Node {
            parameters:
                nodeLabel = "node_45";
                @display("p=52,204");
        }

        node_52: Node {
            parameters:
                nodeLabel = "node_52";
                @display("p=91,24");
        }

        node_59: Node {
            parameters:
                nodeLabel = "node_59";
                @display("p=366,312");
        }

        node_66: Node {
            parameters:
                nodeLabel = "node_66";
                @display("p=571,171");
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
}
