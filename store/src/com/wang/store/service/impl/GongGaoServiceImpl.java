package com.wang.store.service.impl;

import java.util.List;

import com.wang.store.dao.GongGaoDao;
import com.wang.store.dao.impl.GongGaoDaoImpl;
import com.wang.store.domain.GongGao;
import com.wang.store.service.GongGaoService;

public class GongGaoServiceImpl implements GongGaoService {
	GongGaoDao gongGaoDao = new GongGaoDaoImpl();
	//查询所有公告
	@Override
	public List<GongGao> findGongGao() throws Exception {
		// TODO Auto-generated method stub	
		return gongGaoDao.finfGongGao();
	}
	
	//添加公告
	@Override
	public void addGong(GongGao gongGao) throws Exception {
		// TODO Auto-generated method stub
		gongGaoDao.findGong(gongGao);
	}
	
	//删除工告信息
	@Override
	public void deleteGongGao(int ids) throws Exception {
		// TODO Auto-generated method stub
		gongGaoDao.deleteGongGao(ids);
	}

}
