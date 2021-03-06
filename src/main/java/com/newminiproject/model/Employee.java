package com.newminiproject.model;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.validator.constraints.Email;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="M_EMPLOYEE")
public class Employee {
	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	private int id;
	
	@Column(name="employee_number", length=50, unique=true)
	private String code;
	
	@Column(name="first_name", length=50)
	private String firstName;
	
	@Column(name="last_name", length=50)
	private String lastName;
	
	@ManyToOne
	@JoinColumn(name="m_company_id")
	private Company mCompanyId;
	
	@Column(length=150)
	@Email
	private String email;
	
	@Column(name="is_delete", length=50)
	private boolean isDelete;
	
	@Column(name="created_by", length=50)
	private String createdBy;
	
	@CreationTimestamp
	@Temporal(TemporalType.DATE)
	@Column(name="created_date")
	private Date createdDate;
	
	@Column(name="updated_by", length=50)
	private String updated_by;
	
	@CreationTimestamp
	@Temporal(TemporalType.DATE)
	@Column(name="updated_date")
	private Date updatedDate;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="employee")
	@JsonIgnore
	private List<Event> event;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="requestBy")
	@JsonIgnore
	private List<Design> listDesignRequest;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="approvedBy")
	@JsonIgnore
	private List<Design> listDesignApproved;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="assignTo")
	@JsonIgnore
	private List<Design> listDesignAssign;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="createdBy")
	@JsonIgnore
	private List<Design> listDesignCreated;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="updatedBy")
	@JsonIgnore
	private List<Design> listDesignUpdated;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="requestPic")
	@JsonIgnore
	private List<DesignItem> listDesignItemRequest;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="createdBy")
	@JsonIgnore
	private List<DesignItem> listDesignItemCreated;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="updatedBy")
	@JsonIgnore
	private List<DesignItem> listDesignItemUpdated;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="requestBy")
	@JsonIgnore
	private List<TransactionSouvenir> listRequestBy;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="approvedBy")
	@JsonIgnore
	private List<TransactionSouvenir> listApprovedBy;

	@OneToMany(fetch=FetchType.LAZY, mappedBy="receivedBy")
	@JsonIgnore
	private List<TransactionSouvenir> listReceivedBy;
	
	public List<TransactionSouvenir> getListReceivedBy() {
		return listReceivedBy;
	}

	public void setListReceivedBy(List<TransactionSouvenir> listReceivedBy) {
		this.listReceivedBy = listReceivedBy;
	}

	@OneToMany(fetch=FetchType.LAZY, mappedBy="settlementBy")
	@JsonIgnore
	private List<TransactionSouvenir> listSettlementBy;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="settlementAprrovedBy")
	@JsonIgnore
	private List<TransactionSouvenir> listSettlementApprovedBy;
	
	@OneToMany (fetch = FetchType.LAZY, mappedBy = "requestBy")
	@JsonIgnore
	private List<Promotion> listPromotionRequestBy;

	@OneToMany (fetch = FetchType.LAZY, mappedBy = "approvedBy")
	@JsonIgnore
	private List<Promotion> listPromotionApprovedBy;
	
	@OneToMany (fetch = FetchType.LAZY, mappedBy = "assignTo")
	@JsonIgnore
	private List<Promotion> listPromotionAssignTo;
	
	@OneToMany (fetch = FetchType.LAZY, mappedBy = "requestPic")
	@JsonIgnore
	private List<PromotionItem> listPromotionItemRequestPic;
	
	@OneToMany (fetch = FetchType.LAZY, mappedBy = "requestBy")
	@JsonIgnore
	private List<Event> listEventRequestBy;
	
	public List<Event> getListEventRequestBy() {
		return listEventRequestBy;
	}

	public void setListEventRequestBy(List<Event> listEventRequestBy) {
		this.listEventRequestBy = listEventRequestBy;
	}

	@OneToOne(mappedBy="mEmployeeId")
	@JsonIgnore
	private User user;
	
	
	
	public List<Event> getEvent() {
		return event;
	}

	public void setEvent(List<Event> event) {
		this.event = event;
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

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Company getmCompanyId() {
		return mCompanyId;
	}

	public void setmCompanyId(Company mCompanyId) {
		this.mCompanyId = mCompanyId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public boolean isDelete() {
		return isDelete;
	}

	public void setDelete(boolean isDelete) {
		this.isDelete = isDelete;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getUpdated_by() {
		return updated_by;
	}

	public void setUpdated_by(String updated_by) {
		this.updated_by = updated_by;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public List<Design> getListDesignRequest() {
		return listDesignRequest;
	}

	public void setListDesignRequest(List<Design> listDesignRequest) {
		this.listDesignRequest = listDesignRequest;
	}

	public List<Design> getListDesignApproved() {
		return listDesignApproved;
	}

	public void setListDesignApproved(List<Design> listDesignApproved) {
		this.listDesignApproved = listDesignApproved;
	}

	public List<Design> getListDesignAssign() {
		return listDesignAssign;
	}

	public void setListDesignAssign(List<Design> listDesignAssign) {
		this.listDesignAssign = listDesignAssign;
	}

	public List<Design> getListDesignCreated() {
		return listDesignCreated;
	}

	public void setListDesignCreated(List<Design> listDesignCreated) {
		this.listDesignCreated = listDesignCreated;
	}

	public List<Design> getListDesignUpdated() {
		return listDesignUpdated;
	}

	public void setListDesignUpdated(List<Design> listDesignUpdated) {
		this.listDesignUpdated = listDesignUpdated;
	}

	public List<DesignItem> getListDesignItemRequest() {
		return listDesignItemRequest;
	}

	public void setListDesignItemRequest(List<DesignItem> listDesignItemRequest) {
		this.listDesignItemRequest = listDesignItemRequest;
	}

	public List<DesignItem> getListDesignItemCreated() {
		return listDesignItemCreated;
	}

	public void setListDesignItemCreated(List<DesignItem> listDesignItemCreated) {
		this.listDesignItemCreated = listDesignItemCreated;
	}

	public List<DesignItem> getListDesignItemUpdated() {
		return listDesignItemUpdated;
	}

	public void setListDesignItemUpdated(List<DesignItem> listDesignItemUpdated) {
		this.listDesignItemUpdated = listDesignItemUpdated;
	}

	public List<TransactionSouvenir> getListRequestBy() {
		return listRequestBy;
	}

	public void setListRequestBy(List<TransactionSouvenir> listRequestBy) {
		this.listRequestBy = listRequestBy;
	}

	public List<TransactionSouvenir> getListApprovedBy() {
		return listApprovedBy;
	}

	public void setListApprovedBy(List<TransactionSouvenir> listApprovedBy) {
		this.listApprovedBy = listApprovedBy;
	}

	public List<TransactionSouvenir> getListSettlementBy() {
		return listSettlementBy;
	}

	public void setListSettlementBy(List<TransactionSouvenir> listSettlementBy) {
		this.listSettlementBy = listSettlementBy;
	}

	public List<TransactionSouvenir> getListSettlementApprovedBy() {
		return listSettlementApprovedBy;
	}

	public void setListSettlementApprovedBy(List<TransactionSouvenir> listSettlementApprovedBy) {
		this.listSettlementApprovedBy = listSettlementApprovedBy;
	}

	public List<Promotion> getListPromotionRequestBy() {
		return listPromotionRequestBy;
	}

	public void setListPromotionRequestBy(List<Promotion> listPromotionRequestBy) {
		this.listPromotionRequestBy = listPromotionRequestBy;
	}

	public List<Promotion> getListPromotionApprovedBy() {
		return listPromotionApprovedBy;
	}

	public void setListPromotionApprovedBy(List<Promotion> listPromotionApprovedBy) {
		this.listPromotionApprovedBy = listPromotionApprovedBy;
	}

	public List<Promotion> getListPromotionAssignTo() {
		return listPromotionAssignTo;
	}

	public void setListPromotionAssignTo(List<Promotion> listPromotionAssignTo) {
		this.listPromotionAssignTo = listPromotionAssignTo;
	}

		public List<PromotionItem> getListPromotionItemRequestPic() {
		return listPromotionItemRequestPic;
	}

	public void setListPromotionItemRequestPic(List<PromotionItem> listPromotionItemRequestPic) {
		this.listPromotionItemRequestPic = listPromotionItemRequestPic;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	
	
}
