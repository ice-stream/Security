package com.yhhz.service;

import java.util.List;

import com.yhhz.pojo.SecurityAtt;

public interface AttendanceSv {

	
	
	/**
	 * ��ѯ����Ա��
	 * @return
	 */
	public List<SecurityAtt> getAll();

	public int saveSecurityAtt(SecurityAtt securityAtt);

	public int deleteBatch(List<Long> del_ids);

	public int deleteEmp(Long id);

	public int updateEmp(SecurityAtt securityAtt);
	

	
	
	
	
	
	
	
	
	
}
