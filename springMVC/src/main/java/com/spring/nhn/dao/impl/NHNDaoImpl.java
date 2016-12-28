package com.spring.nhn.dao.impl;
import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.nhn.dao.NHNDao;
import com.spring.nhn.model.NHNModel;

@Repository("nHNDao")
public class NHNDaoImpl implements NHNDao{
	@Autowired
	private SqlSession sqlSession;
	public void setSqlSession(SqlSession sqlSession){
		this.sqlSession = sqlSession;
	}
	@Override
	public List<NHNModel> getBookList() {
		
		return sqlSession.selectList("getBookList");
	}

}