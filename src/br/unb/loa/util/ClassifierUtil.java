package br.unb.loa.util;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import br.unb.loa.model.ClassifierType;

public class ClassifierUtil {
	public static ClassifierType getClassifierTypeById(String id) {
		for(ClassifierType type : ClassifierType.values()) {
			if (type.getId().equals(id))
					return type;
		}
		
		return null;
	}
	
	public static List<ClassifierType> getClassifierTypeListByIds(List<String> idList){
		List<ClassifierType> enumList;
		
		enumList = new ArrayList<ClassifierType>();
		
		if(idList != null){
			//Vraptor Bug
			Collections.reverse(idList);
			
			for(String id : idList){
				for(ClassifierType type : ClassifierType.values()) {
					if (type.getId().equals(id))
							enumList.add(type);
				}
			}	
		}
		
		return enumList;
	}
}
