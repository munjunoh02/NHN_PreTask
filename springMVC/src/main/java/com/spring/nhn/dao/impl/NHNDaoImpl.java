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
	private SqlSession _sqlSession;
	
	public void setSqlSession(SqlSession sqlSession){
		this._sqlSession = sqlSession;
	}
	
	@Override
	public List<NHNModel> getCommentList() {
		return this._sqlSession.selectList("getCommentList");
	}

	@Override
	public List<NHNModel> getNthData(String index) {
		return this._sqlSession.selectList("getNthData", index);
	}
	
	@Override
	public void deleteData(String index) {
		// TODO Auto-generated method stub
		this._sqlSession.delete("deleteData", index);
	}

	@Override
	public void insertData(NHNModel comment) {
		// TODO Auto-generated method stub
		this._sqlSession.insert("insertData", comment);	
	}
}