package com.newminiproject.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table (name ="t_promotion_item_file")
public class PromotionItemFile {

	 @Id
	 @SequenceGenerator (name = "idpif", sequenceName ="idpif")
	 @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "idpif")
	 @Column(length = 11)
	 private int id;
	 
	 @ManyToOne
	 @JoinColumn (name = "t_promotion_id")
	 private Promotion promotion;
	 
	 @Column (length = 50)
	 private String fileName;
	 
	 @Column (length = 11, name = "sizee")
	 private String sizee;
	 
	 @Column (length = 11)
	 private String extention;
	 
	 @Temporal(TemporalType.DATE)
	 @Column (name = "start_date")
	 private Date startDate;
	 
	 @Temporal(TemporalType.DATE)
	 @Column (name = "end_date")
	 private Date endDate;
	 
	 @Temporal(TemporalType.DATE)
	 @Column (name = "request_due_date")
	 private Date requestDueDate;
	 
	 @Column (length = 50)
	 private int qty;
	 
	 @Column (length = 50)
	 private String todo;
	 
	 @Column (length = 255)
	 private String note;
	 
	 @Column (name = "is_delete", columnDefinition = "int default 0")
	 private int isDelete;
	 
	 @JoinColumn (name = "created_by")
	 @ManyToOne
	 private Employee createdBy;
	 
	 @Temporal(TemporalType.DATE)
	 @Column (name = "created_date")
	 private Date createdDate;
	 
	 @JoinColumn (name = "updated_by")
	 @ManyToOne
	 private Employee updatedBy;
	 
	 @Temporal(TemporalType.DATE)
	 @Column (name = "update_date")
	 private Date updatedDate;
	 ///////////////// Setter & Getter /////////////////////

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Promotion getPromotion() {
		return promotion;
	}

	public void setPromotion(Promotion promotion) {
		this.promotion = promotion;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getSizee() {
		return sizee;
	}

	public void setSizee(String sizee) {
		this.sizee = sizee;
	}

	public String getExtention() {
		return extention;
	}

	public void setExtention(String extention) {
		this.extention = extention;
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

	public int getQty() {
		return qty;
	}

	public void setQty(int qty) {
		this.qty = qty;
	}

	public String getTodo() {
		return todo;
	}

	public void setTodo(String todo) {
		this.todo = todo;
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

	 
	 
}