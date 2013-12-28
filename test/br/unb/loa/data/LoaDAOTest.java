package br.unb.loa.data;

import java.util.List;

import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;

import br.unb.loa.model.Classifier;
import br.unb.loa.model.ClassifierType;

public class LoaDAOTest {

	private SimpleDAO<Classifier, ClassifierType> dao;
	
	@Before
	public void setUp(){
		this.dao = new LoaDAO();
	}
	
	@Test
	public void testSearchAcao2000() {
		
		List<Classifier> classifiers;
		
		classifiers = dao.searchByType(ClassifierType.ACAO, 2000);

		Assert.assertTrue(classifiers.size() > 1);
	}
	
	@Test
	public void testSearchPO2000() {
		
		List<Classifier> classifiers;
		
		classifiers = dao.searchByType(ClassifierType.PO, 2000);

		Assert.assertTrue(classifiers.isEmpty());
	}
	
	@Test
	public void testSearchForWrongYear() {
		
		List<Classifier> classifiers;
		
		classifiers = dao.searchByType(ClassifierType.FUNCAO, 2099);

		Assert.assertTrue(classifiers.isEmpty());
	}

}
