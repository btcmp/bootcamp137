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
@Table(name="t_design_item")
public class DesignItem {

	@Id
	@SequenceGenerator(name="iddi", sequenceName="iddi")
	@GeneratedValue(strategy= GenerationType.SEQUENCE, generator="iddi")
	@Column(length=11)
	private int id;
	
	@JoinColumn(name="t_design_id", nullable=false)
	@ManyToOne
	private Design tDesignId;

	@JoinColumn(name="m_product_id", nullable=false)
	@ManyToOne
	private Product mProductId;
	
	@Column(name="title_item", length=255, nullable=false)
	private String titleItem;
	
	@JoinColumn(name="request_pic")
	@ManyToOne
	private Employee requestPic;
	
	@Temporal(TemporalType.DATE)
	@Column(name="start_date")
	private Date startDate;
	
	@Temporal(TemporalType.DATE)
	@Column(name="end_date")
	private Date endDate;
	
	@Temporal(TemporalType.DATE)
	@Column(name="request_due_date")
	private Date requestDueDate;
	
	@Column(name="note", length=255)
	private String note;
	
	@Column(name="is_delete")
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
	
	@JsonIgnore
	@OneToMany(fetch=FetchType.LAZY, mappedBy="designItem")
	private List<PromotionItem> listPromotionItem;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitleItem() {
		return titleItem;
	}

	public void setTitleItem(String titleItem) {
		this.titleItem = titleItem;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public Date getRequestDueDate() {
		return requestDueDate;
	}

	public void setRequestDueDate(Date requestDueDate) {
		this.requestDueDate = requestDueDate;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public int getIsDelete() {
		return isDelete;
	}

	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Date getUpdatedDate() {
		return updatedDate;
	}

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	public Design gettDesignId() {
		return tDesignId;
	}

	public void settDesignId(Design tDesignId) {
		this.tDesignId = tDesignId;
	}

	public Product getmProductId() {
		return mProductId;
	}

	public void setmProductId(Product mProductId) {
		this.mProductId = mProductId;
	}

	public Employee getRequestPic() {
		return requestPic;
	}

	public void setRequestPic(Employee requestPic) {
		this.requestPic = requestPic;
	}

	public Employee getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(Employee createdBy) {
		this.createdBy = createdBy;
	}

	public Employee getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(Employee updatedBy) {
		this.updatedBy = updatedBy;
	}

	public List<PromotionItem> getListPromotionItem() {
		return listPromotionItem;
	}

	public void setListPromotionItem(List<PromotionItem> listPromotionItem) {
		this.listPromotionItem = listPromotionItem;
	}
		
}
