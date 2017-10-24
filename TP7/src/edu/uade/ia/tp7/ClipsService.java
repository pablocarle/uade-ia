package edu.uade.ia.tp7;

import java.util.ArrayList;
import java.util.HashMap;
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
		long result = environment.run();
		System.out.println("Initialization result is: " + result);
	}

	public List<Map<String, String>> findFacts(String factAddress, Map<String, String> params) throws Exception {
		final List<Map<String, String>> results = new ArrayList<>();

		assertFacts(params);

		String evalStr = "(find-all-facts ((?var " + factAddress + ")) TRUE)";
		PrimitiveValue pv = environment.eval(evalStr);

		if (pv instanceof MultifieldValue) {
			MultifieldValue value = (MultifieldValue) pv;
			Map<String, String> values = new HashMap<>();
			for (Object factAddressRaw : value.multifieldValue()) {
				FactAddressValue factAddressValue = (FactAddressValue) factAddressRaw;
				values.put("NombreEquipo", factAddressValue.getFactSlot("NombreEquipo").toString());
				values.put("ColoresCamiseta", factAddressValue.getFactSlot("ColoresCamiseta").toString());
				values.put("Patron", factAddressValue.getFactSlot("Patron").toString());
				values.put("CantidadBarras", factAddressValue.getFactSlot("CantidadBarras").toString());
				values.put("Pais", factAddressValue.getFactSlot("Pais").toString());
				values.put("Categoria", factAddressValue.getFactSlot("Categoria").toString());
				results.add(values);
			}
		}

		long result = environment.run();
		System.out.println("Result is: " + result);
		return results;
	}

	private void assertFacts(Map<String, String> params) {
		params.forEach((k, v) -> {
			StringBuilder assertions = new StringBuilder();
			assertions.append("(assert (")
					.append(k)
					.append(" ")
					.append(v)
					.append("))\n");

			System.out.println("Assert: " + assertions.toString());
			PrimitiveValue pv = environment.eval(assertions.toString());
			System.out.println("Assertions eval returned with: " + pv.getValue());
			long result = environment.run();
			System.out.println("Result of run after assertions: " + result);
		});
	}


	public void reset() throws Exception {
		environment.reset();
	}
}

