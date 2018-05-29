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

import org.hibernate.annotations.CreationTimestamp;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonManagedReference;



//dummny
@Entity
@Table(name="M_COMPANY")
public class Company {
	@Id
	@SequenceGenerator(name="seqCompany",sequenceName="seqCompany")        
	@GeneratedValue(strategy=GenerationType.SEQUENCE, generator="seqCompany")
	private int id;
	@Column
	private String name;
	private String code;
	private String phone;
	private String email;
	private String address;
	private int isDelete;
	
	@Temporal(TemporalType.DATE)
	private Date updateDate;
	
	@CreationTimestamp
	@Temporal(TemporalType.DATE)
	private Date createDate;
	private String createBy;
	
	@OneToMany(fetch=FetchType.LAZY, mappedBy="mCompanyId")
	@JsonIgnore
	private List<Employee> employee;
	
	public List<Employee> getEmployee() {
		return employee;
	}


	public void setEmployee(List<Employee> employee) {
		this.employee = employee;
	}


	private String updateBy;
	
	
	
	
	
	


	public String getCreateBy() {
		return createBy;
	}


	public void setCreateBy(String createBy) {
		this.createBy = createBy;
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


	public void setUpdateDate(Date update_date) {
		this.updateDate = update_date;
	}


	


	


	public Date getcreateDate() {
		return createDate;
	}


	public void setcreateDate(Date createDate) {
		this.createDate = createDate;
	}


	


	public int getIsDelete() {
		return isDelete;
	}


	public void setIsDelete(int isDelete) {
		this.isDelete = isDelete;
	}


	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getCode() {
		return code;
	}


	public void setCode(String code) {
		this.code = code;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getAddress() {
		return address;
	}


	public void setAddress(String address) {
		this.address = address;
	}
}
