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
import core.NetworkInterface;
import core.Settings;
import core.SimClock;
import core.SimScenario;

/**
 * Crappy router that only detectes connections and does nothing (Used for the purposes of generating a clean EventLogReport)
 * By clean EventLog I mean one that doens't have events of Message Sending.
 * 
 * Also this router, when the simulation ends, it forcefully ends any connection still UP, thus assuring all connections will
 * have a respective CONN DOWN event (To address annoying events when the simulation ends and some connection was still up, not
 * being closed properly!)
 * 
 * Made by ÁLVARO SHIOKAWA ALVAREZ
 */
public class ConnectionsOnlyRouter extends ActiveRouter {
	
	/**
	 * Constructor. Creates a new message router based on the settings in
	 * the given Settings object.
	 * @param s The settings object
	 */
	public ConnectionsOnlyRouter(Settings s) {
		super(s);
	}
	
	/**
	 * Copy constructor.
	 * @param r The router prototype where setting values are copied from
	 */
	protected ConnectionsOnlyRouter(ConnectionsOnlyRouter r) {
		super(r);
	}
	
	@Override
	public void update() {
		/*
		 * This improvised condition here is to make use of the tearDownAllConnections() method, but wait, it is private...
		 * No problem, I shamelessly copied the method's content and pasted it here inside this if statement, which verifies
		 * if the simulation has already ended, that is, the current simulation time is greater or equal the simulation time limit
		 * specified within "default_settings.txt".
		 * 
		 * So when the update method is called, if the method still has connections while the simulation ended, well...
		 * The connections are doomed. And the eventlog won't look stupid, not closing the connections that were left open.
		 * */
		if (SimClock.getTime() >= SimScenario.getInstance().getEndTime()){ // If the simulation ended and it still has connections up... Well, it is doomed. 
			// Shameless copy of the tearDownAllConnections() method.
			// Why a copy? Because it is originally not accessible, that is, private. FEAR MY GODLIKE POWERS!
			for (NetworkInterface i : this.getHost().getInterfaces()) {
				// Get all connections for the interface
				List<Connection> conns = i.getConnections();
				if (conns.size() == 0) continue;
				
				// Destroy all connections
				List<NetworkInterface> removeList =
					new ArrayList<NetworkInterface>(conns.size());
				for (Connection con : conns) {
					removeList.add(con.getOtherInterface(i));
				}
				for (NetworkInterface inf : removeList) {
					i.destroyConnection(inf);
				}
			}
		}
		super.update();
	}
		
	@Override
	public ConnectionsOnlyRouter replicate() {
		return new ConnectionsOnlyRouter(this);
	}

}