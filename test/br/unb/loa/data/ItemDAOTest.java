package br.unb.loa.data;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import br.unb.loa.model.ClassifierType;
import br.unb.loa.model.Item;

public class ItemDAOTest {

	private SimpleDAO<Item, ClassifierType> dao;
	
	@Before
	public void setUp(){
		this.dao = new ItemDAO();
	}
	
	@Test
	public void testSearchAcao2000() {
		
		List<Item> items;
		
		items = dao.searchByType(ClassifierType.ACAO, 2000);

		Assert.assertTrue(items.size() > 1);
		Assert.assertTrue(items.get(0).getClassifierList().size() == 1);
	}
	
	@Test
	public void testSearchPO2000() {
		
		List<Item> items;
		
		items = dao.searchByType(ClassifierType.PO, 2000);

		Assert.assertTrue(items.size() == 1);
		Assert.assertTrue(items.get(0).getClassifierList().size() == 1);
	}
	
	@Test
	public void testSearchForWrongYear() {
		
		List<Item> items;
		
		items = dao.searchByType(ClassifierType.FUNCAO, 2099);

		Assert.assertTrue(items.isEmpty());
	}
	
	@Test
	public void testSearchClassifiersList(){
		
		List<ClassifierType> typeList;
		List<Item> items;
		
		typeList = new ArrayList<ClassifierType>();
		typeList = Arrays.asList(ClassifierType.values());
		
		items = dao.searchByTypeList(typeList, 2000);
		
		Assert.assertTrue(items.size() > 1);
		Assert.assertTrue(items.get(0).getClassifierList().size() > 1);
	}

}
