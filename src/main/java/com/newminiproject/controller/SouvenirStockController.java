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

import com.newminiproject.dao.SeqDaoTSouvenir;
import com.newminiproject.model.Employee;
import com.newminiproject.model.Souvenir;
import com.newminiproject.model.TransactionSouvenir;
import com.newminiproject.service.EmployeeService;
import com.newminiproject.service.SouvenirStockService;
import com.newminiproject.service.TransactionSouvenirItemStockService;

@Controller
@RequestMapping("/souvenirstock")
public class SouvenirStockController {
	
	@Autowired
	EmployeeService employeeService;
	
	@Autowired
	SouvenirStockService souvenirStockService;
	
	@Autowired
	SeqDaoTSouvenir seqDaoTSouvenir;
	
	@Autowired
	TransactionSouvenirItemStockService transactionSouvenirItemService;
	
	@RequestMapping
	public String index(Model model) {
		List<Employee> listEmployee = employeeService.getAll();
		List<Souvenir> listSouvenir = souvenirStockService.getAllSouvenir();
		List<TransactionSouvenir> listTransactionSouvenir = souvenirStockService.getAllTransactionSouvenir();
		String hasilb = seqDaoTSouvenir.addSeq();
		model.addAttribute("hasil", hasilb);
		model.addAttribute("listTransactionSouvenir", listTransactionSouvenir);
		model.addAttribute("listSouvenir", listSouvenir);
		model.addAttribute("listEmployee", listEmployee);
		return "list-souvenir-stock";
	}
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	@ResponseBody// respones status biasanya void
	public TransactionSouvenir save(@RequestBody TransactionSouvenir transactionSouvenir) {
		souvenirStockService.save(transactionSouvenir);
		return transactionSouvenir;
	}
	
	@ResponseBody
	@RequestMapping(value="/getTransactionSouvenir")
	public TransactionSouvenir getTransactionSouvenirById(@RequestParam(value="id", required=false) int id) { //reqparam dari url
		TransactionSouvenir transactionSouvenir = souvenirStockService.getTransactionSouvenirById(id);
		//
		return transactionSouvenir;
	}
	
	@RequestMapping(value="/delete/{id}", method=RequestMethod.GET)
	public String delete(@PathVariable int id) {
		System.out.println("id"+id);
		TransactionSouvenir transactionSouvenir = new TransactionSouvenir();
		transactionSouvenir.setId(id);
		souvenirStockService.delete(transactionSouvenir);
		return "redirect:/souvenirstock";
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	@ResponseBody
	public TransactionSouvenir update(@RequestBody TransactionSouvenir transactionSouvenir) {
		souvenirStockService.update(transactionSouvenir);
		return transactionSouvenir;
	}
}
