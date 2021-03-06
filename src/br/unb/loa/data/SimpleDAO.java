package br.unb.loa.data;

import java.util.List;

public interface SimpleDAO<V, T> {
	
	public List<V> searchByType(T type, int year);
	public List<V> searchByTypeList(List<T> typeList, int year);

}
