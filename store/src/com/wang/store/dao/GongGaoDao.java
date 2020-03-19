package com.wang.store.dao;

import java.util.List;

import com.wang.store.domain.GongGao;

public interface GongGaoDao {

	List<GongGao> finfGongGao() throws Exception;

	void findGong(GongGao gongGao)throws Exception;

	void deleteGongGao(int ids)throws Exception;

}
