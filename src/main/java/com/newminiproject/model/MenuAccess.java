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
import javax.validation.constraints.NotNull;

@Entity
@Table(name="M_MENU_ACCESS")
public class MenuAccess {

	@Id
	@SequenceGenerator(name="seqMenuAccess",sequenceName="seqMenuAccess")
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="seqMenuAccess")
	private int id;
	
	@ManyToOne
	@JoinColumn(name="m_menu_id")
	private Menu mMenuId;
	
	@ManyToOne
	@JoinColumn(name="m_role_id")
	private Role mRoleId;
	
	@NotNull
	@Column(name="is_delete", nullable=false)
	private boolean isDelete;
	
	@NotNull
	@Column(name="created_by", length=50, nullable=false)
	private String createdBy;
	
	@NotNull
	@Column(name="created_date", nullable=false)
	@Temporal(TemporalType.DATE)
	private Date createdDate;
	
	@Column(name="updated_by", length=50)
	private String updatedBy;
	
	@Column(name="updated_date")
	@Temporal(TemporalType.DATE)
	private Date updatedDate;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Menu getmMenuId() {
		return mMenuId;
	}

	public void setmMenuId(Menu mMenuId) {
		this.mMenuId = mMenuId;
	}

	public Role getmRoleId() {
		return mRoleId;
	}

	public void setmRoleId(Role mRoleId) {
		this.mRoleId = mRoleId;
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
