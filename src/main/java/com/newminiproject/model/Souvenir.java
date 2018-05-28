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
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="m_souvenir")
public class Souvenir {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	@GenericGenerator(name = "sequence_souvenir_code", strategy = "com.xsis.miniproject.codegenerator.SouvenirCodeGenerator")
	@GeneratedValue(generator = "sequence_souvenir_code")
	@Column(name="code", length=50, nullable=false)
	@NotNull
	private String code;
	
	@Column(length=50, nullable=false)
	@NotNull
	private String name;
	
	private String description;
	
	@ManyToOne
	@JoinColumn(name="m_unit_id")
	@NotNull
	private Unit mUnitId;
	
	@Column(name="is_delete", nullable=false)
	private boolean isDelete;
	
	@Column(name="created_by", length=50)//nullable
	private String createdBy;
	
	@Column(name="created_date", nullable=false)//nullable
	@Temporal(TemporalType.DATE)
	private Date createdDate;
	
	@Column(name="updated_by", length=50)
	private String updatedBy;
	
	@Column(name="updated_date")
	@Temporal(TemporalType.DATE)
	private Date updatedDate;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="mSouvenirId")
	private List<TransactionSouvenirItem> listmSouvenirId;

	
	//Setter & Getter
	
	public int getId() {
		return id;
	}

	public List<TransactionSouvenirItem> getListmSouvenirId() {
		return listmSouvenirId;
	}

	public void setListmSouvenirId(List<TransactionSouvenirItem> listmSouvenirId) {
		this.listmSouvenirId = listmSouvenirId;
	}

	public Unit getmUnitId() {
		return mUnitId;
	}

	public void setmUnitId(Unit mUnitId) {
		this.mUnitId = mUnitId;
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
	
	
}
