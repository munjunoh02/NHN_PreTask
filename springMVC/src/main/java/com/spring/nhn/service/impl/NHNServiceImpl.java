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
	private NHNDao nhnDao;

	@Override
	public List<NHNModel> getBookList() {
		return nhnDao.getBookList();
	}

}