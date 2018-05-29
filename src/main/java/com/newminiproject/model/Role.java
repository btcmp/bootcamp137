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
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name="m_role")
public class Role {

	@Id
	@SequenceGenerator(name="seqRole",sequenceName="seqRole")        
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="seqRole")
	private int id;
	
	@NotNull
	@Column(name="code", length=50, nullable=false)
	private String code;
	
	@NotNull
	@Column(name="name", length=50, nullable=false)
	private String name;
	
	@Column(name="description", length=255)
	private String description;
	
	@NotNull
	@Column(name="is_delete", nullable=false)
	private boolean isDelete;
	
	@NotNull
	@Column(name="created_by", nullable=false)
	private String createdBy;
	
	@NotNull
	@Column(name="created_date", nullable=false)
	@Temporal(TemporalType.DATE)
	private Date createdDate;
	
	@Column(name="update_by")
	private String updateBy;
	
	@Column(name="update_date")
	@Temporal(TemporalType.DATE)
	private Date updateDate;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="mRoleId")
	private List<MenuAccess> listMenuAccess;
	
	@ManyToMany(cascade = CascadeType.ALL)
	private List<User> listUser;

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

	public List<MenuAccess> getListMenuAccess() {
		return listMenuAccess;
	}

	public void setListMenuAccess(List<MenuAccess> listMenuAccess) {
		this.listMenuAccess = listMenuAccess;
	}

	public List<User> getListUser() {
		return listUser;
	}

	public void setListUser(List<User> listUser) {
		this.listUser = listUser;
	}
	
}
