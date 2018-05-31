package com.newminiproject.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mysql.jdbc.Blob;
import com.newminiproject.dao.SeqDaoPromotion;
import com.newminiproject.model.Design;
import com.newminiproject.model.Event;
import com.newminiproject.model.Product;
import com.newminiproject.model.Promotion;
import com.newminiproject.service.DesignItemService;
import com.newminiproject.service.DesignService;
import com.newminiproject.service.EventService;
import com.newminiproject.service.ProductService;
import com.newminiproject.service.PromotionItemFileService;
import com.newminiproject.service.PromotionItemService;
import com.newminiproject.service.PromotionService;

@Controller
@RequestMapping("/promotion")
public class PromotionController {
	
	@Autowired
	PromotionService promotionService;
	
	@Autowired
	PromotionItemService promotionItemService;
	
	@Autowired
	PromotionItemFileService promotionItemFileService;
	
	@Autowired
	EventService eventService;
	
	@Autowired
	DesignService designService;
	
	@Autowired
	DesignItemService designItemService;
	
	@Autowired
	ProductService productService;
	
	@Autowired
	SeqDaoPromotion seqDaoPromotion;
	

	@RequestMapping
	public String index(Model model) {
		String hasil = seqDaoPromotion.addSeq();
		String tanggal = seqDaoPromotion.convDate();
		
		List<Event> listEvent = eventService.getAll();
		List<Design> listDesign = designService.getListDesign();
		
		List<Promotion> listPromotion = promotionService.getAllPromotion();
		List<Product> listProduct = productService.getAllProduct();
		
		model.addAttribute("listProduct", listProduct);
		
		model.addAttribute("listEvent", listEvent);
		model.addAttribute("listPromotion", listPromotion);
		model.addAttribute("listDesign", listDesign);
		model.addAttribute("hasil", hasil);
		model.addAttribute("tanggal", tanggal);
		
		return "promotion";
	}
	
	@ResponseBody
	@RequestMapping (value = "/getall", method = RequestMethod.GET) // untuk menampilkan data design dan designitem dalam modal promotion
	public Design getDesign (@RequestParam(value="id", required = false) int id) {
		Design design = designService.getDesignById(id);
		return design;
	}
	
	@ResponseBody
	@RequestMapping (value = "/getdesign", method = RequestMethod.GET)
	public Event getEvent (@RequestParam(value="id", required = false) int id) {
		Event event = eventService.getEventByIdDesign(id);
		return event;
	}
	
	@ResponseBody
	@RequestMapping(value = "/save", method = RequestMethod.POST)
	public Promotion save (@RequestBody Promotion promotion) {
		promotionService.save(promotion);
		return promotion;
	}
	
	@ResponseBody
	@RequestMapping(value = "/getdetail", method = RequestMethod.GET)
	public Promotion getPromotion (@RequestParam(value="id", required = false) int id) {
		Promotion promotion = promotionService.getPromotionById(id);
		return promotion;
	}
	
	@ResponseBody
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public Promotion update(@RequestBody Promotion promotion) {
		promotionService.update(promotion);
		return promotion;
	}
	
	@ResponseBody
	@RequestMapping (value = "/approved", method = RequestMethod.POST)
	public Promotion approved (@RequestBody Promotion promotion) {
		promotionService.approved(promotion);
		return promotion;
	}
	
	
	@ResponseBody
	@RequestMapping (value = "/rejected", method = RequestMethod.POST)
	public Promotion rejected (@RequestBody Promotion promotion) {
		promotionService.rejected (promotion);
		return promotion;
	}
	
	@ResponseBody
	@RequestMapping(value = "/closerequest", method = RequestMethod.POST)
	public Promotion closeRequest (@RequestBody Promotion promotion) {
		promotionService.closeRequest (promotion);
		return promotion;
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(Model model, @RequestParam(value = "code", defaultValue="")String code) {
		System.out.println(code);
		
		Promotion searching = new Promotion();
		searching.setCode(code);
		
		List<Promotion> listPromotion = promotionService.search(searching);
		model.addAttribute("listPromotion", listPromotion);
		return "promotion";
	}
	
	@RequestMapping (value="/test", method = RequestMethod.GET)
	@ResponseBody
	public String test() {
		String hasil = seqDaoPromotion.addSeq();
		String tanggal = seqDaoPromotion.convDate();
		//System.out.println(tanggal);
		return "";
	}
	
	/*@ResponseBody
	@RequestMapping(value="/doupload", method=RequestMethod.POST)
	public void doUpload(@RequestParam("theFile") MultipartFile theFile){
		MyFiles myFiles = null;
		if(!theFile.isEmpty()){
			try {
				byte[] bFile = theFile.getBytes();
				myFiles = new MyFiles();
				Blob blob = new SerialBlob(bFile);
				myFiles.setFile(blob);
				myFiles.setName(theFile.getName());
				myFileDao.save(myFiles);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	}*/
	
}
