package br.unb.loa.util;

import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;

public class FormatterUtil {

	public static String convertDouble(double value) {
        DecimalFormatSymbols symbols = new DecimalFormatSymbols();
        symbols.setDecimalSeparator(',');
        symbols.setGroupingSeparator('.');
        DecimalFormat myFormatter = new DecimalFormat("###,##0.00", symbols);
        
        String result = "R$-";
        result = result.concat(myFormatter.format(value));
        
        return result;
    }
	
}
