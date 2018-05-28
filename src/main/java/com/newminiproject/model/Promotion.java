
package com.newminiproject.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonFormat.Shape;

@Entity
@Table (name = "t_promotion")
public class Promotion {

	@Id
	@SequenceGenerator (name = "idp", sequenceName ="idp")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "idp")
	@Column (length = 11)
	private int id;
	
	@Column(name = "title_header")
	private String titleHeader;

	@Column (length=50)
	private String code;
	
	@Column (length = 5, name = "flag_design",  columnDefinition = "int default 0")
	private int flagDesign;
	
	@ManyToOne
	@JoinColumn (name = "t_event_id")
	private Event event;
	
	@ManyToOne
	@JoinColumn (name = "t_design_id")
	private Design design;
	
	@JoinColumn (name = "request_by")
	@ManyToOne
	private Employee requestBy;
	
	@Temporal (TemporalType.DATE)
	@Column (name= "request_date")
	private Date requestDate;
	
	@JoinColumn (name ="approved_by")
	@ManyToOne
	private Employee approvedBy;
	
	@Temporal(TemporalType.DATE)
	@Column (name = "approved_date")
	private Date approvedDate;
	
	@JoinColumn (name = "assign_to")
	@ManyToOne
	private Employee assignTo;
	
	@Temporal(TemporalType.DATE)
	@Column (name = "close_date")
	private Date closeDate;
	
	@Column (length = 255)
	private String note;
	
	@Column (length = 1)
	private int status;
	
	@Column (length = 255,name = "reject_reason")
	private String rejectReason;
	
	@Column (name = "is_delete", length = 5, columnDefinition = "int default 0")
	private int isDelete;
	
	@ManyToOne
	@JoinColumn (name = "created_by") //nullable
	private Employee createdBy;
	
	@Temporal(TemporalType.DATE)
	@Column (name ="created_date") //nullable
	private Date createdDate;
	
	@ManyToOne
	@JoinColumn (name = "updated_by")
	private Employee updatedBy;
	
	@Temporal(TemporalType.DATE)
	@Column (name = "updated_date")
	private Date updatedDate;
	
	@OneToMany (fetch=FetchType.LAZY, mappedBy = "promotion")
	private List<PromotionItem> listPromotionItem;
	
	@OneToMany (fetch=FetchType.LAZY, mappedBy = "promotion")
	private List<PromotionItemFile> listPromotionItemFile;
	/////////////////// setter & getter ///////////////////////

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitleHeader() {
		return titleHeader;
	}

	public void setTitleHeader(String titleHeader) {
		this.titleHeader = titleHeader;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public int getFlagDesign() {
		return flagDesign;
	}

	public void setFlagDesign(int flagDesign) {
		this.flagDesign = flagDesign;
	}

	public Event getEvent() {
		return event;
	}

	public void setEvent(Event event) {
		this.event = event;
	}

	public Design getDesign() {
		return design;
	}

	public void setDesign(Design design) {
		this.design = design;
	}

	public Employee getRequestBy() {
		return requestBy;
	}

	public void setRequestBy(Employee requestBy) {
		this.requestBy = requestBy;
	}

	public Date getRequestDate() {
		return requestDate;
	}

	public void setRequestDate(Date requestDate) {
		this.requestDate = requestDate;
	}

	public Employee getApprovedBy() {
		return approvedBy;
	}

	public void setApprovedBy(Employee approvedBy) {
		this.approvedBy = approvedBy;
	}

	public Date getApprovedDate() {
		return approvedDate;
	}

	public void setApprovedDate(Date approvedDate) {
		this.approvedDate = approvedDate;
	}

	public Employee getAssignTo() {
		return assignTo;
	}

	public void setAssignTo(Employee assignTo) {
		this.assignTo = assignTo;
	}

	public Date getCloseDate() {
		return closeDate;
	}

	public void setCloseDate(Date closeDate) {
		this.closeDate = closeDate;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getRejectReason() {
		return rejectReason;
	}

	public void setRejectReason(String rejectReason) {
		this.rejectReason = rejectReason;
	}

	public int getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}

	public Employee getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Employee createdBy) {
		this.createdBy = createdBy;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Employee getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(Employee updatedBy) {
		this.updatedBy = updatedBy;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public List<PromotionItem> getListPromotionItem() {
		return listPromotionItem;
	}

	public void setListPromotionItem(List<PromotionItem> listPromotionItem) {
		this.listPromotionItem = listPromotionItem;
	}

	public List<PromotionItemFile> getListPromotionItemFile() {
		return listPromotionItemFile;
	}

	public void setListPromotionItemFile(List<PromotionItemFile> listPromotionItemFile) {
		this.listPromotionItemFile = listPromotionItemFile;
	}
		
}
