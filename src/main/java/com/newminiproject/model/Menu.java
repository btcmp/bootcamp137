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
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

@Entity
@Table(name="m_menu")
public class Menu {

	@Id
	@SequenceGenerator(name="seqMenu",sequenceName="seqMenu")        
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="seqMenu")
	private int id;
	
	@NotNull
	@Column(name="code", length=50)
	private String code;
	
	@Column(name="name", length=50)
	private String name;
	
	@NotNull
	@Column(name="controller", length=150)
	private String controller;
	
	@NotFound(action = NotFoundAction.IGNORE)
	@ManyToOne
	@JoinColumn(name="parent_id")
	private Menu parentId;
	
	@NotNull
	@Column(name="is_delete")
	private boolean isDelete;
	
	@NotNull
	@Column(name="created_by", length=50)
	private String createdBy;
	
	@NotNull
	@Column(name="created_date")
	@Temporal(TemporalType.DATE)
	private Date createdDate;
	
	@Column(name="updated_by", length=50)
	private String updatedBy;
	
	@Column(name="updated_date")
	@Temporal(TemporalType.DATE)
	private Date updatedDate;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="mMenuId")
	private List<MenuAccess> listMenuAccess;

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

	public String getController() {
		return controller;
	}

	public void setController(String controller) {
		this.controller = controller;
	}

	public Menu getParentId() {
		return parentId;
	}

	public void setParentId(Menu parentId) {
		this.parentId = parentId;
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

	public List<MenuAccess> getListMenuAccess() {
		return listMenuAccess;
	}

	public void setListMenuAccess(List<MenuAccess> listMenuAccess) {
		this.listMenuAccess = listMenuAccess;
	}
	
	
}
