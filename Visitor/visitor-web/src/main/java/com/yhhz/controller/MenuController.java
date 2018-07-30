package com.yhhz.controller;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
@RequestMapping("/menuController")
public class MenuController {
	
	

	@RequestMapping("/attendance")
	public String selectAttendance() {
		return "/attendance";
	}

	

	@RequestMapping("/visitor")
	public String selectVisitor() {
		return "/visitor";
	}
	
	
}
