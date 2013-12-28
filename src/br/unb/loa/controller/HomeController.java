package br.unb.loa.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Resource;
import br.com.caelum.vraptor.Result;
import br.com.caelum.vraptor.Validator;
import br.com.caelum.vraptor.validator.ValidationMessage;
import br.unb.loa.data.LoaDAO;
import br.unb.loa.data.SimpleDAO;
import br.unb.loa.model.Classifier;
import br.unb.loa.model.ClassifierType;

@Resource
public class HomeController {
	
	public final Result result;
	public final Validator validator;
	public final SimpleDAO<Classifier, ClassifierType> classifierDAO;
	
	private static final int LOA_START = 2000;
	private static final int LOA_END = 2013;
	
	private static final String ERROR_MESSAGE_OFFLINE = "Serviço indisponível, tente mais tarde";
	
	public HomeController(Result result, Validator validator){
		this.result = result;
		this.validator = validator;
		this.classifierDAO = new LoaDAO();
	}
	
	@Path("/")
	public void home(){
		List<ClassifierType> enumList;
		
		enumList = Arrays.asList(ClassifierType.values());
		result.include("enumList", enumList);
	}
	
	@Post
	@Path("/searchClassifier")
	public void searchClassifier(ClassifierType enumType, int year){
		
		List<Classifier> classifiersList;
		List<Integer> loaYears;
		
		loaYears = new ArrayList<Integer>();
		
		for(int i=LOA_START; i<=LOA_END; i++)
			loaYears.add(new Integer(i));

		classifiersList = classifierDAO.searchByType(enumType, year);
		
		result.include("classifiersList", classifiersList);
		result.include("loaYears", loaYears);
		result.include("selectedEnum", enumType);
		result.include("selectedYear", year);
		
		if(classifiersList == null){
			validator.add(new ValidationMessage(ERROR_MESSAGE_OFFLINE, "errorOffline"));
			validator.onErrorRedirectTo(HomeController.class).home();
		}
		
		result.redirectTo(HomeController.class).home();
	}

}
