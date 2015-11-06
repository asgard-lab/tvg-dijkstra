/* 
 * Copyright 2010 Aalto University, ComNet
 * Released under GPLv3. See LICENSE.txt for details. 
 */
package routing;

import tvg.TVG;
import core.DTNHost;
import core.Message;
import core.Settings;
import core.SimClock;

/**
 * Epidemic message router with drop-oldest buffer and only single transferring
 * connections at a time.
 */
public class EpidemicRouter_CUSTOM extends ActiveRouter {
	
	/**
	 * Constructor. Creates a new message router based on the settings in
	 * the given Settings object.
	 * @param s The settings object
	 */
	public EpidemicRouter_CUSTOM(Settings s) {
		super(s);
		//TODO: read&use epidemic router specific settings (if any)
	}
	
	/**
	 * Copy constructor.
	 * @param r The router prototype where setting values are copied from
	 */
	protected EpidemicRouter_CUSTOM(EpidemicRouter_CUSTOM r) {
		super(r);
		//TODO: copy epidemic settings here (if any)
	}
			
	@Override
	public void update() {
		super.update();
		if (isTransferring() || !canStartTransfer()) {
			return; // transferring, don't try other connections yet
		}
		
		// Try first the messages that can be delivered to final recipient
		if (exchangeDeliverableMessages() != null) {
			return; // started a transfer, don't try others (yet)
		}
		
		// then try any/all message to any/all connection
		this.tryAllMessagesToAllConnections();
	}
	
	
	@Override
	public EpidemicRouter_CUSTOM replicate() {
		return new EpidemicRouter_CUSTOM(this);
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
	
}