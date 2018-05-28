package com.newminiproject.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name="t_souvenir_item")
public class TransactionSouvenirItem {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	@Column(length=11)
	private int id;
	
	
	@ManyToOne
	@JoinColumn(name="t_souvenir_id")
	private TransactionSouvenir tSouvenirId;
	
	@ManyToOne
	@JoinColumn(name="m_sovenir_id")
	private Souvenir mSouvenirId;
	
	@Column(length=50)
	private long qty;
	
	@Column(name="qty_settlement", length=50)
	private long qtySettlement;
	
	@Column(nullable=false)
	private String note;
	
	@Column(name="is_delete", nullable=false)
	private boolean isDelete;
	
	@Column(name="created_by")
	private long createdBy;
	
	@Column(name="created_date")
	private Date createdDate;
	
	@Column(name="updated_by")
	private long updatedBy;
	
	@Column(name="updated_date")
	private Date updatedDate;

	
	//Setter & Getter
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public TransactionSouvenir gettSouvenirId() {
		return tSouvenirId;
	}

	public void settSouvenirId(TransactionSouvenir tSouvenirId) {
		this.tSouvenirId = tSouvenirId;
	}

	public Souvenir getmSouvenirId() {
		return mSouvenirId;
	}

	public void setmSouvenirId(Souvenir mSouvenirId) {
		this.mSouvenirId = mSouvenirId;
	}

	public long getQty() {
		return qty;
	}

	public void setQty(long qty) {
		this.qty = qty;
	}

	public long getQtySettlement() {
		return qtySettlement;
	}

	public void setQtySettlement(long qtySettlement) {
		this.qtySettlement = qtySettlement;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
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
