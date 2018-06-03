
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

@Entity
@Table (name = "t_promotion_item")
public class PromotionItem {

	@Id
	@SequenceGenerator (name = "idpi", sequenceName ="idpi")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "idpi")
	@Column (length = 11)
	private int id;
	
	@ManyToOne
	@JoinColumn (name = "t_promotion_id")
	private Promotion promotion;
	
	@ManyToOne
	@JoinColumn (name = "t_design_item_id")
	private DesignItem designItem;
	
	@ManyToOne
	@JoinColumn (name = "m_product_id")
	private Product product;
	
	@Column (length = 255)
	private String title;
	
	@JoinColumn (name = "request_pic") 
	@ManyToOne
	private Employee requestPic;
	
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
	
	@Column (name = "is_delete", length = 5, columnDefinition = "int default 0")
	private int isDelete;
	
	@JoinColumn (name = "created_by")
	private String createdBy;
	
	@Temporal(TemporalType.DATE)
	@Column (name = "created_date")
	private Date createdDate;
	
	@JoinColumn (name ="updated_by")
	private String updatedBy;
	
	@Temporal(TemporalType.DATE)
	@Column (name = "update_date")
	private Date updatedDate;
///////////////// Setter & Getter ///////////////////////


	public Date getUpdatedDate() {
		return updatedDate;
	}

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

	public DesignItem getDesignItem() {
		return designItem;
	}

	public void setDesignItem(DesignItem designItem) {
		this.designItem = designItem;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Employee getRequestPic() {
		return requestPic;
	}

	public void setRequestPic(Employee requestPic) {
		this.requestPic = requestPic;
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

	

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public String getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(String updatedBy) {
		this.updatedBy = updatedBy;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	

	public void setUpdatedDate(Date updatedDate) {
		this.updatedDate = updatedDate;
	}

	
}
