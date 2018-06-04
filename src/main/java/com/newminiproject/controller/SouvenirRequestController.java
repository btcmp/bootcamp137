package com.newminiproject.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

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

import com.newminiproject.codegenerator.CodeGenerator;
import com.newminiproject.model.Event;
import com.newminiproject.model.Souvenir;
import com.newminiproject.model.TransactionSouvenir;
import com.newminiproject.model.TransactionSouvenirItem;
import com.newminiproject.model.Unit;
import com.newminiproject.model.User;
import com.newminiproject.service.SouvenirRequestService;
import com.newminiproject.service.SouvenirService;
import com.newminiproject.service.TransactionSouvenirItemService;

@Controller
@RequestMapping("/souvenirrequest")
public class SouvenirRequestController {

	@Autowired
	SouvenirRequestService souvenirRequestService;
	
	@Autowired
	CodeGenerator codeGenerator;
	
	@Autowired
	SouvenirService souvenirService;
	
	@Autowired
	TransactionSouvenirItemService transactionSouvenirItemService;
	
	@Autowired
	HttpSession httpSession;
	
	@RequestMapping
	//@ResponseBody
	public String index(Model model){
		List<Event> listEvent = souvenirRequestService.getAllEvent();
		List<Souvenir> listSouvenirItem = souvenirService.getAllSouvenir();
		List<TransactionSouvenir> listTransactionSouvenir = souvenirRequestService.getAllTransaction();
		List<TransactionSouvenirItem> listTransactionSouvenirItem = souvenirRequestService.getAllItem();
		String hasil = codeGenerator.sequenceTransaction();
		User user = (User)httpSession.getAttribute("app-user");
		String requester = user.getmEmployeeId().getFirstName() + ' ' + user.getmEmployeeId().getLastName();
		model.addAttribute("requester", requester);
		model.addAttribute("user", user);
		model.addAttribute("hasil", hasil);
		model.addAttribute("listEvent", listEvent);
		model.addAttribute("listSouvenirItem", listSouvenirItem);
		model.addAttribute("listTransactionSouvenir", listTransactionSouvenir);
		model.addAttribute("listTransactionSouvenirItem", listTransactionSouvenirItem);

		return "list-request";
	}
	
	@RequestMapping(value="/admin")
	public String indexAdmin(Model model){
		List<Event> listEvent = souvenirRequestService.getAllEvent();
		List<Souvenir> listSouvenirItem = souvenirService.getAllSouvenir();
		List<TransactionSouvenir> listTransactionSouvenir = souvenirRequestService.getAllTransaction();
		model.addAttribute("listTransactionSouvenir", listTransactionSouvenir);
		model.addAttribute("listEvent", listEvent);
		model.addAttribute("listSouvenirItem", listSouvenirItem);
		return "list-request";
	}
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	//@ResponseStatus(HttpStatus.CREATED)
	@ResponseBody
	public TransactionSouvenir save(@RequestBody TransactionSouvenir transactionSouvenir){ //valid, buat aktifik validator nya
		User user = (User)httpSession.getAttribute("app-user");
		transactionSouvenir.setRequestBy(user.getmEmployeeId());
		souvenirRequestService.save(transactionSouvenir);
		return transactionSouvenir;
	}
	
	@RequestMapping(value="/update", method=RequestMethod.PUT)
	//@ResponseStatus(HttpStatus.OK)
	@ResponseBody
	public TransactionSouvenir update(@RequestBody TransactionSouvenir transactionSouvenir){
		User user = (User)httpSession.getAttribute("app-user");
		transactionSouvenir.setRequestBy(user.getmEmployeeId());
		souvenirRequestService.update(transactionSouvenir);
		return transactionSouvenir;
	}
	
	@ResponseBody
	@RequestMapping(value="/gettransactionsouvenir", method=RequestMethod.GET)
	public TransactionSouvenir getSouvenir(@RequestParam(value="id", required=false) int id, Model model){ //required=false -> gak harus
		TransactionSouvenir transactionSouvenir = souvenirRequestService.getTransactionSouvenirById(id);
		
		//model.addAttribute("lastTsi", lastTsi);
		//model.addAttribute("listTransactionSouvenirItem", listTransactionSouvenirItem);
		return transactionSouvenir;
	}
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String search(Model model, @RequestParam(value="transactioncode", defaultValue="")String transactionCode, @RequestParam(value="requestby", defaultValue="")String requestBy, @RequestParam(value="requestdate", defaultValue="")String requestDate, @RequestParam(value="duedate", defaultValue="")String dueDate, @RequestParam(value="status", defaultValue="")String status, @RequestParam(value="createddate", defaultValue="")String createdDate, @RequestParam(value="createby", defaultValue="")String createBy) throws ParseException{
		
		
		Date requestDateDual = null;
		Date dueDateDual = null;
		Date createdDateDual = null;
		int statusDual = 0;
		
		if (status.equals("Submitted")) {
			statusDual = 1;
		} else if (status.equals("In Progress")){
			statusDual = 2;
		} else if(status.equals("Received By Requester")){
			statusDual = 3;
		} else if (status.equals("Settlement")){
			statusDual = 4;
		} else if (status.equals("Approved Settlement")){
			statusDual = 5;
		} else if (status.equals("Close Request")){
			statusDual = 6;
		} else if (status.equals("Rejected")){
			statusDual = 0;
		}
		
		if (!requestDate.equals("")) {
			requestDateDual = new SimpleDateFormat("yyyy-MM-dd").parse(requestDate);
		}
		
		if (!dueDate.equals("")) {
			dueDateDual = new SimpleDateFormat("yyyy-MM-dd").parse(dueDate);
		}
		
		if (!createdDate.equals("")) {
			createdDateDual = new SimpleDateFormat("yyyy-MM-dd").parse(createdDate);
		}
		
		TransactionSouvenir transactionSouvenir = new TransactionSouvenir();
		transactionSouvenir.setCode(transactionCode);
		//transactionSouvenir.setRequestBy(requestBy);
		transactionSouvenir.setRequestDate(requestDateDual);
		transactionSouvenir.setRequestDueDate(dueDateDual);
		transactionSouvenir.setStatus(statusDual);
		transactionSouvenir.setCreatedDate(createdDateDual);
		//transactionSouvenir.setCreatedBy(createdBy);
		
		List<TransactionSouvenir> listTransactionSouvenir = souvenirRequestService.getAllTransaction();
		List<TransactionSouvenir> listTransactionSouvenirFilter = souvenirRequestService.search(transactionSouvenir);
	
		model.addAttribute("listTransactionSouvenir", listTransactionSouvenirFilter);
		model.addAttribute("listTransactionSouvenirFilter", listTransactionSouvenir);
		
		String result = codeGenerator.sequenceTransaction();
		model.addAttribute("result", result);
		
		return "list-request";
	}
	
	@ResponseBody
	@RequestMapping(value="/settlement", method = RequestMethod.PUT)
	public TransactionSouvenir savesettlement(@RequestBody TransactionSouvenir transactionSouvenir){
		User user = (User)httpSession.getAttribute("app-user");
		transactionSouvenir.setSettlementBy(user.getmEmployeeId());
		souvenirRequestService.savesettlement(transactionSouvenir);
		return transactionSouvenir;
	}
	
	@ResponseBody
	@RequestMapping(value="/approveset", method = RequestMethod.PUT)
	public TransactionSouvenir approvesettlement(@RequestBody TransactionSouvenir transactionSouvenir){
		User user = (User)httpSession.getAttribute("app-user");
		transactionSouvenir.setSettlementAprrovedBy(user.getmEmployeeId());
		souvenirRequestService.saveApproveSettlement(transactionSouvenir);
		return transactionSouvenir;
	}
	
	@ResponseBody
	@RequestMapping(value="/approved", method = RequestMethod.PUT)
	public TransactionSouvenir approved(@RequestBody TransactionSouvenir transactionSouvenir){
		User user = (User)httpSession.getAttribute("app-user");
		transactionSouvenir.setRequestBy(user.getmEmployeeId());
		souvenirRequestService.approved(transactionSouvenir);
		return transactionSouvenir;
	}
	
	@ResponseBody
	@RequestMapping(value="/rejected", method = RequestMethod.PUT)
	public TransactionSouvenir rejected(@RequestBody TransactionSouvenir transactionSouvenir){
		User user = (User)httpSession.getAttribute("app-user");
		transactionSouvenir.setRequestBy(user.getmEmployeeId());
		souvenirRequestService.rejected(transactionSouvenir);
		return transactionSouvenir;
	}
	
	@RequestMapping(value="/received", method=RequestMethod.PUT)
	@ResponseBody
	public TransactionSouvenir received(@RequestBody TransactionSouvenir transactionSouvenir){
		User user = (User)httpSession.getAttribute("app-user");
		transactionSouvenir.setRequestBy(user.getmEmployeeId());
		souvenirRequestService.received(transactionSouvenir);
		return transactionSouvenir;
	}
	
	@ResponseBody
	@RequestMapping(value="/closerequest", method = RequestMethod.PUT)
	public TransactionSouvenir close(@RequestBody TransactionSouvenir transactionSouvenir){
		souvenirRequestService.close(transactionSouvenir);
		return transactionSouvenir;
	}
	
	
	
}
