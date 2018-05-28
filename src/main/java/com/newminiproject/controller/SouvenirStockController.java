package com.newminiproject.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.miniproject.xsis.dao.SeqDaoTSouvenir;
import com.miniproject.xsis.model.Employee;
import com.miniproject.xsis.model.Souvenir;
import com.miniproject.xsis.model.TransactionSouvenir;
import com.miniproject.xsis.model.TransactionSouvenirItem;
import com.miniproject.xsis.service.EmployeeService;
import com.miniproject.xsis.service.SouvenirStockService;
import com.miniproject.xsis.service.TransactionSouvenirItemStockService;

@Controller
@RequestMapping("/souvenirstock")
public class SouvenirStockController {
	
	@Autowired
	EmployeeService employeeService;
	
	@Autowired
	SouvenirStockService souvenirService;
	
	@Autowired
	SeqDaoTSouvenir seqDaoTSouvenir;
	
	@Autowired
	TransactionSouvenirItemStockService transactionSouvenirItemService;
	
	@RequestMapping
	public String index(Model model) {
		List<Employee> listEmployee = employeeService.getAll();
		List<Souvenir> listSouvenir = souvenirService.getAllSouvenir();
		List<TransactionSouvenir> listTransactionSouvenir = souvenirService.getAllTransactionSouvenir();
		String hasilb = seqDaoTSouvenir.addSeq();
		model.addAttribute("hasil", hasilb);
		model.addAttribute("listTransactionSouvenir", listTransactionSouvenir);
		model.addAttribute("listSouvenir", listSouvenir);
		model.addAttribute("listEmployee", listEmployee);
		return "list-souvenir";
	}
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	@ResponseBody// respones status biasanya void
	public TransactionSouvenir save(@RequestBody TransactionSouvenir transactionSouvenir) {
		souvenirService.save(transactionSouvenir);
		return transactionSouvenir;
	}
	
	@ResponseBody
	@RequestMapping(value="/getTransactionSouvenir")
	public TransactionSouvenir getTransactionSouvenirById(@RequestParam(value="id", required=false) int id) { //reqparam dari url
		TransactionSouvenir transactionSouvenir = souvenirService.getTransactionSouvenirById(id);
		//
		return transactionSouvenir;
	}
	
	@RequestMapping(value="/delete/{id}", method=RequestMethod.GET)
	public String delete(@PathVariable int id) {
		System.out.println("id"+id);
		TransactionSouvenir transactionSouvenir = new TransactionSouvenir();
		transactionSouvenir.setId(id);
		souvenirService.delete(transactionSouvenir);
		return "redirect:/souvenirstock";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	@ResponseBody
	public TransactionSouvenir update(@RequestBody TransactionSouvenir transactionSouvenir) {
		souvenirService.update(transactionSouvenir);
		return transactionSouvenir;
	}
}
