package br.unb.loa.util;

import br.unb.loa.model.ClassifierType;

public class ClassifierUtil {
	public static ClassifierType getClassifierTypeById(String id) {
		for(ClassifierType type : ClassifierType.values()) {
			if (type.getId().equals(id))
					return type;
		}
		
		return null;
	}
}
