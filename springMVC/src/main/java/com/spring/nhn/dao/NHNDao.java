package com.spring.nhn.dao;
import java.util.List;
import com.spring.nhn.model.NHNModel;

public interface NHNDao {
	public List<NHNModel> getCommentList();
	public List<NHNModel> getNthData(String index);
	public void insertData(NHNModel comment);
	public void deleteData(String index);
}
