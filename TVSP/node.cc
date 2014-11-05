//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 


#include <omnetpp.h>
#include <string.h>
/***************
 *             *
 * Classe Node *
 *             *
 ***************/
class Node : public cSimpleModule
{
    private:
        cMessage *event;        // Pointer to the event object which we'll use for timing (Durante os self-messageS).
        cMessage *tictocMsg;    // Variable to remember the message until we send it back.

    public:
        Node();     // Construtor padrão
        ~Node();    // Destrutor

    protected:
        virtual void initialize();
        virtual void handleMessage(cMessage *msg);
};

/* Esta module class precisa ser registrado no OMNeT++. SEMPRE tem que estar no .cc, e nunca no .h! */
Define_Module(Node);

/****************************
 * Detalhamento dos métodos *
 ************************** */

/* Construtor padrão*/
Node::Node() {
    /* Set pointer members of the module class to NULL; postpone all other initialization tasks to initialize().

       Set the pointer to NULL, so that the destructor won crash, even if initialize() doesn't get called because
       of a runtime error or user cancellation during the startup process (Refere-se ao initiliaze() ). */
    ev << "Constructing node...\n";
    event = tictocMsg = NULL;
}

/* Destrutor*/
Node::~Node() {
    /* Dispose of the dynamically allocated objects.

       Delete everything which was allocated by new and is still held by the module class.
       With self-messages (timers), use the cancelAndDelete(msg) function!
       It is almost always wrong to just delete a self-message from the destructor, because it might be in the scheduled events list.
       The cancelAndDelete(msg) function checks for that first, and cancels the message before deletion if necessary.

       OMNeT++ prints the list of unreleased objects at the end of the simulation.
       When a simulation model dumps "undisposed object ..." messages, this indicates that the corresponding module destructors should be fixed.
       As a temporary measure, these messages may be hidden by setting print-undisposed=false in the configuration. */

    ev << "Destructing node...\n";
    cancelAndDelete(event);
    delete tictocMsg;
}

/* Método initialize */
void Node::initialize()
{
    /* Perform all initialization tasks: read module parameters, initialize class variables,
       allocate dynamic data structures with new; also allocate and initialize self-messages (timers) if needed. */

    /* finish():
       Record statistics. Do not delete anything or cancel timers -- all cleanup must be done in the destructor. */
    scheduleAt(simTime(), new cMessage("start"));
}

/* Método handleMessage*/
void Node::handleMessage(cMessage *msg) {
    if (this->par("nodeLabel").str() == this->getParentModule()->par("sourceNodeLabel").str()) { // Se este é o nó de de faremos o Djikstra iniciar a busca
        cTopology topo; // Cria uma estrutura de dados de topologia

        std::vector<std::string> nedTypes; // Cria um Vector que armazanerá como elementos strinds relativas aos tipos NED procurados.

        nedTypes.push_back("tvsp.Node");
        topo.extractByNedTypeName(nedTypes); // Extrai para a topologia, incluindo na mesma, todos módulos do tipo Node

        cTopology::Node *sourceNode = topo.getNodeFor(this); // Define quem é o nó inicial a partir de onde vai ser feito o shortest path!
        cTopology::Node *walkerNode = NULL;         // Cria um ponteiro que caminhará por todos os nós do grafo.

        /* Será feito o Djikstra deste nó  até nós da topologia que foram setados como destino*/
        for (int i = 0; i < topo.getNumNodes(); i++) {
            if (topo.getNode(i)->getModule()->par("nodeLabel").str() == this->getParentModule()->par("destinationNodeLabel").str()) {   // Se este é um nó destino para onde faremos o Djikstra
                walkerNode = sourceNode;                                // Faz o walkerNode voltar a apontar para o nó origem de onde se começará o Djikstra

                topo.calculateUnweightedSingleShortestPathsTo( topo.getNode(i) ); // Calcula os shortest path até o nó setado como destino, no caso, destinationNode.

                ev << "Source node = " << this-> getFullName() << endl
                   << "Destination node = " << topo.getNode(i)->getModule()->getName() << endl << endl;

                if (sourceNode == NULL) {
                    ev << "We are not included in the topology.\n";
                } else if (sourceNode->getNumPaths()==0) {// Retorna o número de shorteest paths do sourceNode até o targetNode. Se for igual a 0 é porque  o destino é o nó de origem.
                    ev << "No path to destination.\n\n***********************************\n\n";
                } else {
                    ev << "Walking through the network...\n\n";
                    while (walkerNode != topo.getTargetNode()) {// getTargetNode retorna o nó dque foi passado na chamada mais recente do calculateUnweightedSingleShortestPathsTo
                        ev << "We are at " << walkerNode->getModule()->getFullPath() << endl;

                        cTopology::LinkOut *path = walkerNode->getPath(0); // Retorna o próximo link no shotest-path, ou seja, pega o vizinho deste nó, vizinho que está no shortest path!
                        ev << "Taking gate " << path->getLocalGate()->getFullName()
                           << " we arrive in " << path->getRemoteNode()->getModule()->getFullPath()
                           << " on its gate " << path->getRemoteGate()->getFullName() << endl << endl;

                        walkerNode = path->getRemoteNode(); // Faz o walkerNode apontar para o nó no fim da aresta pega no shortestpath

                        if (walkerNode == topo.getTargetNode()) // Se o nó descoberto for o nó destino...
                            ev << "Arrived!\n\n***********************************\n\n";
                    }
                }
            }
        }
    }
}

