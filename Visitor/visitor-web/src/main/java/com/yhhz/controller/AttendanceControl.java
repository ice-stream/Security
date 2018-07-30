package com.yhhz.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yhhz.pojo.SecurityAtt;
import com.yhhz.service.AttendanceSv;
import com.yhhz.util.Msg;

@Controller
public class AttendanceControl {

	
	@Autowired
	AttendanceSv attendanceSv;
	
	
	
   /*	@RequestMapping("/emps")*/
	public String getAttendance(@RequestParam(value = "pn", defaultValue = "1") Integer pn,Model model) {
	
		PageHelper.startPage(pn, 5);
	  
		List<SecurityAtt> emps = attendanceSv.getAll();
		
		
		PageInfo page = new PageInfo(emps, 5);
		model.addAttribute("pageInfo",page);
		return "list";
	}
	

	@RequestMapping("/emps")
	@ResponseBody
	public Msg getEmpsWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
	
		PageHelper.startPage(pn, 5);
		
		List<SecurityAtt> emps = attendanceSv.getAll();

		PageInfo page = new PageInfo(emps, 5);
		return Msg.success().add("pageInfo", page);
	}
	
	

	@RequestMapping(value="/emp",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveEmp(@Validated SecurityAtt securityAtt,BindingResult result){
		if(result.hasErrors()){
			//У��ʧ�ܣ�Ӧ�÷���ʧ�ܣ���ģ̬������ʾУ��ʧ�ܵĴ�����Ϣ
			Map<String, Object> map = new HashMap<>();
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError fieldError : errors) {
				System.out.println("������ֶ�����"+fieldError.getField());
				System.out.println("������Ϣ��"+fieldError.getDefaultMessage());
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorFields", map);
		}else{
			attendanceSv.saveSecurityAtt(securityAtt);
			return Msg.success();
		}
		
	}

	
	
	@ResponseBody
	@RequestMapping(value="/emp/{ids}",method=RequestMethod.DELETE)
	public Msg deleteEmp(@PathVariable("ids")String ids){
		//����ɾ��
		if(ids.contains("-")){
			List<Long> del_ids = new ArrayList<>();
			String[] str_ids = ids.split("-");
			//��װid�ļ���
			for (String string : str_ids) {
				
			 Long longs=Long.parseLong(string);
			
			 del_ids.add(longs);
					
					
			}
			
			attendanceSv.deleteBatch(del_ids);
		}else{
			Long id = Long.parseLong(ids);
			attendanceSv.deleteEmp(id);
		}
		return Msg.success();
	}
	
	

	@ResponseBody
	@RequestMapping(value="/emp/{empId}",method=RequestMethod.PUT)
	public Msg saveEmp(SecurityAtt securityAtt,HttpServletRequest request){
		System.out.println("将要更新的员工数据："+attendanceSv);
		attendanceSv.updateEmp(securityAtt);
		return Msg.success()	;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
