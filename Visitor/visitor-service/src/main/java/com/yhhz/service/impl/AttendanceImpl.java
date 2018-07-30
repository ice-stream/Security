package com.yhhz.service.impl;

import java.text.SimpleDateFormat;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yhhz.mapper.SecurityAttMapper;
import com.yhhz.pojo.SecurityAtt;
import com.yhhz.service.AttendanceSv;

@Service
public class AttendanceImpl  implements AttendanceSv{

	 @Autowired
	 SecurityAttMapper   securityAttDao;
	
	
	@Override
	public List<SecurityAtt> getAll(){
		// TODO Auto-generated method stub
		return securityAttDao.selectAll();
	}


	@Override
	public int saveSecurityAtt(SecurityAtt securityAtt) {
	
		// TODO Auto-generated method stub
		  Date date = new Date();//获得系统时间.
	        securityAtt.setAttDate(date);
	        
				return securityAttDao.insertSelective(securityAtt);
	}


	@Override
	public int deleteBatch(List<Long> del_ids) {
		// TODO Auto-generated method stub
		return  securityAttDao.deleteBatch(del_ids) ;
	}


	@Override
	public int deleteEmp(Long id) {
		// TODO Auto-generated method stub
		return securityAttDao.deleteByPrimaryKey(id);
	}


	@Override
	public int updateEmp(SecurityAtt securityAtt) {
		// TODO Auto-generated method stub
		return securityAttDao.updateByPrimaryKeySelective(securityAtt);
	}


	


	
}
