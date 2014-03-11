package br.unb.loa.util;

import java.util.Arrays;
import java.util.List;

import junit.framework.Assert;

import org.junit.Test;

import br.unb.loa.model.ClassifierType;

public class ClassifierUtilTest {

	@Test
	public void searchPOId() {
	
		ClassifierType poEnum;
		
		poEnum = ClassifierUtil.getClassifierTypeById(ClassifierType.PO.getId());
		
		Assert.assertEquals(ClassifierType.PO, poEnum);
	}
	
	@Test
	public void searchNullEnum(){
		
		ClassifierType invalidEnum;
		
		invalidEnum = ClassifierUtil.getClassifierTypeById(null);
		
		Assert.assertNull(invalidEnum);
	}
	
	@Test
	public void searchInvalidEnum(){
		
		ClassifierType invalidEnum;
		
		invalidEnum = ClassifierUtil.getClassifierTypeById("fail");
		
		Assert.assertNull(invalidEnum);
	}
	
	@Test
	public void searchEnumList(){
		
		List<ClassifierType> enumList;
		String[] idList = {ClassifierType.ACAO.getId(), ClassifierType.FUNCAO.getId()};
		
		enumList = ClassifierUtil.getClassifierTypeListByIds(Arrays.asList(idList));
		
		Assert.assertEquals(2, enumList.size());
		Assert.assertEquals(ClassifierType.ACAO, enumList.get(0));
		Assert.assertEquals(ClassifierType.FUNCAO, enumList.get(1));
	}
	
	@Test
	public void searchValidAndInvalidIds(){
	
		List<ClassifierType> enumList;
		String[] idList = {ClassifierType.ACAO.getId(), "fail"};
		
		enumList = ClassifierUtil.getClassifierTypeListByIds(Arrays.asList(idList));
		
		Assert.assertEquals(1, enumList.size());
		Assert.assertEquals(ClassifierType.ACAO, enumList.get(0));
	}
	
	@Test
	public void searchNullIds(){
	
		List<ClassifierType> enumList;
		
		enumList = ClassifierUtil.getClassifierTypeListByIds(null);
		
		Assert.assertEquals(0, enumList.size());
	}
}
