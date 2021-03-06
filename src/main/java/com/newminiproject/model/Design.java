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

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="t_design")
public class Design {

	@Id
	@SequenceGenerator(name="idd", sequenceName="idd")
	@GeneratedValue(strategy= GenerationType.SEQUENCE, generator="idd")
	@Column(length=11)
	private int id;
	
	@Column(name="code", length=50, nullable=false)
	private String code;
	
	@JoinColumn(name="t_event_id",  nullable=false)
	@ManyToOne
	private Event tEventId;
	
	@Column(name="title_header", length=255, nullable=false)
	private String titleHeader;
	
	@JoinColumn(name="request_by")
	@ManyToOne
	private Employee requestBy;
	
	@Temporal(TemporalType.DATE)
	@Column(name="request_date", nullable=false)
	private Date requestDate;
	
	@JoinColumn(name="approved_by")
	@ManyToOne
	private Employee approvedBy;
	
	@Temporal(TemporalType.DATE)
	@Column(name="approved_date")
	private Date approvedDate;
	
	@JoinColumn(name="assign_to")
	@ManyToOne
	private Employee assignTo;
	
	@Temporal(TemporalType.DATE)
	@Column(name="closed_date")
	private Date closeDate;
	
	@Column(name="note", length=255)
	private String note;
	
	@Column(name="status", length=1)
	private int status;
	
	@Column(name="reject_reason", length=255)
	private String rejectReason;
	
	@Column(name="is_delete", length=1, columnDefinition="int default 0")
	private int isDelete;
	
	@JoinColumn(name="created_by")
	@ManyToOne
	private Employee createdBy;
	
	@Temporal(TemporalType.DATE)
	@Column(name="created_date")
	private Date createdDate;
	
	@JoinColumn(name="updated_by")
	@ManyToOne
	private Employee updatedBy;
	
	@Temporal(TemporalType.DATE)
	@Column(name="updated_date")
	private Date updatedDate;

	@OneToMany(fetch=FetchType.LAZY, mappedBy="tDesignId")
	private List<DesignItem> listDesignItem;
	
	//@JsonIgnore
	@OneToMany(fetch=FetchType.LAZY, mappedBy="design")
	private List<Promotion> listPromotion;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
		
	public Event gettEventId() {
		return tEventId;
	}

	public void settEventId(Event tEventId) {
		this.tEventId = tEventId;
	}

	public String getTitleHeader() {
		return titleHeader;
	}

	public void setTitleHeader(String titleHeader) {
		this.titleHeader = titleHeader;
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
	
	public List<DesignItem> getListDesignItem() {
		return listDesignItem;
	}

	public void setListDesignItem(List<DesignItem> listDesignItem) {
		this.listDesignItem = listDesignItem;
	}

	public List<Promotion> getListPromotion() {
		return listPromotion;
	}

	public void setListPromotion(List<Promotion> listPromotion) {
		this.listPromotion = listPromotion;
	}

}
