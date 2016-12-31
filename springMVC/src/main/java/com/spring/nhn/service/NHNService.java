package com.spring.nhn.service;
import java.util.List;
import com.spring.nhn.model.NHNModel;

public interface NHNService {
	public List<NHNModel> getCommentList();
	public List<NHNModel> getNthData(String index);
	public void insertData(NHNModel comment);
	public void deleteData(String index);
}