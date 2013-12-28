package br.unb.loa.util;

import org.junit.Assert;
import org.junit.Test;

public class FormatterUtilTest {
	
	@Test
	public void testConvertSimpleDouble() {
		
		double a;
		String expected;
		
		a = 440;
		expected = "R$-440,00";
		
		Assert.assertEquals(expected, FormatterUtil.convertDouble(a));
	}
	
	@Test
	public void testConvertDecimal() {
		
		double a;
		String expected;
		
		a = 5.89;
		expected = "R$-5,89";
		
		Assert.assertEquals(expected, FormatterUtil.convertDouble(a));
	}
	
	@Test
	public void testConvertZero() {
		
		double a;
		String expected;
		
		a = 0;
		expected = "R$-0,00";
		
		Assert.assertEquals(expected, FormatterUtil.convertDouble(a));
	}

}
