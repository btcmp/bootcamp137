package com.newminiproject.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.newminiproject.dao.SeqDao;
import com.newminiproject.model.Company;
import com.newminiproject.model.Employee;
import com.newminiproject.service.CompanyService;




@Controller
@RequestMapping("/company")
public class CompanyController {
	@Autowired
	SeqDao seqDao;	
	
	@Autowired
	CompanyService m_companyService;
	
	@RequestMapping
	public String index(Model model) {
		List<Company> listCompany = m_companyService.getAll();
		String hasil = seqDao.addSeq();
		
		model.addAttribute("listCompany",listCompany);
		model.addAttribute("listCompanyFilter", listCompany);
		model.addAttribute("hasil", hasil);
		return "company";
	}
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void save(@RequestBody Company m_company) {
		m_companyService.save(m_company);
	}
	
	@RequestMapping(value="/getall", method=RequestMethod.GET )
	@ResponseBody
	public List<Company> getAll(){
		List<Company> m_company = m_companyService.getAll();
		//m_companyService.getNexVal();
		return m_company;
	}
	
	@ResponseBody
	@RequestMapping(value="/getcompany/{id}")
	public Company getCompanyById(@PathVariable int id){
		Company company = m_companyService.getCompanyById(id);
		return company;
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void update(@RequestBody Company company) throws Exception {
		m_companyService.update(company);
	}
	
	@RequestMapping(value="/delete/{id}", method=RequestMethod.GET)
	public String delete(@PathVariable int id) {
		Company cpy = new Company();
		cpy.setId(id);
		m_companyService.delete(cpy);
		return "redirect:/company";
	}
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String search(Model model, @RequestParam(value="codeCompany", defaultValue="")String codeCompany, @RequestParam(value="nameCompany", defaultValue="") String nameCompany, @RequestParam(value="createdByCompany", defaultValue="") String createdByCompany, @RequestParam(value="createDateCompany", defaultValue="") String createDateCompany) throws ParseException {
		
		Date createdDateDual = null;
		if(!createDateCompany.equals("")) {
			createdDateDual = new SimpleDateFormat("yyyy-MM-dd").parse(createDateCompany);
		}
		if(codeCompany.equals("")&&nameCompany.equals("")&&createdByCompany.equals("")&&createDateCompany.equals("")) {
			m_companyService.getAll();
		}
		Company cpy = new Company();
		cpy.setName(nameCompany);
		cpy.setCode(codeCompany);
		cpy.setCreateBy(createdByCompany);
		cpy.setcreateDate(createdDateDual);
		List<Company> listCompany = m_companyService.getAll();
		List<Company> listCompanyFilter = m_companyService.search(cpy);
		model.addAttribute("listCompany", listCompanyFilter); //isi dari table, milik method getall
		model.addAttribute("listCompanyFilter", listCompany); //data yang ingin dicari
		String result = seqDao.addSeq();
		//System.out.println(result);
		model.addAttribute("result",result);
		return "company";
	}
	
		
}
