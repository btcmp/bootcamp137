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
import com.xsis.training146.dao.SeqDao;
import com.xsis.training146.model.Design;
import com.xsis.training146.model.DesignItem;
import com.xsis.training146.model.Event;
import com.xsis.training146.model.MyFiles;
import com.xsis.training146.model.Product;
import com.xsis.training146.model.Promotion;
import com.xsis.training146.model.PromotionItem;
import com.xsis.training146.model.PromotionItemFile;
import com.xsis.training146.service.DesignItemService;
import com.xsis.training146.service.DesignService;
import com.xsis.training146.service.EventService;
import com.xsis.training146.service.ProductService;
import com.xsis.training146.service.PromotionItemFileService;
import com.xsis.training146.service.PromotionItemService;
import com.xsis.training146.service.PromotionService;

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
	SeqDao seqDao;
	

	@RequestMapping
	public String index(Model model) {
		String hasil = seqDao.addSeq();
		String tanggal = seqDao.convDate();
		
		List<Event> listEvent = eventService.getAll();
		List<Design> listDesign = designService.getAll();
		
		List<Promotion> listPromotion = promotionService.getAllPromotion();
		List<Product> listProduct = productService.getAll();
		
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
	
	@RequestMapping (value="/test", method = RequestMethod.GET)
	@ResponseBody
	public String test() {
		String hasil = seqDao.addSeq();
		String tanggal = seqDao.convDate();
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
