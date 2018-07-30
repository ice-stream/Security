package com.yhhz.service;

import java.util.List;

import com.yhhz.pojo.SecurityVisitor;

public interface VisitorSv {

	List<SecurityVisitor> getAll();

	int deleteBatch(List<Long> del_ids);

	int deleteEmp(Long id);

}
