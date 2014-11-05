package tvsp;


simple Node {
    parameters:
        @display("i=device/wifilaptop");
        string nodeLabel = default("node");
        
    gates:
        inout gate[];
}
