package com.spring.nhn.dao;
import java.util.List;
import com.spring.nhn.model.NHNModel;

public interface NHNDao {
	List<NHNModel> getBookList();
}