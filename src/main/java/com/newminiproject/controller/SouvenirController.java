package com.newminiproject.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.newminiproject.model.Souvenir;
import com.newminiproject.model.TransactionSouvenir;
import com.newminiproject.model.Unit;
import com.newminiproject.service.SouvenirRequestService;
import com.newminiproject.service.SouvenirService;
import com.newminiproject.service.UnitService;
import com.newminiproject.codegenerator.CodeGenerator;

@Controller
@RequestMapping("/souvenir")
public class SouvenirController {

	@Autowired
	SouvenirService souvenirService;
	
	@Autowired
	UnitService unitService;
	
	@Autowired
	CodeGenerator codeGenerator;
	
	@RequestMapping
	//@ResponseBody
	public String index(Model model){
		List<Unit> listUnit= unitService.getAllUnit();
		List<Souvenir> listSouvenir = souvenirService.getAllSouvenir();
		String hasil = codeGenerator.sequence();
		model.addAttribute("hasil", hasil);
		System.out.println(hasil);
		model.addAttribute("listUnit", listUnit);
		model.addAttribute("listSouvenir", listSouvenir);
		
		
		return "list-souvenir";
	}
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.CREATED)
	public void save(@RequestBody Souvenir souvenir){ //valid, buat aktifik validator nya
		souvenirService.save(souvenir);
	}
	
	@ResponseBody
	@RequestMapping(value="/getsouvenir", method=RequestMethod.GET)
	public Souvenir getSouvenir(@RequestParam(value="id", required=false) int id){ //required=false -> gak harus
		Souvenir souvenir = souvenirService.getSouvenirById(id);
		return souvenir;
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.DELETE)
	@ResponseStatus(HttpStatus.OK)
	public void delete(@RequestParam(value="id", required=false) int id){
		souvenirService.delete(id);
	}
	
	@RequestMapping(value="/update", method=RequestMethod.PUT)
	@ResponseStatus(HttpStatus.OK)
	public void update(@RequestBody Souvenir souvenir){
		souvenirService.update(souvenir);
	}
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String search(Model model, @RequestParam(value="souvenircode", defaultValue="")String souvenirCode, @RequestParam(value="souvenirname", defaultValue="")String souvenirName, @RequestParam(value="createddate", defaultValue="")String createdDate) throws ParseException{
		
		Date createdDateDual = null;
		
		if (!createdDate.equals("")) {
			createdDateDual = new SimpleDateFormat("yyyy-MM-dd").parse(createdDate);
		}
		
		Souvenir souvenir = new Souvenir();
		souvenir.setCode(souvenirCode);
		//transactionSouvenir.setRequestBy(requestBy);
		souvenir.setName(souvenirName);
		souvenir.setCreatedDate(createdDateDual);
		//transactionSouvenir.setStatus(status);
		//transactionSouvenir.setCreatedBy(createdBy);
		
		List<Souvenir> listSouvenir = souvenirService.getAllSouvenir();
		List<Souvenir> listSouvenirFilter = souvenirService.search(souvenir);
	
		model.addAttribute("listSouvenir", listSouvenirFilter);
		model.addAttribute("listSouvenirFilter", listSouvenir);
		
		String result = codeGenerator.sequence();
		model.addAttribute("result", result);
		
		return "list-souvenir";
	}
	
}
