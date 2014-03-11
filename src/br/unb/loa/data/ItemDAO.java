package br.unb.loa.data;

import java.util.ArrayList;
import java.util.List;

import br.unb.loa.model.Classifier;
import br.unb.loa.model.ClassifierType;
import br.unb.loa.model.Item;
import br.unb.loa.service.EndpointSPARQL;

import com.hp.hpl.jena.query.QuerySolution;
import com.hp.hpl.jena.query.ResultSet;
import com.hp.hpl.jena.rdf.model.Literal;
import com.hp.hpl.jena.rdf.model.RDFNode;

public class ItemDAO implements SimpleDAO<Item, ClassifierType>{

	private EndpointSPARQL endpoint;
	
	private static String CODE_SPARQL = "cod";
	private static String PLOA_SPARQL = "ploa";
	private static String LOA_SPARQL = "loa";
	private static String LEI_MAIS_CREDITO_SPARQL = "lei_mais_credito";
	private static String EMPENHADO_SPARQL = "empenhado";
	private static String LIQUIDADO_SPARQL = "liquidado";
	private static String PAGO_SPARQL = "pago";
	
	public ItemDAO(){
		this.endpoint = new EndpointSPARQL();
	}
	
	public List<Item> searchByType(ClassifierType type, int year) {

		List<Item> items;
		List<ClassifierType> wrapperTypeList;
		
		wrapperTypeList = new ArrayList<ClassifierType>();
		wrapperTypeList.add(type);
		
		items = searchByTypeList(wrapperTypeList, year);
		
		return items;
	}
	
	public List<Item> searchByTypeList(List<ClassifierType> typeList, int year) {
		
		ResultSet result;
		String query;
		List<Item> items;
		
		query = buildQuery(typeList, year);
		result = endpoint.execSPARQLQuery(query);
		
		items = (result != null ) ? convertResultQuery(result, typeList, year) : null;
		
		return items;
	}
	
	private String buildQuery(List<ClassifierType> typeList, int year){
        
		ClassifierType type;
		String query, classifierCode;
		
        query = "PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>" +
                "PREFIX loa: <http://vocab.e.gov.br/2013/09/loa#>" +
                "PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>" +
                "SELECT (sum(?val1) as ?"+PLOA_SPARQL+") (sum(?val2) as ?"+LOA_SPARQL+") (sum(?val3) as ?"+LEI_MAIS_CREDITO_SPARQL+") (sum(?val4) as ?"+EMPENHADO_SPARQL+") (sum(?val5) as ?"+LIQUIDADO_SPARQL+") (sum(?val6) as ?"+PAGO_SPARQL+") WHERE {" +
                "  ?i loa:temExercicio [loa:identificador "+year+"] ."+
                "  ?i loa:valorProjetoLei ?val1 ." +
                "  ?i loa:valorDotacaoInicial ?val2 ." +
                "  ?i loa:valorLeiMaisCredito ?val3 ." +
                "  ?i loa:valorEmpenhado ?val4 ." +
                "  ?i loa:valorLiquidado ?val5 ." +
                "  ?i loa:valorPago ?val6 ." +
                "} GROUP BY ORDER BY";
            
        int i;
        for(i=typeList.size()-1; i>=0; i--){
        	type = typeList.get(i);
        	
        	classifierCode = CODE_SPARQL + type.getId();
            query = query.replace("SELECT", "SELECT ?"+classifierCode+" ?"+type.getId()+"");
            
            query = query.replace("GROUP BY", "GROUP BY ?"+classifierCode+" ?"+type.getId()+"");                
            query = query.replace("ORDER BY", "ORDER BY ?"+classifierCode+" ?"+type.getId()+"");
        	
            switch (type) {
	            case ORGAO:
	            	query = query.replace("Pago ?val6 .", "Pago ?val6 . ?i loa:"+ClassifierType.UO.getProperty()+" [loa:"+type.getProperty()+" [rdf:label ?"+type.getId()+" ; loa:codigo ?"+classifierCode+"]] .");      
	            	break;
	            default:
	            	query = query.replace("Pago ?val6 .", "Pago ?val6 . ?i loa:"+type.getProperty()+" [rdf:label ?"+type.getId()+" ; loa:codigo ?"+classifierCode+"] .");         
	            	break;
            }	
        }
		
		return query;
	}
		
	private List<Item> convertResultQuery(ResultSet result, List<ClassifierType> typeList, int year){
	
		List<Item> items;
		
		items = new ArrayList<Item>();
		
		while(result.hasNext()){
		
			QuerySolution qsol;
			RDFNode labelNode, codeNode, ploaNode, loaNode, leiMaisCreditoNode, empenhadoNode, liquidadoNode, pagoNode;
			List<Classifier> classifiers;
			String label, code;
			double ploa, loa, leiMaisCredito, empenhado, liquidado, pago;
			
			qsol = result.nextSolution() ;
			classifiers = new ArrayList<Classifier>();
			
			for(ClassifierType type : typeList){
				codeNode = qsol.get(CODE_SPARQL + type.getId());
				labelNode = qsol.get(type.getId());
				
				code = ((Literal)codeNode).getLexicalForm();
				label = ((Literal)labelNode).getLexicalForm();
				
				classifiers.add(new Classifier(label, code, year, type) );
			}
			
			ploaNode = qsol.get(PLOA_SPARQL);
			loaNode = qsol.get(LOA_SPARQL);
			leiMaisCreditoNode = qsol.get(LEI_MAIS_CREDITO_SPARQL);
			empenhadoNode = qsol.get(EMPENHADO_SPARQL);
			liquidadoNode = qsol.get(LIQUIDADO_SPARQL);
			pagoNode = qsol.get(PAGO_SPARQL);
			
			ploa = Double.parseDouble(((Literal)ploaNode).getLexicalForm());
			loa = Double.parseDouble(((Literal)loaNode).getLexicalForm());
			leiMaisCredito = Double.parseDouble(((Literal)leiMaisCreditoNode).getLexicalForm());
			empenhado = Double.parseDouble(((Literal)empenhadoNode).getLexicalForm());
			liquidado = Double.parseDouble(((Literal)liquidadoNode).getLexicalForm());
			pago = Double.parseDouble(((Literal)pagoNode).getLexicalForm());
         
			items.add(new Item(classifiers, year, ploa, loa, leiMaisCredito, liquidado, empenhado, pago));
		}
		
		return items;
	}

}
