package com.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dao.ToDoDao;
import com.entities.ToDo;

@Controller
public class Homectrl {
	@Autowired
	ServletContext context;
	@Autowired
	ToDoDao todoDao;

	@RequestMapping("/home")
	public String home(Model m) {
		String s = "Home";
		m.addAttribute("page", s);
		List<ToDo> list = this.todoDao.getAll();
		m.addAttribute("todos", list);
		return "home";
	}

	@RequestMapping("/add")
	public String addTodo(Model m) {
		ToDo t = new ToDo();
		m.addAttribute("page", "Add");
		m.addAttribute("todo", t);
		return "home";
	}

	@RequestMapping(value = "/saveToDo", method = RequestMethod.POST) // this is added because the default value of
																		// requestmapping is GET while we need it as
																		// POST
	public String saveToDo(@ModelAttribute("todo") ToDo t, Model m) {

		t.setTodoDate(new Date());
		this.todoDao.save(t);
		m.addAttribute("msg", "Task successfully added");
		return "redirect:/home";
	}

	@RequestMapping(value = "/deleteToDo/{todoId}"/* , method = RequestMethod.POST */)
	public String deleteToDo(@RequestParam("todoId") int todoId,Model m) {
		this.todoDao.delete(todoId);
		m.addAttribute("delmsg", "Task successfully deleted");
		return "redirect:/home";

	}
	@RequestMapping(value = "updateToDo" , method = RequestMethod.POST )
	public String updateToDo(int todoId,Model m) {
		//ToDo todoObj=this.todoDao.get(todoId);
		//m.addAttribute("todoObj",todoObj);
		//m.addAttribute("todo", todoObj);
		this.todoDao.update(todoId);
		//m.addAttribute("delmsg", "Task successfully deleted");
		return "home";

	}
	@RequestMapping(value="updatepage/{todoId}")
	public String updatepage(@RequestParam("todoId") int todoId,Model m)
	{	
		ToDo todoObj=this.todoDao.get(todoId);
		m.addAttribute("todo",todoObj);
		m.addAttribute("page", "Update");
		this.todoDao.update(todoId);
		return "home";
	}
}
