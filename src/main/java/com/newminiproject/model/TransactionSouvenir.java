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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name="t_souvenir")
public class TransactionSouvenir {

	@Id
	@GeneratedValue(strategy=GenerationType.SEQUENCE)
	@Column(length=11)
	private int id;
	
	
	@Column(length=50, nullable=false)
	private String code;
	
	@Column(length=11)
	private String type;
	
	@ManyToOne
	@JoinColumn(name="t_event_id")
	private Event tEventId;
	
	@ManyToOne
	@JoinColumn(name="request_by")
	private Employee requestBy;
	
	@Column(name="request_date")
	@Temporal(TemporalType.DATE)
	private Date requestDate;
	
	@Column(name="request_due_date")
	@Temporal(TemporalType.DATE)
	private Date requestDueDate;
	
	@ManyToOne
	@JoinColumn(name="approved_by")
	private Employee approvedBy;
	
	@Column(name="approved_date")
	@Temporal(TemporalType.DATE)
	private Date approvedDate;
	
	@ManyToOne
	@JoinColumn(name="received_by")
	private Employee receivedBy;
	
	@Column(name="received_date")
	@Temporal(TemporalType.DATE)
	private Date receivedDate;
	
	@ManyToOne
	@JoinColumn(name="settlement_by")
	private Employee settlementBy;
	
	@Column(name="settlement_date")
	@Temporal(TemporalType.DATE)
	private Date settlementDate;
	
	@ManyToOne
	@JoinColumn(name="settlement_approved_by")
	private Employee settlementAprrovedBy;
	
	@Column(name="settlement_approved_date")
	@Temporal(TemporalType.DATE)
	private Date settlementApprovedDate;
	
	private int status;
	
	private String note;
	
	@Column(name="reject_reason")
	private String rejectReason;
	
	@Column(name="is_delete")
	private boolean isDelete;
	
	@Column(name="created_by")
	private long createdBy;
	
	@Column(name="created_date")
	@Temporal(TemporalType.DATE)
	private Date createdDate;
	
	@Column(name="updated_by")
	private long updatedBy;
	
	@Column(name="updated_date")
	@Temporal(TemporalType.DATE)
	private Date updatedDate;
	
	
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="tSouvenirId")
	private List<TransactionSouvenirItem> transactionSouvenirItem;
	
	
	//Setter & Getter
	
	public int getId() {
		return id;
	}

	public Event gettEventId() {
		return tEventId;
	}

	public void settEventId(Event tEventId) {
		this.tEventId = tEventId;
	}

	

	public List<TransactionSouvenirItem> getTransactionSouvenirItem() {
		return transactionSouvenirItem;
	}

	public void setTransactionSouvenirItem(List<TransactionSouvenirItem> transactionSouvenirItem) {
		this.transactionSouvenirItem = transactionSouvenirItem;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	public Date getRequestDueDate() {
		return requestDueDate;
	}

	public void setRequestDueDate(Date requestDueDate) {
		this.requestDueDate = requestDueDate;
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

	public Employee getReceivedBy() {
		return receivedBy;
	}

	public void setReceivedBy(Employee receivedBy) {
		this.receivedBy = receivedBy;
	}

	public Date getReceivedDate() {
		return receivedDate;
	}

	public void setReceivedDate(Date receivedDate) {
		this.receivedDate = receivedDate;
	}

	public Employee getSettlementBy() {
		return settlementBy;
	}

	public void setSettlementBy(Employee settlementBy) {
		this.settlementBy = settlementBy;
	}

	public Date getSettlementDate() {
		return settlementDate;
	}

	public void setSettlementDate(Date settlementDate) {
		this.settlementDate = settlementDate;
	}

	public Employee getSettlementAprrovedBy() {
		return settlementAprrovedBy;
	}

	public void setSettlementAprrovedBy(Employee settlementAprrovedBy) {
		this.settlementAprrovedBy = settlementAprrovedBy;
	}

	public Date getSettlementApprovedDate() {
		return settlementApprovedDate;
	}

	public void setSettlementApprovedDate(Date settlementApprovedDate) {
		this.settlementApprovedDate = settlementApprovedDate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public String getRejectReason() {
		return rejectReason;
	}

	public void setRejectReason(String rejectReason) {
		this.rejectReason = rejectReason;
	}

	public boolean isDelete() {
		return isDelete;
	}

	public void setDelete(boolean isDelete) {
		this.isDelete = isDelete;
	}

	public long getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(long createdBy) {
		this.createdBy = createdBy;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public long getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(long updatedBy) {
		this.updatedBy = updatedBy;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}
	
	
}
