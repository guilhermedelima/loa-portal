package br.unb.loa.service;

import com.hp.hpl.jena.query.QueryExecution;
import com.hp.hpl.jena.query.QueryExecutionFactory;
import com.hp.hpl.jena.query.ResultSet;

public class EndpointSPARQL {

	private static final String ENDPOINT_URL = "http://10.209.65.201:8890/sparql";
	
	public EndpointSPARQL(){ }
	
	public ResultSet execSPARQLQuery(String query){
	
		QueryExecution queryExecution;
		ResultSet result;
		
		System.out.println(query);
		
		try {
			queryExecution = QueryExecutionFactory.sparqlService(ENDPOINT_URL, query);
			result = queryExecution.execSelect();
		} catch(Exception e){
			e.printStackTrace();
			result = null;
		}
			
		return result;
	}
}
