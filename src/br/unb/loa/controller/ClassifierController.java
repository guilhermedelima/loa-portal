package br.unb.loa.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.view.Results;
import br.unb.loa.data.LoaDAO;
import br.unb.loa.data.SimpleDAO;
import br.unb.loa.model.Classifier;
import br.unb.loa.model.ClassifierType;
import br.unb.loa.util.ClassifierUtil;

@Resource
public class ClassifierController {
	
	public final Result result;
	public final Validator validator;
	public final SimpleDAO<Classifier, ClassifierType> classifierDAO;
	
	private static final int LOA_START = 2000;
	private static final int LOA_END = 2013;
	
	private static final String CLASSIFIER_DEFAULT = ClassifierType.PROGRAMA.getId();
	private static final int YEAR_DEFAULT = 2013;
	
	private static final String ERROR_MESSAGE_OFFLINE = "Serviço indisponível, tente mais tarde";
	
	public ClassifierController(Result result, Validator validator){
		this.result = result;
		this.validator = validator;
		this.classifierDAO = new LoaDAO();
	}
	
	@Path("/")
	public void index(){
		
		result.redirectTo(ClassifierController.class).classifier(CLASSIFIER_DEFAULT, YEAR_DEFAULT);
	}
	
	@Path("/classificador/{enumID}/{year:[0-9]{4}}")
	public void classifier(String enumID, int year){
		ClassifierType enumType;
		List<Classifier> classifiersList;
		List<Integer> loaYears;
		
		enumType = ClassifierUtil.getClassifierTypeById(enumID);
		
		if (enumType == null) {
			result.use(Results.http()).setStatusCode(404);
			result.use(Results.http()).sendError(404);
			return;
		}

		classifiersList = classifierDAO.searchByType(enumType, year);
		
		if(classifiersList == null){
			result.include("errorMessage", ERROR_MESSAGE_OFFLINE);
			result.use(Results.http()).setStatusCode(500);
			result.use(Results.http()).sendError(500);
			return;
		}
		
		loaYears = new ArrayList<Integer>();
		
		for(int i=LOA_START; i<=LOA_END; i++)
			loaYears.add(new Integer(i));

		result.include("classifiersList", classifiersList);
		result.include("loaYears", loaYears);
		result.include("selectedEnum", enumType);
		result.include("selectedYear", year);
		result.include("enumList", Arrays.asList(ClassifierType.values()));
	}

}
