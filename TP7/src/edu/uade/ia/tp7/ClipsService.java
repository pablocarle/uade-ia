package edu.uade.ia.tp7;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import net.sf.clipsrules.jni.Environment;
import net.sf.clipsrules.jni.FactAddressValue;
import net.sf.clipsrules.jni.MultifieldValue;
import net.sf.clipsrules.jni.PrimitiveValue;

public class ClipsService {

	private Environment environment;
	
	public ClipsService() {
		super();
		initializeEnvironment();
	}
	
	private void initializeEnvironment() {
		environment = new Environment();
		environment.loadFromResource("/edu/uade/ia/tp7/resources/tp7.clp");
		environment.reset();

		PrimitiveValue pv1 = environment.eval("(facts)");

		System.out.println("pv1: " + pv1.getValue());

		long result = environment.run();

		PrimitiveValue pv2 = environment.eval("(facts)");

		System.out.println("pv2: " + pv2.getValue());

		System.out.println("Initialization result is: " + result);
	}

	public List findFacts(String factAddress, Map<String, Object> params) throws Exception {
		final List results = new ArrayList();
		StringBuilder evalStr = new StringBuilder(
				"(find-all-facts ((?var " + factAddress + ")) (and "
		);

		params.forEach((k, v) -> {
			if (v instanceof Number) {
				evalStr.append("(= ?var:").append(k).append(" ").append(v).append(") ");
			} else if (v instanceof List<?>) {

			} else {
				evalStr.append("(eq ?var:").append(k).append(" ").append(v).append(") ");
			}
		});
		evalStr.append("))");
		PrimitiveValue pv = environment.eval(evalStr.toString());

		if (pv instanceof MultifieldValue) {
			MultifieldValue value = (MultifieldValue) pv;
			for (Object factAddressRaw : value.multifieldValue()) {
				FactAddressValue factAddressValue = (FactAddressValue) factAddressRaw;
				results.add(factAddressValue.getFactSlot("nombre").toString());
			}
		}

		long result = environment.run();
		System.out.println("Result is: " + result);
		return results;
	}
	
	public void reset() throws Exception {
		environment.reset();
	}
}
