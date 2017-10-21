package edu.uade.ia.tp7;

import java.util.List;
import java.util.Map;

import net.sf.clipsrules.jni.Environment;

public class ClipsService {

	private Environment environment;
	
	public ClipsService() {
		super();
		initializeEnvironment();
	}
	
	private void initializeEnvironment() {
		environment = new Environment();
		environment.loadFromResource("tp7.clp");
		environment.reset();
	}

	public List run(Map<String, String> extractParams) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	public void reset() throws Exception {
		environment.reset();
	}
}
