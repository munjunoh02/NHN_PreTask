package com.spring.nhn.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.spring.nhn.dao.NHNDao;
import com.spring.nhn.model.NHNModel;
import com.spring.nhn.service.NHNService;

@Service("nHNService")
public class NHNServiceImpl implements NHNService {

	@Resource(name="nHNDao")
	private NHNDao _nhnDao;

	@Override
	public List<NHNModel> getCommentList() {
		return this._nhnDao.getCommentList();
	}

	@Override
	public void deleteData(String index) {
		// TODO Auto-generated method stub
		this._nhnDao.deleteData(index);
	}

	@Override
	public List<NHNModel> getNthData(String index) {
		// TODO Auto-generated method stub
		return this._nhnDao.getNthData(index);
	}

	@Override
	public void insertData(NHNModel comment) {
		// TODO Auto-generated method stub
		this._nhnDao.insertData(comment);
	}

}