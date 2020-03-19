package com.wang.store.service;

import java.util.List;

import com.wang.store.domain.GongGao;

public interface GongGaoService {

	List<GongGao> findGongGao() throws Exception;

	void addGong(GongGao gongGao)throws Exception;

	void deleteGongGao(int ids)throws Exception;

}
