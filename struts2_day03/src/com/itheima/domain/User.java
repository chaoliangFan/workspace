package com.itheima.domain;

import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

public class User {
	private Integer id;
	private String name;
	@JSONField(format="yyyy-mm-dd")
	private Date birth;
	
	public User(Integer id, String name, Date birth) {
		super();
		this.id = id;
		this.name = name;
		this.birth = birth;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	
}
