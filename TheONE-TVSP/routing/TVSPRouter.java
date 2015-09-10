/* 
 * Copyright 2010 Aalto University, ComNet
 * Released under GPLv3. See LICENSE.txt for details. 
 */
package routing;

import java.util.ArrayList;
import java.util.List;

import core.Connection;
import core.DTNHost;
import core.Message;
import core.Settings;
import core.SimClock;
import tvg.*;

/**
 * TVSP Router, that will be, initially like a First contact router which uses only a single copy of the message 
 * (or fragments) and forwards it to the first available contact.
 */
public class TVSPRouter extends ActiveRouter {
	
	/**
	 * Constructor. Creates a new message router based on the settings in
	 * the given Settings object.
	 * @param s The settings object
	 */
	public TVSPRouter(Settings s) {
		super(s);
	}
	
	/**
	 * Copy constructor.
	 * @param r The router prototype where setting values are copied from
	 */
	protected TVSPRouter(TVSPRouter r) {
		super(r);
	}
	
	@Override
	protected int checkReceiving(Message m, DTNHost from) {
		int recvCheck = super.checkReceiving(m, from); 
		
		if (recvCheck == RCV_OK) {
			/* don't accept a message that has already traversed this node */
			
			/*
			 * Aqui garante que este router não receberá  mensagem repetida, isto é, uma mensagem que já passou por ele.
			 * Verifica-se a lista de nós por onde a mensagem passou, ou seja, sua lista de hops. Se por acaso este nó
			 * estiver nesta lista de hops, quer dizer que ela já passou por aqui, logo impede de receber.
			 * */
			if (m.getHops().contains(getHost())) { // Aqui garante que não vai receber uma mensagem repetida!!!!!
				recvCheck = DENIED_OLD;
			}
		}
		
		return recvCheck;
	}
			
	@Override
	public void update() {
		super.update();
		if (isTransferring() || !canStartTransfer()) {
			return; 
		}
		
		if (exchangeDeliverableMessages() != null) {
			return; 
		}
		
		tryAllMessagesToAllConnections(); // Aqui seria a parte de ter que hackear e fazer os if do algoritmo.
	}

	@Override
	public Message messageTransferred(String id, DTNHost from) {
		Message m = super.messageTransferred(id, from);
		System.out.println(id + " from " +  from + " arrived at " + this.getHost() + " at time " + SimClock.getTime() + " seconds (Hop count: " + m.getHopCount() + ")");
		if (m.getTo() == getHost()) {
			System.out.println(id + " arrived at DESTINATION " + this.getHost()+ " at time " + SimClock.getTime() + " seconds");
		} 
		/**
		 *  N.B. With application support the following if-block
		 *  becomes obsolete, and the response size should be configured 
		 *  to zero.
		 */
		// check if msg was for this host and a response was requested
		if (m.getTo() == getHost() && m.getResponseSize() > 0) {
			// generate a response message
			Message res = new Message(this.getHost(),m.getFrom(), 
					RESPONSE_PREFIX+m.getId(), m.getResponseSize());
			this.createNewMessage(res);
			this.getMessage(RESPONSE_PREFIX+m.getId()).setRequest(m);
		}
		
		return m;
	}	
	
	@Override
	protected void transferDone(Connection con) {
		/* don't leave a copy for the sender */
		this.deleteMessage(con.getMessage().getId(), false); // Aqui deleta a mensagem já transferida, de modo a não ficar uma cópia.
	}
	
	/**
	 * Tries to send all messages that this router is carrying to all
	 * connections this node has. Messages are ordered using the 
	 * {@link MessageRouter#sortByQueueMode(List)}. See 
	 * {@link #tryMessagesToConnections(List, List)} for sending details.
	 * @return The connections that started a transfer or null if no connection
	 * accepted a message.
	 */
	@Override
	protected Connection tryAllMessagesToAllConnections(){
		List<Connection> connections = getConnections();
		if (connections.size() == 0 || this.getNrofMessages() == 0) {
			return null;
		}

		List<Message> messages = new ArrayList<Message>(this.getMessageCollection());
		this.sortByQueueMode(messages);

		return tryMessagesToConnections(messages, connections);
	}	
	
	/**
	 * Tries to send all given messages to all given connections. Connections
	 * are first iterated in the order they are in the list and for every
	 * connection, the messages are tried in the order they are in the list.
	 * Once an accepting connection is found, no other connections or messages
	 * are tried.
	 * @param messages The list of Messages to try
	 * @param connections The list of Connections to try
	 * @return The connections that started a transfer or null if no connection
	 * accepted a message.
	 */
	@Override
	protected Connection tryMessagesToConnections(List<Message> messages, List<Connection> connections) {
		for (int i=0, n=connections.size(); i<n; i++) {
			Connection con = connections.get(i);
			String a = con.getOtherNode(this.getHost()).toString();
			String b = TVG.getInstance().getCurrentShortestPath().getFirst().toString();
			if(a.equals(b)){
				TVG.getInstance().getCurrentShortestPath().removeFirst();
				Message started = tryAllMessages(con, messages); 
				if (started != null) {
					return con;
				}
			}
			

		}
		
		return null;
	}
	
	 /**
	  * Goes trough the messages until the other node accepts one
	  * for receiving (or doesn't accept any). If a transfer is started, the
	  * connection is included in the list of sending connections.
	  * @param con Connection trough which the messages are sent
	  * @param messages A list of messages to try
	  * @return The message whose transfer was started or null if no 
	  * transfer was started. 
	  */
	protected Message tryAllMessages(Connection con, List<Message> messages) {
		for (Message m : messages) {
			int retVal = startTransfer(m, con); 
			if (retVal == RCV_OK) {
				return m;	// accepted a message, don't try others
			}
			else if (retVal > 0) { 
				return null; // should try later -> don't bother trying others
			}
		}
		
		return null; // no message was accepted		
	}	
	
	@Override
	public TVSPRouter replicate() {
		return new TVSPRouter(this);
	}

}