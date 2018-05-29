package com.newminiproject.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="T_EVENT")
public class Event {
	
	@Id
	@SequenceGenerator(name="seqEvent",sequenceName="seqEvent")        
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="seqEvent")
	private int id;
	@Column
	private String code;
	@Temporal(TemporalType.DATE)
	private Date requestDate;
	@Temporal(TemporalType.DATE)
	private Date endDate;
	private String rejectReason;
	private int status;
	@CreationTimestamp
	@Temporal(TemporalType.DATE)
	private Date createDate;
	private String createBy;
	private String eventName;
	private String eventPlace;
	@Temporal(TemporalType.DATE)
	private Date startDate;
	@Temporal(TemporalType.DATE)
	private Date closeDate;
	private String requestBy;
	private String note;
	private long budget;
	private int isDelete;
	@Temporal(TemporalType.DATE)
	private Date update_date;
	private String updateBy;
	
	@JsonIgnore
	@OneToMany(fetch=FetchType.LAZY, mappedBy="tEventId")
	private List<Design> listDesign;
	
	@JsonIgnore
	@OneToMany(fetch=FetchType.LAZY, mappedBy="event")
	private List<Promotion> listPromotion;
	
	@ManyToOne
	private Employee employee;
	
	
	
	public List<Design> getListDesign() {
		return listDesign;
	}
	public void setListDesign(List<Design> listDesign) {
		this.listDesign = listDesign;
	}
	public List<Promotion> getListPromotion() {
		return listPromotion;
	}
	public void setListPromotion(List<Promotion> listPromotion) {
		this.listPromotion = listPromotion;
	}
	public Employee getEmployee() {
		return employee;
	}
	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
	public String getRejectReason() {
		return rejectReason;
	}
	public void setRejectReason(String rejectReason) {
		this.rejectReason = rejectReason;
	}
	
	public String getUpdateBy() {
		return updateBy;
	}
	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}
	public Date getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getCloseDate() {
		return closeDate;
	}
	public void setCloseDate(Date closeDate) {
		this.closeDate = closeDate;
	}
	public int getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}
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
	public Date getRequestDate() {
		return requestDate;
	}
	public void setRequestDate(Date requestDate) {
		this.requestDate = requestDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getCreateBy() {
		return createBy;
	}
	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}
	public String getEventName() {
		return eventName;
	}
	public void setEventName(String eventName) {
		this.eventName = eventName;
	}
	public String getEventPlace() {
		return eventPlace;
	}
	public void setEventPlace(String eventPlace) {
		this.eventPlace = eventPlace;
	}
	public String getRequestBy() {
		return requestBy;
	}
	public void setRequestBy(String requestBy) {
		this.requestBy = requestBy;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public long getBudget() {
		return budget;
	}
	public void setBudget(long budget) {
		this.budget = budget;
	}
	
	
	
	
	

}