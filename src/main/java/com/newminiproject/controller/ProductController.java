package com.newminiproject.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.miniproject.xsis.dao.SeqDao;
import com.miniproject.xsis.model.Souvenir;
import com.miniproject.xsis.model2.Product;
import com.miniproject.xsis.service.ProductService;

@Controller
@RequestMapping("/product")
public class ProductController {
	
	@Autowired
	ProductService prodSer;
	
	@Autowired
	SeqDao seqDao;
	
	@RequestMapping
	public String index(Model model){
		List<Product> listProduct = prodSer.getAllProduct();
		model.addAttribute("listDll", listProduct);
		model.addAttribute("listProduct", listProduct);
		String hasila = seqDao.addSeq();
		model.addAttribute("hasil", hasila);
		
		model.addAttribute("lala", listProduct);
		return "list-product";
	}
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.CREATED)
	public void save(@RequestBody Product product) {
		prodSer.save(product);
	}
	
	@ResponseBody
	@RequestMapping(value="/getproduct")
	public Product getproduct(@RequestParam(value="id", required=false) int id) {
		Product prod = prodSer.getproduct(id);
		return prod;
	}
	
	
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void edit(@RequestBody Product product){
		prodSer.edit(product);
	}
	
	@RequestMapping(value="/test", method=RequestMethod.GET)
	@ResponseBody
	public String coba() {
		String hasil = seqDao.addSeq();
		System.out.println(hasil);
		return "";// kenapa return nya menjadi seperti ini???
	}
	
	@RequestMapping(value="/delete/{id}", method=RequestMethod.GET)
	public String delete(@PathVariable int id) {
		Product product = new Product();
		product.setId(id);
		prodSer.delete(product);
		return "redirect:/product";
	}
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String search(Model model, @RequestParam(value="code", defaultValue="")String code, @RequestParam(value="name", defaultValue="")String name, @RequestParam(value="description", defaultValue="")String description, @RequestParam(value="createdDate", defaultValue="")String createdDate, @RequestParam(value="createdBy", defaultValue="")String createdBy) throws ParseException {
		/*System.out.println("code : "+code);
		System.out.println("name : "+name);
		System.out.println("description : "+description);
		System.out.println("createdDate : "+createdDate);
		System.out.println("createdBy : "+createdBy);
		*/
		Date createdDateDual = null;
		if(!createdDate.equals("")) {
			createdDateDual = new SimpleDateFormat("yyyy-mm-dd").parse(createdDate);
		}
		if(code.equals("")&&name.equals("")&&description.equals("")&&createdDate.equals("")&&createdBy.equals("")) {
			prodSer.getAllProduct();
		}
		Product product = new Product();
		product.setName(name);
		product.setCode(code);
		product.setDescription(description);
		product.setCreatedDate(createdDateDual);
		product.setCreatedBy(createdBy);
		List<Product> listProduct = prodSer.getAllProduct();
		List<Product> listProductFilter = prodSer.search(product);
		model.addAttribute("listProduct", listProduct);
		model.addAttribute("listDll", listProductFilter);
		String hasil = seqDao.addSeq();
		model.addAttribute("hasil", hasil);
		return "list-product";
	}
}
