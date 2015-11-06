/* 
 * Copyright 2010 Aalto University, ComNet
 * Released under GPLv3. See LICENSE.txt for details. 
 */
package routing;

import core.Connection;
import core.DTNHost;
import core.Message;
import core.Settings;
import core.SimClock;

/**
 * First contact router which uses only a single copy of the message 
 * (or fragments) and forwards it to the first available contact.
 */
public class FirstContactRouter_CUSTOM extends ActiveRouter {
	
	/**
	 * Constructor. Creates a new message router based on the settings in
	 * the given Settings object.
	 * @param s The settings object
	 */
	public FirstContactRouter_CUSTOM(Settings s) {
		super(s);
	}
	
	/**
	 * Copy constructor.
	 * @param r The router prototype where setting values are copied from
	 */
	protected FirstContactRouter_CUSTOM(FirstContactRouter_CUSTOM r) {
		super(r);
	}
	
	@Override
	protected int checkReceiving(Message m, DTNHost from) {
		int recvCheck = super.checkReceiving(m, from); 
		
		if (recvCheck == RCV_OK) {
			/* don't accept a message that has already traversed this node */
			if (m.getHops().contains(getHost())) {
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
		
		tryAllMessagesToAllConnections();
	}
	
	/* messageTransferred method */
	@Override
	public Message messageTransferred(String id, DTNHost from) {
		Message m = super.messageTransferred(id, from);
		double message_transfer_time = m.getReceiveTime() - this.getHost().getRouter().getTimeWhenMessageTransferStarted();
		System.out.println(id + " from " +  from + " started transfering at " + this.getHost().getRouter().getTimeWhenMessageTransferStarted() + " seconds, arrived at " + this.getHost() + " at time " + m.getReceiveTime() + " seconds (Hop count: " + m.getHopCount() + " / Transmission time: " + message_transfer_time + " seconds)");
		if (m.getTo() == getHost()) {
			System.out.println(id + " arrived at DESTINATION " + this.getHost()+ " at time " + m.getReceiveTime() + " seconds");
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
		this.deleteMessage(con.getMessage().getId(), false);
	}
		
	@Override
	public FirstContactRouter_CUSTOM replicate() {
		return new FirstContactRouter_CUSTOM(this);
	}

}