package com.itheima.annotation.manytomany;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Cascade;
import org.hibernate.annotations.CascadeType;

@SuppressWarnings("all")
@Entity
@Table(name="t_student")
public class Student {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	private  String name;

	@ManyToMany(targetEntity=Teacher.class)
	
	//使用JoinTable 来描述中间表，并描述中间表外键于Student,Teacher的映射关系
	//joinColumns 它是用来描述Student与中间表中映射关系
	//inverseJoinColumns 它使用来描述Teacher与中间表中的映射关系
	
	@JoinTable(name="s_t",joinColumns= {@JoinColumn(name="s_student_id",referencedColumnName="id")},
	inverseJoinColumns= {@JoinColumn(name="t_teacher_id",referencedColumnName="id")})
	@Cascade(CascadeType.ALL)
	private Set<Teacher> teachers = new HashSet<>();

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

	public Set<Teacher> getTeachers() {
		return teachers;
	}

	public void setTeachers(Set<Teacher> teachers) {
		this.teachers = teachers;
	}
	
	
}
