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
import javax.validation.constraints.NotNull;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="m_unit")
public class Unit {

	@Id
	@SequenceGenerator(name="seqUnit",sequenceName="seqUnit")        
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="seqUnit")
	private int id;
	
	@NotNull
	@Column(name="code", length=50)
	private String code;
	
	@NotNull
	@Column(name="name", length=50)
	private String name;
	
	@Column(name="description", length=50)
	private String description;
	
	@NotNull
	@Column(name="is_delete")
	private boolean isDelete;
	
	@NotNull
	@Column(name="created_by", length=50)
	private String createdBy;
	
	@Column(name="created_date")
	@Temporal(TemporalType.DATE)
	private Date createdDate;
	
	@Column(name="updated_by", length=50)
	private String updateBy;
	
	@Column(name="updated_date")
	@Temporal(TemporalType.DATE)
	private Date updateDate;

	@JsonIgnore
	@OneToMany(fetch=FetchType.LAZY, mappedBy="mUnitId")
	private List<Souvenir> listSouvenir;
	
	public List<Souvenir> getListSouvenir() {
		return listSouvenir;
	}

	public void setListSouvenir(List<Souvenir> listSouvenir) {
		this.listSouvenir = listSouvenir;
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

	public String getUpdateBy() {
		return updateBy;
	}

	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
	
}
