package com.newminiproject.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


@Entity
@Table(name="M_PRODUCT")
public class Product {
	
	@Id
	//@SequenceGenerator
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	
	@Column(length=50)
	private String code;
	
	@Column(length=50)
	private String name;
	
	private String description;
	
	@Column(name="is_delete")
	private boolean isDelete;
	
	@Column(name="created_by")
	private String createdBy;
	
	@Column(name="created_date")
	@Temporal(TemporalType.DATE)
	private Date createdDate;
	
	@Column(name="updated_by")
	private String updatedBy;
	
	@Column(name="updated_date")
	private Date updatedDate;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="mProductId")
	private List<TransactionPromotionItem> listtransactionPromotionItem;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="mProductId")
	private List<TransactionPromotion> listtransactionPromotion;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="mProductId")
	private List<TransactionDesignItem> listtransactionDesignItem;

	////setter and getter ////
	
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
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

	public String getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public List<TransactionPromotionItem> getListtransactionPromotionItem() {
		return listtransactionPromotionItem;
	}

	public void setListtransactionPromotionItem(List<TransactionPromotionItem> listtransactionPromotionItem) {
		this.listtransactionPromotionItem = listtransactionPromotionItem;
	}

	public List<TransactionPromotion> getListtransactionPromotion() {
		return listtransactionPromotion;
	}

	public void setListtransactionPromotion(List<TransactionPromotion> listtransactionPromotion) {
		this.listtransactionPromotion = listtransactionPromotion;
	}

	public List<TransactionDesignItem> getListtransactionDesignItem() {
		return listtransactionDesignItem;
	}

	public void setListtransactionDesignItem(List<TransactionDesignItem> listtransactionDesignItem) {
		this.listtransactionDesignItem = listtransactionDesignItem;
	}
}
