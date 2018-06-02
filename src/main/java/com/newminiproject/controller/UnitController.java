package com.newminiproject.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.sound.midi.Sequence;

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

import com.newminiproject.dao.SequenceDaoUnit;
import com.newminiproject.model.Unit;
import com.newminiproject.service.UnitService;

@Controller
@RequestMapping("/unit")
public class UnitController {

	@Autowired
	UnitService unitService;
	
	@Autowired
	SequenceDaoUnit seqDao;
	
	@RequestMapping
	public String index(Model model) {
		List<Unit> listUnit = unitService.getAllUnit();
		model.addAttribute("listUnitComponent", listUnit);
		model.addAttribute("listUnit", listUnit);
		String result = seqDao.addSeq();
		model.addAttribute("result",result);
		//System.out.println(result);
		return "unit";
	}
	
	@RequestMapping(value="/search", method=RequestMethod.GET)
	public String search(Model model, @RequestParam(value="unitname", defaultValue="")String unitName, @RequestParam(value="unitcode", defaultValue="") String unitCode, @RequestParam(value="unitcreatedby", defaultValue="") String createdBy, @RequestParam(value="unitcreateddate", defaultValue="") String createdDate) throws ParseException {
		//SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); //untuk format tanggal
		Date createdDateDual = null;
		if(!createdDate.equals("")) {
			createdDateDual = new SimpleDateFormat("yy-MM-dddd").parse(createdDate);
		}
		Unit unit = new Unit();
		unit.setName(unitName);
		unit.setCode(unitCode);
		unit.setCreatedBy(createdBy);
		unit.setCreatedDate(createdDateDual);
		List<Unit> listUnit = unitService.getAllUnit();
		List<Unit> listUnitFilter = unitService.search(unit);
		model.addAttribute("listUnit", listUnitFilter);
		model.addAttribute("listUnitComponent", listUnit);
		String result = seqDao.addSeq();
		//System.out.println(result);
		model.addAttribute("result",result);
		return "unit";
	}
	
	@RequestMapping(value="/save", method=RequestMethod.POST)
	@ResponseBody
	public Unit save(@RequestBody Unit unit) {
		unitService.save(unit);
		return unit;
	}	
	
	@RequestMapping(value="/getall", method=RequestMethod.GET)
	@ResponseBody
	public List<Unit> getAllUnit() {
		List<Unit> unit = unitService.getAllUnit();
		return unit;
	}
	
	@RequestMapping(value="/delete/{id}", method=RequestMethod.GET)
	public String Delete(@PathVariable int id) {
		Unit unit = new Unit();
		unit.setId(id);
		unitService.delete(unit);
		return "redirect:/unit";
	}
	
	@ResponseBody
	@RequestMapping(value="/getunit/{id}", method=RequestMethod.GET)
	public Unit getUnitById(@PathVariable int id) {
		return unitService.getUnitById(id);
	}
	
	@RequestMapping(value="/update", method=RequestMethod.POST)
	@ResponseStatus(HttpStatus.OK)
	public void update(@RequestBody Unit unit){
		unitService.update(unit);
	}
}
