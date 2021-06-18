package com.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.PathVariable;

import com.entities.ToDo;
@Component
public class ToDoDao {
	@Autowired
	HibernateTemplate hibernateTemplate;
	@Transactional
	public int save(ToDo t)
	{
		Integer i=(Integer) this.hibernateTemplate.save(t);
		return i;
	}
	public List<ToDo> getAll()
	{
		List<ToDo> todos = this.hibernateTemplate.loadAll(ToDo.class);
		return todos;
	}
	@Transactional
	public void delete(int id)
	{
		
		this.hibernateTemplate.delete(hibernateTemplate.get(ToDo.class,id));
	}
	@Transactional
	public void update(int id)
	{
		this.hibernateTemplate.update(hibernateTemplate.get(ToDo.class,id));
		
	}
	public ToDo get(int id)
	{
		return this.hibernateTemplate.get(ToDo.class, id);
	}
}
