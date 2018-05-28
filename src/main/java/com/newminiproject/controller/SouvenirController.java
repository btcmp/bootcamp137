package com.newminiproject.controller;

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

import com.miniproject.xsis.codegenerator.CodeGenerator;
import com.miniproject.xsis.model.Souvenir;
import com.miniproject.xsis.model.TransactionSouvenir;
import com.miniproject.xsis.model.Unit;
import com.miniproject.xsis.service.SouvenirRequestService;
import com.miniproject.xsis.service.SouvenirService;
import com.miniproject.xsis.service.UnitService;

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
	
}
