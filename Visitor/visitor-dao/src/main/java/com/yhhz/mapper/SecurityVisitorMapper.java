package com.yhhz.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yhhz.pojo.SecurityVisitor;

public interface SecurityVisitorMapper {


	int deleteByPrimaryKey(Long vtId);

    int insert(SecurityVisitor record);

    int insertSelective(SecurityVisitor record);

    SecurityVisitor selectByPrimaryKey(Long vtId);

    int updateByPrimaryKeySelective(SecurityVisitor record);

    int updateByPrimaryKey(SecurityVisitor record);

	List<SecurityVisitor> getALL();
	
	int deleteBatch(@Param("del_ids") List<Long> del_ids);
	
}