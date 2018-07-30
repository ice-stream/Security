package com.yhhz.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yhhz.mapper.SecurityVisitorMapper;
import com.yhhz.pojo.SecurityVisitor;
import com.yhhz.service.VisitorSv;

@Service
public class VisitorImpl  implements VisitorSv{
	
	
	
	
	@Autowired
	private SecurityVisitorMapper  visitorDao;
	
	

	@Override
	public List<SecurityVisitor> getAll() {
		// TODO Auto-generated method stub
		return visitorDao.getALL();
	}



	@Override
	public int deleteBatch(List<Long> del_ids) {
		// TODO Auto-generated method stub
		return  visitorDao.deleteBatch(del_ids) ;
	}



	@Override
	public int deleteEmp(Long id) {
		// TODO Auto-generated method stub
		return visitorDao.deleteByPrimaryKey(id);
	}



	
	
	
	
}
