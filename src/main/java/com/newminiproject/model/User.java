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
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;


@Entity
@Table(name="M_USER")
public class User {

	@Id
	@SequenceGenerator(name="seqUser",sequenceName="seqUser")
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="seqUser")
	//@Column(name="m_user_id")
	private int id;
	
	@Column(name="username", length=50, nullable=false)
	private String username;
	
	//@ColumnTransformer(read = "decode(password, 'password')", write = "encode(?, 'password')")
    @Column(name = "password", length=50, nullable=false)
	private String password;
	
	@ManyToMany(cascade = CascadeType.ALL, fetch=FetchType.EAGER)
	@JoinTable(
			name="user_roles",
			joinColumns= {@JoinColumn(name="m_user_id")},
			inverseJoinColumns={@JoinColumn(name="m_role_id")}
			)
	private List<Role> listRole;
	
	@Column(name="enabled")
	private int enabled;
	
	@OneToOne
	@JoinColumn(name="m_employee_id")
	private Employee mEmployeeId;
	
	@Transient
	private List<String> menus;
	
	@Column(name="is_delete", nullable=false)
	private boolean isDelete;
	
	@Column(name="created_by", length=50, nullable=false)
	private String createdBy;
	
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

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
	public int getEnabled() {
		return enabled;
	}

	public void setEnabled(int enabled) {
		this.enabled = enabled;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public List<Role> getListRole() {
		return listRole;
	}

	public void setListRole(List<Role> listRole) {
		this.listRole = listRole;
	}

	public Employee getmEmployeeId() {
		return mEmployeeId;
	}

	public void setmEmployeeId(Employee mEmployeeId) {
		this.mEmployeeId = mEmployeeId;
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

	public List<String> getMenus() {
		return menus;
	}

	public void setMenus(List<String> menus) {
		this.menus = menus;
	}
}
