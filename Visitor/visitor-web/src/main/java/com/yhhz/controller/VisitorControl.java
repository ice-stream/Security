package com.yhhz.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yhhz.pojo.SecurityAtt;
import com.yhhz.pojo.SecurityVisitor;
import com.yhhz.service.VisitorSv;
import com.yhhz.util.Msg;

@Controller
public class VisitorControl {
	
	@Autowired
	private VisitorSv visitorImpl;
	
	
	@RequestMapping("/visitor")
	@ResponseBody
	public Msg getVisitorWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
	
		PageHelper.startPage(pn, 5);
		
		List<SecurityVisitor> visitor = visitorImpl.getAll();
		
		PageInfo page = new PageInfo(visitor, 5);
		return Msg.success().add("pageInfo", page);
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="/visitor/{ids}",method=RequestMethod.DELETE)
	public Msg deleteVisitor(@PathVariable("ids") String ids){
		//����ɾ��
		System.out.println(ids);
		if(ids.contains("-")){
			List<Long> del_ids = new ArrayList<>();
			String[] str_ids = ids.split("-");
			//��װid�ļ���
			for (String string : str_ids) {
				
			 Long longs=Long.parseLong(string);
			
			 del_ids.add(longs);
					
					
			}
			
			visitorImpl.deleteBatch(del_ids);
		}else{
			Long id = Long.parseLong(ids);
			visitorImpl.deleteEmp(id);
		}
		return Msg.success();
	}
	
	
	
	
	

}
