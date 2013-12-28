package br.unb.loa.data;

import java.util.ArrayList;
import java.util.List;

import br.unb.loa.model.Classifier;
import br.unb.loa.model.ClassifierType;
import br.unb.loa.service.EndpointSPARQL;

import com.hp.hpl.jena.query.QuerySolution;
import com.hp.hpl.jena.query.ResultSet;
import com.hp.hpl.jena.rdf.model.Literal;
import com.hp.hpl.jena.rdf.model.RDFNode;

public class LoaDAO implements SimpleDAO<Classifier, ClassifierType>{

	private EndpointSPARQL endpoint;
	
	private static String CODE_SPARQL = "cod";
	private static String PLOA_SPARQL = "ploa";
	private static String LOA_SPARQL = "loa";
	private static String LEI_MAIS_CREDITO_SPARQL = "lei_mais_credito";
	private static String EMPENHADO_SPARQL = "empenhado";
	private static String LIQUIDADO_SPARQL = "liquidado";
	private static String PAGO_SPARQL = "pago";
	
	public LoaDAO(){
		this.endpoint = new EndpointSPARQL();
	}
	
	public List<Classifier> searchByType(ClassifierType type, int year) {

		ResultSet result;
		String query;
		List<Classifier> classifiers;
		
		query = buildQuery(type, year);
		result = endpoint.execSPARQLQuery(query);
		
		classifiers = (result != null ) ? convertResultQuery(result, type, year) : null;
		
		return classifiers;
	}
	
	private String buildQuery(ClassifierType type, int year){
        
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
            
        classifierCode = CODE_SPARQL + type.getSparqlName();
        query = query.replace("SELECT", "SELECT ?"+classifierCode+" ?"+type.getSparqlName()+"");
        
        query = query.replace("GROUP BY", "GROUP BY ?"+classifierCode+" ?"+type.getSparqlName()+"");                
        query = query.replace("ORDER BY", "ORDER BY ?"+classifierCode+" ?"+type.getSparqlName()+"");  
        
        switch (type) {
	        case ORGAO:
	            query = query.replace("Pago ?val6 .", "Pago ?val6 . ?i loa:"+ClassifierType.UO.getProperty()+" [loa:"+type.getProperty()+" [rdf:label ?"+type.getSparqlName()+" ; loa:codigo ?"+classifierCode+"]] .");      
	            break;
            default:
                query = query.replace("Pago ?val6 .", "Pago ?val6 . ?i loa:"+type.getProperty()+" [rdf:label ?"+type.getSparqlName()+" ; loa:codigo ?"+classifierCode+"] .");         
                break;
        }
		
		return query;
	}
	
	private List<Classifier> convertResultQuery(ResultSet result, ClassifierType type, int year){
	
		List<Classifier> classifiers;
		
		classifiers = new ArrayList<Classifier>();
		
		while(result.hasNext()){
		
			QuerySolution qsol;
			RDFNode labelNode, codeNode, ploaNode, loaNode, leiMaisCreditoNode, empenhadoNode, liquidadoNode, pagoNode;
			String label, code;
			double ploa, loa, leiMaisCredito, empenhado, liquidado, pago;
			
			qsol = result.nextSolution() ;
			
			codeNode = qsol.get(CODE_SPARQL + type.getSparqlName());
			labelNode = qsol.get(type.getSparqlName());
			ploaNode = qsol.get(PLOA_SPARQL);
			loaNode = qsol.get(LOA_SPARQL);
			leiMaisCreditoNode = qsol.get(LEI_MAIS_CREDITO_SPARQL);
			empenhadoNode = qsol.get(EMPENHADO_SPARQL);
			liquidadoNode = qsol.get(LIQUIDADO_SPARQL);
			pagoNode = qsol.get(PAGO_SPARQL);
			
			code = ((Literal)codeNode).getLexicalForm();
			label = ((Literal)labelNode).getLexicalForm();
			ploa = Double.parseDouble(((Literal)ploaNode).getLexicalForm());
			loa = Double.parseDouble(((Literal)loaNode).getLexicalForm());
			leiMaisCredito = Double.parseDouble(((Literal)leiMaisCreditoNode).getLexicalForm());
			empenhado = Double.parseDouble(((Literal)empenhadoNode).getLexicalForm());
			liquidado = Double.parseDouble(((Literal)liquidadoNode).getLexicalForm());
			pago = Double.parseDouble(((Literal)pagoNode).getLexicalForm());
         
			classifiers.add(new Classifier(label, code, year, ploa, loa, leiMaisCredito, liquidado, empenhado, pago, type));
		}
		
		return classifiers;
	}
}
