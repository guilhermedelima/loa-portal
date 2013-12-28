package br.unb.loa.data;

import java.util.List;

public interface SimpleDAO<V, T> {
	
	public List<V> searchByType(T type, int year);

}
